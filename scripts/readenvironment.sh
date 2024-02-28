MONDIALUSERPASSWORD="$USERPASSWORD"
MONDIALUSER="$MONDIALUSER"
MONDIALDB="$MONDIALDB"

sed -i "s/MONDIALUSERPASSWORD/${MONDIALUSERPASSWORD}/g" /sql/mondial_schema.sql
sed -i "s/MONDIALUSER/${MONDIALUSER}/g" /sql/mondial_schema.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_schema.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_data.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_warehouse_schema.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_warehouse_store_data.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_warehouse_customer_data.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_warehouse_article_data.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_warehouse_time_data.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_warehouse_sales_data.sql
