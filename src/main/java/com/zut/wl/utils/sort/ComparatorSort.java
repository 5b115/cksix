package com.zut.wl.utils.sort;

import com.zut.wl.bean.StuWithScore;

import java.math.BigDecimal;
import java.util.Comparator;

/**
 * @Author xiumu
 * @Date 2019/6/27 9:14
 */
public class ComparatorSort implements Comparator<StuWithScore> {

    //平均学分绩点
    private BigDecimal o1_avg_gpa;
    private BigDecimal o2_avg_gpa;

    //英语和数学的总成绩
    private BigDecimal o1_sum_me;
    private BigDecimal o2_sum_me;

    //程序设计基础成绩
    private BigDecimal o1_score1;
    private BigDecimal o2_score1;

    //面向对象程序设计成绩
    private BigDecimal o1_score2;
    private BigDecimal o2_score2;


    @Override
    public int compare(StuWithScore o1, StuWithScore o2) {
        o1_avg_gpa = new BigDecimal(o1.getAvgGpa());
        o2_avg_gpa = new BigDecimal(o2.getAvgGpa());
        if (o1_avg_gpa.compareTo(o2_avg_gpa)>0){
            return -1;
        }else if (o1_avg_gpa.compareTo(o2_avg_gpa)<0){
            return 1;
        }else {
            o1_sum_me = new BigDecimal(o1.getAvgme());
            o2_sum_me = new BigDecimal(o2.getAvgme());
            if (o1_sum_me.compareTo(o2_sum_me)>0){
                return -1;
            }else if (o1_sum_me.compareTo(o2_sum_me)<0) {
                return 1;
            }else {
                o1_score1 = new BigDecimal(o1.getScore1());
                o2_score1 = new BigDecimal(o2.getScore1());
                if (o1_score1.compareTo(o2_score1)>0){
                    return -1;
                }else if (o1_score1.compareTo(o2_score1)<0) {
                    return 1;
                }else {
                    o1_score2 = new BigDecimal(o1.getScore2());
                    o2_score2 = new BigDecimal(o2.getScore2());
                    if (o1_score2.compareTo(o2_score2)>0){
                        return -1;
                    }else if (o1_score2.compareTo(o2_score2)<0) {
                        return 1;
                    }
                }
            }
        }
        return 0;
    }
}
