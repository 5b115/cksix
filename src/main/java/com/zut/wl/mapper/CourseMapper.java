package com.zut.wl.mapper;

import com.zut.wl.pojo.Course;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface CourseMapper {
    void insertCourseList(List<Course> courseList);

    @Select("select * from Course")
    List<Course> selectAllCourse();

    @Update("update course set permission = #{permission} where course_id = #{courseId}")
    void updateCoursePermission(@Param("courseId") String courseId, @Param("permission") Integer permission);

    @Select("select * from course where permission = 1")
    List<Course> selectCourseByPermission();
}
