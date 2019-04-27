package com.zut.wl.controller;

import com.zut.wl.pojo.Major;
import com.zut.wl.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/25 17:44
 */
@Controller
public class MajorController {

    @Autowired
    private MajorService majorService;

    @ResponseBody
    @GetMapping("/getMajorList")
    public List<Major> getMajorList(){
        List<Major> majorList = majorService.selAllMajor();
        return majorList;
    }

    @PostMapping("/addMajor")
    public String addOneMajor(String majorName){
        majorService.insertOneMajor(majorName);
        return "specialty00";
    }

    @ResponseBody
    @GetMapping("/deleteMajor/{id}")
    public String deleteOneMajor(@PathVariable("id") Integer id){
        majorService.updateOneMajor(id);
        return "true";
    }

    @ResponseBody
    @PostMapping("/addMajorLimit")
    public List<Major> addMajorLimit(Integer[] majorId,Integer[] majorLimit){
        majorService.updateMajorBatch(majorId,majorLimit);
        List<Major> majors = majorService.selAllMajor();
        return majors;
    }

    @ResponseBody
    @GetMapping("/getMajorLimit")
    public List<Major> getMajorLimit(){
        return majorService.selAllMajor();
    }

}