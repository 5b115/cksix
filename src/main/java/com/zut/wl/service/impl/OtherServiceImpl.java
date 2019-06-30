package com.zut.wl.service.impl;

import com.zut.wl.bean.StuWithScore;
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
import com.zut.wl.utils.sort.ComparatorSort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
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
        String score1Id = "DB0801146";
        String score2Id = "DB0801220";
        String grade = logInfoMapper.selectLastLogInfo().getLastSemester();
        List<Other> otherList = otherMapper.selectAllByGrade(grade);
        List<Student> studentList = studentMapper.selectStudentByClazz(TimeUtils.currentGrade());
        StuWithScore stuWithScore = null;
        Other other = null;
        List<StuWithScore> stuWithScoreList = new ArrayList<>();
        for (int i = 0; i < studentList.size(); i++) {
            stuWithScore = new StuWithScore();
            stuWithScore.setStuId(studentList.get(i).getStuId());
            other = otherMapper.selectOtherByStuId(studentList.get(i).getStuId());
            stuWithScore.setAvgGpa(other.getAvgGpa());
            stuWithScore.setAvgme(other.getAvgme());
            Double score1 = gradeMapper.selectScoreByStuAndCourse(otherList.get(i).getStuId(),score1Id);
            if (score1 == null){
                score1 = 0.00;
            }
            stuWithScore.setScore1(score1);
            Double score2 = gradeMapper.selectScoreByStuAndCourse(otherList.get(i).getStuId(),score2Id);
            if (score2 == null){
                score2 = 0.00;
            }
            stuWithScore.setScore2(score2); stuWithScoreList.add(stuWithScore);
        }
        Collections.sort(stuWithScoreList,new ComparatorSort());
        for (int i = 0; i < stuWithScoreList.size(); i++) {
            otherMapper.updateGradeRanking(i+1,stuWithScoreList.get(i).getStuId());
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
