import com.zut.wl.utils.ClientUtil;
import com.zut.wl.utils.ResolveJsonResponse;
import com.zut.wl.utils.TimeUtils;
import org.junit.Test;

/**
 * @Author xiumu
 * @Date 2019/5/7 8:36
 */
public class TestClientUtil {
    @Test
    public void testGetAccessToken(){
        ClientUtil clientUtil = new ClientUtil();
        System.out.println(clientUtil.getAccessToken());
    }
    @Test
    public void testGetStudentInfo(){
        ResolveJsonResponse resolveJsonResponse = new ResolveJsonResponse();
        resolveJsonResponse.getStudentInfo("2018",1);
        System.out.println(resolveJsonResponse.getStudents());
    }

    @Test
    public void testTimeUtils(){
        System.out.println(TimeUtils.currentTime());
    }


    @Test
    public void testDoWhile(){
        int maxPage = 10;
        int page = 0;
        do {
            page+=1;
            System.out.println(maxPage+"\t"+page);
        }while (maxPage!=page);
        System.out.println(page);
    }
}
