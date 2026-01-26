#!/usr/bin/env python3
"""
Erstellt Charts und Dashboard für das Mondial Warehouse.
Wird im Superset-Container ausgeführt.
"""
import sys
sys.path.insert(0, '/app')
import json

from superset.app import create_app
app = create_app()

with app.app_context():
    from superset.connectors.sqla.models import SqlaTable
    from superset.models.core import Database
    from superset.models.slice import Slice
    from superset.models.dashboard import Dashboard
    from superset.extensions import db
    
    # Finde Mondial DB und Datasets
    mondial_db = db.session.query(Database).filter_by(database_name="Mondial DB").first()
    if not mondial_db:
        print("ERROR: Mondial DB nicht gefunden!")
        sys.exit(1)
    
    def get_dataset(table_name):
        return db.session.query(SqlaTable).filter_by(
            table_name=table_name,
            schema="warehouse",
            database_id=mondial_db.id
        ).first()
    
    sales = get_dataset("sales")
    customer = get_dataset("customer")
    article = get_dataset("article")
    location = get_dataset("location")  # location, nicht store!
    time_table = get_dataset("time")
    
    # Virtuelles Dataset holen
    sales_extended = db.session.query(SqlaTable).filter_by(
        table_name="sales_extended",
        database_id=mondial_db.id
    ).first()
    
    if not all([sales, customer, article, location, sales_extended]):
        print("ERROR: Nicht alle Datasets gefunden!")
        # ... logs ...
        sys.exit(1)
        
    print(f"Datasets gefunden (inkl. sales_extended ID: {sales_extended.id})")
    
    # Lösche alte Charts
    old_charts = db.session.query(Slice).filter(
        Slice.slice_name.in_(["Total Sales", "Sales by Year", "Customers by Birth Year", 
                              "Articles by Brand", "Stores by State", "Stores by Province",
                              "Sales Count by Article", "Customers by Age", "Top Articles by Sales",
                              "Customer Age Distribution", "Sales Over Time"])
    ).all()
    for chart in old_charts:
        db.session.delete(chart)
    db.session.commit()
    print(f"\n{len(old_charts)} alte Charts gelöscht.")
    
    charts = []
    
    # Chart 1: Total Sales (Big Number) - nutzt sales_extended
    chart1 = Slice(
        slice_name="Total Sales",
        viz_type="big_number_total",
        datasource_type="table",
        datasource_id=sales_extended.id,
        params=json.dumps({
            "datasource": f"{sales_extended.id}__table",
            "viz_type": "big_number_total",
            "metric": {
                "expressionType": "SIMPLE",
                "column": {"column_name": "SalesVolume", "type": "NUMERIC"},
                "aggregate": "SUM",
                "label": "Total Sales"
            },
            "header_font_size": 0.5,
            "subheader_font_size": 0.2,
            "y_axis_format": ",.0f"
        })
    )
    charts.append(chart1)
    
    # Chart 2: Sales Over Time (Verwende sales_extended mit ECharts Time Series!)
    chart2 = Slice(
        slice_name="Sales Over Time",
        viz_type="echarts_timeseries_line",
        datasource_type="table",
        datasource_id=sales_extended.id,
        params=json.dumps({
            "datasource": f"{sales_extended.id}__table",
            "viz_type": "echarts_timeseries_line",
            "x_axis": "OrderDate",
            "metrics": [{
                "expressionType": "SIMPLE",
                "column": {"column_name": "SalesVolume", "type": "NUMERIC"},
                "aggregate": "SUM",
                "label": "Sales"
            }],
            "groupby": [],
            "row_limit": 1000,
            "color_scheme": "supersetColors"
        })
    )
    charts.append(chart2)
    
    # Chart 3: Customer Age Distribution (Table)
    chart3 = Slice(
        slice_name="Customer Age Distribution",
        viz_type="table",
        datasource_type="table",
        datasource_id=customer.id,
        params=json.dumps({
            "datasource": f"{customer.id}__table",
            "viz_type": "table",
            "metrics": [{
                "expressionType": "SQL",
                "sqlExpression": "COUNT(*)",
                "label": "Customer Count"
            }],
            "groupby": ["Age"],
            "row_limit": 50,
            "order_desc": True
        })
    )
    charts.append(chart3)
    
    # Chart 4: Articles by Brand (Pie Chart)
    chart4 = Slice(
        slice_name="Articles by Brand",
        viz_type="pie",
        datasource_type="table",
        datasource_id=article.id,
        params=json.dumps({
            "datasource": f"{article.id}__table",
            "viz_type": "pie",
            "metric": {
                "expressionType": "SQL",
                "sqlExpression": "COUNT(*)",
                "label": "Article Count"
            },
            "groupby": ["Brand"],
            "row_limit": 10
        })
    )
    charts.append(chart4)
    
    # Chart 5: Stores by Province (Table)
    chart5 = Slice(
        slice_name="Stores by Province",
        viz_type="table",
        datasource_type="table",
        datasource_id=location.id,
        params=json.dumps({
            "datasource": f"{location.id}__table",
            "viz_type": "table",
            "metrics": [{
                "expressionType": "SQL",
                "sqlExpression": "COUNT(*)",
                "label": "Store Count"
            }],
            "groupby": ["Province"],
            "row_limit": 100,
            "order_desc": True
        })
    )
    charts.append(chart5)
    
    # Erstelle Charts
    for chart in charts:
        db.session.add(chart)
        db.session.flush()
        print(f"  Chart erstellt: {chart.slice_name} (ID: {chart.id})")
    
    db.session.commit()
    
    # Hole alle erstellten Charts
    all_charts = db.session.query(Slice).filter(
        Slice.slice_name.in_(["Total Sales", "Sales Over Time", "Customer Age Distribution", 
                              "Articles by Brand", "Stores by Province"])
    ).all()
    
    # Chart 4: Articles by Brand (Spalte heißt "Brand", nicht BrandName)
    chart4 = Slice(
        slice_name="Articles by Brand",
        viz_type="pie",
        datasource_type="table",
        datasource_id=article.id,
        params=json.dumps({
            "datasource": f"{article.id}__table",
            "viz_type": "pie",
            "metric": {
                "expressionType": "SQL",
                "sqlExpression": "COUNT(*)",
                "label": "Article Count"
            },
            "groupby": ["Brand"],
            "row_limit": 20
        })
    )
    charts.append(chart4)
    
    # Chart 5: Stores by Province (Tabelle heißt location, Spalte Province existiert)
    chart5 = Slice(
        slice_name="Stores by Province",
        viz_type="table",
        datasource_type="table",
        datasource_id=location.id,
        params=json.dumps({
            "datasource": f"{location.id}__table",
            "viz_type": "table",
            "metrics": [{
                "expressionType": "SQL",
                "sqlExpression": "COUNT(*)",
                "label": "Store Count"
            }],
            "groupby": ["Province"],
            "row_limit": 100,
            "order_desc": True
        })
    )
    charts.append(chart5)
    
    # Erstelle Charts
    for chart in charts:
        db.session.add(chart)
        db.session.flush()
        print(f"  Chart erstellt: {chart.slice_name} (ID: {chart.id})")
    
    db.session.commit()
    
    # Hole alle erstellten Charts
    all_charts = db.session.query(Slice).filter(
        Slice.slice_name.in_(["Total Sales", "Top Articles by Sales", "Customer Age Distribution", 
                              "Articles by Brand", "Stores by Province"])
    ).all()
    
    # Dashboard erstellen/aktualisieren
    existing_dash = db.session.query(Dashboard).filter_by(dashboard_title="Mondial Warehouse Overview").first()
    if existing_dash:
        print(f"\nDashboard existiert: Mondial Warehouse Overview - aktualisiere Charts")
        dashboard = existing_dash
    else:
        dashboard = Dashboard(
            dashboard_title="Mondial Warehouse Overview",
            slug="mondial-warehouse",
            published=True
        )
        db.session.add(dashboard)
        db.session.flush()
        print(f"\nDashboard erstellt: Mondial Warehouse Overview (ID: {dashboard.id})")
    
    # Charts zum Dashboard hinzufügen
    dashboard.slices = all_charts
    db.session.commit()
    
    print(f"\n✅ Fertig! {len(all_charts)} Charts im Dashboard.")
    print(f"   Dashboard URL: http://localhost:8088/superset/dashboard/mondial-warehouse/")
