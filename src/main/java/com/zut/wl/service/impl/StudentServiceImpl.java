package com.zut.wl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zut.wl.bean.ClazzContent;
import com.zut.wl.bean.StuWithScore;
import com.zut.wl.mapper.*;
import com.zut.wl.pojo.*;
import com.zut.wl.service.StudentService;
import com.zut.wl.utils.GradeUtil;
import com.zut.wl.utils.TimeUtils;
import com.zut.wl.utils.sort.ComparatorSort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @Author xiumu
 * @Date 2019/4/22 21:03
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private MajorMapper majorMapper;

    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private GradeMapper gradeMapper;

    @Autowired
    private OtherMapper otherMapper;

    @Autowired
    private VolunteerMapper volunteerMapper;

    @Override
    public PageInfo selStudentPageInfo(int pn) {
        PageHelper.startPage(pn,10);
        List<Student> students = studentMapper.selectAllStudentByVolunteer();
        PageInfo studentPageInfo = new PageInfo(students);
        return studentPageInfo;
    }

    @Override
    public List<Student> selectRepeatStudentByGrade() {
//        String currentGrade = TimeUtils.currentGrade();
        return studentMapper.selectRepeatStudent(TimeUtils.currentGrade());
    }

    @Override
    public List<Student> selectStudentNotMajor() {
        return studentMapper.selectNotMajorStudent(TimeUtils.currentGrade());
    }

    @Override
    public Student selectStudentById(String id) {
        return studentMapper.selectOneById(id);
    }

    @Override
    public void updateStudentMajor(String stuId, String majorName, int allowed) {
        Student student = new Student();
        student.setStuId(stuId);
        if(majorName!=null&&majorName!=""){
            student.setLastMajor(majorMapper.selectMajorByMajorName(majorName).getMajorId());
            student.setAllowed(allowed);
        }else {
            System.out.println(majorName);
            student.setLastMajor(0);
            student.setAllowed(allowed);
        }
        studentMapper.updateStudentByStuId(student);
    }


    @Override
    public void insertOne(){
        Student student = new Student();
        student.setStuId("201608040122");
        student.setStuName("朽木");
        studentMapper.insOne(student);
        System.out.println(studentMapper.selectOneById("201608040122"));
    }

    @Override
    public List<Student> selectStudentMajor() {
        return studentMapper.selectStudentMajor();
    }

    @Override
    public List<Student> selectStudentNotAllowed() {
        return studentMapper.selectStudentNoPermission();
    }

    @Override
    public Map<String, Object> selectVolunteerInfo() {
        Map<String,Object> map = new HashMap<>();
        map.put("currentTime",TimeUtils.currentTime());
        map.put("filledNumber",studentMapper.selectCountFilled(TimeUtils.currentGrade()));
        map.put("unfilledNumber",studentMapper.selectCountUnfilled(TimeUtils.currentGrade()));
        return map;
    }

    @Override
    public Map<String, Object> selectStuWithCG(String stuId) {
        Map<String,Object> map = new HashMap<>();
        Student student = studentMapper.selectOneById(stuId);
        map.put("student" ,student);
        List<Double> list = new ArrayList<>();
        List<Grade> gradeList = gradeMapper.selectByStuId(stuId);
        List<Grade> grades = new ArrayList<>();
        List<Course> courses = new ArrayList<>();
        for (Grade grade : gradeList) {
            Course course = courseMapper.selectByCourseId(grade.getCourseId());
            if (course != null) {
                courses.add(course);
                grades.add(grade);
                list.add(grade.getGradeScore());
            }
        }
        map.put("courses",courses);
        map.put("grades",grades);
        map.put("sumGrade",GradeUtil.sumGrade(list));
        map.put("avgGrade",GradeUtil.avgGrade(list));
        map.put("avgGpa",otherMapper.selectAvgGpaByStuId(stuId)+"");
        return map;
    }

    @Override
    public boolean selectStudentCheck(String stuId, String password) {
        boolean index = false;
        if (studentMapper.selectStudentExist(stuId)==1){
            if (stuId.equals(password)){
                index =  true;
            }
        }
        return index;
    }

    @Override
    public List<ClazzContent> selectClazzContent() {
        ClazzContent clazzContent = null;
        List<ClazzContent> clazzContentList = new ArrayList<>();
        List<String> clazzNameList = studentMapper.selectClazzName();
        for (String clazz : clazzNameList) {
            clazzContent = new ClazzContent();
            clazzContent.setFilledNumber(studentMapper.selectfilledByClazz(clazz));
            clazzContent.setUnfilledNumber(studentMapper.selectunfilledByClazz(clazz));
            clazzContent.setClazzName(clazz);
            clazzContentList.add(clazzContent);
        }
        return clazzContentList;
    }

    @Override
    public void updateStuFilled(String stuId) {
        studentMapper.updateStufilled(stuId);
    }

    @Override
    public void updateAssignMajor() {
        //分流算法
        String score1Id = "DB0801146";
        String score2Id = "DB0801220";
        List<Major> majorList = majorMapper.getMajorByStatus();
        for (Major major : majorList) {
            List<Volunteer> volunteerList = volunteerMapper.selectVolunteerByMajor(major.getMajorId());
            //如果填报人数小于专业限制人数则直接分配
            if (volunteerList.size()<=major.getMajorLimit()){
                for (Volunteer volunteer : volunteerList) {
                    studentMapper.updateStuByStuId(volunteer.getStuId(),major.getMajorId());
                }
            }else {
                StuWithScore stuWithScore = null;
                List<StuWithScore> stuWithScoreList = new ArrayList<>();
                Other other = null;
                for (int i = 0; i < volunteerList.size(); i++) {
                    stuWithScore = new StuWithScore();
                    stuWithScore.setStuId(volunteerList.get(i).getStuId());
                    List<Grade> gradeList = gradeMapper.selectByStuId(volunteerList.get(i).getStuId());
                    other = otherMapper.selectOtherByStuId(volunteerList.get(i).getStuId());
                    stuWithScore.setAvgGpa(other.getAvgGpa());
                    stuWithScore.setAvgme(other.getAvgme());
                    for (Grade grade : gradeList) {
                        if (score1Id.equals(grade.getCourseId())){
                            stuWithScore.setScore1(grade.getGradeScore());
                        }
                        if (score2Id.equals(grade.getCourseId())){
                            stuWithScore.setScore2(grade.getGradeScore());
                        }
                    }
                    stuWithScoreList.add(stuWithScore);
                }
                Collections.sort(stuWithScoreList,new ComparatorSort());
                for (int j = 0; j < major.getMajorLimit(); j++) {
                    studentMapper.updateStuByStuId(stuWithScoreList.get(j).getStuId(),major.getMajorId());
                }
            }
        }
    }

    @Override
    public void updateAssignByVolunteer() {
        //分流算法
        String score1Id = "DB0801146";
        String score2Id = "DB0801220";
        //先获取当前的专业
        List<Major> majorList = majorMapper.getMajorByStatus();
        int majorNumber = majorList.size();//获取当前专业的数量
        //循环志愿次序
        for (int i = 0; i < majorNumber; i++) {
            //循环专业
            for (Major major : majorList) {
                //获取第i个志愿是此专业的学生
                List<Volunteer> volunteerList = volunteerMapper.selectVolunteerByRanking(major.getMajorId(),i+1);
                //先计算该专业还有多少人可以进入  （专业限制人数 - 已经分配到此专业的人数）
                int indexLimit = major.getMajorLimit() - studentMapper.selectStuByLastMajor(major.getMajorId()).size();
                //如果还有名额
                if (indexLimit>0){
                    //查询填报了第i个志愿是此专业并且还没有被分配的学生
                    List<Student> studentList = studentMapper.selectStuByRankingAndMajor(i,major.getMajorId());
                    //如果专业人数限制>=填报该专业的人数
                    if (indexLimit>=studentList.size()){
                        //直接将学生分配到该专业
                        for (Student student : studentList) {
                            studentMapper.updateStuByStuId(student.getStuId(),major.getMajorId());
                        }
                    }else {
                        //如果填报人数大于专业人数限制
                        //给学生根据成绩排序
                        StuWithScore stuWithScore = null;
                        List<StuWithScore> stuWithScoreList = new ArrayList<>();
                        Other other = null;
                        for (int j = 0; j < studentList.size(); j++) {
                            stuWithScore = new StuWithScore();
                            other = otherMapper.selectOtherByStuId(studentList.get(j).getStuId());
                            stuWithScore.setStuId(studentList.get(j).getStuId());
                            stuWithScore.setAvgGpa(other.getAvgGpa());
                            stuWithScore.setAvgme(other.getAvgme());
                            Double score1 = gradeMapper.selectScoreByStuAndCourse(studentList.get(j).getStuId(),score1Id);
                            if (score1 == null){
                                score1 = 0.00;
                            }
                            stuWithScore.setScore1(score1);
                            Double score2 = gradeMapper.selectScoreByStuAndCourse(studentList.get(j).getStuId(),score2Id);
                            if (score2 == null){
                                score2 = 0.00;
                            }
                            stuWithScore.setScore2(score2);
                            stuWithScoreList.add(stuWithScore);
                        }
                        Collections.sort(stuWithScoreList,new ComparatorSort());
                        for (int i1 = 0; i1 < indexLimit; i1++) {
                            studentMapper.updateStuByStuId(stuWithScoreList.get(i1).getStuId(),major.getMajorId());
                        }
                    }
                }else {
                    continue;
                }
            }
        }
    }

    @Override
    public List<Student> selectStuByMajor(String majorName) {
        int majorId = majorMapper.selectMajorByMajorName(majorName).getMajorId();
        List<Student> studentList = studentMapper.selectStuByLastMajor(majorId);
        return studentList;
    }

    @Override
    public PageInfo selectStuByMajorPage(String majorName, int pn) {
        if(studentMapper.selectStuHasLastMajor().size()>0){
            int majorId = majorMapper.selectMajorByMajorName(majorName).getMajorId();
            PageHelper.startPage(pn,10);
            List<Student> students = studentMapper.selectStuByLastMajor(majorId);
            PageInfo studentList = new PageInfo(students);
            return studentList;
        }
        return null;
    }

    @Override
    public Map<String, Object> selectStuLastMajor(String stuId) {
        Map<String,Object> map = new HashMap<>();
        Student student = studentMapper.selectOneById(stuId);
        map.put("stuId",student.getStuId());
        map.put("stuName",student.getStuName());
        String majorName = majorMapper.selectMajorByMajorId(student.getLastMajor());
        map.put("lastMajorName",majorName);
        return map;
    }
}
