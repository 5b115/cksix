import com.zut.wl.mapper.*;
import com.zut.wl.pojo.Grade;
import com.zut.wl.pojo.Major;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.StudentService;
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

    @Autowired
    private GradeMapper gradeMapper;

    @Autowired
    private StudentService studentService;

    @Test
    public void insertTest(){
        Student student = new Student();
        student.setStuId("201608040122");
        student.setStuName("朽木");
        studentMapper.insOne(student);
    }

    @Test
    public void selectTest(){
        System.out.println(studentMapper.selectStudentMajor());
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
        String stuId = studentMapper.selectStuId(TimeUtils.currentGrade()+"%");
        System.out.println(stuId);
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
        List<Student> students = studentMapper.selectNotMajorStudent(TimeUtils.currentGrade());
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


    @Test
    public void testGradeMapper(){
        for (Grade grade : gradeMapper.selectAll()) {
            System.out.println(grade);
        }
    }

}
