# Apache Superset Integration

Diese Anleitung beschreibt, wie Apache Superset mit der MondialDB verwendet wird.

## Voraussetzungen

- Docker und Docker Compose installiert
- Das `ngmondial` Image muss gebaut sein:
  ```bash
  docker build -t ngmondial .
  ```

## Quick Start

```bash
# Alle Services starten (DB + pgAdmin + Superset)
docker compose up -d

# Warten bis alle Services bereit sind (ca. 30-60 Sekunden)
docker compose logs -f superset
```

## Zugriff

| Service | URL | Login |
|---------|-----|-------|
| **Superset** | http://localhost:8088 | `admin` / `admin` |
| **pgAdmin** | http://localhost:5050 | `user@hs-pforzheim.de` / `secret` |
| **PostgreSQL** | localhost:5432 | `mondial` / `mondial!` |

## Datenbank in Superset einrichten

Nach dem ersten Start muss die Datenbankverbindung manuell eingerichtet werden:

### 1. Neue Datenbankverbindung anlegen

1. In Superset einloggen: http://localhost:8088
2. **Settings** → **Database Connections** → **+ Database**
3. **PostgreSQL** auswählen
4. Verbindungsdetails eingeben:

   | Feld | Wert |
   |------|------|
   | Host | `db` |
   | Port | `5432` |
   | Database name | `mondial` |
   | Username | `mondial` |
   | Password | `mondial!` |

5. **Test Connection** klicken
6. **Connect** klicken

### 2. Oder: SQLAlchemy URI verwenden

Unter "Advanced" → "SQLAlchemy URI":
```
postgresql+psycopg2://mondial:mondial!@db:5432/mondial
```

## Datasets erstellen

Nach der Datenbankverbindung können Datasets (Tabellen) hinzugefügt werden:

1. **Data** → **Datasets** → **+ Dataset**
2. **Database**: Mondial DB
3. **Schema**: `warehouse` (für Data Warehouse) oder `public` (für Mondial)
4. **Table**: gewünschte Tabelle auswählen

### Empfohlene Datasets für das Warehouse

| Schema | Tabelle | Beschreibung |
|--------|---------|--------------|
| `warehouse` | `sales` | Verkaufstransaktionen |
| `warehouse` | `article` | Artikelstammdaten |
| `warehouse` | `customer` | Kundendaten |
| `warehouse` | `store` | Filialdaten |
| `warehouse` | `time` | Zeitdimension |
| `warehouse` | `location` | Standortdaten |

## Dashboard importieren

Falls ein Dashboard-Export vorhanden ist:

1. **Settings** → **Import Dashboards**
2. ZIP-Datei auswählen (enthält Dashboard + Charts + Datasets)
3. **Import** klicken

## Troubleshooting

### Superset startet nicht

```bash
# Logs prüfen
docker compose logs superset

# Container neustarten
docker compose restart superset
```

### Keine Daten in Charts

1. Prüfen, ob die Datenbankverbindung funktioniert (Test Connection)
2. Prüfen, ob das richtige Schema ausgewählt ist (`warehouse` vs `public`)
3. Prüfen, ob Daten in den Tabellen vorhanden sind:
   ```bash
   docker exec -it mondial-db psql -U mondial -d mondial -c "SELECT COUNT(*) FROM warehouse.sales;"
   ```

### Datenbank-Verbindung fehlgeschlagen

Der Hostname muss `db` sein (nicht `localhost`), da die Container im selben Docker-Netzwerk sind.

### Dashboard ist leer nach Import

- Die Datenbank-Verbindung muss den gleichen Namen haben wie im Export
- Die Datasets müssen neu mit der lokalen Datenbank verknüpft werden

## Daten generieren

Der `generator/` Ordner enthält ein Java-Tool zur Generierung von Testdaten für das Warehouse-Schema:

```bash
cd generator
mvn compile exec:java
```

Die generierten SQL-Inserts können dann in die Datenbank importiert werden.

## Services stoppen

```bash
# Alle Services stoppen (Daten bleiben erhalten)
docker compose down

# Alle Services stoppen und Volumes löschen (Neustart)
docker compose down -v
```
