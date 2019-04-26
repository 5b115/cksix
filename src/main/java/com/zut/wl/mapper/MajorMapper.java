package com.zut.wl.mapper;

import com.zut.wl.pojo.Major;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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
}
