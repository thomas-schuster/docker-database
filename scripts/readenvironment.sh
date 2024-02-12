MONDIALUSERPASSWORD="$USERPASSWORD"
MONDIALUSER="$MONDIALUSER"
MONDIALDB="$MONDIALDB"

sed -i "s/MONDIALUSERPASSWORD/${MONDIALUSERPASSWORD}/g" /sql/mondial_schema.sql
sed -i "s/MONDIALUSER/${MONDIALUSER}/g" /sql/mondial_schema.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_schema.sql
sed -i "s/MONDIAL/${MONDIALDB}/g" /sql/mondial_data.sql
