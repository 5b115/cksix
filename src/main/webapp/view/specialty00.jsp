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

 <!-- 专业新增模态框 -->
 <div class="modal fade" id="addMajorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h4 class="modal-title" id="myModalLabel">增加新的专业</h4>
             </div>
             <form method="post" action="/pt/addMajor">
                 <div class="modal-body">
                     <div class="row">
                         <div class="col-md-4 col-md-offset-1">
                             <p class="span2" for="name">专业名称</p>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-md-4 col-md-offset-1">
                             <input type="text" name="majorName" id="name" placeholder="名称">
                         </div>
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

    <div class="row" style="margin-top: 8px;">
        <div class="col-md-6">
            <h2>计算机专业及人数设置</h2>
        </div>
        <div class="col-md-4 col-md-offset-2">
            <button style="margin-top: 19px;" onclick="addOneMajor();" type="button" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-plus"></span>新增</button>
        </div>
    </div>
    <div class="row">
		<table class="table table-striped" >
			<thead>
				<tr>
					<th>专业名称</th>
					<th>人数设置</th>
				</tr>
			</thead>
            <tbody id="major_table_body">
                <tr>
                    <td>软件工程</td>
                    <td><input class="col-md-4" type="number" name="sum" placeholder="人数"/></td>
                    <td><button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button></td>
                </tr>
                <tr>
                    <td>人工智能</td>
                    <td><input class="col-md-4" type="number" name="sum" placeholder="人数"/></td>
                    <td><button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button></td>
                </tr>
                <tr>
                    <td>网络工程</td>
                    <td><input class="col-md-4" type="number" name="sum" placeholder="人数"/></td>
                    <td><button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button></td>
                </tr>
                <tr>
                    <td>计算机科学与技术</td>
                    <td><input class="col-md-4" type="number" name="sum" placeholder="人数"/></td>
                    <td><button type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span>删除</button></td>
                </tr>
            </tbody>
		</table>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-3">
            <input type="button" class="form-control btn btn-primary" value="确认"/>
        </div>
    </div>
    <div class="row">
        <div id="major_info" hidden="hidden">
            <h2></h2>
        </div>
    </div>
</div>
 </body>
  <script type="text/javascript">
      $(function () {
          getMajorList()
      })
      function getMajorList() {
          $.ajax({
              url:"/pt/getMajorList",
              data: "",
              type:"GET",
              success:function(result){
                  //1、解析并显示专业信息
                  build_major_table(result);
                  //2、解析并显示分页信息
                  //build_Course_info(result);
              }
          });
      }
      function build_major_table(result) {
          $("#major_table_body").empty();
          $.each(result,function (index,item) {
              var majorNameTd = $("<td></td>").append(item.majorName);
              var checkBoxTd = $("<td><input class='col-md-4' type='number' name='sum' placeholder='人数'/></td>");
              var buttonTd = $("<button type='button' class='btn btn-danger btn-sm btn-delete'><span class='glyphicon glyphicon-trash'></span>删除</button>")
              $("<tr></tr>").append(majorNameTd)
                  .append(checkBoxTd)
                  .append(buttonTd)
                  .appendTo("#major_table_body");
          });
          $(".btn-delete").
          $(".btn-delete").click(function (id) {
              $.ajax({
                  url:"/pt/deleteMajor/"+id,
                  data: "",
                  type:"GET",
                  success:function(result){
                      //1、解析并显示专业信息
                      build_major_table(result);
                      //2、解析并显示分页信息
                      //build_Course_info(result);
                  }
              });
          });
      }
      
      function addOneMajor() {
          $("#addMajorModal").modal({
              backdrop:"static"
          })
      }
  </script>
</html>
