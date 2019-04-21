<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="/pt/bootstrap/css/bootstrap.min.css"/>
    <script src="/pt/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="/pt/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body style="background-image: url(/pt/images/sj.png);background-size:100% 100%">
<div class="container">
    <div class="row">
        <div class="col-md-12 col-md-offset-2">
            <h2>请先导入学生成绩数据以此获取学生以及课程信息</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <hr size="2px"/>
        </div>
    </div>
    <form  id="inputFile" class="form-horizontal" action="/pt/upload" onsubmit="return changePage(this);" method="post" enctype="multipart/form-data" role="form">
        <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
               <h3>请选择文件：</h3>
                <input id="" type="file" name="file" style=""/>
            </div>
            <div class="col-md-2">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
                 <button class="btn btn-success" type="submit">提交</button>
            </div>
        </div>
    </form>
    <div id="schedule" class="row" hidden="hidden">
        <div class="progress progress-striped active" >
            <div class="progress-bar progress-bar-success" role="progressbar"
                 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                 style="width: 40%;">
                <span class="sr-only">40% 完成</span>
            </div>
        </div>

    </div>
    <div class="row" id="point" hidden="hidden">
        <hr/>
        <h2>正在初始化数据，请稍后.......</h2>
    </div>
</div>

</body>
<script type="text/javascript">
    function changePage(obj) {
        $("#inputFile").hide();
        $("#schedule").show();
        $("#point").show();
    }
</script>

</html>

