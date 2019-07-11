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
<div class="container">
    <div class="row">
        <ul class="nav nav-tabs">
            <li id="update-first" class="active"><a href="javascript:void(0);" onclick="update_click(1);"><h4>概况</h4></a></li>
            <li id="update-second"><a href="javascript:void(0);" onclick="update_click(2);"><h4>班级概况</h4></a></li>
            <li id="update-third"><a href="javascript:void(0);" onclick="update_click(3);"><h4>搜索</h4></a></li>
        </ul>
    </div>
    <div id="update-first-div"><!-- 概况start -->
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
            <div class="row">
                <div class="col-md-4">
                    <select class="form-control" id="stuStatus" onchange="changeSelect(1);">
                        <option>未填报</option>
                        <option>已填报</option>
                    </select>
                </div>
            </div>
            <table class="table table-striped" id="stu_table_info">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>年级</th>
                    <th>班级</th>
                    <th>填报权限</th>
                    <th>填报情况</th>
                </tr>
                </thead>
                <tbody id="stu-table">
                <tr>
                    <td>201608040122</td>
                    <td>朽木</td>
                    <td>2016</td>
                    <td>软件161</td>
                    <td>允许</td>
                    <td class="text-success">已填报</td>
                </tr>
                <tr>
                    <td>201608040122</td>
                    <td>朽木</td>
                    <td>2016</td>
                    <td>软件161</td>
                    <td>允许</td>
                    <td class="text-success">已填报</td>
                </tr>
                <tr>
                    <td>201608040122</td>
                    <td>朽木</td>
                    <td>2016</td>
                    <td>软件161</td>
                    <td>允许</td>
                    <td class="text-success">已填报</td>
                </tr>
                <tr>
                    <td>201608040122</td>
                    <td>朽木</td>
                    <td>2016</td>
                    <td>软件161</td>
                    <td>允许</td>
                    <td class="text-success">已填报</td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
    <div class="row" id="stu_page_info">
        <div class="col-md-6" id="page_stu_info"></div>
        <div class="col-md-4 col-md-offset-2">
            <ul class="pagination">
                <li id="pageUp" onclick="pageUp(this)"><a href="javascript:void(0);">&laquo;上一页</a></li>
                <li  id="pageDown" onclick="pageDown(this)"><a href="javascript:void(0);">下一页&raquo;</a></li>
            </ul>
        </div>
    </div>
    </div><!-- 概况end -->

    <!-- 班级概况start -->
    <div id="update-second-div" hidden="hidden">
        <div class="row">
            <div class="col-md-12">
                <h3>截止到<span class="span3" id="">2019年5月31日 16:03</span>班级填报情况</h3>
            </div>
        </div>
        <div class="row">
            <table class="table table-striped" >
                <thead>
                <tr>
                    <th>班级</th>
                    <th>已填报</th>
                    <th>未填报</th>
                </tr>
                </thead>
                <tbody id="clazz-content">
                <tr>
                    <td>计算机类181</td>
                    <td>15</td>
                    <td>15</td>
                </tr>
                <tr>
                    <td>计算机类182</td>
                    <td>18</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td>计算机类183</td>
                    <td>0</td>
                    <td>30</td>
                </tr>
                <tr>
                    <td>计算机类184</td>
                    <td>30</td>
                    <td>0</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div><!-- 班级概况end -->

    <!-- 搜索start -->
    <div id="update-third-div" hidden="hidden">
        <br/>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group has-feedback">
                    <div class="input-group">
                        <input type="text" id="stuId-input" class="form-control"  placeholder="输入学号" >
                        <div class="input-group-btn">
                            <button class="btn btn-primary " onclick="seachClick()">搜索
                                <span class="glyphicon glyphicon-search "></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="studentInfo" hidden="hidden">
            <div class="row">
                <div class="col-md-2 text-right"><h4>学号：</h4></div>
                <div class="col-md-3"><h4 id="stuId"></h4></div>
            </div>
            <div class="row">
                <div class="col-md-2 text-right"><h4>姓名：</h4></div>
                <div class="col-md-3"><h4 id="stuName"></h4></div>
            </div>
            <div class="row">
                <div class="col-md-2 text-right"><h4>班级：</h4></div>
                <div class="col-md-3"><h4 id="clazz"></h4></div>
            </div>
            <div class="row">
                <div class="col-md-2 text-right"><h4>年级：</h4></div>
                <div class="col-md-3"><h4 id="gradeLevel"></h4></div>
            </div>
            <div class="row">
                <div class="col-md-2 text-right"><h4>填报情况：</h4></div>
                <div class="col-md-3"><h4 id="volunteer"></h4></div>
            </div>
            <div class="row">
                <div class="col-md-2 text-right"><h4>年级排名：</h4></div>
                <div class="col-md-3"><h4 id="gradeRanking"></h4></div>
            </div>
            <div class="row">
                <div class="col-md-2 text-right"><h4>分流情况：</h4></div>
                <div class="col-md-3"><h4 id="lastMajor"></h4></div>
            </div>

        </div>
        <div class="row">
            <div id="noStu"></div>
        </div>
    </div><!-- 搜索end -->


