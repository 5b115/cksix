package com.zut.wl.service.impl;

import com.zut.wl.bean.ResultExcelEntity;
import com.zut.wl.mapper.*;
import com.zut.wl.pojo.Major;
import com.zut.wl.service.ExcelResolveService;
import com.zut.wl.utils.excel.CreateExcel;
import com.zut.wl.utils.excel.ExcelResolve;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:53
 */
@Service
public class ExcelResolveServiceImpl implements ExcelResolveService {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private OtherMapper otherMapper;
    @Autowired
    private GradeMapper gradeMapper;

    @Autowired
    private MajorMapper majorMapper;

//    private SqlSession sqlSession; 这个本来是用来做大量数据批量插入用的，暂时先不用，先用foreach来插入

    @Override
    public void insertData(ExcelResolve excelResolve) {
        studentMapper.insertStudentList(excelResolve.getStudents());
//        otherMapper.insertOtherList(excelResolve.getOthers());
        courseMapper.insertCourseList(excelResolve.getCourses());
        gradeMapper.insertGradeList(excelResolve.getGrades());
    }

    @Override
    public HSSFWorkbook createResultExcel() {
        List<Major> majorList = majorMapper.getMajorByStatus();
        List<ResultExcelEntity> resultExcelEntityList = new ArrayList<>();
        ResultExcelEntity resultExcelEntity = null;
        for (Major major : majorList) {
            resultExcelEntity = new ResultExcelEntity();
            resultExcelEntity.setMajorName(major.getMajorName());
            resultExcelEntity.setStudentList(studentMapper.selectStuByLastMajor(major.getMajorId()));
            resultExcelEntityList.add(resultExcelEntity);
        }
        CreateExcel createExcel = new CreateExcel(resultExcelEntityList);
        HSSFWorkbook resultExcel = createExcel.createResultExcrel();
        return resultExcel;
    }
}
