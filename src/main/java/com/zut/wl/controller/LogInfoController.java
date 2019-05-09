package com.zut.wl.controller;

import com.zut.wl.pojo.LogInfo;
import com.zut.wl.service.LogInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @GetMapping("/updateData")
    public String updateData(){
        logInfoService.insertLastLogInfo();
        return "dataInput";
    }
}
