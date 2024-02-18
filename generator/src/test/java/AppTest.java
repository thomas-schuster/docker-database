import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import hspf.Generator;
import hspf.domain.models.Field;
import hspf.domain.models.FieldType;
import hspf.domain.models.Table;

public class AppTest 
    extends TestCase
{

    public AppTest( String testName )
    {
        super( testName );
    }

    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    public void testApp()
    {
        Field articleId = new Field("ArticleId", FieldType.VARCHAR, 8, false, true);
        Field timeId = new Field("TimeId", FieldType.VARCHAR, 8, false, true);
        Field storeId = new Field("StoreId", FieldType.VARCHAR, 8, false, true);
        Field customerId = new Field("CustomerId", FieldType.VARCHAR, 8, false, true);
        Field salesVolume = new Field("SalesVolume", FieldType.DECIMAL, 24, true, false);
        Field amount = new Field("Amount", FieldType.SMALLINT, -1, true, false);

        Table sales = new Table()
                .setName("sales")
                .addField(articleId)
                .addField(timeId)
                .addField(storeId)
                .addField(customerId)
                .addField(salesVolume)
                .addField(amount)
                .getPrimaryKeyConstraint("Sales_pk");


        Generator generator = new Generator()
                .addTable(sales);

        generator.generate(5000);
        generator.print();
    }
}
