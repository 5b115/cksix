package com.zut.wl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/22 21:03
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public PageInfo selStudentPageInfo(int pn) {
        PageHelper.startPage(pn,10);
        List<Student> students = studentMapper.selectAllStudent();
        PageInfo studentPageInfo = new PageInfo(students);
        return studentPageInfo;
    }

    @Override
    public List<Student> selectRepeatStudentByGrade() {
//        String currentGrade = TimeUtils.currentGrade();
        return studentMapper.selectRepeatStudent("2017");
    }

    @Override
    public List<Student> selectStudentNotMajor() {
        return studentMapper.selectNotMajorStudent();
    }

    @Override
    public Student selectStudentById(String id) {
        return studentMapper.selectOneById(id);
    }
}
