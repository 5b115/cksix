import org.junit.Test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/11 11:34
 */
public class TestString {

    @Test
    public void testSub(){
        List<Integer> ranking = new ArrayList();
        ranking.add(1);
        ranking.add(2);
        ranking.add(3);
        ranking.add(4);
        ranking.add(5);
        ranking.add(6);
        Collections.shuffle(ranking);
        for (Object o : ranking) {
            System.out.println(o);
        }

    }

    @Test
    public void testBigDecimal(){
        BigDecimal a = new BigDecimal(5);
        BigDecimal math = new BigDecimal(28.55);
        BigDecimal english = new BigDecimal(39.5);
        double d = 0;
        System.out.println(a.add(math).add(english).doubleValue());
    }
}
