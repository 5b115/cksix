package com.zut.wl.service;

import com.github.pagehelper.PageInfo;
import com.zut.wl.bean.ClazzContent;
import com.zut.wl.pojo.Student;

import java.util.List;
import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/4/22 20:58
 */
public interface StudentService {

    /**
     * 分页获取还未填报志愿的学生
     * @param pn 第几页
     * @return
     */
    PageInfo selStudentPageInfo(int pn);

    /**
     * 查询当前学年留级的学生
     * @return
     */
    List<Student> selectRepeatStudentByGrade();

    /**
     * 获取转专业的学生信息
     * @return
     */
    List<Student> selectStudentNotMajor();

    /**
     * 根据id获取学生信息
     * @param id
     * @return
     */
    Student selectStudentById(String id);

    /**
     * 更改学生的最终专业以及填报权限
     * @param stuId
     * @param majorName
     * @param allowed
     */
    void updateStudentMajor(String stuId,String majorName,int allowed);

    void insertOne();

    /**
     * 查询已经分配专业的学生
     * @return
     */
    List<Student> selectStudentMajor();

    /**
     * 查询没有填报资格的学生
     * @return
     */
    List<Student> selectStudentNotAllowed();

    /**
     * 获取目前学生的填报情况
     * @return
     */
    Map<String,Object> selectVolunteerInfo();

    /**
     * 查询学生信息包括成绩和课程
     * @return
     */
    Map<String,Object> selectStuWithCG(String stuId);

    /**
     * 学生端判断学生登录
     * @param stuId 学号
     * @param password 密码
     * @return
     */
    boolean selectStudentCheck(String stuId, String password);

    /**
     * 查询班级填报情况
     * @return
     */
    List<ClazzContent> selectClazzContent();
}
