package hspf.domain.models;

public class Field implements Comparable {

    private String name;
    private FieldType fieldType;
    private int length;
    private boolean isNullable;
    private boolean isPrimaryKey;

    public Field(String name, FieldType fieldType, int length, boolean isNullable, boolean isPrimaryKey) {
        this.name = name;
        this.fieldType = fieldType;
        this.length = length;
        this.isNullable = isNullable;
        this.isPrimaryKey = isPrimaryKey;
    }

    public boolean isNullable() {
        return isNullable;
    }

    public boolean isPrimaryKey() {
        return isPrimaryKey;
    }

    public String getName() {
        return this.name;
    }

    @Override
    public int compareTo(Object o) {
        if (!(o instanceof Field)) {
            return  0;
        }

        Field other = (Field) o;

        return this.name.compareTo(other.getName());
    }
}
