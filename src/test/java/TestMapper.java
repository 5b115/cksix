import com.zut.wl.mapper.*;
import com.zut.wl.service.LogInfoService;
import com.zut.wl.service.OtherService;
import com.zut.wl.service.StudentService;
import com.zut.wl.service.VolunteerService;
import com.zut.wl.utils.TimeUtils;
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

    @Autowired
    private MajorMapper majorMapper;

    @Autowired
    private LogInfoMapper logInfoMapper;

    @Autowired
    private GradeMapper gradeMapper;

    @Autowired
    private LogInfoService logInfoService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private VolunteerService volunteerService;

    @Autowired
    private OtherMapper otherMapper;

    @Autowired
    private OtherService otherService;

    @Autowired
    private VolunteerMapper volunteerMapper;

    @Test
    public void insertTest(){
//        otherService.updateOtherRanking();
    }

    @Test
    public void test(){

    }
    @Test
    public void zyfl(){
        studentService.updateAssignByVolunteer();
    }

    @Test
    public void sort() {
        String[] volunteers = {"软件工程","计算机科学与技术","人工智能","物联网","网络工程","信息安全"};
        String endTime = logInfoService.selectLastLogInfo().getEndTime();
        String startTime = logInfoService.selectLastLogInfo().getStartTime();
        System.out.println(TimeUtils.checkT1AfterT2(startTime,endTime));
    }



/*
    @Test
    public void selectTest(){
        for (Student student : studentMapper.selectStudentByClazz(TimeUtils.currentGrade())) {
            System.out.println(student);
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


    @Test
    public void testLogInfoService(){
        //logInfoService.insertGrades();
    }*/
    @Test
    public void testLogInfoService(){
//        logInfoService.insertCourses();
    }

}
