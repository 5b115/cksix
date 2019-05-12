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
              color: #808080;
          }
          .span2{
              font-size: 22px;
              font-weight: bold;
          }
          .span3{
              color: blue;
          }
          .span4{
              color: lightgreen;
          }
          .span5{
              color: red;
          }
      </style>

  </head>
	  		
 <body>
   	<%--<img src="/pt/images/timg.jpg" width="100%" height="100%">--%>
<div class="container">
    <div class="row" style="border-bottom: 1px solid #9D9D9D;">
        <div class="col-md-12 col-md-offset-4">
            <h2>当前专业填报情况</h2>
        </div>
    </div>
    <div class="row" style="margin-top: 8px;">
        <div class="col-md-4">
            <h3 class="span2">学生填报情况</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>截止到<span class="span3" id="currentTime">2019年5月11日 16:03</span>已经有<span class="span4" id="stuFilledNumber">232</span>个完成了填报，
                还有<span class="span5" id="notFilledNumber">8</span>个学生未填报</h3>
        </div>
        <div class="col-md-12">
            <h3 class="span1">还未填报的学生</h3>
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
                    <td>2016</td>
                    <td>软件161</td>
                </tr>
                <tr>
                    <td>201608040122</td>
                    <td>朽木</td>
                    <td>2016</td>
                    <td>软件161</td>
                </tr>
                <tr>
                    <td>201608040122</td>
                    <td>朽木</td>
                    <td>2016</td>
                    <td>软件161</td>
                </tr>
                <tr>
                    <td>201608040122</td>
                    <td>朽木</td>
                    <td>2016</td>
                    <td>软件161</td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
    <div class="row">
        <div class="col-md-6" id="page_stu_info"></div>
        <div class="col-md-4 col-md-offset-2">
            <ul class="pagination">
                <li id="pageUp" onclick="pageUp()"><a href="javascript:void(0);">&laquo;上一页</a></li>
                <li  id="pageDown" onclick="pageDown()"><a href="javascript:void(0);">下一页&raquo;</a></li>
            </ul>
        </div>
    </div>


</div>
 </body>
  <script type="text/javascript">
      var pageNum = 1;
      var pages = 1;
      $(function () {
          getStudentList(1);
          setVolunteerInfo(); 
      })
      function getStudentList(pn) {
          $.ajax({
              url:"/pt/getStuNotFilled",
              data: "pn="+pn,
              type:"GET",
              success:function(result){
                  build_stu_table(result);
                  //2、解析并显示分页信息
                  build_stu_info(result);
              }
          });
      }

      function build_stu_table(result) {
          $("#stu-table").empty();
          var stuList = result.list;
          pages = result.pages;
          pageNum = result.pageNum;
          $.each(stuList,function (index,item) {
              var stuId = $("<td></td>").append(item.stuId);
              var stuName = $("<td></td>").append(item.stuName);
              var gradeLevelTd = $("<td></td>").append(item.gradeLevel);
              var clazzTd = $("<td></td>").append(item.clazz);
              $("<tr></tr>").append(stuId).append(stuName)
                  .append(gradeLevelTd).append(clazzTd)
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
              getStudentList(pageNum-1);
          }
      }
      function pageDown() {
          if (pageNum>=pages){
              alert("这是最后一页");
          }else {
              getStudentList(pageNum+1);
          }
      }

      function setVolunteerInfo() {
          $.ajax({
              url:"/pt/getVolunteerInfo",
              data: "",
              type:"GET",
              success:function(result){
                  if (result != null || result!=""){
                      $("#currentTime").html(result.currentTime);
                      $("#stuFilledNumber").html(result.filledNumber);
                      $("#notFilledNumber").html(result.unfilledNumber);
                  }
              }
          });
      }
  </script>
</html>
