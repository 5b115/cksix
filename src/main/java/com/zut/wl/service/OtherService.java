package com.zut.wl.service;

/**
 * @Author xiumu
 * @Date 2019/5/31 16:10
 */
public interface OtherService {

    /**
     * 批量插入学生平均成绩
     */
    void insertOther();

    /**
     * 批量更新学生排名(按默认方式)
     */
    void updateOtherRanking();

    /**
     * 更新平均学分一样的学生的排名
     */
    void updateOtherRepeat();
}
