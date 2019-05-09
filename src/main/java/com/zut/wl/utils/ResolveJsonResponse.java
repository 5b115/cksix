package com.zut.wl.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zut.wl.pojo.Course;
import com.zut.wl.pojo.Student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/7 16:58
 */
public class ResolveJsonResponse {

    private ClientUtil clientUtil = new ClientUtil();
    private ObjectMapper objectMapper = new ObjectMapper();
    private JsonNode jsonNode = null;
    private int maxPage; //最大页数
    private int per;     //每页的记录个数
    private int page;    //当前页数
    private List<Student> students = new ArrayList<>();//当前页的所有学生信息
    private List<Course> courses = new ArrayList<>();//当前页的课程信息

    /**
     * 根据年级获取学生信息,需要传入年级和页数
     * @param gradeLevel 年级
     * @param page 页数
     */
    public void getStudentInfo(String gradeLevel,int page){
        String getAccessTokenUrl = "http://10.10.31.140:5009/open_api/customization/vbzksall_alpha/full?access_token="+clientUtil.getAccessToken()+"&XZNJ="+gradeLevel+"&page="+page;
        String stringEntity = clientUtil.executeGet(getAccessTokenUrl);
        try {
            jsonNode = objectMapper.readValue(stringEntity,JsonNode.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        JsonNode resultJsonNode = jsonNode.get("result");
        maxPage = resultJsonNode.get("max_page").asInt();
        per = resultJsonNode.get("per").asInt();
        Iterator<JsonNode> elements = resultJsonNode.get("data").elements();
        Student student = null;
        while (elements.hasNext()){
            JsonNode element = elements.next();
            System.out.println(element.get("BJMC").asText()+"\t\t"+element.get("XH").asText()+"\t\t"+element.get("XM").asText()+"\t\t"+element.get("XZNJ").asText());
            student = new Student();
            student.setStuId(element.get("XH").asText());
            student.setStuName(element.get("XM").asText());
            student.setClazz(element.get("BJMC").asText());
            student.setGradeLevel(element.get("XZNJ").asText());
            students.add(student);
        }

    }

    public List<Student> getStudents() {
        return students;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public int getPer() {
        return per;
    }

    public int getPage() {
        return page;
    }
}
