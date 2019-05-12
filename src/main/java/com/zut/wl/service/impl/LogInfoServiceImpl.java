package com.zut.wl.service.impl;

import com.zut.wl.mapper.CourseMapper;
import com.zut.wl.mapper.GradeMapper;
import com.zut.wl.mapper.LogInfoMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.pojo.LogInfo;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.LogInfoService;
import com.zut.wl.utils.ResolveJsonResponse;
import com.zut.wl.utils.TimeUtils;
import com.zut.wl.utils.client.ClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/7 15:32
 */
@Service
public class LogInfoServiceImpl implements LogInfoService {

    @Autowired
    private LogInfoMapper logInfoMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private GradeMapper gradeMapper;

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public LogInfo selectLastLogInfo() {
        return logInfoMapper.selectLastLogInfo();
    }

    @Override
    public void insertLastLogInfo() {
        insertStudentList();
        insertLogInfo();
    }

    /**
     * 记录数据更新日志
     */
    private void insertLogInfo(){
        LogInfo logInfo = new LogInfo();
        logInfo.setLogChangeTime(TimeUtils.currentTime());
        logInfo.setLastSemester(TimeUtils.currentGrade());
        logInfoMapper.insertOneLog(logInfo);
    }

    /**
     * 更新学生信息
     */
    private void insertStudentList(){
        ResolveJsonResponse jsonResponse = new ResolveJsonResponse(new ClientUtil());
        String grade = TimeUtils.currentGrade();
        jsonResponse.getStudentInfo(grade,1);
        int maxPage = jsonResponse.getMaxPage();
        for (int i = 0; i < maxPage; i++) {
            jsonResponse.getStudentInfo(grade,i+1);
            //插入studentList
            studentMapper.insertStudentList(jsonResponse.getStudents());
        }
    }

    /**
     * 更新课程信息
     */
    private void insertCourses(){
        ResolveJsonResponse jsonResponse = new ResolveJsonResponse(new ClientUtil());
        String clazzType = studentMapper.selectStuId(TimeUtils.currentGrade()+"%");
        jsonResponse.getCourseList(clazzType);
        int maxPage = jsonResponse.getMaxPage();
        for (int i = 0; i < maxPage; i++) {
            jsonResponse.getCourseList(clazzType);
            courseMapper.insertCourseList(jsonResponse.getCourses());
        }
    }

    /**
     * 更新成绩信息
     */
    private void insertGrades(){
        ResolveJsonResponse jsonResponse = new ResolveJsonResponse(new ClientUtil());
        List<Student> students = studentMapper.selectStudentByClazz();
        int maxPage = 0;
        for (int i = 0; i < students.size(); i++) {
            String stuId = students.get(i).getStuId();
            jsonResponse.getGradeList(stuId);
            maxPage = jsonResponse.getMaxPage();
            for (int i1 = 0; i1 < maxPage; i1++) {
                jsonResponse.getGradeList(stuId);
                gradeMapper.insertGradeList(jsonResponse.getGrades());
            }
        }

    }



}
