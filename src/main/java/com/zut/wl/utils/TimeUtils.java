package com.zut.wl.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Author xiumu
 * @Date 2019/4/19 18:00
 */
public class TimeUtils {

    /**
     * 获取当前时间（格式如2019-4-19 17:52）
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
        String todayString = todayYear+"-"+todayMonth+"-"+day+" "+hour+":"+minute;
        return todayString;
    }

    /**
     * 获取一年级新生的年级
     * @return
     */
    public static String currentGrade(){
        Calendar today = Calendar.getInstance();
        return (today.get(Calendar.YEAR)-1)+"";
    }

    /**
     * 比较日期t1是否在当前日期之后
     * @param t1
     * @return
     */
    public static boolean checkT1AfterT2(String t1){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date date = null;
        try {
            date = dateFormat.parse(t1);
        } catch (ParseException e) {
            return false;
        }
        Date today = new Date();
        if (date!=null){
            return date.after(today);
        }
        return false;
    }

}
