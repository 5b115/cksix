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

}
