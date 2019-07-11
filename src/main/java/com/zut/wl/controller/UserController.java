package com.zut.wl.controller;

import com.zut.wl.bean.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/4/18 11:22
 */
@Controller
public class UserController {

    @PostMapping("/checkUserLogin")
    public String checkUser(String username, String password, Map map){
        if (username.equals(Admin.username)&&password.equals(Admin.password)){
            return "main";
        }else {
            map.put("msg","账号或密码错误");
        }
        return "login";
    }



}
