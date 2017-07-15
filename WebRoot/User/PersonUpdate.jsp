<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PersonUpdate.jsp' starting page</title>
    
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
	<script type="text/javascript" src="easyui/jquery.min.js"></script>   
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	
	<style type="text/css">
		.inputCls{
			height: 22px;
			width:100px;
			margin: 0;
			padding: 0 2px;
			margin-top: 17px;
			border:1px solid #95B8E7;
		}
	</style>
	<script type="text/javascript">
	
	function changePWD(){
	 
			$('#myform').form('submit', {  
			
			    url:"login/changePWD.do",    
			    onSubmit: function(){    
			    	
			    },    
			    success:function(data){    
			    	
			    	
					if (data=="ok") {
						
						window.location.href="http://localhost:8080/exam/User/PersonShow.jsp";
						$.messager.alert("修改提示","修改成功！");
					} else if(data=="bothnull"){
						$.messager.alert("修改提示","所有不能为空！");
					}else if(data=="bothmis"){
					$.messager.alert("修改提示","两次输入密码不相同！！");
					}else if(data=="ymis"){
					$.messager.alert("修改提示","原密码错误！");
					}
			    	
			    }    
			}); 
			
		}
		

	
	
	</script>

  </head>
  
  <body>
 
			<form action="" method="post" name="myform" id="myform" style="text-align: center;">
			
			<table style="width: 400px;text-align:center margin:0 auto; margin-top: 20px; margin-left:-20px; font-size: 14px; font-family:'微软雅黑' ;" cellspacing="10">
			<tr>
					<td style="text-align: right;">用户账号:</td>
					<td>
						<div>${sessionScope.user.username} </div>
					</td>
			 </tr>
			 
			 <tr>
					<td style="text-align: right;">原密码:</td>
					<td>
						<input type="password" name="password"  id="password"/>
					</td>
			 </tr>
			 
			 
			  <tr>
					<td style="text-align: right;">新密码:</td>
					<td>
						<input type="password" name="Upassword"  id="Upassword"/>
					</td>
			 </tr>
			 
			  <tr>
					<td style="text-align: right;">确认密码:</td>
					<td>
						<input type="password" name="Upassword2" id="Upassword2" />
					</td>
			 </tr>
         
      
       
    </table>
   
  </form>

  <a href="#" class="easyui-linkbutton"  style="margin-top: -5px ;margin-left: 50px"  onclick="changePWD()">保存修改</a>

  
  
  
  
  
  </body>
</html>
