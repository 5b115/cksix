package com.zut.wl.mapper;

import com.zut.wl.pojo.Other;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface OtherMapper {
    void insertOtherList(List<Other> otherList);


    @Select("select avg_gpa from other where stu_id=#{stuId}")
    Double selectAvgGpaByStuId(String stuId);
}
