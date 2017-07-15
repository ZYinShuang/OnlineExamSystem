<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
body{margin:0; padding:0; font-size:9pt;}
#login{margin:auto; width:975px; height:368px; margin-top:120px;}
#top_left{width:691px; height:89px; float:left;}
#top_left img {margin-left:33px;}
#top_center{width:248px; height:89px; background:url(loginImg/login_05.gif); float:left;}

#center_left{width:691px; height:190px; background:url(loginImg/login_09.jpg); float:left;}
#center_middle{width:248px; height:190px; float:left; background:url(loginImg/login_13.gif) repeat-y;}
#center_right{width:36px; height:190px; float:right; background:url(loginImg/login_11.gif);}

#down_left{width:691px; height:89px; float:left; margin-top:15px;}
#down_center{width:248px; height:89px; background:url(loginImg/login_16.gif); float:left;}
#inf{width:691px; height:38px; background:url(loginImg/login_18.gif) no-repeat; }
.inf_text{display:block; width:100px; height:20px; font-size:16px; font-weight:bolder; color:#fff; margin-left:17px; margin-top:12px; float:left;}
.copyright{display:block; float:left; margin-left:17px; margin-top:15px;}

#message{text-align:center;color:red;}
#user{ margin-left:40px; margin-top:15px;}
#password{margin-left:40px; margin-top:25px; height:25px;}
input{width:120px; height:18px; border:solid 1px #aca7a7; font-size:9pt;}
#btn{margin-left:30px; margin-top:40px;height:25px; margin-right:28px; text-align:center;}
#btn a{display:block; line-height:25px; background: url(loginImg/bt_bg.gif); border: solid 1px #b6b6b6; width:65px; float:left; margin-left:15px; text-decoration:none; color:#000;}
#btn input{display:block;height:25px; line-height:22px; background: url(loginImg/bt_bg.gif); border: solid 1px #b6b6b6; width:65px; float:left; margin-left:2px; text-decoration:none; color:#000;}
</style>
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

function hi(){
var a;
alert(a);
}
    
</script>
</head>
<body>
  <form action="login/admins.do" method="post" name="myform">
  <div id="login">
    <div id="top">
      <div id="top_left"><img src="img/logo.png"/></div>
      <div id="top_center"></div>
    </div>	
    <div id="center">
      <div id="center_left"></div>
      <div id="center_middle">
     <%--  <%
     String error =  request.getParameter("error");
     if(error.equals("1")){
     	%>
     	<div id="message">用户名或密码错误<span id="showname" style="display:inline;"></span></div>
     	<%
     }else if(error.equals("2")){
     %>
     	<div id="message">您的账号已被冻结<span id="showname" style="display:inline;"></span></div>
     <% 
     }
       %> --%>
       <div id="message">${sessionScope.error }<span id="showname" style="display:inline;"></span></div>
        <!-- <div id="message">用户名或密码错误<span id="showname" style="display:inline;"></span></div> -->
        <div id="user">用  户：<input type="text" name="username" onblur="show()" id="name"/></div>
        <div id="password">密  码：<input type="password" name="password" onblur="show()" id="pwd"/></div>
        <div id="btn"><a onclick="submit()">登  录</a>
        <a href="javascript:document.myform.reset();">清  空</a></div>
       <c>dianji</c>
        <!-- javascript:document.myform.submit(); -->
     		</div>
      <div id="center_right"></div>		 
    </div>
    <div id="down">
      <div id="down_left">
      </div>
      <div id="down_center"></div>		 
    </div>
  </div>
  </form>
</body>

</html>
