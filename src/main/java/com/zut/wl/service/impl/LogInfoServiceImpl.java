package com.zut.wl.service.impl;

import com.zut.wl.mapper.LogInfoMapper;
import com.zut.wl.pojo.LogInfo;
import com.zut.wl.service.LogInfoService;
import com.zut.wl.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author xiumu
 * @Date 2019/5/7 15:32
 */
@Service
public class LogInfoServiceImpl implements LogInfoService {

    @Autowired
    private LogInfoMapper logInfoMapper;

    @Override
    public LogInfo selectLastLogInfo() {
        return logInfoMapper.selectLastLogInfo();
    }

    @Override
    public void insertLastLogInfo() {
        LogInfo logInfo = new LogInfo();
        logInfo.setLogChangeTime(TimeUtils.currentTime());
        logInfo.setLastSemester(TimeUtils.currentGrade());
        logInfoMapper.insertOneLog(logInfo);
    }
}
