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
    /**
     * 批量插入
     * @param courseList
     */
    void insertCourseList(List<Course> courseList);

    @Select("select * from Course where course_type = '01' ")
    List<Course> selectAllCourse();

    /**
     * 更新课程的选中状态
     * @param courseId 课程id
     * @param permission 权限
     */
    @Update("update course set permission = #{permission} where course_id = #{courseId}")
    void updateCoursePermission(@Param("courseId") String courseId, @Param("permission") Integer permission);

    /**
     * 查询所有的选中的课程
     * @return
     */
    @Select("select * from course where permission = 1")
    List<Course> selectCourseByPermission();

    /**
     * 根据课程Id查询已经被选中的课程信息
     * @param courseId 课程号
     * @return
     */
    @Select("select * from course where course_id = #{courseId} and permission = 1 ")
    Course selectByCourseId(String courseId);
}
