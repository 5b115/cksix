package com.zut.wl.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @Author xiumu
 * @Date 2019/4/18 8:22
 */
@ToString
@Getter
@Setter
public class User {
    private int userId;//用户id
    private String userAccount;//用户账号
    private String password; // 登录密码
    private char role;//角色（t老师|s学生|m管理员）
}
