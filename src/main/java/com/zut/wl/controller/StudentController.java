package com.zut.wl.controller;

import com.github.pagehelper.PageInfo;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
        PageInfo studentPageInfo = studentService.selStudentPageInfo(pn);
        return studentPageInfo;
    }

    @ResponseBody
    @GetMapping("/getRepeatStu")
    public List<Student> getRepeatStudent(){
        return studentService.selectRepeatStudentByGrade();
    }

    @ResponseBody
    @GetMapping("/getStuNotMajor")
    public List<Student> getStudentNotMajor(){
        return studentService.selectStudentNotMajor();
    }

    @ResponseBody
    @PostMapping("/getOneStu")
    public Student getOneStudent(String id){
        return studentService.selectStudentById(id);
    }

}
