package com.zut.wl.bean;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/5/30 19:39
 */
@Data
public class StudentWithVolunteer {
    private String stuId;
    private String stuName;
    private Map<String,String> volunteerMap = new HashMap<>();
}
