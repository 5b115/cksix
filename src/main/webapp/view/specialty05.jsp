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
      .paddingdiv{
          padding-top: 12px;
      }
      .span2{
          font-size: 22px;
          font-weight: bold;
      }
      .span3{
          font-size: 22px;
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
        <div class="col-md-4">
            <h3 class="span2">分流结果</h3>
        </div>
        <div class="col-md-8 paddingdiv">
            <div class="row">
                <button id="btn-depart" onclick="btn_depart(this)" class="btn btn-primary col-md-3 col-md-offset-8">开始分流</button>
            </div>
        </div>
    </div>
    <div id="depart-before" hidden="hidden">
        <div class="row">
            <div class="col-md-12">
                <p class="span3">填报截止时间为<span id="filled-deadtime" class="text-primary">2019-06-30 00:00</span>,填报结束后开始分流</p>
            </div>
        </div>
    </div>
    <div id="depart-before1" hidden="hidden">
        <div class="row">
            <div class="col-md-12">
                <p class="span3">还没有开始分流</p>
            </div>
        </div>
    </div>
    <div id="depart-major-content">
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
        <div class="col-md-2">
            <button class="btn btn-primary" onclick="downloadExcel(this)">导出Excel表</button>
        </div>
    </div>

    <div class="row">
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
      var isdepart = false;
      $(function () {
          getMajorList();
          checkTime();
      })

      function checkTime() {
          $.ajax({
              url:"/pt/getLogInfo",
              data: "",
              type:"GET",
              success:function(result){
                  isdepart = result.isdepart;
                  build_depart(result);
              }
          });
      }
      function build_depart(result){
          if (result.isdepart==false){
              build_depart_content(result.endTime);
          }else {
              getStuByMajorNamePage(majorName,1);
          }
      }
      
      function build_depart_content(endTime) {
          $("#depart-major-content").hide();
          $("#depart-before").show();
          $("#filled-deadtime").empty().append(endTime);
          $("#btn-depart").addClass("disabled");
      }
      function build_depart_before() {
          $("#depart-major-content").hide();
          $("#depart-before").hide();
          $("#depart-before1").show();
      }
      
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
          getStuByMajorNamePage(majorName,1)
      }

      function getStuByMajorNamePage(majorName,pn) {

          $.ajax({
              url:"/pt/getStuByMajorPage",
              data: "majorName="+majorName+"&pn="+pn,
              type:"POST",
              success:function(result){
                  if (result==null||result==""){
                      build_depart_before();
                  }else {
                      build_stu_table(result);
                      //2、解析并显示分页信息
                      build_stu_info(result);

                  }
              }
          });
      }

      function build_stu_table(result) {
          $("#depart-major-content").show();
          $("#depart-before").hide();
          $("#depart-before1").hide();
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

      function btn_depart(btn) {
          $(btn).addClass("disabled").val("loading......");
          var index = layer.load(0, {time: 60*1000});
          $.ajax({
              url:"/pt/departMajor",
              data: "",
              type:"GET",
              success:function(result){
                  checkTime();
                  $("#btn-depart").removeClass("disabled");
                  layer.close(index);
              }
          });
      }
      function downloadExcel(btn) {
          $(btn).attr("disabled",true);
          window.location.href = "/pt/downloadExcel";
          $(btn).attr("disabled",false);
      }
  </script>
</html>
