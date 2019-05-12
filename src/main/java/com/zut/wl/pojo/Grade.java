package com.zut.wl.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @Author xiumu
 * @Date 2019/4/18 9:17
 */
@ToString
@Getter
@Setter
public class Grade {
    private int gradeId;//主键自增
    private String stuId;//学号
    private String courseId;//课程号
    private double gradeScore;//成绩得分
    private double gradePoint;//绩点
    private String examType;//重修或初修
    private double gradeCredit;//学分
}
