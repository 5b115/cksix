<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/pt/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/pt/js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>功能表单</div>
    
    <dl class="leftmenu">
    
    <dd>
    <div class="title">
    <span><img src="/pt/images/leftico01.png" /></span>分流设置
    </div>
    	<ul class="menuson">
            <li><i></i></li>
        <dd>
        	<div>
                <li style="background-color: #FFEFD5"><cite></cite><a href="/pt/view/dataInput.jsp" target="rightFrame">数据导入</a><i></i></li>
				<li><cite></cite><a href="/pt/view/specialty00.jsp" target="rightFrame">专业及人数设置</a><i></i></li>
				<li><cite></cite><a href="/pt/view/specialty01.jsp" target="rightFrame">异常处理</a><i></i></li>
                <li><cite></cite><a href="/pt/view/selAllDivide.jsp" target="rightFrame">分流结果</a><i></i></li>
            </div>
        </dd>
        </ul>
    </dd>
		<dd>
			<div class="title">
				<span><img src="/pt/images/leftico01.png" /></span>分流设置
			</div>
			<ul class="menuson">
				<li><i></i></li>
		<dd>
			<div>
				<li style="background-color: #FFEFD5"><cite></cite><a href="/pt/view/dataInput.jsp" target="rightFrame">数据导入</a><i></i></li>
				<li><cite></cite><a href="/pt/view/specialty.jsp" target="rightFrame">分流设置</a><i></i></li>
				<li><cite></cite><a href="/pt/view/selall_student.jsp" target="rightFrame">异常处理</a><i></i></li>
				<li><cite></cite><a href="/pt/view/selAllDivide.jsp" target="rightFrame">分流结果</a><i></i></li>
			</div>
		</dd>
		</ul>
		</dd>


	   <dd>
	    <div class="title">
	    <span><img src="/pt/images/leftico01.png" /></span>管理
	    </div>
	    	<ul class="menuson">
	         <li><cite></cite><a href="/pt/view/selall_course.jsp" target="rightFrame">课程管理</a><i></i></li>
	          <li><cite></cite><a href="/pt/view/selall_student.jsp" target="rightFrame">学生管理</a><i></i></li>
	        </ul>    

	    </dd>
	    
	    <dd>
	    <div class="title">
	    <span><img src="/pt/images/leftico01.png" /></span>查看
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="#" target="rightFrame">查看成绩信息</a><i></i></li>
	        <li><cite></cite><a href="#" target="rightFrame">查看志愿信息</a><i></i></li>
	        </ul>    	        	       
	    </dd>
    </dl>
</body>
</html>
