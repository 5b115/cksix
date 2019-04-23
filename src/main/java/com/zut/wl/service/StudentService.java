package com.zut.wl.service;

import com.github.pagehelper.PageInfo;

/**
 * @Author xiumu
 * @Date 2019/4/22 20:58
 */
public interface StudentService {

    /**
     * 获取学生信息的分页数据
     * @param pn 第几页
     * @return
     */
    PageInfo getStudentPageInfo(int pn);
}
