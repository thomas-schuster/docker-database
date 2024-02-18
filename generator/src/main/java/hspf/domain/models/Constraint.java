package hspf.domain.models;

import java.util.ArrayList;
import java.util.List;

public class Constraint {

    private String name;
    private List<Field> fields = new ArrayList<>();
    private ConstraintType type;

    public  Constraint() {

    }

    public Constraint setType(ConstraintType type) {
        this.type = type;
        return this;
    }

    public Constraint setName(String name) {
        this.name = name;
        return this;
    }


    public void addField(Field field) {
        if (this.type == ConstraintType.PRIMARYKEY) {
            if (field.isPrimaryKey()) {
                fields.add(field);
            }
        }
    }

    private boolean hasPrimaries() {
        for (Field field : fields) {
            if (field.isPrimaryKey()) {
                return true;
            }
        }
        return false;
    }


}
