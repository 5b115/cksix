package com.zut.wl.service.impl;

import com.zut.wl.bean.StudentWithVolunteer;
import com.zut.wl.mapper.MajorMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.mapper.VolunteerMapper;
import com.zut.wl.pojo.Student;
import com.zut.wl.pojo.Volunteer;
import com.zut.wl.service.VolunteerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author xiumu
 * @Date 2019/5/30 16:59
 */
@Service
public class VolunteerServiceImpl implements VolunteerService {

    @Autowired
    private VolunteerMapper volunteerMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private MajorMapper majorMapper;

    @Override
    public int insertVolunteer(List<Volunteer> volunteers) {
        return volunteerMapper.insertVolunteerList(volunteers);

    }

    @Override
    public StudentWithVolunteer selectVolunteerByStuId(String stuId) {
        StudentWithVolunteer studentWithVolunteer = new StudentWithVolunteer();
        Student student = studentMapper.selectOneById(stuId);
        studentWithVolunteer.setStuId(student.getStuId());
        studentWithVolunteer.setStuName(student.getStuName());
        List<Volunteer> volunteerList = volunteerMapper.selectVolunteerByStuId(stuId);
        Map<String,String> map = new HashMap<>();
        for (int i = 0; i < volunteerList.size(); i++) {
            map.put("majorName"+i,majorMapper.selectMajorByMajorId(volunteerList.get(i).getMajorId()));
            map.put("ranking"+i,volunteerList.get(i).getRanking()+"");
        }
        studentWithVolunteer.setVolunteerMap(map);
        return studentWithVolunteer;
    }
}