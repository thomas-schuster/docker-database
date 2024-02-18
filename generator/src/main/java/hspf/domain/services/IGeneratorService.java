package hspf.domain.services;

import hspf.domain.models.Row;

public interface IGeneratorService {

    void print();
    void generate(int amount);
    Row generateRow();
}
