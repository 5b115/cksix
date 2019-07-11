package com.zut.wl.controller;

import com.zut.wl.pojo.LogInfo;
import com.zut.wl.service.LogInfoService;
import com.zut.wl.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/5/7 16:08
 */
@Controller
public class LogInfoController {

    @Autowired
    private LogInfoService logInfoService;


    @ResponseBody
    @GetMapping("/getLog")
    public LogInfo getLastLog(){
        return logInfoService.selectLastLogInfo();
    }

    @ResponseBody
    @GetMapping("/getLogInfo")
    public Map<String,Object> getLogInfo(){
        Map<String,Object> map = new HashMap<>();
        String endTime = logInfoService.selectLastLogInfo().getEndTime();
        String startTime = logInfoService.selectLastLogInfo().getStartTime();
        boolean isdepart = TimeUtils.checkTodyaAfterEndTime(startTime,endTime);
        map.put("endTime",endTime);
        map.put("isdepart",isdepart);
        return map;
    }

    @GetMapping("/updateData")
    public String updateData(){
        logInfoService.insertStudentList();
        logInfoService.insertCourses();
        logInfoService.insertGrades();
        logInfoService.insertLastLogInfo();
        return "dataInput";
    }

    @GetMapping("/depart")
    public String departMajor(){

        return null;
    }

    @ResponseBody
    @PostMapping("/updateTime")
    public Map<String,String> updateTime(String startTime,String endTime){
        logInfoService.updateTime(startTime,endTime);
        Map<String,String> map = new HashMap<>();
        map.put("startTime",startTime);
        map.put("endTime",endTime);
        return map;
    }
}
