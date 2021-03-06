package com.zut.wl.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @Author xiumu
 * @Date 2019/4/18 9:09
 */
@ToString
@Getter
@Setter
public class Other {
    private String stuId;//学号
    private double avgGpa;//平均学分绩点
    private int clazzRanking; //班级排名
    private int gradeRanking; //年级排名
    private String grade;  //学年
    private double avgme;  //数学和英语的平均成绩
}
