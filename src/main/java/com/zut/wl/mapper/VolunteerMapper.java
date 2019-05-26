package com.zut.wl.mapper;

import com.zut.wl.pojo.Volunteer;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/21 9:39
 */
public interface VolunteerMapper {

    /**
     * 批量插入志愿信息
     * @param list
     */
    void insertVolunteerList(List<Volunteer> list);


}
