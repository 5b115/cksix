<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- 引入bootstrap -->
    <link rel="stylesheet" href="/pt/bootstrap/css/bootstrap.min.css"/>
    <script src="/pt/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="/pt/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/pt/laydate/laydate.js"></script>
    <style type="text/css">
        .paddingtop{
            padding-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <%--<div class="row">--%>
        <%--<ul class="nav nav-tabs">--%>
            <%--<li id="update-first" class="active"><a href="javascript:void(0);" onclick="update_click(1);"><h3>一键更新</h3></a></li>--%>
            <%--<li id="update-second"><a class="disabled" href="javascript:void(0);" onclick="update_click(2);"><h3>自定义更新</h3></a></li>--%>
            <%--<li id="update-third"><a class="disabled" href="javascript:void(0);" onclick="update_click(3);"><h3>单项更新</h3></a></li>--%>
        <%--</ul>--%>
    <%--</div>--%>
    <div id="update-first-div">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center sr-only">初始化数据</h2>
            </div>
        </div>
        <div class="row" id="data-not-null">
            <div class="page-header">
                <h1 id="input-title">当前最新数据为<span class="text-primary" id="current-year"></span>级学生</h1>
            </div>
        </div>
        <div class="row" id="inputFile">
            <div class="col-md-6 updateTime" hidden="hidden">
                <h3>上次更新时间为：<span class="text-primary" id="last-update-time"></span></h3>
            </div>
            <div class="col-md-4 col-md-offset-2" >
                <form action="/pt/updateData" method="get" onsubmit="return changePage();">
                    <button disabled="disabled" type="submit" class="btn btn-primary btn-lg">一键更新数据</button>
                </form>
            </div>
        </div>
    </div>
    <div id="set-date-time">
        <div class="row">
            <div class="col-md-12"><h2>设置填报时间</h2></div>
            <div class="col-md-12" id="set-datetime-success">
                <h2>上次设置结果<span style="color: blue" id="start-time">2019-6-7 17:55</span>至<span style="color: blue" id="end-time">2019-6-8 17:55</span></h2>
            </div>
        </div>
        <div class="row" id="set-date-start">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="test1" class="col-md-2 control-label">开始时间</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="test1" placeholder="选择开始时间">
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="set-date-end">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="test3" class="col-md-2 control-label">截止时间</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" id="test3" placeholder="选择结束时间">
                    </div>
                    <input type="button" onclick="setFillDatetime(this)" class="btn btn-primary col-md-2 " value="确定">
                </div>
            </div>
        </div>
    </div>
    <div id="update-second-div" hidden="hidden">
        <div class="row">
            <h1 class="">&nbsp;</h1>
        </div>
        <form onsubmit="return changePage1();">
            <div class="row">
                <h3 class="col-md-4 text-center">学年</h3>
                <div class="col-md-3 paddingtop">
                    <input class="form-control" type="number" name="gradeLevel" />
                </div>
            </div>
            <div class="row">
                <h3 class="col-md-4 text-center">班级代码</h3>
                <div class="col-md-3 paddingtop">
                    <input class="form-control" type="number" name="clazz" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 updateTime" hidden="hidden">
                    <h3>上次更新时间为：<span id="last-update-time1"></span></h3>
                </div>
                <div class="paddingtop">
                    <button class="btn btn-primary  col-md-3" type="submit">更新</button>
                </div>
            </div>
        </form>

    </div>
    <div id="update-third-div" hidden="hidden">
        <div class="row">单项更新</div>
        <div class="row">
            <div>学生信息</div>
            <div>成绩信息</div>
            <div>课程信息</div>
            <div>某学生信息</div>
        </div>
        <div class="row">
            <div></div>
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
        <h2>正在初始化数据，请稍后.......此过程可能需要5到10分钟</h2>
    </div>
</div>

</body>
<script src="/pt/js/dayjs.min.js"></script>
<script src="/pt/layer/layer.js"></script>
<script type="text/javascript">


    $(function () {
        setLayDate();
        checkIsGetData();
    })
    
    function setLayDate() {
        var todayTime = dayjs().format('YYYY-MM-DD HH:mm');
        var todayTime1 = dayjs().format('YYYY-MM-DD HH:mm:ss');
        var startTime = laydate.render({
            elem: '#test1',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm',
            value: todayTime,
            min: todayTime,
            ready: function(date){
                var dateTime = dayjs(new Date(todayTime));
                endTime.config.min = {
                    year: dateTime.year(),
                    month:dateTime.month(),
                    date: dateTime.date(),
                    hours: dateTime.hour(),
                    minutes: dateTime.minute()+1,
                    seconds : dateTime.second()
                };
            },
            done: function(value, date, endDate){
                var dateTime = dayjs(new Date(value));
                endTime.config.min = {
                    year: dateTime.year(),
                    month:dateTime.month(),
                    date: dateTime.date(),
                    hours: dateTime.hour(),
                    minutes: dateTime.minute()+1,
                    seconds : dateTime.second()
                };
            },
            trigger: 'click'
        });
        var endTime = laydate.render({
            elem: '#test3',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm',
            min: todayTime1,
            trigger: 'click'
        });

    }
    function checkTimeNotNull() {
        var endTime = $("#test3").val();
        if(endTime==null||endTime==""){
            return false;
        }
        return true;
    }
    function setFillDatetime(btn) {
        var startTime = $("#test1").val();
        var endTime = $("#test3").val();
        var startTimeDayjs = dayjs(new Date(startTime));
        var endTimeDayjs = dayjs(new Date(endTime));
        var index = endTimeDayjs.isAfter(startTimeDayjs);
        var index1 = endTimeDayjs.isSame(startTimeDayjs);
        if (!checkTimeNotNull()){
            layer.tips('日期不能为空', btn, {
                tips: [1, '#0FA6D8'] //还可配置颜色
            });
            return false;
        }else if (!index) {
            layer.tips('截止日期不合法！', btn, {
                tips: [1, '#0FA6D8'] //还可配置颜色
            });
            return false;
        }
        $(btn).addClass("disabled").val("loading......");

        $.ajax({
            url:"/pt/updateTime",
            data: {
                "startTime":startTime,
                "endTime":endTime
            },
            type:"POST",
            success:function(result){
                setFillDatetimeSuccess(result);
                $(btn).removeClass("disabled").val("确定");
            }
        });
    }
    
    function setFillDatetimeSuccess(result) {
        $("#start-time").empty().append(result.startTime);
        $("#end-time").empty().append(result.endTime);
    }

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
            $("#last-update-time1").append(result.logChangeTime);
            $("#start-time").empty().append(result.startTime);
            $("#end-time").empty().append(result.endTime);
        }
    }

    function changePage() {
        $("#inputFile").hide();
        $("#schedule").show();
        $("#point").show();
    }

    function update_click(index) {
        return false;
        switch (index){
            case 1:
                $("#update-first").attr("class","active");
                $("#update-second").attr("class","");
                $("#update-third").attr("class","");
                $("#update-first-div").show();
                $("#update-second-div").hide();
                $("#update-third-div").hide();
                break;
            case 2:
                $("#update-first").attr("class","");
                $("#update-second").attr("class","active");
                $("#update-third").attr("class","");
                $("#update-first-div").hide();
                $("#update-second-div").show();
                $("#update-third-div").hide();
                break;
            case 3:
                $("#update-first").attr("class","");
                $("#update-second").attr("class","");
                $("#update-third").attr("class","active");
                $("#update-first-div").hide();
                $("#update-second-div").hide();
                $("#update-third-div").show();
                break;
            default:
                break;
        }
    }
</script>

</html>

