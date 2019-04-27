package com.zut.wl.service.impl;

import com.zut.wl.mapper.MajorMapper;
import com.zut.wl.pojo.Major;
import com.zut.wl.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/25 17:51
 */
@Service
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;

    @Override
    public List<Major> selAllMajor() {
        return majorMapper.getMajorByStatus();
    }

    @Override
    public void insertOneMajor(String majorName) {
        majorMapper.insertOneMajor(majorName);
    }

    @Override
    public void updateOneMajor(Integer id) {
        majorMapper.updateMajorById(id);
    }

    @Override
    public void updateMajorBatch(Integer[] majorId, Integer[] majorLimit) {
        for (int i = 0; i < majorId.length; i++) {
            majorMapper.updateMajorLimit(majorId[i],majorLimit[i]);
        }
    }
}
