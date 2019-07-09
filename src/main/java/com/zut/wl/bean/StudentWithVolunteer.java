package com.zut.wl.bean;

import lombok.Data;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/30 19:39
 */
@Data
public class StudentWithVolunteer {
    private String stuId;
    private String stuName;
    private List<String> volunteers;
}
