<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="img/favicon.ico"/>
		<title>登陆-杰瑞教育题库考试系统</title>
	</head>
	<style>
		.web_top{
			display: block;
			width: 100%;
			min-width: 1200px;
		}
		.logo{
			width: 100%;
			height: 65px;
		}
		.logo_content{
			width: 1200px;
			height: 100%;
			margin: 0 auto;
		}
		.logo_content img{
			float: left;
			margin-top: 15px;
		}
		.logininfo{
			float: right;
			width: 380px;
			height: 22px;
			margin-top: 20px;
			color: #999999;
			font-family: "微软雅黑";
			font-size: 13px;
		}
		.main{
			width: 100%;
			height: 485px;
			position: relative;
			overflow: hidden;
		}
		.main .main_bg{
			position: absolute;
			width: 1920px;
			height: 484px;
			left: 50%;
			margin-left: -960px;
		}
		.main_table{
			width: 391px;
			height: 375px;
			background-image: url(img/login_0007.png);
			position: absolute;
			right: 10%;
			top: 210px;
		}
		.inputAttr1{
		    background: url(img/login_0003_icon.png) no-repeat 223px ;
		    width: 240px;
		    height: 35px;
		    border-radius:5px;
		    border: 1px solid #999999;
		    box-shadow: 1px 1px 3px #cccccc;
		    padding-left: 10px;
		}
		.inputAttr2{
		    background: url(img/login_0004_icon.png) no-repeat 223px ;
		    width: 240px;
		    height: 35px;
		    border-radius:5px;
		    border: 1px solid rgb(103,189,255);
		    box-shadow: 1px 1px 3px #cccccc;
		    padding-left: 10px;
		}
		.inputAttr3{
		    background: url(img/login_0002_icon.png) no-repeat 223px ;
		    width: 240px;
		    height: 35px;
		    border-radius:5px;
		    border: 1px solid #999999;
		    box-shadow: 1px 1px 3px #cccccc;
		    padding-left: 10px;
		}
		.inputAttr4{
		    background: url(img/login_0001_icon.png) no-repeat 223px ;
		    width: 240px;
		    height: 35px;
		    border-radius:5px;
		    border: 1px solid rgb(103,189,255);
		    box-shadow: 1px 1px 3px #cccccc;
		    padding-left: 10px;
		}
		.submit{
			width: 250px;
			height: 36px;
			background-color: rgb(250,166,0);
			color: #FFFFFF;
			border-radius:5px;
			font-size: 15px;
			border: none;
		}
		#message{text-align:center;color:red;margin-top: 15px; font-family: "微软雅黑"; font-size: 12px; font-weight: lighter;}
	</style>
	<script>
		//右上角日期的显示
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
		
		window.onload = function (){
			showTime();
		}
	</script>
	<script type="text/javascript">
	function show(){  
	    if(document.getElementById("name").value==""){
	      document.getElementById("message").innerHTML="用户名不能为空！";
	     // document.getElementById("name").focus();
	      return false;
	    }else if(document.getElementById("pwd").value==""){
	        document.getElementById("message").innerHTML="密码不能为空！";
	     // document.getElementById("pwd").focus();
	      return false;
	    }else{
	        return true;
	    }
	}  
	
	function submit(){
		var name = document.getElementById("name").value;
		var pwd = document.getElementById("pwd").value;
		if(name==""||pwd==""){
			alert("用户名或密码为空");
			return false;
		}else{
			document.myform.submit();
		}
	}
	    
	</script>
	
	<body style="margin: 0;padding: 0;">
		<!--上方分割线-->
		<img class="web_top" src="img/login_0000_line.png"/>
		<div class="logo">
			<div class="logo_content">
				<img src="img/login_0009_logo.png"/>
				<div class="logininfo">
					今天是：
					<span id="display_date">2016年6月24日</span>
				</div>
			</div>
		</div>
		<div class="main">
			<img class="main_bg" src="img/login_0008_banner.png"/>
		</div>
		<div class="main_table">
				 <form action="login/admins.do" method="post" name="myform" autocomplete="off">
					<table style="margin: 0 auto; width: 315px;height: 200px;margin-top: 40px;" cellpadding="10px">
						<tr>
							<th align="center">
								<img src="img/login_0005_icon.png"/>
							</th>
						</tr>
						<tr>
							<th align="center">
								<div>
									<input name="username" onfocus="javascript:this.className='inputAttr2'" onblur="javascript:this.className='inputAttr1'" class="inputAttr1" type="text" placeholder="请输入用户名" id="name" />
								</div>
							</th>
						</tr>
						<tr>
							<th align="center">
								<div>
									<input name="password" onfocus="javascript:this.className='inputAttr4'" onblur="javascript:this.className='inputAttr3'" class="inputAttr3" type="password" placeholder="请输入密码" id="pwd" />
								</div>
							</th>
						</tr>
						<tr align="center">
							<th>
								<input type="submit" class="submit" value="登录" onclick="submit()"/>
								
								<div id="message">${sessionScope.error }</div>
							</th>
						</tr>
					</table>
				</form>
			</div>
	</body>
</html>
