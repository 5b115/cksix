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

      <script type="text/javascript">
	$(document).ready(function(){
    $('select').change(function(e){
        var oldvalue=$(this).attr('old');
        var currentvalue=$(this).val();
        if(oldvalue){
            $('select option[value='+oldvalue+']').show();
        }
 
        $('select option[value='+currentvalue+']').hide();
        $(this).attr('old',currentvalue);
    });
});
</script>
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
              color: green;
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
    <div class="row" style="padding-top: 5px;">
        <div class="col-md-5 col-md-offset-1">
            <ul class="list-group" id="majorlist">
                <li class="list-group-item">
                    <span class="badge">14</span>
                    Cras justo odio
                </li>
            </ul>
        </div>
    </div>
    <div class="row" style="margin-top: 8px;">
        <p class="span2 col-md-4">计算学分的课程</p>
    </div>
    <div class="row" id="courseList">
    </div>
    <br/>
    <div class="row">
        <div class="col-md-4 span2 col-md-offset-4" id="total-credit"></div>
    </div>

    <div class="row" style="margin-top: 8px;">
        <p class="span2 col-md-5">已经指定专业的学生</p>
    </div>
    <div class="row">
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>年级</th>
                <th>班级</th>
            </tr>
            </thead>
            <tbody id="stu-table">
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
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>年级</th>
                <th>班级</th>
            </tr>
            </thead>
            <tbody>
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
          // getStudentList(1);
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
      function getStudentList(pn) {
          $.ajax({
              url:"/pt/getStudents",
              data: "pn="+pn,
              type:"GET",
              success:function(result){
                  // pageNum = result.pageNum;
                  // pages = result.pages;
                  //console.log(result);
                  //1、解析并显示学生信息
                  build_stu_table(result);
                  //2、解析并显示分页信息
                  build_stu_info(result);
              }
          });
      }
      function build_majorlist(result) {
          $("#majorlist").empty();
          var majorList = result;
          $.each(majorList,function (index,item) {
              var majorLimit = $("<span class='badge'></span>").append(item.majorLimit+"人");
              var majorNameli = $("<li class='list-group-item'></li>").append(item.majorName).append(majorLimit);
              $("#majorlist").append(majorNameli);
          });
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
      function build_stu_table(result) {
          $("#stu-table").empty();
          var stuList = result.list;
          $.each(stuList,function (index,item) {
              var stuId = $("<td></td>").append(item.stuId);
              var stuName = $("<td></td>").append(item.stuName);
              var checkBoxTd = $("<td><input name='' type='checkbox' style='height:18px;width: 18px;'/></td>");
              $("<tr></tr>").append(stuId)
                  .append(stuName)
                  .append(checkBoxTd)
                  .appendTo("#stu-table");
          });
      }
      function build_stu_info(result) {
          $("#page_stu_info").empty();
          $("#page_stu_info").append("当前是第"+result.pageNum+"页,总"+
              result.pages+"页,总共"+
              result.total+"学生");
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
  </script>
</html>
