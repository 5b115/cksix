package com.zut.wl.controller;

import com.zut.wl.bean.StudentWithVolunteer;
import com.zut.wl.pojo.Major;
import com.zut.wl.pojo.Volunteer;
import com.zut.wl.service.MajorService;
import com.zut.wl.service.StudentService;
import com.zut.wl.service.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private VolunteerService volunteerService;

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

    @ResponseBody
    @PostMapping("/checkStudentLogin")
    public boolean checkStudent(@RequestParam(value = "stuId",defaultValue = "") String stuId, String password){
        return studentService.selectStudentCheck(stuId,password);
    }

    @ResponseBody
    @PostMapping("/fillVolunteer")
    public boolean fillVolunteer(List<Volunteer> volunteers){
        if (volunteerService.insertVolunteer(volunteers)>0){
            return true;
        }else {
            return false;
        }
    }
    @ResponseBody
    @GetMapping("/getVolunteerByStuId")
    public StudentWithVolunteer getVolunteers(String stuId){
        return volunteerService.selectVolunteerByStuId(stuId);
    }


}
