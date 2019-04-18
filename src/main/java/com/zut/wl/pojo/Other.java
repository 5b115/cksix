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
    private int otherId;//主键自增
    private double sumGrade;//总成绩
    private double avgGrade;//平均成绩
    private double sumGpa;//总学分绩点
    private double avgGpa;//平均学分绩点
}
