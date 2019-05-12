package com.zut.wl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zut.wl.mapper.MajorMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.StudentService;
import com.zut.wl.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
