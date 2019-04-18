<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'specialty.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	$(document).ready(function(){
    $('select').change(function(e){
        var oldvalue=$(this).attr('old');
        var currentvalue=$(this).val();
        if(oldvalue){
            $('select option[value='+oldvalue+']').show();
        }
 
        $('select option[value='+currentvalue+']').hide();
        $(this).attr('old',currentvalue);
    });
});
</script>

  </head>
	  		
 <body>
 
   	<img src="images/timg.jpg" width="100%" height="100%">
   		  <form action="insSpecialty1">
	  		<table align="center" border="1" cellspacing="0" style="margin-top: -400px">	  
	  			<tr>
	  				<th style="height: 30px;width: 150px;background-color:#EEA2AD;" >
	  					<b>设置专业名称：</b>
	  				</th>
	  				
	  				<th style="height: 30px;width: 150px;background-color:#EEE0E5;">
	  					输入招生人数：
	  				</th>
	  				
	  				<th style="height: 30px;width: 150px;background-color:#EEE0E5;">
	  					设置学生年级：
	  				</th>
	  			</tr>
	  
	  		

	  			<tr>	  		  	 
	  				<td>
	  					 <select name="specialty1"  style="height: 30px;width: 150px">
				         	<option value="软件工程" >软件工程</option>
				         	<option value="计算机网络工程">计算机网络工程</option>
				         	<option value="信息安全">信息安全</option>
				         	<option value="计算机科学与技术">计算机科学与技术</option>
			        	</select>
	  				</td>	  					
	  				<td style="width: 100px">
	  					<input type="text" name="specialtynumber1" style="height: 30px;"/>
	  				</td>		  						 
	  				<td>
	   			  &nbsp;&nbsp;&nbsp;&nbsp;  2016：<input type="radio" name="sex" id="sex" value="2016"/>			         
	  				</td>
	  			</tr>
	  		
	  		
	  		
	  			<tr>  		
	  				<td>
	  				 <select name="specialty2"  style="height: 30px;width: 150px">
				         	<option value="软件工程">软件工程</option>
				         	<option value="计算机网络工程">计算机网络工程</option>
				         	<option value="信息安全">信息安全</option>
				         	<option value="计算机科学与技术">计算机科学与技术</option>
			        	</select>       	 
	  				</td>  		  							
	  				<td>
	  					<input type="text" name="specialtynumber2"  style="height: 30px;"/>
	  				</td>	  									
	  				<td>    
	  				&nbsp;&nbsp;&nbsp;&nbsp;  2017：<input type="radio" name="sex" id="sex" value="2017" />
					</td>
	  			</tr>
	 
	 
	  			
	  			<tr>	  		
	  				<td>
	  					 <select name="specialty3"  style="height: 30px;width: 150px">
				         	<option value="软件工程">软件工程</option>
				         	<option value="计算机网络工程">计算机网络工程</option>
				         	<option value="信息安全">信息安全</option>
				         	<option value="计算机科学与技术">计算机科学与技术</option>
			        	</select>	 
	  				</td>	  					
	  				<td>
	  					 <input type="text" name="specialtynumber3"  style="height: 30px;"/>
	  				</td>	  														 
	  				<td>
	  					  &nbsp;&nbsp;&nbsp;&nbsp;  2018：<input type="radio" name="sex" id="sex" value="2018" />
	  				</td>
	  			</tr>
	  			
	  			
	  			
	  			
	  			<tr>	  			
	  				<td>
	  						<select name="specialty4"  style="height: 30px;width: 150px">
				         	<option value="软件工程">软件工程</option>
				         	<option value="计算机网络工程">计算机网络工程</option>
				         	<option value="信息安全">信息安全</option>
				         	<option value="计算机科学与技术">计算机科学与技术</option>
				       	    </select>
	  				</td>  				
	  				<td>
	  					<input type="text" name="specialtynumber4"  style="height: 30px;"/>
	  				</td>
	  				<td>
	  					&nbsp;&nbsp;&nbsp;&nbsp; 2019：<input type="radio" name="sex" id="sex" value="2019" />
	  				</td>	  		
	  			</tr>	  		
	  		</table><br>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="submit" value="确定"/>
	  </form>
  </body>
</html>
