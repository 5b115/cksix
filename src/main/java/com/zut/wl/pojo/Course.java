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
    private int credit;//学分
    private int period;//学时
    private String courseType;//课程类型
}
