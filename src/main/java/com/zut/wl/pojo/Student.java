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
    private int other_grade;//其他成绩
    private int volunteerId;//填报的志愿
    private int lastMajor; //最终专业
    private int stu_status;//是否已经填报
}
