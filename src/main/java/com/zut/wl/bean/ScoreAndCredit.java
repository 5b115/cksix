package com.zut.wl.bean;

import java.math.BigDecimal;

/**
 * @Author xiumu
 * @Date 2019/5/31 14:27
 */
public class ScoreAndCredit {
    private double score;
    private double credit;
    private double courseCredit;
    private BigDecimal product;

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public BigDecimal getProduct() {
        BigDecimal s = new BigDecimal(score);
        BigDecimal c = new BigDecimal(credit);
        return s.multiply(c);
    }

    public double getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(double courseCredit) {
        this.courseCredit = courseCredit;
    }

}
