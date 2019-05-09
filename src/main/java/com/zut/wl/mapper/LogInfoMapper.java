package com.zut.wl.mapper;

import com.zut.wl.pojo.LogInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

/**
 * @Author xiumu
 * @Date 2019/5/7 15:03
 */
public interface LogInfoMapper {
    @Select("SELECT * FROM log_info ORDER BY log_info_id DESC LIMIT 1;")
    LogInfo selectLastLogInfo();

    @Insert("insert into log_info value(default,#{logChangeTime},#{lastSemester})")
    void insertOneLog(LogInfo logInfo);
}
