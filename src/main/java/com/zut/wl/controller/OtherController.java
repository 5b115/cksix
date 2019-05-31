package com.zut.wl.controller;

import com.zut.wl.service.OtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Author xiumu
 * @Date 2019/5/31 17:17
 */
@Controller
public class OtherController {
    @Autowired
    private OtherService otherService;

    @GetMapping("/calculateAvgGpa")
    public void calculateAvgGpa(){
        otherService.insertOther();
    }
}