</div>
 </body>
  <script type="text/javascript">
      var pageNum = 1;
      var pages = 1;
      $(function () {
          getStuNotFilled(1);
          setVolunteerInfo();
          set_clazz_content();
      })
      
      function changeSelect(pn) {
          var stuStatus = $("#stuStatus").val();
          console.log(stuStatus);
          if ("未填报"==stuStatus){
              getStuNotFilled(pn);
          }else {
              getStudentFilled(pn);
          }
      }
      function getStudentFilled(pn) {
          $.ajax({
              url:"/pt/getStuFilled",
              data: "pn="+pn,
              type:"GET",
              success:function(result){
                  if (result.total==0) {
                      console.log("没有人填报，清空stu-table");
                      $("#stu-table").empty();
                      $("#stu_page_info").hide();
                      $("#stu-table").append($("<h3>还没有学生填报</h3>"));
                  }else {
                      $("#stu_page_info").show();
                      build_stu_table(result);
                      //2、解析并显示分页信息
                      build_stu_info(result);
                  }
              }
          });
      }
      
      function getStuNotFilled(pn) {
          $.ajax({
              url:"/pt/getStuNotFilled",
              data: "pn="+pn,
              type:"GET",
              success:function(result){
                  if (result.total==0) {
                      $("#stu-table").empty();
                      $("#stu_page_info").hide();
                      $("#stu-table").append($("<h3>所有学生已经填报完毕</h3>"));
                  }else {
                      console.log("进入构建未填报的学生函数");
                      $("#stu_page_info").show();
                      build_stu_table(result);
                      //2、解析并显示分页信息
                      build_stu_info(result);
                  }
              }
          });
      }

      function build_stu_table(result) {
          $("#stu-table").empty();
          var stuList = result.list;
          pages = result.pages;
          pageNum = result.pageNum;
          console.log("开始构建未填报的学生");
          $.each(stuList,function (index,item) {
              var stuId = $("<td></td>").append(item.stuId);
              var stuName = $("<td></td>").append(item.stuName);
              var gradeLevelTd = $("<td></td>").append(item.gradeLevel);
              var clazzTd = $("<td></td>").append(item.clazz);
              var allowedTd = $("<td></td>");
              if (item.allowed == 1) {
                  allowedTd.append("允许");
              }else {
                  allowedTd.append("不允许").addClass("text-danger");
              }
              var volunteerTd = $("<td></td>");
              if(item.volunteerId==0){
                  volunteerTd.append("未填报").addClass("text-danger");
              }else {
                  volunteerTd.append("已填报").addClass("text-success");
              }
              $("<tr></tr>").append(stuId).append(stuName)
                  .append(gradeLevelTd).append(clazzTd)
                  .append(allowedTd).append(volunteerTd)
                  .appendTo("#stu-table");
              console.log("构建当中");
          });
          console.log("构建结束");
      }
      function build_stu_info(result) {
          $("#page_stu_info").empty();
          $("#page_stu_info").append("当前是第"+result.pageNum+"页,总"+
              result.pages+"页,总共"+
              result.total+"学生");
      }
      function pageUp(btn) {
          if (pageNum<=1){
              layer.tips('这是第一页', btn, {
                  tips: [1, '#0FA6D8'] //还可配置颜色
              });
          }else {
              changeSelect(pageNum-1);
          }
      }
      function pageDown(btn) {
          if (pageNum>=pages){
              layer.tips('这是最后一页', btn, {
                  tips: [1, '#0FA6D8'] //还可配置颜色
              });
          }else {
              changeSelect(pageNum+1);
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
      
      function set_clazz_content() {
          $.ajax({
              url:"/pt/getClazzContent",
              data: "",
              type:"GET",
              success:function(result){
                  build_clazz_content(result);
              }
          });
      }
      function build_clazz_content(result) {
          $("#clazz-content").empty();
          $.each(result,function (index,item) {
              var clazzNameTd = $("<td></td>").append(item.clazzName);
              var filledNumberTd = $("<td></td>").append(item.filledNumber);
              var unfilledNumberTd = $("<td></td>").append(item.unfilledNumber);
              $("<tr></tr>").append(clazzNameTd).append(filledNumberTd)
                  .append(unfilledNumberTd)
                  .appendTo("#clazz-content");
          });
      }

      function update_click(index) {
          switch (index) {
              case 1:
                  $("#update-first").attr("class", "active");
                  $("#update-second").attr("class", "");
                  $("#update-third").attr("class", "");
                  $("#update-first-div").show();
                  $("#update-second-div").hide();
                  $("#update-third-div").hide();
                  break;
              case 2:
                  $("#update-first").attr("class", "");
                  $("#update-second").attr("class", "active");
                  $("#update-third").attr("class", "");
                  $("#update-first-div").hide();
                  $("#update-second-div").show();
                  $("#update-third-div").hide();
                  break;
              case 3:
                  $("#update-first").attr("class", "");
                  $("#update-second").attr("class", "");
                  $("#update-third").attr("class", "active");
                  $("#update-first-div").hide();
                  $("#update-second-div").hide();
                  $("#update-third-div").show();
                  break;
              default:
                  break;
          }
      }

      function seachClick() {
          var stuId = $("#stuId-input").val();
          $.ajax({
              url:"/pt/getOneStu",
              data: "id="+stuId,
              type:"POST",
              success:function(result){
                  build_stu_content(result);
              }
          });
      }
      function build_stu_content(result) {
          var student = result.student;
          if (student==null||student==""){
              $("#studentInfo").hide();
              $("#noStu").empty();
              $("#noStu").append($("<h2></h2>").append("查无此人！"));
          }else {
              $("#stuId").empty();
              $("#stuId").append(student.stuId);
              $("#stuName").empty();
              $("#stuName").append(student.stuName);
              $("#clazz").empty();
              $("#clazz").append(student.clazz);
              $("#gradeLevel").empty();
              $("#gradeLevel").append(student.gradeLevel);
              $("#volunteer").empty();
              if (student.volunteerId>0){
                  $("#volunteer").append("已填报");

              }else {
                  $("#volunteer").append("未填报");
              }
              $("#gradeRanking").empty();
              $("#gradeRanking").append(result.gradeRanking);
              $("#lastMajor").empty();
              if(result.lastMajor==null){
                  $("#lastMajor").append("无");
              }else {
                  $("#lastMajor").append(result.lastMajor);
              }
              $("#studentInfo").show();
              $("#noStu").empty();
          }
      }
  </script>
</html>
