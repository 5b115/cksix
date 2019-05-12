package com.zut.wl.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @Author xiumu
 * @Date 2019/4/18 9:20
 */
@ToString
@Getter
@Setter
public class Course {
    private String courseId;//课程号
    private String courseName;//课程名
    private double credit;//学分
    private int period;//学时
    private String courseType;//课程类型
    private int permission;//权限（是否被选中）
    private String startYear;//开课学年
    private String clazzType;//开课班级
}
