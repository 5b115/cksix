package com.zut.wl.mapper;

import com.zut.wl.pojo.LogInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * @Author xiumu
 * @Date 2019/5/7 15:03
 */
public interface LogInfoMapper {
    @Select("SELECT * FROM log_info ORDER BY log_info_id DESC LIMIT 1;")
    LogInfo selectLastLogInfo();

    @Insert("insert into log_info value(default,#{logChangeTime},#{lastSemester},default,default)")
    void insertOneLog(LogInfo logInfo);

    @Update("update log_info set start_time = #{startTime},end_time = #{endTime} where log_info_id=#{logInfoId}")
    void updateLogTime(LogInfo logInfo);
}
