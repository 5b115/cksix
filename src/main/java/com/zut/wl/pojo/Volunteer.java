package com.zut.wl.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @Author xiumu
 * @Date 2019/4/18 8:29
 */

@ToString
@Getter
@Setter
public class Volunteer {
    private int volunteerId;//主键自增
    private String stuId;//学号
    private int majorId;//意向专业
    private int ranking;//第几个志愿
}
