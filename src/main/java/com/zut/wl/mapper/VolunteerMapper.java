package com.zut.wl.mapper;

import com.zut.wl.pojo.Volunteer;
import org.apache.ibatis.annotations.Delete;
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
    @Select("select * from volunteer where stu_id = #{stuId} ORDER BY ranking")
    List<Volunteer> selectVolunteerByStuId(String stuId);

    /**
     * 获取第一志愿为此专业的学生
     * @param majorId 此专业id
     * @return
     */
    @Select("select * from volunteer where major_id = #{majorId} and ranking = 1")
    List<Volunteer> selectVolunteerByMajor(int majorId);

    /**
     * 根据专业id以及志愿次序来查询
     * @param majorId 专业
     * @param ranking 次序
     * @return
     */
    @Select("select * from volunteer where major_id = #{param1} and ranking = #{param2}")
    List<Volunteer> selectVolunteerByRanking(int majorId,int ranking);


    /**
     * 清除模拟报考数据
     */
    @Delete("truncate table volunteer")
    void deleteVirtualFilled();
}
