package com.zut.wl.service.impl;

import com.zut.wl.mapper.CourseMapper;
import com.zut.wl.pojo.Course;
import com.zut.wl.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 14:27
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> selAllCourse() {
        List<Course> list = courseMapper.selectAllCourse();
        return list;
    }

    @Override
    public void updateCoursePermissionList(String[] courseIdList,Integer[] permissions) {
        for (int i = 0; i < courseIdList.length; i++) {
            courseMapper.updateCoursePermission(courseIdList[i],permissions[i]);
        }
    }

    @Override
    public List<Course> selAllCourseByPermission() {
        return courseMapper.selectCourseByPermission();
    }
}
