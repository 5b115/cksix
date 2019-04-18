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
			cell0.innerHTML="<input type='text' name='mnumber'/>"
			var cell1=tr.insertCell(1);
			//cell1.innerHTML=document.getElementById("cname").value;
			cell1.innerHTML="<input type='text' name='mname'/>"
			var cell2=tr.insertCell(2);
			//cell2.innerHTML=document.getElementById("credit").value;
			cell2.innerHTML="<input type='text' name='mrole'/>"
			var cell3=tr.insertCell(3);
			//cell3.innerHTML=document.getElementById("period").value;
			cell3.innerHTML="<input type='text' name='mpassword'/>"
	
			var cell4=tr.insertCell(4);
			//cell5.style.textAlign="center";
			cell4.innerHTML="<input type='submit' value='删除' onclick='delRow(this)'/> <input type='button'  value='修改' />";
			
		}
	

	</script>

  </head>
  
  <body style="background-image: url('images/timg.jpg') ;background-size:100% 100%">
<br><br><br>
  	<form action="insUser" onsubmit="return sumbit_sure_insert()">
   		 <table id="ta" align="center" border="1" cellspacing="0">
    
    	  		<hr /><br />
    	 						<tr>
						    		<td style="width: 162px">编号</td>
						    		<td style="width: 160px">姓名</td>
						    		<td style="width: 160px">角色</td>
						    		<td style="width: 161px">密码</td>
						    		<td style="width: 91px">操作</td>	
						  
	    						</tr>
	    		 <input type="submit" name="" id="" value="确定" style="margin-left: 913px" />
				<input type="button" name="" id="" value="添加" onclick="addRow()" style="margin-left: 10px"/>
				<br />  <br />
	    	
	    	<table align="center" border="1" cellspacing="0">	
	    	
	    	  <form action="delUser" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="mnumber" value="201608040107" /></td>
		    			<td width="160px"><input type="text" name="mname" value="吴帆" /></td>
		    			<td width="160px"><input type="text" name="mrole" value="教学主管"/></td>
		    			<td width="160px"><input type="text" name="mpassword" value="111" /></td>	
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    		
	    	  <form action="delUser" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="mnumber" value="201608040156" /></td>
		    			<td width="160px"><input type="text" name="mname" value="关小彤" /></td>
		    			<td width="160px"><input type="text" name="mrole" value="教学秘书"/></td>
		    			<td width="160px"><input type="text" name="mpassword" value="777" /></td>	
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    		
	    	  <form action="delUser" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="mnumber" value="201608040354" /></td>
		    			<td width="160px"><input type="text" name="mname" value="孙俪" /></td>
		    			<td width="160px"><input type="text" name="mrole" value="教学秘书"/></td>
		    			<td width="160px"><input type="text" name="mpassword" value="444" /></td>	
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    		
	    	  <form action="delUser" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="mnumber" value="333" /></td>
		    			<td width="160px"><input type="text" name="mname" value="迪丽热巴" /></td>
		    			<td width="160px"><input type="text" name="mrole" value="教学秘书"/></td>
		    			<td width="160px"><input type="text" name="mpassword" value="333" /></td>	
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    		
	    	  <form action="delUser" onsubmit="return sumbit_sure_delete()"> 
	    		
	    			<tr >
		    			<td width="160px"><input type="text" name="mnumber" value="asdsa" /></td>
		    			<td width="160px"><input type="text" name="mname" value="asd" /></td>
		    			<td width="160px"><input type="text" name="mrole" value="asdasd"/></td>
		    			<td width="160px"><input type="text" name="mpassword" value="asd" /></td>	
		    			<td>  		
			    			<input type="submit" name="" id="" value="删除" onclick="delRow(this)"/>
			    			<input type="button" name="" id="" value="修改"/>
		    			</td>
	    			</tr>
	    	
	    	</form>
	    		
	    			</table>
	    	
	   <br />
	    	
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <a style="margin-left: 655px"  href="showUserPage?pageNumber=0&pageSize=10"  onclick="javascript:return false;"  >上一页</a>
    	<a href="showUserPage?pageNumber=2&pageSize=10"  onclick="javascript:return false;"  >下一页</a>
	 	&nbsp;&nbsp;&nbsp;&nbsp;<a>当前第1页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>一共1页</a>
	    	
   	

    
    	 </table>
    		</form>
    		
    		
  </body>
</html>




