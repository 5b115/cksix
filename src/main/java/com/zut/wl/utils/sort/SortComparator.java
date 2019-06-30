package com.zut.wl.utils.sort;

import com.zut.wl.pojo.Other;

import java.math.BigDecimal;
import java.util.Comparator;

/**
 * @Author xiumu
 * @Date 2019/6/27 9:14
 */
@Deprecated
public class SortComparator implements Comparator<Other> {

    //平均学分绩点
    private BigDecimal o1_avg_gpa;
    private BigDecimal o2_avg_gpa;

    //英语和数学的总成绩
    private BigDecimal o1_sum_me;
    private BigDecimal o2_sum_me;

    @Override
    public int compare(Other o1, Other o2) {
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

            }
        }
        return 0;
    }
}
