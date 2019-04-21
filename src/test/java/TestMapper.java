import com.zut.wl.mapper.CourseMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.pojo.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author xiumu
 * @Date 2019/4/20 12:16
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:application.xml"})
public class TestMapper {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private CourseMapper courseMapper;

    @Test
    public void insertTest(){
        Student student = new Student();
        student.setStuId("201608040122");
        student.setStuName("朽木");
        studentMapper.insOne(student);
    }

    @Test
    public void selectTest(){
        System.out.println(courseMapper.selectAllCourse());
    }
}
