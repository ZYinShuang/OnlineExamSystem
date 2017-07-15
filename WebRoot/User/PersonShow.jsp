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
    
    <title>My JSP 'PersonShow.jsp' starting page</title>
     
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
	<script type="text/javascript" src="easyui/jquery.min.js"></script>   
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>  
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
	<style type="text/css">
		
		*{
		margin:0;
		padding:0;
		}
		
		.rightmenu{
			float:right;
			width:200px;
			height:60px;
			margin-top: 40px;
			margin-right: 150px;
		}
		
		.rightmenu li{
			float:left;
			list-style:none;
			width:50px;
			height:60px;
			margin-left:14px;
			cursor: pointer;
			text-align: center;
			color: white;
			font-weight: bold;
			font-size: 12px;
			line-height: 22px;
		}
		
		.logininfo{
			float: right;
			margin-top:50px;
			width:400px; 
			height:30px; 			
			color:#fff;
			display:table-cell; 
			vertical-align:bottom;
			line-height:30px;
			font-size:12px;
		}
	</style>
  </head>
  
  <body>
   <table style="width: 400px; margin:0 auto; margin-top: 10px;margin-bottom: 10px; margin-left:-20px; font-size: 14px; font-family:'微软雅黑' ; " cellspacing="10">
	<tr>
					<tr>
			        <td style="text-align:center;">用户账号:</td>
					<td >
					
						 ${sessionScope.user.username }
					</td>
			    </tr>
			
			    <tr>
			        <td style="text-align:center;">用户密码:</td>
					<td >
						${sessionScope.user.password }
					</td>
			    </tr>
			    <tr>
			        <td style="text-align:center;">用户姓名:</td>
					<td >
						${sessionScope.user.name }
					</td>
			    </tr>
			
			     <tr> 
			        <td style="text-align:center;"> 用户类型:</td>
					<td >
					<c:if test="${sessionScope.user.type eq '1'}"> 管理员</c:if>
					<c:if test="${sessionScope.user.type eq '2'}"> 教员</c:if>
					<c:if test="${sessionScope.user.type eq '3'}"> 学生</c:if>
	  		
					</td>
			    </tr>
			    
			
			   <!--   <tr>
			        <td style="text-align: right;">用户成绩:</td>
					<td>
						<input id="Sscore" type="text" name="pwd" style="border:1px solid #95B8E7;"/>  
					</td>
			    </tr> -->
		</table>
			 <div id="toolbar" style="padding-left: 60px">
			
			<a href="#" class="easyui-linkbutton"  style="margin-top: -5px" onClick="window.open('login.jsp','_self')">点击返回登录页面</a>
	 		&nbsp;
			</div> 
  </body>
</html>
