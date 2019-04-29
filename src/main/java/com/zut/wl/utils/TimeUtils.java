package com.zut.wl.utils;

import java.util.Calendar;

/**
 * @Author xiumu
 * @Date 2019/4/19 18:00
 */
public class TimeUtils {

    /**
     * 获取当前时间（格式如2019-4-19-17-52-31）
     * @return
     */
    public static String currentTime(){
        Calendar today = Calendar.getInstance();
        int todayYear = today.get(Calendar.YEAR);
        int todayMonth = today.get(Calendar.MONTH)+1;
        int day = today.get(Calendar.DAY_OF_MONTH);
        int hour = today.get(Calendar.HOUR_OF_DAY);
        int minute = today.get(Calendar.MINUTE);
        int second  = today.get(Calendar.SECOND);
        String todayString = todayYear+"-"+todayMonth+"-"+day+"-"+hour+"-"+minute+"-"+second;
        return todayString;
    }

    public static String currentGrade(){
        Calendar today = Calendar.getInstance();
        return (today.get(Calendar.YEAR)-1)+"";
    }
}
