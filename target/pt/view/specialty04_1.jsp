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
    <div id="update-first-div">
    <div class="row" style="margin-top: 8px;">
        <div class="col-md-4">
            <h3 class="span2">志愿填报详情</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped" id="volunteer_table_info">
                <thead>
                <tr>
                    <th>专业名称</th>
                    <th>招生人数</th>
                    <th>第一志愿人数</th>
                    <th>平均学分绩点</th>
                </tr>
                </thead>
                <tbody id="volunteer-table">

                </tbody>
            </table>
        </div>
    </div>
  </div>
  </div>
 </body>
  <script type="text/javascript">
      $(function () {
          getVolunteerInfo();
      })
      function getVolunteerInfo() {
          var layerMsg = layer.msg('正在加载，请稍后......', {
              time: 20000 //2秒关闭（如果不配置，默认是3秒）
          });
          $.ajax({
              url:"/pt/getVolunteerInfoList",
              data: "",
              type:"GET",
              success:function(result){
                  build_volunteer_table(result);
                  layer.close(layerMsg);
              }
          });
      }

      function build_volunteer_table(result) {
          $("#volunteer-table").empty();
          $.each(result,function (index,item) {
              var majorName = $("<td></td>").append(item.majorName);
              var majorLimit = $("<td></td>").append(item.majorLimit);
              var firstFilledNumber = $("<td></td>").append(item.firstFilledNumber);
              var avgGpa = $("<td></td>").append(item.avgGpa);
              $("<tr></tr>").append(majorName).append(majorLimit)
                  .append(firstFilledNumber).append(avgGpa)
                  .appendTo("#volunteer-table");
          });
      }
  </script>
</html>
