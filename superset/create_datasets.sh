#!/bin/bash
# Erstellt Datasets für alle Warehouse-Tabellen in Superset

set -e

# Login und Token holen
TOKEN=$(curl -s -X POST -H "Content-Type: application/json" \
    -d '{"username":"admin","password":"admin","provider":"db"}' \
    http://localhost:8088/api/v1/security/login | python3 -c "import sys,json; print(json.load(sys.stdin)['access_token'])")

echo "Token erhalten, erstelle Datasets..."

# Warehouse-Tabellen
TABLES=("sales" "article" "customer" "store" "time")

for TABLE in "${TABLES[@]}"; do
    echo -n "  Erstelle Dataset: warehouse.$TABLE ... "
    
    RESULT=$(curl -s -X POST \
        -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"database\": 1, \"schema\": \"warehouse\", \"table_name\": \"$TABLE\"}" \
        http://localhost:8088/api/v1/dataset/)
    
    if echo "$RESULT" | grep -q '"id"'; then
        echo "OK"
    else
        ERROR=$(echo "$RESULT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('message', 'Unknown error'))" 2>/dev/null || echo "$RESULT")
        echo "Fehler: $ERROR"
    fi
done

echo ""
echo "Datasets erstellt! Bitte Superset neu laden."
