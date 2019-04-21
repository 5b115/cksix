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
      </style>

  </head>
	  		
 <body>
   	<%--<img src="/pt/images/timg.jpg" width="100%" height="100%">--%>
<div class="container">
    <div class="row" style="border-bottom: 1px solid #9D9D9D;">
        <div class="col-md-12 col-md-offset-4">
            <h2>请设置专业分流规则：</h2>
        </div>
    </div>
    <div class="row" style="margin-top: 8px;">
        <div class="col-md-4">
            <p class="span2">计算机专业如下：</p>
        </div>
        <div class="col-md-4">
            <button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"></span>新增</button>
            <button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button>
        </div>
    </div>
    <div class="row" style="border-bottom: 1px solid #9D9D9D;padding-top: 5px;">
		<table class="table table-striped" >
			<thead>
				<tr>
					<th>软件工程</th>
					<th>人工智能</th>
					<th>网络工程</th>
					<th>计算机科学与技术</th>
				</tr>
			</thead>
            <tbody>
            <tr>
                <td><input class="form-control" type="number" name="sum" placeholder="人数"/></td>
                <td><input class="form-control" type="number" name="sum" placeholder="人数"/></td>
                <td><input class="form-control" type="number" name="sum" placeholder="人数"/></td>
                <td><input class="form-control" type="number" name="sum" placeholder="人数"/></td>
            </tr>
            </tbody>
		</table>
    </div>
    <div class="row" style="margin-top: 8px;">
        <p class="span2">请选择计算学分的必修课程（所有的课程如下）：</p>
    </div>
    <div class="row" style="border-bottom: 1px solid #9D9D9D;">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>学分</th>
                    <th>学时</th>
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
        <div class="col-md-6">
            <ul class="pagination">
                <li id="pageUp" onclick="pageUp()"><a href="javascript:void(0);">&laquo;上一页</a></li>
                <li  id="pageDown" onclick="pageDown()"><a href="javascript:void(0);">下一页&raquo;</a></li>
            </ul>
        </div>
    </div>

    <div class="row" style="margin-top: 8px;">
        <p class="span2">请选择能够参与填报志愿的学生：</p>
    </div>
    <div class="row">
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
            </tr>
            </thead>
            <tbody id="stu-table">
            <tr>
                <td>201608040122</td>
                <td>朽木</td>
                <td><input name="" type="checkbox" style="height:18px;width: 18px;"/></td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="row">
        <div>

        </div>
    </div>
</div>
 </body>
  <script type="text/javascript">
      var pageNum = 1;
      var pages = 1;
      $(function () {
          getCourseList(1);
      })
      function getCourseList(pn) {
          $.ajax({
              url:"/pt/getCourseInfo",
              data: "pn="+pn,
              type:"GET",
              success:function(result){
                  pageNum = result.pageNum;
                  pages = result.pages;
                  //console.log(result);
                  //1、解析并显示课程信息
                  build_Course_table(result);
                  //2、解析并显示分页信息
                  build_Course_info(result);
              }
          });
      }
      function build_Course_table(result) {
          $("#course-table").empty();
          var courseList = result.list;
          $.each(courseList,function (index,item) {
              var courseId = $("<td></td>").append(item.courseId);
              var courseName = $("<td></td>").append(item.courseName);
              var credit = $("<td></td>").append(item.credit);
              var period = $("<td></td>").append(item.period);
              var checkBoxTd = $("<td><input name='' type='checkbox' style='height:18px;width: 18px;'/></td>");
              $("<tr></tr>").append(courseId)
                  .append(courseName)
                  .append(credit)
                  .append(period)
                  .append(checkBoxTd)
                  .appendTo("#course-table");
          });
      }
      function build_Course_info(result) {
          $("#page_info").empty();
          $("#page_info").append("当前是第"+result.pageNum+"页,总"+
              result.pages+"页,总"+
              result.total+"门课程");
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
