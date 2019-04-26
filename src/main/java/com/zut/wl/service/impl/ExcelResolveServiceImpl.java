package com.zut.wl.service.impl;

import com.zut.wl.mapper.CourseMapper;
import com.zut.wl.mapper.GradeMapper;
import com.zut.wl.mapper.OtherMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.utils.ExcelResolve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:53
 */
@Service
public class ExcelResolveServiceImpl implements com.zut.wl.service.ExcelResolveService {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private OtherMapper otherMapper;
    @Autowired
    private GradeMapper gradeMapper;

//    private SqlSession sqlSession; 这个本来是用来做大量数据批量插入用的，暂时先不用，先用foreach来插入

    @Override
    public void insertData(ExcelResolve excelResolve) {
        studentMapper.insertStudentList(excelResolve.getStudents());
        otherMapper.insertOtherList(excelResolve.getOthers());
        courseMapper.insertCourseList(excelResolve.getCourses());
        gradeMapper.insertGradeList(excelResolve.getGrades());
    }
}
