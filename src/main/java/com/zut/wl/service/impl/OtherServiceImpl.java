package com.zut.wl.service.impl;

import com.zut.wl.bean.StudentWithScore;
import com.zut.wl.mapper.GradeMapper;
import com.zut.wl.mapper.OtherMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.pojo.Grade;
import com.zut.wl.pojo.Other;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.OtherService;
import com.zut.wl.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/31 16:11
 */
@Service
public class OtherServiceImpl implements OtherService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private GradeMapper gradeMapper;

    @Autowired
    private OtherMapper otherMapper;

    @Override
    public void insertOther() {
        StudentWithScore studentWithScore = null;
        Other other = null;
        List<Other> otherList = new ArrayList<>();
        List<Student> studentList = studentMapper.selectStudentByClazz(TimeUtils.currentGrade());
        for (int i = 0; i < studentList.size(); i++) {
            List<Grade> gradeList = gradeMapper.selectWithCourseByStuId(studentList.get(i).getStuId());
            studentWithScore = new StudentWithScore(gradeList);
            other = new Other();
            other.setStuId(studentList.get(i).getStuId());
            other.setAvgGpa(studentWithScore.getAvgGpa());
            otherList.add(other);
        }
        otherMapper.insertOtherList(otherList);
    }
}
