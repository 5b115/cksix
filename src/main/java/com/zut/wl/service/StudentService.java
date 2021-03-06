package com.zut.wl.service;

import com.github.pagehelper.PageInfo;
import com.zut.wl.bean.ClazzContent;
import com.zut.wl.bean.VolunteerInfo;
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

    /**
     * 更新学生填报志愿的情况
     * @param stuId 学号
     */
    void updateStuFilled(String stuId);


    /**
     * 分流专业,按照第一志愿分流
     */
    @Deprecated
    void updateAssignMajor();

    /**
     * 志愿优先专业分流
     */
    void updateAssignByVolunteer();

    /**
     * 查询分配到该专业的所有学生
     * @param majorName 专业名字
     * @return
     */
    List<Student> selectStuByMajor(String majorName);

    /**
     * 分页查询分配到该专业的所有学生
     * @param majorName 专业名字
     * @param pn 页数
     * @return
     */
    PageInfo selectStuByMajorPage(String majorName,int pn);

    /**
     * 查询学生的最终专业
     * @param stuId
     * @return
     */
    Map<String,Object> selectStuLastMajor(String stuId);

    /**
     * 将分好的专业归零
     */
    void updateLastMajor();

    /**
     * 获取专业填报情况，招生人数，填报人数，平均学分绩点
     * @return
     */
    List<VolunteerInfo> getVolunteerInfoList();

    /**
     * 分页查询没有填报的学生
     * @param pn 页数
     * @return
     */
    PageInfo selStudentfilled(int pn);

    /**
     * 将学生的volunteerId填报情况归零
     */
    void updateStuVolunteer();
}
