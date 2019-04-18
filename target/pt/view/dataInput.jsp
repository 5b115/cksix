<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<!-- 引入jquery文件 -->

<!-- 声明jquery代码域 -->
<script type="text/javascript">

</script>
</head>

<body style="background-image: url(/pt/images/sj.png);background-size:100% 100%">

<div style="margin-left: 400px;margin-top: 200px">
<form action="upload" enctype="multipart/form-data" method="post">
	导入学生数据：
	<input type="file" name="file" />
	<input type="submit" value="确定" /><br />
</form>
<br/>
<form action="upload" enctype="multipart/form-data" method="post">
	导入课程数据：
	<input type="file" name="file" />
	<input type="submit" value="确定" /><br />
</form>
<br/>
<form action="uploadgrade" enctype="multipart/form-data" method="post">
	导入成绩数据：
	<input type="file" name="file" />
	<input type="submit" value="确定" /><br />
</form>

</div>

</body>

</html>

