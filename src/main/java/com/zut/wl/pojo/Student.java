package com.zut.wl.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @Author xiumu
 * @Date 2019/4/18 8:32
 */
@ToString
@Getter
@Setter
public class Student {
    private String stuId;//学号
    private String stuName;//学生姓名
    private int gradeId;//成绩
    private int otherGrade;//其他成绩
    private int volunteerId;//是否填报志愿
    private int lastMajor; //最终专业
    private int stuStatus;//是否已经填报(弃用，用volunteerId)
    private String gradeLevel;//年级
    private String clazz;//班级
    private int allowed;//是否允许填报志愿
    private Major major;
}
