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
              font-size: 18px;
          }
          .span2{
              font-size: 22px;
              font-weight: bold;
          }
          .span3{
              margin-bottom: 5px;
              color: #0000ff;
          }
      </style>

  </head>
	  		
 <body>
   	<%--<img src="/pt/images/timg.jpg" width="100%" height="100%">--%>
<div class="container">
    <div class="row" style="border-bottom: 1px solid #9D9D9D;">
        <div class="col-md-12 col-md-offset-4">
            <h2>专业分流规则设置结果</h2>
        </div>
    </div>
    <div class="row" style="margin-top: 8px;">
        <div class="col-md-4">
            <p class="span2">专业及人数</p>
        </div>
    </div>
    <div class="row" id="majorList1"></div>
    <div class="row" style="margin-top: 8px;">
        <p class="span2 col-md-4">计算学分的课程</p>
        <div class="col-md-4 span2 col-md-offset-1" id="total-credit"></div>
    </div>
    <div class="row" id="courseList">
    </div>

    <div class="row" style="margin-top: 8px;">
        <p class="span2 col-md-5">已经指定专业的学生</p>
    </div>
    <div class="row" >
        <table class="table table-striped majorStuTable" >
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>年级</th>
                <th>班级</th>
                <th>专业</th>
            </tr>
            </thead>
            <tbody id="stu-major-table">
            <tr>
                <td>201608040122</td>
                <td>朽木</td>
                <td></td>
            </tr>
            <tr>
                <td>201608040122</td>
                <td>朽木</td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row" style="margin-top: 8px;">
        <p class="span2 col-md-5">取消填报资格的学生</p>
    </div>
    <div class="row">
        <table class="table table-striped stuNotAllowed" >
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>年级</th>
                <th>班级</th>
            </tr>
            </thead>
            <tbody id="stu-not-allowed">
            <tr>
                <td>201608040122</td>
                <td>亚索</td>
                <td></td>
            </tr>
            <tr>
                <td>201608040122</td>
                <td>亚索</td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_stu_info">
        </div>
        <div class="col-md-6">

        </div>
    </div>

    <div class="row">
        <div>
        </div>
    </div>
</div>
 </body>
  <script type="text/javascript">
      $(function () {
          getMajorList();
          getCourseList();
          getStuMajor();
          getStuNotAllowed();
      })
      function getCourseList() {
          $.ajax({
              url:"/pt/getSelectedCourse",
              data: "",
              type:"GET",
              success:function(result){
                  build_course_list(result);
              }
          });
      }
      function getMajorList() {
          $.ajax({
              url:"/pt/getMajorLimit",
              data: "",
              type:"GET",
              success:function(result){
                  build_majorlist(result);
              }
          });
      }
      function getStuMajor() {
          $.ajax({
              url:"/pt/getMajorStu",
              data: "",
              type:"GET",
              success:function(result){
                  build_stu_Major(result);
              }
          });
      }
      
      function build_stu_Major(result) {
          if (result==null||result==""){
              $(".majorStuTable").empty();
              $(".majorStuTable").append($("<h2></h2>").append("还没有已经指定专业的学生"));
          }else {
              $("#stu-major-table").empty();
              $.each(result,function (index,item) {
                  var stuIdTd = $("<td></td>").append(item.stuId);
                  var stuNameTd = $("<td></td>").append(item.stuName);
                  var gradeLevelTd = $("<td></td>").append(item.gradeLevel);
                  var clazzTd = $("<td></td>").append(item.clazz);
                  var majorTd = $("<td></td>").append(item.major.majorName);
                  $("<tr></tr>").append(stuIdTd).append(stuNameTd)
                      .append(gradeLevelTd).append(clazzTd).append(majorTd)
                      .appendTo("#stu-major-table");
              });
          }
      }
      function build_majorlist(result) {
          $("#majorlist1").empty();
          console.log("换一个方式显示");
          $.each(result,function (index, item) {
              console.log(item);
              var majorLimit2 = $("<span class='badge'></span>").append(item.majorLimit+"人");
              console.log(majorLimit2);
              var majorName1 = $("<span class='span1 span3 col-md-4'></span>").append(item.majorName);
              majorName1.append(majorLimit2).appendTo("#majorlist1");
              console.log("两种方式添加");
              $("#majorList1").append(majorName1.append(majorLimit2));
          });
          console.log("显示成功");
      }
      function build_course_list(result) {
          $("#courseList").empty();
          var credits = 0;
          $.each(result,function (index, item) {
              credits = credits + item.credit;
              var courseName = $("<span class='span1 span3 col-md-4'></span>").append(item.courseName);
              var creditBadge = $("<span class='badge'></span>").append(item.credit+"学分");
              courseName.append(creditBadge).appendTo("#courseList");
          })
          $("#total-credit").append("总学分为"+credits);
      }


      function getStuNotAllowed() {
          $.ajax({
              url:"/pt/getNotAllowed",
              data: "",
              type:"GET",
              success:function(result){
                  build_stu_not_allowed(result);
              }
          });
      }

      function build_stu_not_allowed(result) {
          if (result==null||result==""){
              $(".stuNotAllowed").empty();
              $(".stuNotAllowed").append($("<h2></h2>").append("还没有取消填报资格的学生"));
          }else {
              $("#stu-not-allowed").empty();
              $.each(result,function (index,item) {
                  var stuIdTd = $("<td></td>").append(item.stuId);
                  var stuNameTd = $("<td></td>").append(item.stuName);
                  var gradeLevelTd = $("<td></td>").append(item.gradeLevel);
                  var clazzTd = $("<td></td>").append(item.clazz);
                  $("<tr></tr>").append(stuIdTd).append(stuNameTd)
                      .append(gradeLevelTd).append(clazzTd)
                      .appendTo("#stu-not-allowed");
              });
          }
      }

  </script>
</html>
