package com.zut.wl.controller;

import com.zut.wl.service.StudentService;
import com.zut.wl.service.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author xiumu
 * @Date 2019/5/30 16:32
 */
@RestController
public class VolunteerController {


    @Autowired
    private VolunteerService volunteerService;

    @Autowired
    private StudentService studentService;

    @GetMapping("/virtualFill")
    public String virtualFillVolunteer(){
        volunteerService.insertVolunteerVirtual();
        return "yes";
    }
    @GetMapping("/deleteVirtualFilled")
    public String deleteVirtualFilled(){
        volunteerService.deleteVolunteerVirtual();
        studentService.updateStuVolunteer();
        studentService.updateLastMajor();
        return "yes";
    }
}
