package com.zut.wl.mapper;

import com.zut.wl.pojo.Student;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/4/20 7:44
 */
public interface StudentMapper {
    /**
     * 批量插入学生信息
     * @param studentList
     */
    void insertStudentList(List<Student> studentList);

    int insOne(Student student);

    /**
     * 获取所有还未填报志愿的计算机类的学生
     * @return
     */
    @Select("select * from student where clazz LIKE '计算机类%' and volunteer_id = 0")
    List<Student> selectAllStudentByVolunteer();




    /**
     * 查询留级的所有学生
     * @return
     */
    List<Student> selectRepeatStudent(String gradeLevel);

    /**
     * 查询转专业过来的学生
     * @return
     */
    List<Student> selectNotMajorStudent(String gradeLevel);

    /**
     * 根据id获取学生信息
     * @param id
     * @return
     */
    @Select("select * from student where stu_id = #{id}")
    Student selectOneById(String id);

    /**
     * 根据stuId更新学生最终专业
     * @param student
     */
    void updateStudentByStuId(Student student);

    /**
     * 更新学生最终专业
     * @param stuId 学号
     * @param majorId 专业id
     */
    @Update("update student set last_major = #{param2} where stu_id = #{param1}")
    void updateStuByStuId(String stuId,int majorId);

    /**
     * 查询所有学生，携带最终专业
     * @return
     */
    List<Student> selectStudentWithMajor();

    /**
     * 查询当前学年一个新生的学号
     * @param gradeLevel 当前学年
     * @return
     */
    @Select("SELECT stu_id from student where clazz LIKE '计算机类%' and stu_id LIKE #{gradeLevel} LIMIT 1")
    String selectStuId(String gradeLevel);

    /**
     * 查询当前学年计算机类的所有学生
     * @return
     */
    @Select("SELECT * from student where clazz LIKE '计算机类%' and grade_level=#{gradeLevel} ")
    List<Student> selectStudentByClazz(String gradeLevel);

    /**
     * 查询已经分配专业的学生
     * @return
     */
    List<Student> selectStudentMajor();

    /**
     * 查询计算机类没有填报资格的学生
     * @return
     */
    @Select("select * from student where allowed=0 and clazz LIKE '计算机类%'")
    List<Student> selectStudentNoPermission();

    /**
     * 计算机类已经完成志愿填报的学生数量
     * @param gradeLevel 当前学年
     * @return
     */
    @Select("SELECT count(*) from student WHERE volunteer_id != 0 AND clazz like '计算机类%' AND grade_level = #{gradeLevel}")
    int selectCountFilled(String gradeLevel);

    /**
     * 还没有完成志愿填报的学生数量
     * @param gradeLevel 当前学年
     * @return
     */
    @Select("SELECT count(*) from student WHERE volunteer_id = 0 AND clazz like '计算机类%' AND grade_level = #{gradeLevel}")
    int selectCountUnfilled(String gradeLevel);

    /**
     * 查询学生是否存在
     * @param stuId
     * @return
     */
    @Select("SELECT COUNT(stu_id) from student where stu_id = #{stuId} LIMIT 1")
    int selectStudentExist(String stuId);

    /**
     * 查询班级名称
     * @return 班级名称
     */
    @Select("SELECT DISTINCT clazz from student where clazz LIKE '计算机%' ORDER BY clazz")
    List<String> selectClazzName();

    /**
     * 根据班级查询已经填报的人数
     * @param clazz 班级名称
     * @return 人数
     */
    @Select("SELECT COUNT(stu_id) from student where clazz = #{clazz}  and volunteer_id != 0")
    int selectfilledByClazz(String clazz);

    /**
     * 根据班级查询未填报的人数
     * @param clazz 班级名称
     * @return 人数
     */
    @Select("SELECT COUNT(stu_id) from student where clazz = #{clazz} and volunteer_id = 0")
    int selectunfilledByClazz(String clazz);

    /**
     * 更新学生填报志愿情况
     * @param stuId 学号
     * @return
     */
    @Update("update student set volunteer_id = 1 where stu_id = #{stuId}")
    int updateStufilled(String stuId);
}
