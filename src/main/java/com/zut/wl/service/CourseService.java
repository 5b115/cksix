package com.zut.wl.service;

import com.zut.wl.pojo.Course;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 14:26
 */
public interface CourseService {
    List<Course> selAllCourse();

    /**
     * 批量更改课程权限
     * @param courseIdList 存放课程id的数组
     */
    void updateCoursePermissionList(String[] courseIdList,Integer[] permissions);

    /**
     * 获取所有有权限的课程信息
     * @return
     */
    List<Course> selAllCourseByPermission();
}
