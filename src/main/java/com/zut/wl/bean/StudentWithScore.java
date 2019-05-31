package com.zut.wl.bean;

import com.zut.wl.pojo.Grade;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/31 14:13
 */

public class StudentWithScore {
    private String stuId;
    private String stuName;
    private List<ScoreAndCredit> scoreAndCreditList = new ArrayList<>();
    private double avgGpa;
    private BigDecimal sumCredit = new BigDecimal(0);

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public List<ScoreAndCredit> getScoreAndCreditList() {
        return scoreAndCreditList;
    }

    public void setScoreAndCreditList(List<ScoreAndCredit> scoreAndCreditList) {
        this.scoreAndCreditList = scoreAndCreditList;
    }

    public double getAvgGpa() {
        BigDecimal sumGpa = new BigDecimal(0);
        for (int i = 0; i < scoreAndCreditList.size(); i++) {
            sumGpa = sumGpa.add(scoreAndCreditList.get(i).getProduct());
        }
        avgGpa = sumGpa.divide(sumCredit,3,BigDecimal.ROUND_HALF_EVEN).doubleValue();
        return avgGpa;
    }

    public BigDecimal getSumCredit() {
        for (ScoreAndCredit scoreAndCredit : scoreAndCreditList) {
            sumCredit = sumCredit.add(new BigDecimal(scoreAndCredit.getCourseCredit()));
        }
        return sumCredit;
    }

    public StudentWithScore(List<Grade> gradeList) {
        ScoreAndCredit scoreAndCredit = null;
        for (Grade grade : gradeList) {
            scoreAndCredit = new ScoreAndCredit();
            scoreAndCredit.setScore(grade.getGradeScore());
            scoreAndCredit.setCredit(grade.getGradeCredit());
            scoreAndCredit.setCourseCredit(grade.getCourseCredit());
            scoreAndCreditList.add(scoreAndCredit);
        }
        getSumCredit();
    }
}
