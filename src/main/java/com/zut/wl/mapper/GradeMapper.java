package com.zut.wl.mapper;

import com.zut.wl.pojo.Grade;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface GradeMapper {
    /**
     * 批量插入成绩
     * @param gradeList
     */
    void insertGradeList(List<Grade> gradeList);

    /**
     * 查询所有成绩
     * @return
     */
    @Select("select * from grade")
    List<Grade> selectAll();

    /**
     * 根据学号查询成绩
     * @param stuId 学号
     * @return
     */
    @Select("select * from grade where stu_id = #{stuId}")
    List<Grade> selectByStuId(String stuId);

    /**
     * 根据学号查询已经被选中的课程成绩
     * @param stuId
     * @return
     */
    List<Grade> selectWithCourseByStuId(String stuId);

    /**
     * 通过学号和课程号来查询成绩
     * @param stuId 学号
     * @param CourseId 课程
     * @return
     */
    @Select("SELECT grade_score from grade where stu_id = #{param1} and course_id = #{param2}")
    Double selectScoreByStuAndCourse(String stuId,String CourseId);

}
