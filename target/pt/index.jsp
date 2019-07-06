<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎登录后台管理系统</title>
    <link href="/pt/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/pt/js/jquery-3.3.1.min.js"></script>
    <script src="/pt/js/cloud.js" type="text/javascript"></script>

    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
        });
    </script>
</head>

<body style="background-color:#1E90FF; background-repeat:no-repeat; background-position:center top; overflow:hidden;">



<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>


<div class="logintop">
    <span>欢迎登录专业分流后台</span>
</div>

<div class="loginbody">

    <span class="systemlogo"></span><br/>
    <div class="loginbox">
        <form action="/pt/checkUserLogin" method="post" onsubmit="return checkInput(this);">
        <ul>
            <li><input name="username" type="text" class="loginuser" value="" onclick="JavaScript:this.value=''"/></li>
            <li><p style="color: red">${msg}</p></li>
            <li><input name="password" type="password" class="loginpwd" value="" onclick="JavaScript:this.value=''"/></li>
            <li><input name="" type="submit" class="loginbtn" value="登录" /><label><a href="#">忘记密码？</a></label></li>
        </ul>
        </form>
    </div>
</div>

<div class="loginbm">中原工学院 © 2019~</div>
</body>
<script src="/pt/layer/layer.js"></script>
<script type="text/javascript">
    function checkInput(obj) {
        var user = obj.username.value;
        var pwd = obj.password.value;
        if (user==""||pwd==""){
            layer.tips('账户或者密码为空', ".loginbtn", {
                tips: [2, '#0FA6D8'] //还可配置颜色
            });
            return false;
        }
        return true;
    }
</script>
</html>
