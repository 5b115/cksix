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
    <script src="/pt/layer/layer.js"></script>
    <style type="text/css">
      .span1{
          font-size: 16px;
          color: #808080;
          padding-top: 8px;
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
<div class="container">
    <div id="update-first-div"><!-- 概况start -->
    <div class="row" style="margin-top: 8px;">
        <div class="col-md-4">
            <h3 class="span2">分流结果</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <p class="span1">专业：</p>
        </div>
        <div class="col-md-4">
            <select class="form-control" id="majorList" onchange="getStudentByMajor(this);">
                <option>软件工程</option>
                <option>网络工程</option>
                <option>计算机科学与技术</option>
                <option>人工智能</option>
                <option>信息安全</option>
            </select>
        </div>
    </div>

    <div class="row">
       <%-- <div class="col-md-12">
            <h3>当前应有<span class="span3" id="idealNumber">240</span>个学生参与分流，实际有<span class="span4" id="realNumber">232</span>个学生参与，
                <span class="span5" id="notFilledNumber">8</span>个学生未填报</h3>
        </div>--%>

           <div class="col-md-12">
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
                <li id="pageUp" onclick="pageUp(this)"><a href="javascript:void(0);">&laquo;上一页</a></li>
                <li  id="pageDown" onclick="pageDown(this)"><a href="javascript:void(0);">下一页&raquo;</a></li>
            </ul>
        </div>
    </div>
    </div><!-- 概况end -->

</div>
 </body>
  <script type="text/javascript">
      var pageNum = 1;
      var pages = 1;
      var majorName = $("#majorList").val();
      $(function () {
          getMajorList();
          // getStuByMajorName(majorName);
          getStuByMajorNamePage(majorName,1);
      })


      function getMajorList() {
          $.ajax({
              url:"/pt/getMajorList",
              data: "",
              type:"GET",
              success:function(result){
                  build_major(result);

              }
          });
      }
      function build_major(result) {
          $("#majorList").empty();
          $.each(result,function (index,item) {
              var majorName = $("<option></option>").append(item.majorName);
              $("#majorList").append(majorName);
          });
      }

      function getStudentByMajor(opt) {
          majorName = $(opt).val();
          // getStuByMajorName(majorName);
          getStuByMajorNamePage(majorName,1)
      }
      
      function getStuByMajorName(majorName) {
          $.ajax({
              url:"/pt/getStuByMajor",
              data: "majorName="+majorName,
              type:"POST",
              success:function(result){
                  build_stu_table1(result);
              }
          });
      }

      function getStuByMajorNamePage(majorName,pn) {
          $.ajax({
              url:"/pt/getStuByMajorPage",
              data: "majorName="+majorName+"&pn="+pn,
              type:"POST",
              success:function(result){
                  build_stu_table(result);
                  //2、解析并显示分页信息
                  build_stu_info(result);
              }
          });
      }
      
      function build_stu_table1(result) {
          $("#stu-table").empty();
          $.each(result,function (index,item) {
              var stuId = $("<td></td>").append(item.stuId);
              var stuName = $("<td></td>").append(item.stuName);
              var gradeLevelTd = $("<td></td>").append(item.gradeLevel);
              var clazzTd = $("<td></td>").append(item.clazz);
              $("<tr></tr>").append(stuId).append(stuName)
                  .append(gradeLevelTd).append(clazzTd)
                  .appendTo("#stu-table");
          });
      }

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
      function pageUp(btn) {
          if (pageNum<=1){
              // alert("这是第一页");
              layer.tips('这是第一页', btn, {
                  tips: [1, '#0FA6D8'] //还可配置颜色
              });
          }else {
              // getStudentList(pageNum-1);
              getStuByMajorNamePage(majorName,pageNum-1);
          }
      }
      function pageDown(btn) {
          if (pageNum>=pages){
              // alert("这是最后一页");
              layer.tips('这是最后一页', btn, {
                  tips: [1, '#0FA6D8'] //还可配置颜色
              });
          }else {
              // getStudentList(pageNum+1);
              getStuByMajorNamePage(majorName,pageNum+1);
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