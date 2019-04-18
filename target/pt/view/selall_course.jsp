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
			cell0.innerHTML="<input type='text' name='cnumber'/>"
			var cell1=tr.insertCell(1);
			//cell1.innerHTML=document.getElementById("cname").value;
			cell1.innerHTML="<input type='text' name='cname'/>"
			var cell2=tr.insertCell(2);
			//cell2.innerHTML=document.getElementById("credit").value;
			cell2.innerHTML="<input type='text' name='credit'/>"
			var cell3=tr.insertCell(3);
			//cell3.innerHTML=document.getElementById("period").value;
			cell3.innerHTML="<input type='text' name='period'/>"
			var cell4=tr.insertCell(4);
			//cell4.innerHTML=document.getElementById("method").value;
			cell4.innerHTML="<input type='text' name='method'/>"
			var cell5=tr.insertCell(5);
			//cell5.style.textAlign="center";
			cell5.innerHTML="<input type='submit' value='删除' onclick='delRow(this)'/> <input type='button'  value='修改' />";
			
		}
	

	</script>

  </head>
  
  <body  style="background-image: url('images/sj.png');background-size:100% 100%">

  	<form action="insCourse" onsubmit="return sumbit_sure_insert()">
  	<br>
   		 <table border="1" id="ta" align="center">
    
    	   <br />
  
    	 				
    	 							<tr>
						    		<td style="width: 162px">课程号</td>
						    		<td style="width: 160px">课程名</td>
						    		<td style="width: 160px">学分</td>
						    		<td style="width: 161px">学时</td>
						    		<td style="width: 160px">考查方式</td>	
						    		<td style="width: 91px">操作</td>	
	    	<!--  	<td style="width: 100px">操作</td>		 -->
			    <input type="submit" name="" id="" value="确定" style="margin-left: 1000px" />
				<input type="button" name="" id="" value="添加" onclick="addRow()" style="margin-left: 10px"/>
				<br />  <br />
	    					</tr>
	    
	    	<table border="1" align="center">
	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0102001" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="高等数学A(上)" /></td>
		    			<td width="160px"><input type="text" name="credit" value="5"/></td>
		    			<td width="160px"><input type="text" name="period" value="75" /></td>
		    			<td width="160px"><input type="text" name="method" value="考试"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0102002" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="高等数学A(下)" /></td>
		    			<td width="160px"><input type="text" name="credit" value="5"/></td>
		    			<td width="160px"><input type="text" name="period" value="75" /></td>
		    			<td width="160px"><input type="text" name="method" value="考试"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0102012" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="线性代数" /></td>
		    			<td width="160px"><input type="text" name="credit" value="3"/></td>
		    			<td width="160px"><input type="text" name="period" value="45" /></td>
		    			<td width="160px"><input type="text" name="method" value="考试"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0801051" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="大学生创新创业指导1" /></td>
		    			<td width="160px"><input type="text" name="credit" value="1"/></td>
		    			<td width="160px"><input type="text" name="period" value="15" /></td>
		    			<td width="160px"><input type="text" name="method" value="考查"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0801099" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="计算机导论" /></td>
		    			<td width="160px"><input type="text" name="credit" value="1"/></td>
		    			<td width="160px"><input type="text" name="period" value="15" /></td>
		    			<td width="160px"><input type="text" name="method" value="考查"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0801146" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="程序设计基础" /></td>
		    			<td width="160px"><input type="text" name="credit" value="4"/></td>
		    			<td width="160px"><input type="text" name="period" value="60" /></td>
		    			<td width="160px"><input type="text" name="method" value="考试"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0801220" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="面向对象程序设计" /></td>
		    			<td width="160px"><input type="text" name="credit" value="3"/></td>
		    			<td width="160px"><input type="text" name="period" value="45" /></td>
		    			<td width="160px"><input type="text" name="method" value="考试"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB0905009" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="艺术鉴赏" /></td>
		    			<td width="160px"><input type="text" name="credit" value="1"/></td>
		    			<td width="160px"><input type="text" name="period" value="15" /></td>
		    			<td width="160px"><input type="text" name="method" value="考查"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB1010021" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="大学英语一" /></td>
		    			<td width="160px"><input type="text" name="credit" value="4"/></td>
		    			<td width="160px"><input type="text" name="period" value="60" /></td>
		    			<td width="160px"><input type="text" name="method" value="考试"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	  <form action="delCourse" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="cnumber" value="DB1010022" /></td>
		    			<td width="160px"><input type="text" name="cname"cname" value="大学英语二" /></td>
		    			<td width="160px"><input type="text" name="credit" value="4"/></td>
		    			<td width="160px"><input type="text" name="period" value="60" /></td>
		    			<td width="160px"><input type="text" name="method" value="考试"/></td>		
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    	    	
	    	    	
	    		</table>
	    		<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <a style="margin-left: 750px"  href="showCoursePage?pageNumber=0&pageSize=10"  onclick="javascript:return false;"  >上一页</a>
    	<a href="showCoursePage?pageNumber=2&pageSize=10"  >下一页</a>
	 	&nbsp;&nbsp;&nbsp;&nbsp;<a>当前第1页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>一共2页</a>
	 
   	
 </table>
    	</form>
  </body>
</html>
