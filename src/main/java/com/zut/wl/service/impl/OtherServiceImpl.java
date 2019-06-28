package com.zut.wl.service.impl;

import com.zut.wl.bean.StudentWithScore;
import com.zut.wl.mapper.GradeMapper;
import com.zut.wl.mapper.LogInfoMapper;
import com.zut.wl.mapper.OtherMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.pojo.Grade;
import com.zut.wl.pojo.Other;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.OtherService;
import com.zut.wl.utils.GradeUtil;
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

    @Autowired
    private LogInfoMapper logInfoMapper;

    @Override
    public void insertOther() {
        StudentWithScore studentWithScore = null;
        Other other = null;
        String mathId1 = "DB0102001";
        String mathId2 = "DB0102002";
        String englishId1 = "DB1010021";
        String englishId2 = "DB1010022";
        double mathScore1 = 0.00;
        double engLishScore1 = 0.00;
        Double mathScore2 = null;
        Double engLishScore2 = null;

        List<Other> otherList = new ArrayList<>();
        List<Student> studentList = studentMapper.selectStudentByClazz(TimeUtils.currentGrade());
        for (int i = 0; i < studentList.size(); i++) {
            List<Grade> gradeList = gradeMapper.selectWithCourseByStuId(studentList.get(i).getStuId());
            studentWithScore = new StudentWithScore(gradeList);
            mathScore1 = gradeMapper.selectScoreByStuAndCourse(studentList.get(i).getStuId(),mathId1);
            engLishScore1 = gradeMapper.selectScoreByStuAndCourse(studentList.get(i).getStuId(),englishId1);
            mathScore2 = gradeMapper.selectScoreByStuAndCourse(studentList.get(i).getStuId(),mathId2);
            engLishScore2 = gradeMapper.selectScoreByStuAndCourse(studentList.get(i).getStuId(),englishId2);
            other = new Other();
            other.setStuId(studentList.get(i).getStuId());
            other.setAvgGpa(studentWithScore.getAvgGpa());
            other.setGrade(studentList.get(i).getGradeLevel());
            other.setAvgme(GradeUtil.avgMathAndEnglish(mathScore1,engLishScore1,mathScore2,engLishScore2));
            otherList.add(other);
        }
        otherMapper.insertOtherList(otherList);
    }

    @Override
    public void updateOtherRanking() {
        String grade = logInfoMapper.selectLastLogInfo().getLastSemester();
        List<Other> otherList = otherMapper.selectAllByGrade(grade);
        for (int i = 0; i < otherList.size(); i++) {
            otherMapper.updateGradeRanking(i+1,otherList.get(i).getStuId());
        }

    }

    @Override
    public void updateOtherRepeat() {
        String grade = logInfoMapper.selectLastLogInfo().getLastSemester();
        List<Double> avgGpaList = otherMapper.selectRepeatAvgGpa(grade);
        for (int i = 0; i < avgGpaList.size(); i++) {
            List<Other> others = otherMapper.selectOtherByAvgGpa(grade,avgGpaList.get(i));
            for (int i1 = 0; i1 < others.size(); i1++) {
                //开始排序
            }
        }
    }
}
