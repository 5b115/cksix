package com.zut.wl.bean;

import com.zut.wl.pojo.Student;
import lombok.Data;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/7/11 21:07
 */
@Data
public class ResultExcelEntity {

    private String majorName;//专业名字

    private List<Student> studentList;//分配到该专业的学生


}
