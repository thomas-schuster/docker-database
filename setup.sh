#!/bin/bash
# =============================================================================
# setup.sh - Vollständiges Setup für MondialDB mit Superset
# =============================================================================
# Dieses Skript:
# 1. Baut das Docker-Image für die MondialDB
# 2. Startet alle Container (DB, pgAdmin, Superset)
# 3. Wartet bis alles bereit ist
# 4. Konfiguriert automatisch die Datenbankverbindung in Superset
# =============================================================================

set -e

# Lade Umgebungsvariablen aus .env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Standardwerte setzen, falls nicht in .env
MONDIAL_USER=${MONDIAL_USER:-mondial}
MONDIAL_PASSWORD=${MONDIAL_PASSWORD:-mondial!}
MONDIAL_DB=${MONDIAL_DB:-mondial}

# Farben für Output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN} MondialDB + Superset Setup${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# -----------------------------------------------------------------------------
# Schritt 1: Docker Image bauen
# -----------------------------------------------------------------------------
echo -e "${YELLOW}[1/4] Baue Docker-Image 'ngmondial'...${NC}"
docker build -t ngmondial . -q
echo -e "${GREEN}      ✓ Image gebaut${NC}"

# -----------------------------------------------------------------------------
# Schritt 2: Alte Container stoppen und entfernen
# -----------------------------------------------------------------------------
echo -e "${YELLOW}[2/4] Räume alte Container auf...${NC}"
docker compose down -v 2>/dev/null || true
echo -e "${GREEN}      ✓ Aufgeräumt${NC}"

# -----------------------------------------------------------------------------
# Schritt 3: Container starten
# -----------------------------------------------------------------------------
echo -e "${YELLOW}[3/4] Starte Container...${NC}"
docker compose up -d

# Warte auf Datenbank
echo -n "      Warte auf Datenbank"
until docker exec mondial-db pg_isready -U mondial -d mondial -q 2>/dev/null; do
    echo -n "."
    sleep 2
done
echo -e " ${GREEN}✓${NC}"

# Warte auf Superset
echo -n "      Warte auf Superset"
MAX_WAIT=120
COUNTER=0
until curl -s http://localhost:8088/health 2>/dev/null | grep -q "OK" || [ $COUNTER -eq $MAX_WAIT ]; do
    echo -n "."
    sleep 2
    COUNTER=$((COUNTER+2))
done

if [ $COUNTER -eq $MAX_WAIT ]; then
    echo -e " ${RED}Timeout!${NC}"
    echo -e "${RED}Superset konnte nicht gestartet werden. Prüfe: docker compose logs superset${NC}"
    exit 1
fi
echo -e " ${GREEN}✓${NC}"

# -----------------------------------------------------------------------------
# Schritt 4: Datenbank in Superset konfigurieren
# -----------------------------------------------------------------------------
echo -e "${YELLOW}[4/5] Konfiguriere Datenbankverbindung in Superset...${NC}"

# Erstelle Datenbankverbindung via Superset CLI (der zuverlässigste Weg)
docker exec mondial-superset superset set-database-uri \
    -d "Mondial DB" \
    -u "postgresql+psycopg2://${MONDIAL_USER}:${MONDIAL_PASSWORD}@db:5432/${MONDIAL_DB}" \
    2>/dev/null

echo -e "${GREEN}      ✓ Datenbankverbindung erstellt${NC}"

# -----------------------------------------------------------------------------
# Schritt 5: Datasets, Charts und Dashboard erstellen
# -----------------------------------------------------------------------------
echo -e "${YELLOW}[5/5] Erstelle Datasets, Charts und Dashboard...${NC}"

# Kopiere und führe Setup-Skripte aus
docker cp superset/init_datasets.py mondial-superset:/tmp/ 2>/dev/null
docker cp superset/create_charts.py mondial-superset:/tmp/ 2>/dev/null

# Erstelle Datasets (für warehouse.sales, warehouse.article, etc.)
docker exec -u root mondial-superset python /tmp/init_datasets.py 2>/dev/null
echo -e "${GREEN}      ✓ Datasets erstellt${NC}"

# Erstelle Charts und Dashboard
docker exec -u root mondial-superset python /tmp/create_charts.py 2>/dev/null
echo -e "${GREEN}      ✓ Charts und Dashboard erstellt${NC}"

# -----------------------------------------------------------------------------
# Fertig!
# -----------------------------------------------------------------------------
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN} Setup abgeschlossen!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Zugriff:"
echo -e "  • Superset:   ${GREEN}http://localhost:8088${NC}  - User: admin / Pass: admin"
echo -e "  • pgAdmin:    ${GREEN}http://localhost:5050${NC}  - User: user@hs-pforzheim.de / Pass: secret"
echo -e "  • PostgreSQL: ${GREEN}localhost:5432${NC}         - User: mondial / Pass: mondial!"
echo ""
echo "In Superset verfügbar:"
echo -e "  • Dashboard:  ${GREEN}http://localhost:8088/superset/dashboard/mondial-warehouse/${NC}"
echo "  • 5 Datasets aus dem warehouse Schema"
echo "  • 5 Charts zur Datenanalyse"
echo ""
echo "Container stoppen: docker compose down"
echo "Container + Daten löschen: docker compose down -v"
