package com.zut.wl.service.impl;

import com.zut.wl.mapper.CourseMapper;
import com.zut.wl.mapper.GradeMapper;
import com.zut.wl.mapper.StudentMapper;
import com.zut.wl.service.UpdateDataService;
import com.zut.wl.utils.ResolveJsonResponse;
import com.zut.wl.utils.TimeUtils;
import com.zut.wl.utils.client.ClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author xiumu
 * @Date 2019/5/7 16:35
 */
@Service
public class UpdateDataServiceImpl implements UpdateDataService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private GradeMapper gradeMapper;


    @Override
    public void updateData() {
        updateStudent(TimeUtils.currentGrade(),1);
    }

    /**
     * 更新学生信息
     * @param gradeLevel 当前学年
     * @param page 当前页数
     */
    private void updateStudent(String gradeLevel, int page){
        ResolveJsonResponse jsonResponse = new ResolveJsonResponse(new ClientUtil());
        jsonResponse.getStudentInfo(gradeLevel,page);
        int maxPage = jsonResponse.getMaxPage();
        for (int i = 0; i < maxPage; i++) {
            jsonResponse.getStudentInfo(gradeLevel,i+1);
            //插入list
        }
    }
}
