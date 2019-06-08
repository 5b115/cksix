package com.zut.wl.pojo;

import lombok.Data;

/**
 * @Author xiumu
 * @Date 2019/5/7 15:00
 */
@Data
public class LogInfo {
    private int logInfoId;
    private String logChangeTime; //数据更新时间
    private String lastSemester; //当前学年
    private String startTime;    //填报开始时间
    private String endTime;      //填报截止时间
}
