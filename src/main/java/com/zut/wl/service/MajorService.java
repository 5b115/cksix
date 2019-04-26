package com.zut.wl.service;

import com.zut.wl.pojo.Major;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/25 17:51
 */
public interface MajorService {

    /**
     * 获取所有的专业信息
     * @return
     */
    List<Major> selAllMajor();

    /**
     * 增加一个专业
     * @param majorName 专业名字
     */
    void insertOneMajor(String majorName);
}
