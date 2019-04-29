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
      </style>

  </head>
 <body>
 <!-- 异常学生编辑模态框 -->
 <div class="modal fade" id="notMajorStuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h4 class="modal-title" id="myModalLabel">异常学生的处理</h4>
             </div>
             <form method="post" action="#">
                 <div class="modal-body">
                     <div class="row">
                         <table class="table table-striped">
                             <thead>
                                 <tr>
                                     <th>学号</th>
                                     <th>姓名</th>
                                     <th>年级</th>
                                     <th>班级</th>
                                 </tr>
                             </thead>
                             <tbody id="edit-body">
                             <tr>
                                 <td>201608040122</td>
                                 <td>朽木</td>
                                 <td>2016</td>
                                 <td>161</td>
                             </tr>
                             </tbody>
                         </table>
                     </div>
                     <div class="row">
                         <div class="col-md-4 span1">是否允许填报志愿</div>
                         <div class="col-md-3">
                             <label class="radio-inline">
                                 <input style="font-size: 15px;" type="radio" checked="checked" name="inlineRadioOptions" value="1"> 是
                             </label>
                             <label class="radio-inline">
                                 <input style="width: 12px;height: 12px;" type="radio" name="inlineRadioOptions" value="0"> 否
                             </label>
                         </div>
                     </div>
                     <br/>
                     <div class="row">
                         <div class="col-md-4">
                             <p class="span1">指定专业</p>
                         </div>
                         <div class="col-md-4">
                             <select class="form-control major-list">
                                 <option>1</option>
                                 <option>2</option>
                                 <option>3</option>
                                 <option>4</option>
                                 <option>5</option>
                             </select>
                         </div>
                     </div>
                     <div class="row">

                     </div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                     <button type="submit" class="btn btn-primary" >确定</button>
                 </div>
             </form>
         </div><!-- /.modal-content -->
     </div><!-- /.modal -->
 </div>



 <div class="container">
    <div class="row" style="border-bottom: 1px solid #9D9D9D;">
        <div class="col-md-12 col-md-offset-4">
            <h2>专业分流规则设置</h2>
        </div>
    </div>

    <div class="row" style="margin-top: 8px;">
        <div class="col-md-6">
            <p class="span2 grade-level">异常学生的处理</p>
        </div>
    </div>
   <!-- <div class="row" style="margin-bottom: 8px;">
        <div class="col-md-4">
            <div class="input-group">
                <input type="text" class="form-control" aria-label="...">
                <div class="input-group-btn">
                    <button class="btn btn-default">搜索</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">暂无结果
        </div>
    </div>
    -->
    <div class="row">
        <div class="col-md-4">
        </div>
    </div>
    <div class="row">
        <table class="table table-striped" >
            <h3 class="text-center text-primary">转专业的学生</h3>
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
                <th>选课权限</th>
                <th>最终专业</th>
                <th>设置</th>
            </tr>
            </thead>
            <tbody id="stu-not-major">
            <tr>
                <td>201608040122</td>
                <td>朽木</td>
                <td>181</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <table class="table table-striped" >
            <h3 class="text-center text-primary">留级的学生</h3>
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
                <th>选课权限</th>
                <th>最终专业</th>
                <th>设置</th>
            </tr>
            </thead>
            <tbody id="stu-repeat">
            <tr>
                <td>201608040122</td>
                <td>朽木</td>
                <td>181</td>
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
      var today = new Date();
      $(function () {
          $(".grade-level").html((today.getFullYear()-1)+"级异常学生的处理");
          getRepeatStudent();
          getStuNotMajor();
          edit_btn_click();
      })
      function getRepeatStudent() {
          $.ajax({
              url:"/pt/getRepeatStu",
              data: "",
              type:"GET",
              success:function(result){
                  //1、解析并显示留级学生信息
                  build_stu_repeat(result);
                  //2、解析并显示分页信息
                  build_stu_info(result);
              }
          });
      }
      function getStuNotMajor() {
          $.ajax({
              url:"/pt/getStuNotMajor",
              data: "",
              type:"GET",
              success:function(result){
                  //1、解析并显示留级学生信息
                  build_stu_not_major(result);
                  //2、解析并显示分页信息
                  build_stu_info(result);
              }
          });
      }
      function build_stu_repeat(result) {
          $("#stu-repeat").empty();
          var stuList = result;
          $.each(stuList,function (index,item) {
              var stuId = $("<td></td>").append(item.stuId);
              var stuName = $("<td></td>").append(item.stuName);
              var clazz = $("<td></td>").append(item.clazz);
              var permission = $("<td></td>").append("无");
              var finalMajor = $("<td></td>").append("未分配");
              var buttonTd = $("<button type='button' class='edit-btn btn btn-primary btn-sm'><span class='glyphicon glyphicon-pencil'></span>编辑</button>");
              buttonTd.attr("stu-id",item.stuId);
              $("<tr></tr>").append(stuId)
                  .append(stuName)
                  .append(clazz)
                  .append(permission)
                  .append(finalMajor)
                  .append(buttonTd)
                  .appendTo("#stu-repeat");
          });
      }
      function build_stu_not_major(result) {
          $("#stu-not-major").empty();
          var stuList = result;
          $.each(stuList,function (index,item) {
              var stuId = $("<td></td>").append(item.stuId);
              var stuName = $("<td></td>").append(item.stuName);
              var clazz = $("<td></td>").append(item.clazz);
              var permission = $("<td></td>").append("无");
              var finalMajor = $("<td></td>").append("未分配");
              var buttonTd = $("<button type='button' class='edit-btn btn btn-primary btn-sm'><span class='glyphicon glyphicon-pencil'></span>编辑</button>");
              buttonTd.attr("stu-id",item.stuId);
              $("<tr></tr>").append(stuId)
                  .append(stuName)
                  .append(clazz)
                  .append(permission)
                  .append(finalMajor)
                  .append(buttonTd)
                  .appendTo("#stu-not-major");
          });
      }
      function build_stu_info(result) {
          $("#page_stu_info").empty();
          $("#page_stu_info").append("当前是第"+result.pageNum+"页,总"+
              result.pages+"页,总共"+
              result.total+"学生");
      }
      
      function edit_btn_click() {
          $(document).on("click",".edit-btn",function () {
              $("#notMajorStuModal").modal({
                  backdrop:"static"
              });
              set_edit_body($(this).attr("stu-id"));
              setMajorList();
          });
      }
      
      function setMajorList() {
          $.ajax({
              url:"/pt/getMajorLimit",
              data: "",
              type:"GET",
              success:function(result){
                  $(".major-list").empty();
                  $("<option></option>").append("").appendTo(".major-list");
                  $.each(result,function (index, item) {
                      $("<option></option>").append(item.majorName).appendTo(".major-list");
                  })
              }
          });
      }
      function set_edit_body(id) {
          $.ajax({
              url:"/pt/getOneStu",
              data: "id="+id,
              type:"POST",
              success:function(result){
                  $("#edit-body").empty();
                  var stuIdTd = $("<td></td>").append(result.stuId);
                  var stuNameTd = $("<td></td>").append(result.stuName);
                  var gradeLevelTd = $("<td></td>").append(result.gradeLevel);
                  var clazzTd = $("<td></td>").append(result.clazz);
                  $("<tr></tr>").append(stuIdTd).append(stuNameTd)
                      .append(gradeLevelTd).append(clazzTd)
                      .appendTo("#edit-body");
              }
          });
      }

  </script>
</html>
