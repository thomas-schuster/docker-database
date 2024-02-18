package hspf.domain.models;

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

public class Table {

    private String name;
    private List<Field> fields = new ArrayList<>();
    private List<Field> primaryFields = new ArrayList<>();
    private List<Constraint> constraints = new ArrayList<>();;

    public Table() {

    }

    public Table setName(String name) {
        this.name = name;
        return this;
    }

    public Table addField(Field field) {
        this.fields.add(field);
        if (field.isPrimaryKey()) {
            primaryFields.add(field);
        }
        return this;
    }

    public Table getPrimaryKeyConstraint(String name) {
        if (!primaryFields.isEmpty()) {
            Constraint constraint = new Constraint()
                    .setName(name)
                    .setType(ConstraintType.PRIMARYKEY);

            for (Field field : primaryFields) {
                constraint.addField(field);
            }
        }
        return this;
    }

    public List<Field> getFields() {
        return this.fields;
    }

    public List<Field> getPrimaryFields() {
        return this.fields;
    }




}
