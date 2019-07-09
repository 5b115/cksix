<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生端首页</title>
    <!-- Bootstrap core CSS -->
    <link href="/pt/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/pt/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/pt/bootstrap/js/bootstrap.min.js"></script>
    <style rel="stylesheet" type="text/css">
        .margin-left{
            margin-left: 2em;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="navbar-div">
            <%--<script>$("#navbar-div").load("navbar.html")</script>--%>
            <%@ include file="stuNavbar.jsp"%>
        </div>
    </div>
    <div class="row">
        <h2 class="col-md-12">专业分流规则</h2>
        <ul class="col-md-11 col-md-offset-1">
            <li>
                <h3>志愿优先原则</h3>
                <h4 class="margin-left text-warning">志愿为第一优先级。
                    学生根据对专业的了解，结合自身兴趣爱好与职业规划，
                    填报第一、二、三志愿（第一志愿很重要）。</h4>
            </li>
            <li>
                <h3>成绩优先原则</h3>
                <h4 class="margin-left text-warning">成绩为第二优先级。
                    学生必修课的平均学分绩点作为专业分流的主要依据，
                    若平均学分绩点相同，则按照已修的主要专业基础和专业课程学分绩点进行排序。</h4>
            </li>
            <li>
                <h3>学术特长优先原则</h3>
                <h4 class="margin-left text-warning">单独优先考虑。
                    拥有某学科专业方面的学术特长在选择该专业时可优先考虑。符合下列任一条件即可认定为具有相应的学术特长。
                    <h4 class="margin-left text-warning">（1）在相关学科专业竞赛中，获省级及以上奖励的个人参赛者或团体代表队的骨干队员；</h4>
                    <h4 class="margin-left text-warning">（2）申报专业领域相关专利，排前五名以内；</h4>
                    <h4 class="margin-left text-warning">（3）在正式学术期刊上发表专业相关论文的主要作者,排名第三作者以前；</h4>
                    <h4 class="margin-left text-warning">（4）获得相关专业领域厅级及以上科技成果奖励，取得一级证书；</h4>
                    <h4 class="margin-left text-warning">（5）学生确具有与专业相关的学术特长，学生需提供相关证明或说明材料，学校将组织有关专家进行考核认定。</h4>
                </h4>
            </li>
        </ul>
    </div>

    <div class="row">
        <h2 class="col-md-12">录取说明</h2>

        <ul class="col-md-11 col-md-offset-1">
            <li>
                <h4 class="text-danger">
                    每个专业都从第一志愿开始录取，按照第一志愿录取已经录满的专业，则不考虑第二志愿报名该专业的学生。
                </h4>
            </li>
            <li>
                <h4 class="text-danger">
                    如果第一志愿报名人数高于该专业接收人数，则按照学生的必修课平均学分绩点，从高到低依次录取。
                </h4>
            </li>
            <li>
                <h4 class="text-danger">
                    第一志愿未录取的学生，参考第二志愿，如果第二志愿报名的专业已经在第一志愿录取时录满，则考虑第三志愿，
                    依次向下考虑。
                </h4>
            </li>
            <li>
                <h4 class="text-danger">
                    没有在规定时限内填报志愿的同学，或者没有填报第二、第三志愿的同学，由学校统一调配到该类下人数未录满的专业。
                </h4>
            </li>
        </ul>
    </div>

</div>

</body>
</html>