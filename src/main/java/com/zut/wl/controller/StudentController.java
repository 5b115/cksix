package com.zut.wl.controller;

import com.github.pagehelper.PageInfo;
import com.zut.wl.bean.ClazzContent;
import com.zut.wl.pojo.Other;
import com.zut.wl.pojo.Student;
import com.zut.wl.service.OtherService;
import com.zut.wl.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/4/22 21:15
 */
@Controller
public class StudentController {


    @Autowired
    private OtherService otherService;

    @Autowired
    private StudentService studentService;

    @ResponseBody
    @GetMapping("/getStuNotFilled")
    public PageInfo getStudentInfo(@RequestParam(value="pn",defaultValue = "1") int pn){
        PageInfo studentPageInfo = studentService.selStudentPageInfo(pn);
        return studentPageInfo;
    }

    @ResponseBody
    @GetMapping("/getVolunteerInfo")
    public Map<String,Object> getVolunteerInfo(){
        return studentService.selectVolunteerInfo();
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
    public Map<String,Object> getOneStudent(String id){
        Map<String,Object> map = new HashMap<>();
        Student student = studentService.selectStudentById(id);
        int gradeRanking = 0;
        Other other = otherService.selectOtherByStuId(id);
        if (other!=null){
            gradeRanking = other.getGradeRanking();
        }
        Map studentInfo = studentService.selectStuLastMajor(id);
        String lastMajor = null;
        if (studentInfo!=null){
            lastMajor = (String) studentInfo.get("lastMajorName");
        }
        map.put("student",student);
        map.put("gradeRanking",gradeRanking);
        map.put("lastMajor",lastMajor);
        return map;
    }

    @PostMapping("/updateStuMajor")
    public String updateStudentMajorAndAllowed(String stuId,@RequestParam(value = "majorName",required = false) String majorName, Integer allowed1){
        studentService.updateStudentMajor(stuId,majorName,allowed1);
        return "specialty02";
    }


    @ResponseBody
    @GetMapping("/getMajorStu")
    public List<Student> getStudentMajor(){
        return studentService.selectStudentMajor();
    }

    @ResponseBody
    @GetMapping("/getNotAllowed")
    public List<Student> getStudentNotAllowed(){
        return studentService.selectStudentNotAllowed();
    }

    @ResponseBody
    @GetMapping("/getClazzContent")
    public List<ClazzContent> getClazzContent(){
        return studentService.selectClazzContent();
    }


    @ResponseBody
    @PostMapping("/getStuByMajor")
    public List<Student> getStuByMajor(String majorName){
        List<Student> studentList = studentService.selectStuByMajor(majorName);
        return studentList;
    }
    @ResponseBody
    @PostMapping("/getStuByMajorPage")
    public PageInfo getStuByMajorPage(String majorName, @RequestParam(value="pn",defaultValue = "1")int pn){
        PageInfo studentList = studentService.selectStuByMajorPage(majorName,pn);
        return studentList;
    }

    @ResponseBody
    @GetMapping("/departMajor")
    public boolean departMajor(){
        studentService.updateAssignByVolunteer();
        return true;
    }
}



