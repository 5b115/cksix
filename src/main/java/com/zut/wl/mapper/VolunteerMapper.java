package com.zut.wl.mapper;

import com.zut.wl.pojo.Volunteer;
import org.apache.ibatis.annotations.Select;

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
    int insertVolunteerList(List<Volunteer> list);


    /**
     * 根据学号查询志愿信息
     * @param stuId 学号
     * @return
     */
    @Select("select * from volunteer where stu_id = #{stuId}")
    List<Volunteer> selectVolunteerByStuId(String stuId);
}
