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
    <style type="text/css">
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2 class="text-center sr-only">初始化数据</h2>
        </div>
    </div>
    <div class="row" id="data-not-null">
        <div class="page-header">
            <h1 id="input-title">当前数据最新为<span id="current-year"></span>级学生</h1>
        </div>
    </div>
    <div class="row" id="data-null">

    </div>
    <div class="row" id="inputFile">
        <div class="col-md-6 updateTime" hidden="hidden">
            <h3>上次更新时间为：<span id="last-update-time"></span></h3>
        </div>
        <div class="col-md-4 col-md-offset-2" >
            <form action="/pt/updateData" method="get" onsubmit="return changePage(this);">
                <button type="submit" class="btn btn-primary btn-lg">一键更新数据</button>
            </form>
        </div>
    </div>

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
<!-- <form  id="inputFile" class="form-horizontal" action="/pt/upload" onsubmit="return changePage(this);" method="post" enctype="multipart/form-data" role="form">
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
</form> -->

</body>
<script type="text/javascript">

    $(function () {
        checkIsGetData();
    })

    function checkIsGetData() {
        $.ajax({
            url:"/pt/getLog",
            data: "",
            type:"GET",
            success:function(result){
                setTitle(result);
            }
        });
    }
    
    function setTitle(result) {
        if (result==null||result==""){
            $("#input-title").empty();
            $("#input-title").append("还没有初始化数据！");
        }else {
            $("#current-year").append(result.lastSemester);
            $(".updateTime").show();
            $("#last-update-time").append(result.logChangeTime);
        }
    }

    function changePage(obj) {
        $("#inputFile").hide();
        $("#schedule").show();
        $("#point").show();
    }
</script>

</html>

