#!/usr/bin/env python3
"""
Create datasets for Mondial warehouse tables in Superset
"""
from superset import db
from superset.connectors.sqla.models import SqlaTable
from superset.models.core import Database

# Get the Mondial DB
mondial_db = db.session.query(Database).filter_by(database_name="Mondial DB").first()

if mondial_db:
    print(f"Found DB: {mondial_db.database_name} (id={mondial_db.id})")
    
    # Create datasets for warehouse tables
    tables = ["sales", "article", "customer", "store", "time"]
    
    for table_name in tables:
        existing = db.session.query(SqlaTable).filter_by(
            table_name=table_name, 
            schema="warehouse",
            database_id=mondial_db.id
        ).first()
        
        if not existing:
            dataset = SqlaTable(
                table_name=table_name,
                schema="warehouse",
                database_id=mondial_db.id
            )
            db.session.add(dataset)
            print(f"Created dataset: warehouse.{table_name}")
        else:
            print(f"Dataset exists: warehouse.{table_name}")
    
    db.session.commit()
    print("Done!")
else:
    print("ERROR: Mondial DB not found!")
    exit(1)
