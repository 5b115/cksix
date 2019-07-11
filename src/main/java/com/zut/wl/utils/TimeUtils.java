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
     * 比较日期是否在开始与结束范围之内
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return
     */
    public static boolean checkT1AfterT2(String startTime,String endTime){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date dateStart = null;
        Date dateEnd = null;
        try {
            dateStart = dateFormat.parse(startTime);
            dateEnd = dateFormat.parse(endTime);
        } catch (ParseException e) {
            return false;
        }
        Date today = new Date();
        if (dateStart != null && dateEnd != null){
            if (dateStart.before(today)&&dateEnd.after(today)){
                return true;
            }
        }
        return false;
    }


    /**
     * 比较日期是否在结束结束时间之后
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return
     */
    public static boolean checkTodyaAfterEndTime(String startTime,String endTime){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date dateEnd = null;
        try {
            dateEnd = dateFormat.parse(endTime);
        } catch (ParseException e) {
            return false;
        }
        Date today = new Date();
        if (dateEnd != null){
            if (today.after(dateEnd)){
                return true;
            }
        }
        return false;
    }

}
