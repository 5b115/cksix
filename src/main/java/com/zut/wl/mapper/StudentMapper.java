package com.zut.wl.mapper;

import com.zut.wl.pojo.Student;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface StudentMapper {
    void insertStudentList(List<Student> studentList);
    int insOne(Student student);

    @Select("select * from student")
    List<Student> selectAllStudent();

    /**
     * 查询留级的所有学生
     * @return
     */
    @Select("select * from student where stu_id not like CONCAT(#{gradeLevel},'%')")
    List<Student> selectRepeatStudent(String gradeLevel);

    /**
     * 查询转专业过来的学生
     * @return
     */
    @Select("select * from student where stu_id not like '%0802%' ")
    List<Student> selectNotMajorStudent();

    /**
     * 根据id获取学生信息
     * @param id
     * @return
     */
    @Select("select * from student where stu_id = #{id}")
    Student selectOneById(String id);
}
