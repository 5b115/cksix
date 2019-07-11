import com.zut.wl.utils.GradeUtil;
import org.junit.Test;

import java.util.*;

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
        String[] volunteers = {"软件工程","物联网","人工智能","物联网","网络工程","信息安全"};

        Set<String> volunteerSet = new HashSet<>();
        for (String volunteer : volunteers) {
            volunteerSet.add(volunteer);
        }
        if (volunteers.length==volunteerSet.size()){
            System.out.println(true);
        }else
            System.out.println(false);
    }

    @Test
    public void testTimeUtils(){
        List<Double> list = new ArrayList<>();
        list.add(40.10);
        list.add(41.20);
        list.add(42.30);
        list.add(43.40);
        list.add(44.50);
        list.add(45.60);
        list.add(46.70);
        list.add(47.80);
        list.add(48.90);
        list.add(49.00);
        System.out.println(GradeUtil.avgGradeByBigDecimal(list));
        System.out.println(GradeUtil.avgGrade(list));
    }
}
