package com.zut.wl.utils.excel;

import com.zut.wl.pojo.Course;
import com.zut.wl.pojo.Grade;
import com.zut.wl.pojo.Other;
import com.zut.wl.pojo.Student;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * excel内容解析成对象
 * @Author xiumu
 * @Date 2019/4/19 19:45
 */
public class ExcelResolve {

    private String[] title;//excel表头内容

    private Map<Integer,Object[]> excelContent;//除表头之外的内容

    private List<Student> students = null;//学生信息

    private List<Course> courseList = null; //课程信息

    private List<Grade> gradeList = null; //学生成绩信息

    private List<Other> others = null; //其他成绩信息

    public ExcelResolve(String[] title, Map<Integer, Object[]> excelContent) {
        this.title = title;
        this.excelContent = excelContent;
        students = getStudents();
        courseList = getCourses();
        gradeList = getGrades();
//        others = getOthers();
    }

    /**
     * 获取其他成绩信息
     * @return
     */
   /* public List<Other> getOthers(){
        others = new ArrayList<>();
        Other other = null;
        for (int i = 0; i < this.excelContent.size(); i++) {
            other = new Other();
            other.setStuId(students.get(i).getStuId());
            other.setSumGrade((Double) excelContent.get(i+1)[title.length-4]);
            other.setAvgGrade((Double) excelContent.get(i+1)[title.length-3]);
            other.setSumGpa((Double) excelContent.get(i+1)[title.length-2]);
            other.setAvgGpa((Double) excelContent.get(i+1)[title.length-1]);
            others.add(other);
        }
        return others;
    }*/
    /**
     * 获取excel表中的成绩信息
     * @return
     */
    public List<Grade> getGrades(){
        gradeList = new ArrayList<>();
        Grade grade = null;
        for (int i = 1; i <= this.excelContent.size(); i++) {
            for (int i1 = 0; i1 < courseList.size(); i1++) {
                grade = new Grade();
                grade.setStuId(students.get(i-1).getStuId());
                grade.setCourseId(courseList.get(i1).getCourseId());
                grade.setGradeScore(stringToDouble(this.excelContent.get(i)[i1+2]));
                gradeList.add(grade);
            }
        }
        return gradeList;
    }

    /**
     * String转Double
     * @param obj
     * @return
     */
    private Double stringToDouble(Object obj){
        if (obj == null){
            return 0.00;
        }
        if (obj instanceof String){
            if (obj.toString()!=" 缺考"||!obj.toString().equals(" 缺考")){
            }else {
                return 0.00;
            }
            try {
                return Double.parseDouble(obj.toString());
            }catch(Exception e){
                return 0.00;
            }
        }
        return 0.00;
    }

    /**

     * 获取excel表中的学生信息
     * @return
     */
    public List<Student> getStudents(){
        students = new ArrayList<>();
        Student student = null;
        for (int i = 1; i <= this.excelContent.size(); i++) {
            student = new Student();
            student.setStuId(excelContent.get(i)[0].toString());
            student.setStuName((String) excelContent.get(i)[1]);
            students.add(student);
        }
        return students;
    }

    /**
     * 获取成绩表中的课程信息
     * @return
     */
    public List<Course> getCourses(){
        courseList = new ArrayList<>();
        Course course = null;
        for (int i = 2; i < title.length-4; i++) {
            course = new Course();
            course.setCourseId(getCourseId(title[i]));
            course.setCourseName(getCourseName(title[i]));
            courseList.add(course);
        }
        return courseList;
    }
    /**
     * 获取成绩表中的课程ID
     * @param course 成绩表中的课程全名
     * @return
     */
    private String getCourseId(String course) {
        String string = course;
        int start = string.indexOf("[");
        int end = string.indexOf("]");
        string = string.substring(start+1,end);
        return string;
    }

    /**
     * 获取课程名
     * @param title 表头内容
     * @return
     */
    private String getCourseName(String title){
        String name = title.substring(title.lastIndexOf("]")+1);
        return name;
    }

    /**
     * 输出解析的数据
     */
    public void output() {
        for (int k = 0; k < 1; k++) {
            System.out.print(title[k]+"--");
        }
        int j;
        for (j = 0; j < courseList.size()-4; j++) {
            System.out.print(courseList.get(j).getCourseId()+courseList.get(j).getCourseName()+"--");
        }
        System.out.println();
        for (int i = 0; i < excelContent.size(); i++) {
            System.out.print(students.get(i).getStuId()+"--"+students.get(i).getStuName()+"--");
            for (int l = 0;l<courseList.size();l++){
                for (int i1 = 0; i1 < gradeList.size(); i1++) {
                    if (gradeList.get(i1).getStuId().equals(students.get(i).getStuId())) {
                        if (gradeList.get(i1).getCourseId().equals(courseList.get(l).getCourseId())){
                            System.out.print(gradeList.get(i1).getGradeScore()+"--");
                        }
                    }
                }
            }
            System.out.println();
        }

    }
}
