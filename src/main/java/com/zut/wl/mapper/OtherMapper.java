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
     * 通过年级查询所有学生的平均成绩并排序(从大到下)
     * @return
     */
    @Select("select * from other where grade = #{grade} order by avg_gpa desc")
    List<Other> selectAllByGrade(String grade);

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

    /**
     * 查询重复的成绩
     * @param grade 当前学年
     * @return
     */
    @Select("SELECT DISTINCT o1.avg_gpa FROM other o1,other o2 WHERE o1.grade=#{grade} and o1.stu_id != o2.stu_id and o1.avg_gpa = o2.avg_gpa")
    List<Double> selectRepeatAvgGpa(String grade);

    /**
     * 根据平均成绩查找当前学年的学生
     * @param grade 学年
     * @param avgGpa 平均成绩
     * @return
     */
    @Select("select * from other where grade = #{param1} and avg_gpa = #{param2}")
    List<Other> selectOtherByAvgGpa(String grade,Double avgGpa);

    /**
     * 通过学号查询成绩
     * @param stuId 学号
     * @return
     */
    @Select("select * from other where stu_id = #{stuId}")
    Other selectOtherByStuId(String stuId);
}
