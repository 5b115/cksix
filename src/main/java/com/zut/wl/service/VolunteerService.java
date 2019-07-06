package com.zut.wl.service;

import com.zut.wl.bean.StudentWithVolunteer;

/**
 * @Author xiumu
 * @Date 2019/5/30 16:33
 */
public interface VolunteerService {

    /**
     * 填报志愿
     * @param volunteers
     */
    int insertVolunteer(String[] volunteers,String stuId);

    /**
     * 查询学生的志愿信息
     * @param stuId
     * @return
     */
    StudentWithVolunteer selectVolunteerByStuId(String stuId);

    /**
     * 验证填报的志愿是否重复，是否超过填报日期
     * @param volunteers
     * @return
     */
    boolean checkVolunteers(String[] volunteers);

}
