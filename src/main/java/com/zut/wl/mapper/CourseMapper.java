package com.zut.wl.mapper;

import com.zut.wl.pojo.Course;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface CourseMapper {
    void insertCourseList(List<Course> courseList);

    @Select("select * from Course")
    List<Course> selectAllCourse();
}
