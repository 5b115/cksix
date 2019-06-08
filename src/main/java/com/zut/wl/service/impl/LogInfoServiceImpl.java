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
    @Override
    public void insertStudentList(){
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

    @Override
    public void updateTime(String startTime, String endTime) {
        LogInfo logInfo = logInfoMapper.selectLastLogInfo();
        logInfo.setStartTime(startTime);
        logInfo.setEndTime(endTime);
        logInfoMapper.updateLogTime(logInfo);
    }

    /**
     * 更新课程信息
     */
    @Override
    public void insertCourses(){
        ResolveJsonResponse jsonResponse = new ResolveJsonResponse(new ClientUtil());
        String clazzType = studentMapper.selectStuId(TimeUtils.currentGrade()+"%");
        StringBuffer clazzTypeBuffer = new StringBuffer(clazzType);
        clazzTypeBuffer.setCharAt(8,'0');
        clazzType = clazzTypeBuffer.toString();
        jsonResponse.getCourseList(clazzType,1);
        int maxPage = jsonResponse.getMaxPage();
        for (int i = 0; i < maxPage; i++) {
            jsonResponse.getCourseList(clazzType,i+1);
            courseMapper.insertCourseList(jsonResponse.getCourses());
        }
    }

    /**
     * 更新成绩信息
     */
    @Override
    public void insertGrades(){
        ResolveJsonResponse jsonResponse = new ResolveJsonResponse(new ClientUtil());
        List<Student> students = studentMapper.selectStudentByClazz(TimeUtils.currentGrade());
        int maxPage;
        for (int i = 0; i < students.size(); i++) {
            String stuId = students.get(i).getStuId();
            jsonResponse.getGradeList(stuId,1);
            maxPage = jsonResponse.getMaxPage();
            System.out.println("这是最大页数"+maxPage);
            for (int i1 = 0; i1 < maxPage; i1++) {
                jsonResponse.getGradeList(stuId,i1+1);
                gradeMapper.insertGradeList(jsonResponse.getGrades());
            }
            System.out.println("这是学号"+stuId);
        }

    }



}
