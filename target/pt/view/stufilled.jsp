<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>专业分流首页</title>
    <!-- Bootstrap core CSS -->
    <link href="/pt/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/pt/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/pt/bootstrap/js/bootstrap.min.js"></script>
    <style rel="stylesheet" type="text/css">
        .margin-top{
            margin-top: 20px;
        }
        .margin-right{
            margin-left: 28px;
        }
        .span1{
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="navbar-div">
            <%--<script>$("#navbar-div").load("stuNavbar.jsp")</script>--%>
            <%@ include file="stuNavbar.jsp"%>
        </div>
    </div>
    <div class="row">
        <h3 class="col-md-6">志愿填报</h3>
        <div class="margin-right margin-top">
            <button type="button" id="btn-submit" class="btn btn-primary col-md-2 col-md-offset-4" onclick="filledVolunteerCheck();">提交</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>志愿</th>
                    <th>选择专业</th>
                </tr>
                </thead>
                <tbody id="major-list-select">
                <tr>
                    <td>第一志愿</td>
                    <td>
                        <div class="col-lg-4">
                            <select class="form-control volunteers">
                                <option>请选择专业</option>
                                <option>软件工程</option>
                                <option>网络工程</option>
                                <option>计算机科学与技术</option>
                                <option>信息安全</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>第二志愿</td>
                    <td>
                        <div class="col-lg-4">
                            <select class="form-control volunteers">
                                <option>请选择专业</option>
                                <option>软件工程</option>
                                <option>网络工程</option>
                                <option>计算机科学与技术</option>
                                <option>信息安全</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>第三志愿</td>
                    <td>
                        <div class="col-lg-4">
                            <select class="form-control volunteers">
                                <option>请选择专业</option>
                                <option>软件工程</option>
                                <option>网络工程</option>
                                <option>计算机科学与技术</option>
                                <option>信息安全</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>第四志愿</td>
                    <td>
                        <div class="col-lg-4">
                            <select class="form-control volunteers">
                                <option>请选择专业</option>
                                <option>软件工程</option>
                                <option>网络工程</option>
                                <option>计算机科学与技术</option>
                                <option>信息安全</option>
                            </select>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h3>志愿填报结果</h3>
        </div>
    </div>
    <div class="row" id="result_filled">
        <div class="col-md-6">
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="/pt/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        getMajorList();
        getfilledResult();
    })

    function filledVolunteerCheck() {
        var flag = true;
        var selectVlues = $(".volunteers");
        var volunteers = new Array();
        $.each(selectVlues,function(index,item){
            var str = "请选择专业";
            if($(item).val()==str){
                console.log("进入if判断");
                layer.msg('每一个志愿都要选择');
                console.log("if弹窗");
                flag = false;
                return false;
            }
            var volunteer={};
            volunteer.stuId = stuId;
            volunteer.majorName = $(item).val();
            volunteers[index] = volunteer;
            flag = true;
        });
        if(flag == false){
            console.log("停止执行");
            return false;
        }
        for(var i = 0; i < volunteers.length - 1; i++) {
            console.log(volunteers[i].majorName);
            for(var j = i; j < volunteers.length - 1; j++) {
                console.log(volunteers[i].majorName+":"+volunteers[j+1].majorName);
                if(volunteers[i].majorName == volunteers[j+1].majorName){
                    console.log(volunteers[i].majorName+":"+volunteers[j+1].majorName);
                    layer.msg("志愿不能重复");
                    return false;
                }
            }
        }
        var volunteersArray = new Array();
        for(var i = 0; i < volunteers.length; i++) {
            volunteersArray[i] = volunteers[i].majorName;
        }
        fillVolunteer(volunteersArray);
    }
    function fillVolunteer(volunteers){
        $("#btn-submit").attr("disabled",true);
        var stuId = $("#stuId").text();
        $.ajax({
            url: "/pt/fillVolunteer",
            type:"POST",
            data:"volunteers="+volunteers+"&stuId="+stuId,
            success:function(result){
                console.log(result);
                $("#btn-submit").attr("disabled",false);
                if (result) {
                    layer.msg("填报成功！");
                    getfilledResult();
                }else {
                    layer.msg("填报失败！稍后再试");
                }
            }
        });

    }
    
    function getfilledResult() {
        var stuId = $("#stuId").text();
        $.ajax({
            url: "/pt/getVolunteerByStuId",
            type:"GET",
            data:"stuId="+stuId,
            success:function(result){
                build_result_volunteer(result);
            }
        });
    }
    function build_result_volunteer(result) {
        $("#result_filled").empty();
        if (result.volunteers.length==0) {
            $("#result_filled").append("还没有开始填报");
        }else {
            var stuIdDiv = $("<div class='col-md-4 span1'>学号：</div>").append(result.stuId);
            var stuNameDiv = $("<div class='col-md-8 span1'>姓名：</div>").append(result.stuName);
            $("#result_filled").append(stuIdDiv).append(stuNameDiv);
            $.each(result.volunteers,function(index,item){
                var volunteerRanking = $("<div class='col-md-4 span1'></div>").append("第"+changeNumber(index)+"志愿");
                var volunteerName = $("<div class='col-md-8 span1'></div>").append(item);
                $("#result_filled").append(volunteerRanking).append(volunteerName);
            });
        }
    }
    
    function getMajorList() {
        $.ajax({
            url:"/pt/getMajorList",
            data: "",
            type:"Get",
            success:function(result){
               build_stu_select(result);
            }
        });
    }
    function build_stu_select(majorList) {
        $("#major-list-select").empty();
        var lengthTemp = majorList.length;
        for(var j =0 ; j<lengthTemp;j++){
            var itemTD = $("<td></td>");
            itemTD.append("第"+changeNumber(j)+"志愿");
            var itemSelect = $("<select name='volunteers' class='form-control volunteers'></select>");
            itemSelect.append($("<option>请选择专业</option>"));
            $.each(majorList,function(index,item){
                itemSelect.append($("<option></option>").append(item.majorName));
            });
            var majorListTrDiv = $("<div class='col-lg-4'></div>").append(itemSelect);
            var majorListTr = $("<tr></tr>").append(itemTD).append(majorListTrDiv);
            $("#major-list-select").append(majorListTr);
        }
    }


    function changeNumber(j){
        if(j==0){
            return "一";
        }if(j==1){
            return "二";
        }if(j==2){
            return "三";
        }if(j==3){
            return "四";
        }if(j==4){
            return "五";
        }if(j==5){
            return "六";
        }if(j==6){
            return "七";
        }if(j==7){
            return "八";
        }if(j==8){
            return "九";
        }
    }
</script>
</html>