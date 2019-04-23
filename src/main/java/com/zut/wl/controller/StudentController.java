package com.zut.wl.controller;

import com.github.pagehelper.PageInfo;
import com.zut.wl.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author xiumu
 * @Date 2019/4/22 21:15
 */
@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    @ResponseBody
    @GetMapping("/getStudents")
    public PageInfo getStudentInfo(@RequestParam(value="pn",defaultValue = "1") int pn){
        PageInfo studentPageInfo = studentService.getStudentPageInfo(pn);
        return studentPageInfo;
    }
}
