import org.junit.Test;

/**
 * @Author xiumu
 * @Date 2019/5/11 11:34
 */
public class TestString {

    @Test
    public void testSub(){
        StringBuffer stuId = new StringBuffer("201808064122");
        stuId.setCharAt(8,'0');
        System.out.println(stuId.toString());
    }
}
