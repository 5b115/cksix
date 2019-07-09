<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sr-only" id="stuId">${stuId}</div>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/pt/stuMain?stuId=${stuId}">系统首页</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class=""><a href="#">专业简介</a></li>
                <li><a href="/pt/stufilled?stuId=${stuId}">填报志愿</a></li>
            </ul>
        </div>
        <div class="nav navbar-nav navbar-right">
            <a class="navbar-brand" href="/pt/stuLogin">退出</a>
        </div>
    </div>
</nav>