package com.zut.wl.service;

import com.zut.wl.pojo.Other;

/**
 * @Author xiumu
 * @Date 2019/5/31 16:10
 */
public interface OtherService {

    /**
     * 根据学号查询other
     * @param id 学号
     * @return
     */
    Other selectOtherByStuId(String id);

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
