package com.zut.wl.bean;

import lombok.Data;

/**
 * 学生信息包括各科分数
 * 以此来给学生进行排名
 * @Author xiumu
 * @Date 2019/6/27 10:50
 */
@Data
public class StuWithScore {
    private String stuId;
    private double avgGpa;
    private double avgme;
    private double score1;
    private double score2;
}
