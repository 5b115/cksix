package com.zut.wl.mapper;

import com.zut.wl.pojo.Major;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/25 17:47
 */
public interface MajorMapper {

    /**
     * 获取存在的专业（未删除的专业）
     * @return
     */
    @Select("select * from major where major_status = 1")
    List<Major> getMajorByStatus();

    /**
     * 添加一个专业
     * @param majorName
     */
    @Insert("insert into major value(default,#{majorName},default,default,default)")
    void insertOneMajor(String majorName);

    /**
     * 通过id来“删除”major
     * @param id
     */
    @Update("update major set major_status = 0 where major_id = #{id}")
    void updateMajorById(Integer id);

    @Update("update major set major_limit = #{majorLimit} where major_id = #{majorId}")
    void updateMajorLimit(@Param("majorId") Integer id, @Param("majorLimit") int majorLimit);

    /**
     * 根据专业名字来查找专业信息
     * @param majorName 专业名字
     * @return
     */
    @Select("select * from major where major_name = #{majorName}")
    Major selectMajorByMajorName(String majorName);
}
