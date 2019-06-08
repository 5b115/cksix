package com.zut.wl.mapper;

import com.zut.wl.pojo.Other;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface OtherMapper {
    void insertOtherList(List<Other> otherList);


    @Select("select avg_gpa from other where stu_id=#{stuId}")
    Double selectAvgGpaByStuId(String stuId);

    void updateOtherList(List<Other> otherList);

    /**
     * 查询所有学生的平均成绩并排序(从大到下)
     * @return
     */
    @Select("select * from other order by avg_gpa desc")
    List<Other> selectAll();

    /**
     * 更新学生的年级排名
     * @param ranking 排名
     * @param stuId 学号
     */
    @Update("update other set grade_ranking=#{param1} where stu_id=#{param2}")
    void updateGradeRanking(int ranking,String stuId);

    /**
     * 更新学生的班级排名
     * @param ranking 排名
     * @param stuId 学号
     */
    @Update("update other set clazz_ranking=#{param1} where stu_id=#{param2}")
    void updateClazzRanking(int ranking,String stuId);

    

}
