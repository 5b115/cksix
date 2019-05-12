package com.zut.wl.mapper;

import com.zut.wl.pojo.Grade;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface GradeMapper {
    /**
     * 批量插入成绩
     * @param gradeList
     */
    void insertGradeList(List<Grade> gradeList);

    /**
     * 查询所有成绩
     * @return
     */
    @Select("select * from grade")
    List<Grade> selectAll();
}
