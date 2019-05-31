<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'specialty.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
      <!-- 引入bootstrap -->
      <link rel="stylesheet" href="/pt/bootstrap/css/bootstrap.min.css"/>
      <script src="/pt/js/jquery-3.3.1.min.js" type="text/javascript"></script>
      <script src="/pt/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
      <style type="text/css">
          .span1{
              font-size: 20px;
          }
          .span2{
              font-size: 22px;
              font-weight: bold;
          }
          .sellAll{
              cursor: hand;
          }
          .span3{
              margin-bottom: 5px;
              color: #0000ff;
          }
      </style>

  </head>
	  		
 <body>
<div class="container">
    <div class="row" style="border-bottom: 1px solid #9D9D9D;">
        <div class="col-md-12 col-md-offset-4">
            <h2>专业分流规则设置</h2>
        </div>
    </div>
    <div class="row" style="margin-top: 8px;">
        <div class="col-md-6">
            <p class="span2">选择参与计算学分的课程：</p>
        </div>
        <div class="col-md-3 col-md-offset-3">
            <input type="button" onclick="setCourses();" class="form-control btn btn-primary" value="确认"/>
        </div>
    </div>
    <div class="row" id="final-course" style="margin-top: 8px;">
        <div class="span2">还没有选择课程</div>
    </div>
    <br/>
    <div class="row span2">
        <div class="col-md-6" id="final-credit">
        </div>
    </div>
    <br/>
    <div class="row" style="border-bottom: 1px solid #9D9D9D;">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>课程性质</th>
                    <th>学分</th>
                    <th>学时</th>
                    <th class="sellAll" onclick="selectAll(this);">全选</th>
                </tr>
            </thead>
            <tbody id="course-table">
                <tr>
                    <td>[DB0102001]</td>
                    <td>高等数学A(上)</td>
                    <td>5</td>
                    <td>45</td>
                    <td><input name="" type="checkbox" style="height:18px;width: 18px;"/></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info">
        </div>
    </div>
    <div class="row">

    </div>

    <div class="row">
        <div>

        </div>
    </div>
</div>
 </body>
  <script type="text/javascript">
      $(function () {
          getCourseList();
          getCourses();
      })
      function getCourseList() {
          $.ajax({
              url:"/pt/getCourseList",
              data: "",
              type:"GET",
              success:function(result){
                  //1、解析并显示课程信息
                  build_Course_table(result);
                  //2、解析并显示分页信息
                  build_Course_info(result);
              }
          });
      }

      function build_Course_table(result) {
          $("#course-table").empty();
          var courseList = result;
          $.each(courseList,function (index,item) {
              var courseId = $("<td></td>").append(item.courseId);
              var courseName = $("<td></td>").append(item.courseName);
              var courseType = $("<td></td>");
              if (item.courseType==="01"){
                  courseType.append("必修");
              }else{
                  courseType.append("选修修");
              }
              var credit = $("<td></td>").append(item.credit);
              var period = $("<td></td>").append(item.period);
              var checkBoxTd = $("<td><input name='' class='selected-course' type='checkbox' style='height:18px;width: 18px;'/></td>");
              checkBoxTd.attr("course-id",item.courseId);
              $("<tr></tr>").append(courseId)
                  .append(courseName)
                  .append(courseType)
                  .append(credit)
                  .append(period)
                  .append(checkBoxTd)
                  .appendTo("#course-table");
              if (item.permission==1){
                 // $(".selected-course").prop("checked","checked");
                  checkBoxTd.children("input").prop("checked","checked");
              }else if (item.permission==0) {
                 // $(".selected-course").prop("checked",false);
                  checkBoxTd.children("input").prop("checked",false);
              }
              console.log($(".selected-course").is(':checked'));
          });
      }

      function build_Course_info(result) {
          $("#page_info").empty();
          $("#page_info").append("总"+
              result.length+"门课程");
      }

      function pageUp() {
          if (pageNum<=1){
              alert("这是第一页");
          }else {
              getCourseList(pageNum-1);
          }
      }
      function pageDown() {
          if (pageNum>=pages){
              alert("这是最后一页");
          }else {
              getCourseList(pageNum+1);
          }
      }
      function selectAll(obj) {
          $(".selected-course").each(function () {
              $(this).prop("checked",true);
          });
          // if (obj.innerHTML=="全选"){
             // obj.innerHTML="不全选";
          // }
          // else {
          //     $(".selected-course").each(function () {
          //         $(this).prop("checked",false);
          //     });
          //     obj.innerHTML="全选";
          // }
      }
      
      function setCourses() {
          var courseIdList = new Array();
          var coursePermissions = new Array();
          $(".selected-course").each(function () {
              if ($(this).is(':checked')){
                  courseIdList.push($(this).parent().attr("course-id"));
                  coursePermissions.push(1);
              }else {
                  courseIdList.push($(this).parent().attr("course-id"));
                  coursePermissions.push(0);
              }
          });
          setCoursePermission(courseIdList,coursePermissions);
      }
      function setCoursePermission(obj1,obj2) {
          $.ajax({
              url:"/pt/setPermission",
              data: "courseIdList="+obj1+"&coursePermissions="+obj2,
              type:"POST",
              success:function(result){
                  setFinal(result);
                  calculateAvgGpa();
              }
          });
      }
      
      function calculateAvgGpa() {
          $.ajax({
              url:"/pt/calculateAvgGpa",
              data: "",
              type:"GET",
              success:function(result){
              }
          });
      }

      function getCourses() {
          $.ajax({
              url:"/pt/getCourses",
              data: "",
              type:"GET",
              success:function(result){
                  if (result.length>=1){
                      setFinal(result);
                  }
              }
          });
      }
      function setFinal(result) {
          $("#final-course").empty();
          $("#final-credit").empty();
          var reditSum = 0;
          $.each(result,function (index,item) {
              reditSum = reditSum+item.credit;
              var courseInfoSpan = $("<span class='span1 span3'></span>").append(item.courseName)
                  .append($("<span class='badge'></span>").append(item.credit+"学分"));
              $("<div class='col-md-4'></div>").append(courseInfoSpan).appendTo($("#final-course"));
          });
          $("#final-credit").append("总共选择了"+result.length+"门课程，"+"总学分为"+reditSum);
      }

  </script>
</html>
