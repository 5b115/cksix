import org.junit.Test;

import java.math.BigDecimal;

/**
 * @Author xiumu
 * @Date 2019/5/11 11:34
 */
public class TestString {

    @Test
    public void testSub(){
        StringBuffer stuId = new StringBuffer("201808064122");
        stuId.setCharAt(8,'0');
        System.out.println(stuId.toString().substring(0,10));
    }

    @Test
    public void testBigDecimal(){
        BigDecimal a = new BigDecimal(5);
        System.out.println(a.divide(new BigDecimal(2)).doubleValue());
    }
}
