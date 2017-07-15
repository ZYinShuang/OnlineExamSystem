<%@page import="com.jereh.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>杰瑞教育考试管理系统</title>
    
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
	<script type="text/javascript" src="easyui/jquery.min.js"></script>   
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>  
	<link rel="icon" href="img/favicon.ico"/>

	
	<style type="text/css">
		
		*{
		margin:0;
		padding:0;
		}
		
		.rightmenu{
			float:right;
			width:500px;
			height:60px;
			margin-top: 40px;
			margin-right: -100px;
			
		}
		
		.rightmenu li{
			float:left;
			list-style:none;
			width:80px;
			height:50px;
			margin-left:14px;
			cursor: pointer;
			text-align: center;
			color: white;
			font-weight: bold;
			font-size: 12px;
			line-height: 25px;
		}
		
		.rightmenu li .img2{
			width:37px;
			display: none; 
		}
		
		.rightmenu li:hover{
			color:rgba(1, 97, 158, 1);
		}
		
		.rightmenu li:hover .img1{
			display: none;
		}
		
		.rightmenu li:hover .img2{
			display: inline-block;
		}
		
		.logininfo{
			//float: right;
			//margin-top:50px;
			width:450px; 
			height:30px; 			
			color:#fff;
			display:table-cell; 
			vertical-align:bottom;
			line-height:30px;
			font-size:12px;
			position: fixed;
			top:5px;
			right:0%;
		}
		
	/* 	ul li a{
			display: block;
			width: 100%;
			height: 100%;
		} */
	</style>
	
	<script type="text/javascript">
		function addTabs(title,url){
			if ($("#tabs").tabs("exists",title)) {
				$("#tabs").tabs("select",title);
			}else{
				$("#tabs").tabs("add",{
					title:title,
					content:"<iframe scrolling='auto' frameborder='0'  src='" + url 
					        + "' style='width:100%;height:100%;'></iframe>",
					closable: true,
				});
			}
		}
		
		function closeAll(){		
		 	$("#tabs li").each(function(index, obj) {
	    		//获取所有可关闭的选项卡
	    		var tab = $(".tabs-closable", this).text();
	    		$(".easyui-tabs").tabs('close',tab);
	    	});
		}
		
		function loginOut(){
		 
				$.messager.confirm("退出提示","确定注销并退出吗？",function(isTrue){
					if(isTrue){
						$.post("login/logout.do",function(data){
						
							if(data!=null){
								window.location.href="login/logout.do";

		 					}
						});
					}
				});
			
				
			
			  
		}
		

		
	
		$(function(){
		var mark = "${sessionScope.user.username}";
		
		if(mark!=null&&mark!=""){
			
		}else{
			
			window.location.href="login.jsp";
		}
			
		 $("#changePWD").dialog({    
			
			    title:'个人信息',
			    width: 400,    
   				height: 400,    
    			closed: true,    
			    buttons:[{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){
					
					if($("#password").val()==""||$("#Upassword").val()==""||$("#Upassword2").val()==""){
					$.messager.alert('失败提示','所有信息不能为空！请确认！');
					}else{
					$.post("login/changePWD.do",
					{
						'password':$("#password").val(),
						'Upassword':$("#Upassword").val(),
						'Upassword2':$("#Upassword2").val(),
					
					},
					function(data){
					if(data=="ok"){
						$.messager.alert('成功提示','修改成功！请重新登录');
						window.location.href="login.jsp";
						
					}else if(data=="ymis"){
					$.messager.alert('失败提示','原密码错误！');
					}else if(data=="bothmis"){
					$.messager.alert('失败提示','两次输入密码不一致！！');
					}
					
					
					
					
					
					$("#changePWD").dialog({closed: true});
					});
					}
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
						
						$("#changePWD").dialog({closed: true});
					}
				}]
			});  
		});
		
		function goToChange(){
		$("#password").val("");
		$("#Upassword").val("");
		$("#Upassword2").val("");
			$("#changePWD").dialog({
			closed : false
		});
		
		}
		
		
		
		
	</script>

  </head>
  
  <body class="easyui-layout"  ondragstart="return false">
		<div data-options="region:'north',noheader:true,split:false,border:false" 
		 style="height:100px; background-image: url(img/bacground.png); overflow: hidden; ">
		 	<a href="http://www.jredu100.com/" target="_blank">
				<img alt="" src="img/logo.png" style="margin-top: 30px;margin-left: 80px;">
				<img alt="" src="img/font.png" style="margin-top: 30px;margin-left: 20px;">
			</a>
			<ul class="rightmenu">
	  			<li onclick="goToChange()">
	  				<img title="修改信息" src="img/user_h.png" class="img1"/>
	  				<img title="修改信息" src="img/user.png" class="img2"/>
	  				 <br/>
	  				修改信息
	  			</li>
	  			<li onclick="addTabs('考试','Exam/ExamStart.jsp')">
	  				<img title="进入考试" src="img/forget_h.png" class="img1" />
	  				<img title="进入考试" src="img/forget.png"  class="img2"/>
	  				<br/>
	  				进入考试
	  			</li>
	  			<li onclick="loginOut()">
	  				<img title="退出系统" src="img/setting_h.png" class="img1" />
	  				<img title="退出系统" src="img/setting.png" class="img2" />
	  				<br/>
	  				退出系统
	  			</li>
	  			
	  		</ul>
			
			<%
				/* User user = (User)session.getAttribute("user");
				out.print(user.getUsername());
				out.print(user.getType()); */
			 %>
			
	  		<div class="logininfo">
	  			您好，<span style="color:red"><c:if test="${sessionScope.user.type eq '1' }">管理员&nbsp;</c:if>
	  			${sessionScope.user.name}
	  			<c:if test="${sessionScope.user.type eq '2' }">&nbsp;老师</c:if>
	  			<c:if test="${sessionScope.user.type eq '3' }">&nbsp;同学</c:if></span>。欢迎您使用系统!
	  			<span id="display_date">
	  				2016年6月24日
	  			</span>
	  		</div>
		</div>	
	    
	     
	    <div data-options="region:'west',title:'系统菜单',split:true" style="width:200px;">
	    	<div class="easyui-accordion" data-options="fit:true,border:false,selected:3" style="width:200px;"> 
	    	<%--  <c:if test="${sessionScope.user.type eq '1' }"> 
	    		<div title="用户管理" style="padding-top:10px;" iconCls="icon-search">   
	        		 <ul class="easyui-tree">
	        		 	<!-- <li id="showUserList">
	        		 		<a>教师管理</a>		 		
	        		 	</li>
	        		 	<li><span>学生管理</span></li> -->
	        		 	
	        		 </ul> 
	    		</div>
	    	   </c:if>   --%>
	    	   
	    	   
	    	   <c:if test="${sessionScope.user.type eq '1' }"> 
			    <div title="标准管理" style="padding:10px;" iconCls="icon-filter">   
			        <ul class="easyui-tree">
	        		 	<!-- <li id="showUserList">
	        		 		<a>权限管理</a>		 		
	        		 	</li>
	        		 	<li><span>部门管理</span></li>
	        		 	<li><span>班级管理</span></li> -->
	        		 <!-- 	<li><a onclick="addTabs('测试管理','User/student.jsp')">测试管理</a></li> -->
	        		 	<li><a onclick="addTabs('用户管理','User/user1.jsp')">用户管理</a></li>
	        		 	<li><a onclick="addTabs('课程管理','Standard/CourseList.jsp')">课程管理</a></li>
	        		 	
	        		 </ul>    
			    </div> 
			    </c:if> 
			    
			    
			    
			      <c:if test="${sessionScope.user.type eq '1'||sessionScope.user.type eq '2' }"> 
			    <div title="题库管理" style="padding:10px;" iconCls="icon-sum">   
			        <ul class="easyui-tree">
	        		 	<li>
	        		 		<a onclick="addTabs('单选题管理','Question/SingleSelectionList.jsp')">单选题管理</a>		 		
	        		 	</li>
	        		 	<li><a onclick="addTabs('多选题管理','Question/MultiSelectionList.jsp')">多选题管理</a></li>
	        		 	<li><a onclick="addTabs('判断题管理','Question/JudgeList.jsp')">判断题管理</a></li>
	        		 	<li><a onclick="addTabs('填空题管理','Question/CompletionList.jsp')">填空题管理</a></li>
	        		 	<li><a onclick="addTabs('简答题管理','Question/ShortAnswerList.jsp')">简答题管理</a></li>
	        		 	<li><a onclick="addTabs('试题上传','Question/ProblemUpload.jsp')">试题上传</a></li>
	        		 	
	        		 </ul>    
			    </div>
			    </c:if>
			    
			    
			    
			    
			    <div title="考试管理" style="padding:10px;" iconCls="icon-tip">   
			        <ul class="easyui-tree">
			          <c:if test="${sessionScope.user.type eq '1'||sessionScope.user.type eq '2' }">  
	        		 	<li id="showUserList">
	        		 		<a onclick="addTabs('试卷生成','Exam/PaperList.jsp')">试卷生成</a>		 		
	        		 	</li>
	        		 	<!-- <li>试卷内容管理</li> -->
	        		 	<c:if test="${sessionScope.user.type eq '1'||sessionScope.user.type eq '2'|| sessionScope.user.type eq '3'}"> 
	        		 	
	        		 	 </c:if>
	        		 	<li>
						<a onclick="addTabs('阅卷','Exam/PaperCheck.jsp')">阅卷</a>
					 </c:if>
							
					 <li>
	        		 	<a onclick="addTabs('考试','Exam/ExamStart.jsp')">考试</a>		 		
	        		 </li>	 		
					 </li>
					 <c:if test="${sessionScope.user.type eq '3'}">  
	        		 	<li><a onclick="addTabs('成绩查询','Exam/checkScore.jsp')">成绩查询</a></li> 
	        		 </c:if>
	        		</ul>    
			    </div>
			    
			</div>  
	    
	    </div> 
	    
	    <div data-options="region:'center',noheader:true" style="background:#eee;">
	    	<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,tabHeight:30,tools:'#tab-tools'" >
	            <div title="主页" style="padding: 10px;">
	              	 <iframe scrolling="auto" frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
	            </div>
	        </div>
	        <div id="tab-tools" style="border-top: hidden;border-left: hidden;border-right: hidden; padding-right: 10px;">
				<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-cancel" title="关闭全部" onclick="closeAll()"></a>
			</div>
	    </div>   
	
	    <div data-options="region:'south',noheader:true,split:false,border:false" 
	    	 style="height:30px; text-align: center; line-height: 30px; background-color: #515151; color: #FFF;">
	    		版权所有Copyright©&nbsp;2011-2017&nbsp;杰瑞教育&nbsp;All&nbsp;rights&nbsp;reserved&nbsp; [鲁ICP备16044301号-1] 
	    </div> 
	
	
	<!--个人信息展示框  -->
	 <div id="changePWD" style="padding-left: 40px;overflow:hidden;">
	<table style="width: 400px; margin:0 auto; margin-top: 10px;margin-bottom: 10px; margin-left:-20px; font-size: 14px; font-family:'微软雅黑' ; " cellspacing="10">
	<tr>
					<tr>
			        <td style="text-align:center;">用户账号:</td>
					<td >
						${sessionScope.user.username} 
					</td>
			    </tr>
			    
			     <tr>
			        <td style="text-align:center;">用户姓名:</td>
					<td >
						${sessionScope.user.name } 
					</td>
			    </tr>
			
			
			    
			       <tr>
			        <td style="text-align:center;">用户类型:</td>
					<td >
					
				<c:if test="${sessionScope.user.type eq '1' }">管理员</c:if>
	  			<c:if test="${sessionScope.user.type eq '2' }">老师</c:if>
	  			<c:if test="${sessionScope.user.type eq '3' }">同学</c:if>
					</td>
			    </tr>
			    
			    
			
			    <tr>
			        <td style="text-align:center;">原密码:</td>
					<td >
						<input id="password" type="password" name="password" style="border:1px solid #95B8E7;"/>  
					</td>
			    </tr>
			    
			    <tr>
			        <td style="text-align:center;">新密码:</td>
					<td >
						<input id="Upassword" type="password" name="Upassword" style="border:1px solid #95B8E7;"/>  
					</td>
			    </tr>
			    
			    <tr>
			        <td style="text-align:center;">确认密码:</td>
					<td >
						<input id="Upassword2" type="password" name="Upassword2" style="border:1px solid #95B8E7;"/>  
					</td>
			    </tr>
			   
			  
			
			   
	</table>
	
	</div>
	
	
		 <script type="text/javascript">
			function showTime(){
				var now=new Date();
				var year=now.getFullYear();
				var month=now.getMonth()+1;
				var day=now.getDate();
				var hours=now.getHours();
				var minutes=(now.getMinutes()<10)?"0"+now.getMinutes():now.getMinutes();
				var seconds=(now.getSeconds()<10)?"0"+now.getSeconds():now.getSeconds();
				
				var a = new Array("日", "一", "二", "三", "四", "五", "六"); 
				var week = now.getDay(); 
				var weekstr = "星期"+ a[week];  
				
				document.getElementById("display_date").innerHTML="&nbsp;&nbsp;"+year+"年"
				+month+"月"+day+"日 "+hours+":"+minutes+":"
				+seconds+"&nbsp;  "+weekstr;
				//一秒刷新一次显示时间
				setTimeout(showTime,1000);
			}
			showTime();
		</script>
		
		
		
		
  </body>
</html>
