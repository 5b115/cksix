<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8080/shixun/">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	
	<script type="text/javascript">
		function sumbit_sure_insert(){
		var gnl=confirm("确定要添加吗?");
		if (gnl==true){
		return true;
		}else{
		return false;
		}
		}
	
	
		function sumbit_sure_delete(){
		var gnl=confirm("确定要删除吗?");
		if (gnl==true){
		return true;
		}else{
		return false;
		}
		}
	
		//声明删除行
		function delRow(btn){
			//获取table对象
			var ta=document.getElementById("ta");
			//获取要删除的行对象
			var tr=btn.parentNode.parentNode;
			//删除行
			ta.deleteRow(tr.rowIndex);
		}
		//添加行
		function addRow(){
			//获取table表格对象
			var ta=document.getElementById("ta");
			//添加行
			var tr=ta.insertRow(1);
			//添加单元格
			var cell0=tr.insertCell(0);
			
			//cell0.innerHTML=document.getElementById("cnumber").value;
			cell0.innerHTML="<input type='text' name='snumber' style='width:120px'/>"
			var cell1=tr.insertCell(1);
			//cell1.innerHTML=document.getElementById("cname").value;
			cell1.innerHTML="<input type='text' name='sname' style='width:120px'/>"
			var cell2=tr.insertCell(2);
			//cell2.innerHTML=document.getElementById("credit").value;
			cell2.innerHTML="<input type='text' name='ssex' style='width:120px'/>"
			var cell3=tr.insertCell(3);
			//cell3.innerHTML=document.getElementById("period").value;
			cell3.innerHTML="<input type='text' name='sacademe' style='width:120px'/>"
			var cell4=tr.insertCell(4);
			//cell4.innerHTML=document.getElementById("method").value;
			cell4.innerHTML="<input type='text' name='syear' style='width:120px'/>"
				var cell5=tr.insertCell(5);
			cell5.innerHTML="<input type='text' name='sid' style='width:140px'/>"
				var cell6=tr.insertCell(6);
			cell6.innerHTML="<input type='text' name='sbirthday' style='width:120px'/>"
				var cell7=tr.insertCell(7);
			cell7.innerHTML="<input type='text' name='snation' style='width:120px'/>"
			var cell8=tr.insertCell(8);
			//cell5.style.textAlign="center";
			cell8.innerHTML="<input type='submit' value='删除' onclick='delRow(this)' style='width:58px'/> <input type='button'  value='修改' style='width:58px'/>";
			
		}
	

	</script>
	


  </head>
  
  <body  style="background-image: url('images/sj.png');background-size:100% 100%">

  	<form action="insStudent" onsubmit="return sumbit_sure_insert()">
   		 <table border="1" id="ta" align="center">
    
    	   <hr /><br />
  
    	 				
    	 							<tr>
						    		<td style="width: 120px">学号</td>
						    		<td style="width: 120px">姓名</td>
						    		<td style="width: 120px">性别</td>
						    		<td style="width: 120px">学院</td>
						    		<td style="width: 120px">年级</td>
						    		<td style="width: 140px">身份证号</td>
						    		<td style="width: 120px">出生日期</td>	
						    		<td style="width: 120px">民族</td>
						    		<td style="width: 120px">操作</td>	
	    	<!--  	<td style="width: 100px">操作</td>	 -->
	    				
				<input type="submit" name="" id="" value="确定" style="margin-left: 1082px;width: 60px"/>
				<input type="button" name="" id="" value="添加" onclick="addRow()" style="margin-left: 10px;width: 60px"/>
				  <br />  <br />
	    					</tr>
	  			
	    	<table border="1" align="center">	
	    		
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201503040113" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="米文通" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="342623199611211412" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1996-11-21" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201508020110" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="陈昱文" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="450106199707060575" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1997-07-06" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201508020129" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="李翔" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="340404199709222417" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1997-09-22" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201508020215" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="和昊" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="410802199610270133" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1996-10-27" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201508030324" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="朱一鸣" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="410322199601100819" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1996-01-10" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201508040110" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="张文党" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="412721199612255039" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1996-12-25" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201508040205" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="刘星辰" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="412822199602280478" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1996-02-28" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201508040207" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="王浩杰" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="412701199512113513" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1995-12-11" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201563080424" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="陈杭" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="330327199706183536" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1997-06-18" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201608020114" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="叶昌旺" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="522123199604071032" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1996-04-07" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201608020121" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="韩鹏杨" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="410728199804075019" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1998-04-07" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201608020127" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="丁偲远" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="320282199801162570" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1998-01-16" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201608020130" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="何嘉晟" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="330825199811051011" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1998-11-05" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201608020208" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="魏邵杰" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="350721199802251815" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1998-02-25" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	    	  <form action="delStudent" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr>
		    			<td><input type="text" name="snumber" value="201608020213" style="width: 120px"/></td>
		    			<td><input type="text" name="sname" value="覃全" style="width: 120px"/></td>
		    			<td><input type="text" name="ssex" value="男" style="width: 120px"/></td>
		    			<td><input type="text" name="sacademe" value="计算机学院" style="width: 120px"/></td>
		    			<td><input type="text" name="syear" value="2017" style="width: 120px"/></td>	
		    			<td><input type="text" name="sid" value="522127199608082017" style="width: 140px"/></td>	
		    			<td><input type="text" name="sbirthday" value="1996-08-08" style="width: 120px"/></td>	
		    			<td><input type="text" name="snation" value="汉族" style="width: 120px"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)" style="width: 58px"/>
			    			<input type="button" name="" id="" value="修改" style="width: 58px"/>
		    			</td>
		
	    			</tr>
	    		    		
	    		</form>
	    		   	
	   
		 </table>
	    	<form action="selAllStudent">
	    	
	    	
	    		<input type="text" name="year" style="position: absolute;margin-top: -518px;margin-left: 60px;" placeholder="学号或者姓名查询"/>
	    	
	    		<input type="submit" value="查询" style="position: absolute;margin-top: -518px;margin-left: 230px"/>
	    		
	    		
	    		<table border="1" align="center">	
	    		
	    	</form>
		 </table>
	
	    	<br />
	    	
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <a style="margin-left: 850px"  href="showStudentPage?pageNumber=0&pageSize=15"  onclick="javascript:return false;"  >上一页</a>
    	<a href="showStudentPage?pageNumber=2&pageSize=15"  >下一页</a>
	 	&nbsp;&nbsp;&nbsp;&nbsp;<a>当前第1页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>一共15页</a>
	    	
   	
    	</table> 
    	</form>
    	
  </body>
</html>



    