package com.zut.wl.controller;

import com.zut.wl.service.OtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author xiumu
 * @Date 2019/5/31 17:17
 */
@Controller
public class OtherController {
    @Autowired
    private OtherService otherService;

    @ResponseBody
    @GetMapping("/calculateAvgGpa")
    public boolean calculateAvgGpa(){
        otherService.insertOther();

        return true;
    }
}
