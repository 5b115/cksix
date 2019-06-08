package com.zut.wl.service;

import com.zut.wl.pojo.LogInfo;

/**
 * @Author xiumu
 * @Date 2019/5/7 15:31
 */
public interface LogInfoService {

    /**
     * 获取最新的日志信息
     * @return
     */
    LogInfo selectLastLogInfo();

    /**
     * 记录下每次的更新数据操作
     */
    void insertLastLogInfo();


    void insertCourses();

    void insertGrades();

    void insertStudentList();

    /**
     * 更新填报时间
     * @param startTime 开始时间
     * @param endTime 截止时间
     * @return
     */
    void updateTime(String startTime, String endTime);
}
