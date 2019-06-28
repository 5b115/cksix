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
    //学号
    private String stuId;
    //姓名
    private String stuName;
    //各科成绩和学分
    private List<ScoreAndCredit> scoreAndCreditList = new ArrayList<>();
    //平均学分绩点
    private double avgGpa;
    //总学分
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

    /**
     * 计算平均学分绩点
     * @return
     */
    public double getAvgGpa() {
        BigDecimal sumGpa = new BigDecimal(0);
        for (int i = 0; i < scoreAndCreditList.size(); i++) {
            sumGpa = sumGpa.add(scoreAndCreditList.get(i).getProduct());
        }
        avgGpa = sumGpa.divide(sumCredit,3,BigDecimal.ROUND_HALF_EVEN).doubleValue();
        return avgGpa;
    }

    /**
     * 获取总学分
     * @return
     */
    public BigDecimal getSumCredit() {
        for (ScoreAndCredit scoreAndCredit : scoreAndCreditList) {
            sumCredit = sumCredit.add(new BigDecimal(scoreAndCredit.getCourseCredit()));
        }
        return sumCredit;
    }

    /**
     * 构造计算学生平均学分绩点的对象
     * @param gradeList
     */
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
