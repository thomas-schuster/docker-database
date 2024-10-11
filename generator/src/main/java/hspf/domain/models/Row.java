package hspf.domain.models;

import java.util.*;
import java.util.stream.Collectors;

public class Row {

    private Table table;

    private LinkedHashMap<String, String> values = new LinkedHashMap<>();

    public Row(Table table) {
        this.table = table;
    }

    public void putValue(String fieldName, String value) {
        values.put(fieldName, value);
    }

    public String getValue(String fieldName) {
        return values.get(fieldName);
    }

    @Override
    public int hashCode() {

        List<Field> pks = table.getPrimaryFields();
        List<String> fieldNames = pks.stream()
                .filter(Field::isPrimaryKey)
                .map(Field::getName)
                .collect(Collectors.toList());

        List<String> hashValues = new LinkedList<>();

        for (Map.Entry<String, String> entry : values.entrySet()) {
            if (fieldNames.contains(entry.getKey())) {
                hashValues.add(entry.getValue());
            }
        }


        return Objects.hashCode(hashValues);
    }
}
