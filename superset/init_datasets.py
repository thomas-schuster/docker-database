#!/usr/bin/env python3
"""
Erstellt Datasets für Warehouse-Tabellen in Superset.
Wird im Superset-Container ausgeführt.
"""
import sys
sys.path.insert(0, '/app')

# App muss ZUERST erstellt werden
from superset.app import create_app
app = create_app()

with app.app_context():
    # Jetzt können wir die Models importieren
    from superset.connectors.sqla.models import SqlaTable, TableColumn, SqlMetric
    from superset.models.core import Database
    from superset.extensions import db
    
    # Finde Mondial DB
    mondial_db = db.session.query(Database).filter_by(database_name="Mondial DB").first()
    
    if not mondial_db:
        print("ERROR: Mondial DB nicht gefunden!")
        sys.exit(1)
    
    print(f"Gefunden: {mondial_db.database_name} (ID: {mondial_db.id})")
    
    # Lösche fehlerhafte Datasets (store existiert nicht)
    bad_datasets = db.session.query(SqlaTable).filter_by(
        table_name="store",
        schema="warehouse",
        database_id=mondial_db.id
    ).all()
    for ds in bad_datasets:
        db.session.delete(ds)
    
    # Warehouse-Tabellen
    tables = [
        {"name": "sales", "date_col": None},
        {"name": "article", "date_col": "AvailableSince"}, 
        {"name": "customer", "date_col": "FirstPurchaseDate"},
        {"name": "location", "date_col": "OpenDate"},
        {"name": "time", "date_col": "FullDateLabel"}
    ]
    
    def ensure_count_metric(dataset):
        # Prüfe ob 'count' Metric existiert
        count_metric = db.session.query(SqlMetric).filter_by(
            metric_name="count",
            table_id=dataset.id
        ).first()
        
        if not count_metric:
            print(f"    -> Erstelle 'count' Metric für {dataset.table_name}")
            metric = SqlMetric(
                metric_name="count",
                verbose_name="COUNT(*)",
                metric_type="count",
                expression="COUNT(*)",
                table_id=dataset.id
            )
            db.session.add(metric)
            db.session.flush()

    for t in tables:
        table_name = t["name"]
        date_col = t["date_col"]
        
        # Prüfe ob Dataset existiert
        existing = db.session.query(SqlaTable).filter_by(
            table_name=table_name,
            schema="warehouse", 
            database_id=mondial_db.id
        ).first()
        
        if existing:
            print(f"  Dataset existiert bereits: warehouse.{table_name}")
            try:
                # Spalten synchronisieren
                if date_col and existing.main_dttm_col != date_col:
                    existing.main_dttm_col = date_col
                
                existing.fetch_metadata()
                db.session.commit()
                ensure_count_metric(existing)
            except Exception as e:
                print(f"    -> Fehler bei Sync: {e}")
        else:
            dataset = SqlaTable(
                table_name=table_name,
                schema="warehouse",
                database_id=mondial_db.id,
                main_dttm_col=date_col
            )
            db.session.add(dataset)
            db.session.flush()
            try:
                # Spalten von der Datenbank laden
                dataset.fetch_metadata()
                db.session.commit()
                ensure_count_metric(dataset)
                col_count = db.session.query(TableColumn).filter_by(table_id=dataset.id).count()
                print(f"  Dataset erstellt: warehouse.{table_name} ({col_count} Spalten)")
            except Exception as e:
                print(f"  Dataset erstellt: warehouse.{table_name} (Fehler bei Sync: {e})")

    # ---------------------------------------------------------
    # Erstelle virtuelles Dataset: sales_extended
    # ---------------------------------------------------------
    v_dataset_name = "sales_extended"
    v_sql = """
SELECT 
  s."SalesVolume", 
  s."Amount",
  t."FullDateLabel" AS "OrderDate",
  t."CalendarYear",
  t."CalendarMonthLabel",
  a."ArticleName",
  a."Brand",
  a."ProductGroup",
  c."Gender",
  c."Age",
  l."StoreName",
  l."City" as "StoreCity",
  l."Province" as "StoreProvince",
  l."Country" as "StoreCountry"
FROM warehouse.sales s
JOIN warehouse."time" t ON s."TimeId" = t."TimeId"
JOIN warehouse.article a ON s."ArticleId" = a."ArticleId"
JOIN warehouse.customer c ON s."CustomerId" = c."CustomerId"
JOIN warehouse.location l ON s."StoreId" = l."StoreId"
    """
    
    existing_v = db.session.query(SqlaTable).filter_by(
        table_name=v_dataset_name,
        database_id=mondial_db.id
    ).first()
    
    if existing_v:
        print(f"  Dataset existiert bereits: {v_dataset_name}")
        existing_v.sql = v_sql
        existing_v.main_dttm_col = "OrderDate"
        existing_v.fetch_metadata()
        db.session.commit()
        ensure_count_metric(existing_v)
        
        # Sicherstellen dass OrderDate als Zeitspalte markiert ist
        for col in existing_v.columns:
            if col.column_name == "OrderDate":
                col.is_dttm = True
                col.type = "DATE"
        db.session.commit()
    else:
        v_dataset = SqlaTable(
            table_name=v_dataset_name,
            database_id=mondial_db.id,
            sql=v_sql,
            main_dttm_col="OrderDate"
        )
        db.session.add(v_dataset)
        db.session.flush()
        v_dataset.fetch_metadata()
        db.session.commit()
        ensure_count_metric(v_dataset)
        
        # Sicherstellen dass OrderDate als Zeitspalte markiert ist
        for col in v_dataset.columns:
            if col.column_name == "OrderDate":
                col.is_dttm = True
                col.type = "DATE"
        db.session.commit()
        
        print(f"  Virtuelles Dataset erstellt: {v_dataset_name}")

    db.session.commit()
    print("\nFertig! Datasets wurden erstellt und synchronisiert.")
