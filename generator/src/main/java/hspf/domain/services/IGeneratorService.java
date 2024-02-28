package hspf.domain.services;

import hspf.domain.models.Row;

public interface IGeneratorService {

    void print();
    void generate(int amount, int lowerBound, int upperBound);
    Row generateRow(int lowerBound, int upperBound);
}
