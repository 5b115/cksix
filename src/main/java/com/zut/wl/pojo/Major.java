package com.zut.wl.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @Author xiumu
 * @Date 2019/4/18 9:14
 */
@ToString
@Getter
@Setter
public class Major {
    private int majorId;//主键自增
    private String majorName;//专业名字
    private int departmentId;//所属专业
    private int majorLimit;//专业人数限制
    private int majorStatus;//专业是否存在
}
