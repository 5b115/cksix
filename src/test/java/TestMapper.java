import com.zut.wl.mapper.*;
import com.zut.wl.service.LogInfoService;
import com.zut.wl.service.StudentService;
import com.zut.wl.service.VolunteerService;
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

    @Test
    public void insertTest(){

//        List<Grade> gradeList = gradeMapper.selectByStuId("201808064101");
//        List<Double> gradeScore = new ArrayList<>();
//        for (Grade grade : gradeList) {
//            gradeScore.add(grade.getGradeScore());
//            System.out.println(grade.getGradeScore());
//        }
//        System.out.println(GradeUtil.sumGrade(gradeScore));
//        System.out.println(GradeUtil.avgGrade(gradeScore));

    }

    @Test
    public void test(){
//        List<Grade> gradeList = gradeMapper.selectWithCourseByStuId("201808064101");
//        StudentWithScore studentWithScore = null;
//        Other other = null;
//        studentWithScore = new StudentWithScore(gradeList);
//        other = new Other();
//        other.setAvgGpa(studentWithScore.getAvgGpa());
//        System.out.println(other);
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
}
