package com.zut.wl.service.impl;

import com.zut.wl.bean.StudentWithVolunteer;
import com.zut.wl.mapper.MajorMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.mapper.VolunteerMapper;
import com.zut.wl.pojo.Major;
import com.zut.wl.pojo.Student;
import com.zut.wl.pojo.Volunteer;
import com.zut.wl.service.LogInfoService;
import com.zut.wl.service.VolunteerService;
import com.zut.wl.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @Author xiumu
 * @Date 2019/5/30 16:59
 */
@Service
public class VolunteerServiceImpl implements VolunteerService
{

    @Autowired
    private VolunteerMapper volunteerMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private MajorMapper majorMapper;

    @Autowired
    private LogInfoService logInfoService;

    @Override
    public int insertVolunteer(String[] volunteers,String stuId) {
        Volunteer volunteer = null;
        Major major = null;
        List<Volunteer> volunteerList = new ArrayList<>();
        for (int i = 0; i < volunteers.length; i++) {
            volunteer = new Volunteer();
            volunteer.setStuId(stuId);
            major = majorMapper.selectMajorByMajorName(volunteers[i]);
            if (major!=null){
                volunteer.setMajorId(major.getMajorId());
            }else {
                continue;
            }
            volunteer.setRanking(i+1);
            volunteerList.add(volunteer);
        }
        if (volunteerList.size()<1){
            return -1;
        }
        int index = volunteerMapper.insertVolunteerList(volunteerList);
        if (index>0){
            return index;
        }
        return -1;

    }

    @Override
    public StudentWithVolunteer selectVolunteerByStuId(String stuId) {
        //构建包含学生以及志愿信息的对象
        StudentWithVolunteer studentWithVolunteer = new StudentWithVolunteer();
        //获取学生信息
        Student student = studentMapper.selectOneById(stuId);
        studentWithVolunteer.setStuId(student.getStuId());
        studentWithVolunteer.setStuName(student.getStuName());
        List<Volunteer> volunteerList = volunteerMapper.selectVolunteerByStuId(stuId);
        List<String> volunteers = new ArrayList<>();
        for (int i = 0; i < volunteerList.size(); i++) {
            volunteers.add(majorMapper.selectMajorByMajorId(volunteerList.get(i).getMajorId()));
        }
        studentWithVolunteer.setVolunteers(volunteers);
        return studentWithVolunteer;
    }

    @Override
    public boolean checkVolunteers(String[] volunteers) {

        String endTime = logInfoService.selectLastLogInfo().getEndTime();
        if (TimeUtils.checkT1AfterT2(endTime)) {
            return false;
        }
        Set<String> volunteerSet = new HashSet<>();
        for (String volunteer : volunteers) {
            volunteerSet.add(volunteer);
        }
        if (volunteers.length==volunteerSet.size()){
            return false;
        }
        return true;
    }

    @Override
    public List<Volunteer> selectVolunteersBystuId(String stuId) {
        return volunteerMapper.selectVolunteerByStuId(stuId);
    }
}
