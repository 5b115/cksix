package com.zut.wl.utils;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/22 20:51
 */
public class GradeUtil {

    /**
     * 计算总成绩
     * @param list 各科分数
     * @return 总成绩
     */
    public static double sumGrade(List<Double> list){
        double sum = 0;
        for (Double d : list) {
            sum = sum + d;
        }
        return sum;
    }

    /**
     * 计算平均成绩
     * @param list 各科成绩
     * @return 平均成绩
     */
    public static double avgGrade(List<Double> list){
        double avg = sumGrade(list)/list.size();
        return avg;
    }

    /**
     * 计算总绩点
     * @param list 各科绩点
     * @return 总绩点
     */
    public static double sumGradePoint(List<Double> list){
        double sumPoint = 0;
        for (Double d : list) {
            sumPoint = sumPoint + d;
        }
        return sumPoint;
    }

    /**
     * 计算平均绩点
     * @param list 各科绩点
     * @return 平均绩点
     */
    public static double avgGradePoint(List<Double> list){
        double avgPoint = sumGradePoint(list);
        return avgPoint;
    }

    /**
     * 计算数学和英语的总成绩
     * @return
     */
    public static double avgMathAndEnglish(double mathScore,double englishScore,Double mathScore2,Double engLishScore2){
        if (mathScore2==null){
            mathScore2 = 0.00;
        }
        if (engLishScore2==null){
            engLishScore2=0.00;
        }
        return new BigDecimal(mathScore).add(new BigDecimal(englishScore)).add(new BigDecimal(mathScore2)).add(new BigDecimal(engLishScore2)).doubleValue();
    }
}
