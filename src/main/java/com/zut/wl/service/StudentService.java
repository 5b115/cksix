package com.zut.wl.service;

import com.github.pagehelper.PageInfo;
import com.zut.wl.pojo.Student;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/22 20:58
 */
public interface StudentService {

    /**
     * 获取学生信息的分页数据
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
}
