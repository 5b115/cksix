package com.zut.wl.controller;

import com.zut.wl.pojo.Major;
import com.zut.wl.service.MajorService;
import com.zut.wl.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/5/21 17:15
 */
@CrossOrigin(origins = "*")
@Controller
public class StudentCrossOriginController {

    @Autowired
    private MajorService majorService;

    @Autowired
    private StudentService studentService;


    @ResponseBody
    @GetMapping("/getMajorsByStuId")
    public List<Major> getMajors(){
        return majorService.selAllMajor();
    }

    @ResponseBody
    @GetMapping("/getStuInfoWithOther")
    public Map<String, Object> getGrades(String stuId){
        return studentService.selectStuWithCG(stuId);
    }

}
