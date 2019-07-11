package com.zut.wl.bean;

import lombok.Data;

/**
 * @Author xiumu
 * @Date 2019/7/10 20:25
 */
@Data
public class VolunteerInfo {
    private String majorName;//专业名字
    private int majorLimit;//专业招生人数
    private int firstFilledNumber;//第一志愿人数
    private double avgGpa;//第一志愿是该专业的学生的平均学分绩点
}
