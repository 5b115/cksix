<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>学生填报</title>
    <!-- Bootstrap core CSS -->
    <link href="/pt/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/pt/bootstrap/css/signin.css" rel="stylesheet">
    <script type="text/javascript" src="/pt/js/jquery-3.3.1.min.js"></script>
</head>

<body class="text-center">
<div class="form-signin">
    <h1 class="h3 mb-3 font-weight-normal">欢迎使用</h1>
    <p class="text-danger">${msg}</p>
    <form action="/pt/studentLogin" method="post" onsubmit="return checkLogin();">
        <label class="sr-only">Username</label>
        <input type="text" class="form-control" id="input1" name="stuId" placeholder="用户名" required="" autofocus="">
        <label class="sr-only">Password</label>
        <br />
        <input type="password" id="input2" class="form-control" name="password" placeholder="密码" required="">
        <div class="checkbox mb-3">
        </div>
        <button class="btn btn-lg btn-primary btn-block" id="btn-login" onclick="" type="submit">登录</button>
        <br>
    </form>
    <p class="mt-5 mb-3 text-muted">中原工学院 © 2019~</p>
</div>
</body>
<script type="text/javascript" src="/pt/layer/layer.js"></script>
<script type="text/javascript">
    function checkLogin() {
        var stuId =  $("#input1").val();
        var password = $("#input2").val();
        if (checkNull(stuId,password)){
            layer.tips('学号和密码不能为空', '#btn-login');
            return false;
        }
    }
    //判断学号和密码是否为空
    function checkNull(stuId, pwd) {
        console.log(stuId+"==="+pwd);
        if (stuId==""||pwd=="") {
            return true;
        }
        return false;
    }

</script>
</html>