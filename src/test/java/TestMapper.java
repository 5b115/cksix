import com.zut.wl.mapper.CourseMapper;
import com.zut.wl.mapper.LogInfoMapper;
import com.zut.wl.mapper.MajorMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.pojo.Course;
import com.zut.wl.pojo.Major;
import com.zut.wl.pojo.Student;
import com.zut.wl.utils.TimeUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

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

    @Autowired
    private MajorMapper majorMapper;

    @Autowired
    private LogInfoMapper logInfoMapper;

    @Test
    public void insertTest(){
        Student student = new Student();
        student.setStuId("201608040122");
        student.setStuName("朽木");
        studentMapper.insOne(student);
    }

    @Test
    public void selectTest(){
        List<Course> courses = courseMapper.selectAllCourse();
        for (Course course : courses) {
            System.out.println(course);
        }
    }

    @Test
    public void selectMajor(){
        List<Major> majorList = majorMapper.getMajorByStatus();
        for (Major major : majorList) {
            System.out.println(major);
        }
    }
    @Test
    public void selectStudent(){
        List<Student> students = studentMapper.selectStudentWithMajor();
        for (Student student : students) {
            System.out.println(student);
        }
        System.out.println(studentMapper.selectOneById("201711044604"));
    }
    @Test
    public void selectRepeatStudent(){
        List<Student> students = studentMapper.selectRepeatStudent("2017");
        for (Student student : students) {
            System.out.println(student);
        }
    }

    @Test
    public void selectNotMajortStudent(){
        List<Student> students = studentMapper.selectNotMajorStudent();
        for (Student student : students) {
            System.out.println(student);
        }
    }

    @Test
    public void testTimeUtils(){
        System.out.println(TimeUtils.currentGrade());
    }

    @Test
    public void testLogInfoMapper(){
        System.out.println(logInfoMapper.selectLastLogInfo());
    }
}
