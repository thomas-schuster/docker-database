package hspf;

import hspf.domain.models.Field;
import hspf.domain.models.Row;
import hspf.domain.models.Table;
import hspf.domain.services.IGeneratorService;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class Generator implements IGeneratorService {

  private Table table;
  private Map<String, String> customerStoreMap;
  private Map<String, Integer> articlePriceMap;

  private Map<Integer, Row> rows = new HashMap<>();

  public Generator() {}

  public Generator addTable(Table table) {
    this.table = table;
    setCustomerStores();
    setArticlePriceMap();
    return this;
  }

  public void print() {
    for (Row row : rows.values()) {
      System.out.printf(
        "('%s','%s','%s','%s',%s,%s),%n",
        row.getValue("ArticleId"),
        row.getValue("CustomerId"),
        row.getValue("StoreId"),
        row.getValue("TimeId"),
        row.getValue("Amount"),
        row.getValue("SalesVolume")
      );
    }
  }


  public void generate(int amount, int lowerBound, int upperBound) {
    if(lowerBound > upperBound) {
      throw new RuntimeException("LowerBound cannot exceed upperBound");
    }

    for (int i = 0; i < amount; i++) {
      Row row = generateRow(lowerBound, upperBound);
      addRow(i, row);
    }
  }

  // is PoC
  // TODO Generalization for Fields
  public Row generateRow(int lowerBound, int upperBound) {
    Row row = new Row(table);
    Collections.sort(table.getFields());
    for (Field field : table.getFields()) {
      switch (field.getName()) {
        case "ArticleId":
          String articleId = generateArticleId();
          int amount = pickAmount();
          row.putValue(field.getName(), articleId);
          row.putValue("Amount", String.valueOf(amount));
          row.putValue(
                  "SalesVolume",
                  String.valueOf(amount * articlePriceMap.get(articleId))
          );
          break;
        case "CustomerId":
          row.putValue(field.getName(), generateCustomerId());
          break;
        case "TimeId":
          row.putValue(field.getName(), generateTimeId(lowerBound, upperBound));
          break;
        case "StoreId":
          row.putValue(
                  field.getName(),
                  pickStoreId(row.getValue("CustomerId"))
          );
      }
    }
    return row;
  }

  public void addRow(int i, Row row) {
    this.rows.put(i, row);
  }

  private int pickAmount() {
    Random random = new Random();
    int randomNumber = random.nextInt(5) + 1;

    return randomNumber;
  }

  private String pickStoreId(String customerId) {
    return customerStoreMap.get(customerId);
  }

  private String generateTimeId(int lowerBound, int upperBound) {
    Random random = new Random();
    int range = upperBound - lowerBound + 1;
    int randomNumber = random.nextInt(range) + lowerBound;

    return String.format("T-%04d", randomNumber);
  }

  private String generateCustomerId() {
    Random random = new Random();
    int randomNumber = random.nextInt(60) + 1;

    return String.format("C-%03d", randomNumber);
  }

  private String generateArticleId() {
    Random random = new Random();
    int randomNumber;

    do {
      randomNumber = random.nextInt(130) + 1;
    } while (
      randomNumber >= 71 &&
      randomNumber <= 100 ||
      randomNumber >= 111 &&
      randomNumber <= 120
    );
    return String.format("A-%03d", randomNumber);
  }


  private void setCustomerStores() {
    customerStoreMap = new HashMap<>();
    customerStoreMap.put("C-001", "S-001");
    customerStoreMap.put("C-002", "S-002");
    customerStoreMap.put("C-003", "S-011");
    customerStoreMap.put("C-004", "S-003");
    customerStoreMap.put("C-005", "S-012");
    customerStoreMap.put("C-006", "S-013");
    customerStoreMap.put("C-007", "S-009");
    customerStoreMap.put("C-008", "S-008");
    customerStoreMap.put("C-009", "S-014");
    customerStoreMap.put("C-010", "S-010");
    customerStoreMap.put("C-011", "S-011");
    customerStoreMap.put("C-012", "S-013");
    customerStoreMap.put("C-013", "S-009");
    customerStoreMap.put("C-014", "S-008");
    customerStoreMap.put("C-015", "S-014");
    customerStoreMap.put("C-016", "S-010");
    customerStoreMap.put("C-017", "S-001");
    customerStoreMap.put("C-018", "S-009");
    customerStoreMap.put("C-019", "S-014");
    customerStoreMap.put("C-020", "S-010");
    customerStoreMap.put("C-021", "S-001");
    customerStoreMap.put("C-022", "S-002");
    customerStoreMap.put("C-023", "S-001");
    customerStoreMap.put("C-024", "S-009");
    customerStoreMap.put("C-025", "S-009");
    customerStoreMap.put("C-026", "S-014");
    customerStoreMap.put("C-027", "S-009");
    customerStoreMap.put("C-028", "S-009");
    customerStoreMap.put("C-029", "S-014");
    customerStoreMap.put("C-030", "S-014");
    customerStoreMap.put("C-031", "S-001");
    customerStoreMap.put("C-032", "S-002");
    customerStoreMap.put("C-033", "S-001");
    customerStoreMap.put("C-034", "S-009");
    customerStoreMap.put("C-035", "S-009");
    customerStoreMap.put("C-036", "S-014");
    customerStoreMap.put("C-037", "S-014");
    customerStoreMap.put("C-038", "S-010");
    customerStoreMap.put("C-039", "S-010");
    customerStoreMap.put("C-040", "S-010");
    customerStoreMap.put("C-041", "S-010");
    customerStoreMap.put("C-042", "S-010");
    customerStoreMap.put("C-043", "S-010");
    customerStoreMap.put("C-044", "S-010");
    customerStoreMap.put("C-045", "S-010");
    customerStoreMap.put("C-046", "S-010");
    customerStoreMap.put("C-047", "S-010");
    customerStoreMap.put("C-048", "S-010");
    customerStoreMap.put("C-049", "S-010");
    customerStoreMap.put("C-050", "S-010");
    customerStoreMap.put("C-051", "S-001");
    customerStoreMap.put("C-052", "S-002");
    customerStoreMap.put("C-053", "S-001");
    customerStoreMap.put("C-054", "S-009");
    customerStoreMap.put("C-055", "S-009");
    customerStoreMap.put("C-056", "S-014");
    customerStoreMap.put("C-057", "S-014");
    customerStoreMap.put("C-058", "S-010");
    customerStoreMap.put("C-059", "S-010");
    customerStoreMap.put("C-060", "S-010");
  }

  private void setArticlePriceMap() {
    articlePriceMap = new HashMap<>();
    articlePriceMap.put("A-001", 1200);
    articlePriceMap.put("A-002", 500);
    articlePriceMap.put("A-003", 80);
    articlePriceMap.put("A-004", 100);
    articlePriceMap.put("A-005", 120);
    articlePriceMap.put("A-006", 100);
    articlePriceMap.put("A-007", 180);
    articlePriceMap.put("A-008", 300);
    articlePriceMap.put("A-009", 220);
    articlePriceMap.put("A-010", 40);
    articlePriceMap.put("A-011", 1200);
    articlePriceMap.put("A-012", 500);
    articlePriceMap.put("A-013", 80);
    articlePriceMap.put("A-014", 100);
    articlePriceMap.put("A-015", 120);
    articlePriceMap.put("A-016", 100);
    articlePriceMap.put("A-017", 180);
    articlePriceMap.put("A-018", 300);
    articlePriceMap.put("A-019", 220);
    articlePriceMap.put("A-020", 40);
    articlePriceMap.put("A-021", 1000);
    articlePriceMap.put("A-022", 800);
    articlePriceMap.put("A-023", 350);
    articlePriceMap.put("A-024", 200);
    articlePriceMap.put("A-025", 600);
    articlePriceMap.put("A-026", 2000);
    articlePriceMap.put("A-027", 120);
    articlePriceMap.put("A-028", 1000);
    articlePriceMap.put("A-029", 50);
    articlePriceMap.put("A-030", 80);
    articlePriceMap.put("A-031", 1200);
    articlePriceMap.put("A-032", 2000);
    articlePriceMap.put("A-033", 1000);
    articlePriceMap.put("A-034", 200);
    articlePriceMap.put("A-035", 400);
    articlePriceMap.put("A-036", 2500);
    articlePriceMap.put("A-037", 500);
    articlePriceMap.put("A-038", 250);
    articlePriceMap.put("A-039", 150);
    articlePriceMap.put("A-040", 1000);
    articlePriceMap.put("A-041", 600);
    articlePriceMap.put("A-042", 1200);
    articlePriceMap.put("A-043", 1400);
    articlePriceMap.put("A-044", 180);
    articlePriceMap.put("A-045", 500);
    articlePriceMap.put("A-046", 70);
    articlePriceMap.put("A-047", 30);
    articlePriceMap.put("A-048", 90);
    articlePriceMap.put("A-049", 3000);
    articlePriceMap.put("A-050", 120);
    articlePriceMap.put("A-051", 600);
    articlePriceMap.put("A-052", 2000);
    articlePriceMap.put("A-053", 350);
    articlePriceMap.put("A-054", 2500);
    articlePriceMap.put("A-055", 1200);
    articlePriceMap.put("A-056", 300);
    articlePriceMap.put("A-057", 1400);
    articlePriceMap.put("A-058", 1000);
    articlePriceMap.put("A-059", 400);
    articlePriceMap.put("A-060", 180);
    articlePriceMap.put("A-061", 40);
    articlePriceMap.put("A-062", 150);
    articlePriceMap.put("A-063", 250);
    articlePriceMap.put("A-064", 350);
    articlePriceMap.put("A-065", 1000);
    articlePriceMap.put("A-066", 100);
    articlePriceMap.put("A-067", 90);
    articlePriceMap.put("A-068", 150);
    articlePriceMap.put("A-069", 180);
    articlePriceMap.put("A-070", 500);
    articlePriceMap.put("A-101", 10);
    articlePriceMap.put("A-102", 15);
    articlePriceMap.put("A-103", 30);
    articlePriceMap.put("A-104", 20);
    articlePriceMap.put("A-105", 50);
    articlePriceMap.put("A-106", 60);
    articlePriceMap.put("A-107", 20);
    articlePriceMap.put("A-108", 25);
    articlePriceMap.put("A-109", 10);
    articlePriceMap.put("A-110", 25);
    articlePriceMap.put("A-121", 10);
    articlePriceMap.put("A-122", 15);
    articlePriceMap.put("A-123", 30);
    articlePriceMap.put("A-124", 20);
    articlePriceMap.put("A-125", 50);
    articlePriceMap.put("A-126", 60);
    articlePriceMap.put("A-127", 20);
    articlePriceMap.put("A-128", 25);
    articlePriceMap.put("A-129", 10);
    articlePriceMap.put("A-130", 25);
  }
}
