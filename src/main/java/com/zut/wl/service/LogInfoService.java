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
}
