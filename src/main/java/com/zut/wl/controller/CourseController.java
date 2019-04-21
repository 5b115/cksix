package com.zut.wl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zut.wl.pojo.Course;
import com.zut.wl.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 14:25
 */
@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;

    @ResponseBody
    @GetMapping("/getCourseInfo")
    public PageInfo getCourseInfo(@RequestParam(value="pn",defaultValue = "1") int pn){
        PageHelper.startPage(pn,10);
        List<Course> courseList = courseService.selAllCourse();
        PageInfo pageInfo = new PageInfo(courseList,2);
        return pageInfo;
    }
}
