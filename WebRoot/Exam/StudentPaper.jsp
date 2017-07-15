<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jereh.entity.PaperHead"%>
<%@ page import="com.jereh.entity.PaperTest"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
 request.setCharacterEncoding("UTF-8");
 String path        = request.getContextPath();
 String basePath    = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 PaperHead  paperInfo      =(PaperHead)session.getAttribute("paperInfo");
 List<PaperTest>  listType =(List)session.getAttribute("paperType");
 List<PaperTest>  listJFA  =(List)session.getAttribute("listJFA");
 
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>考试</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
	<script type="text/javascript" src="easyui/jquery.min.js"></script>   
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<!--<style type="text/css">
    body{
        overflow:scroll;
        overflow-y:hidden;
    }
</style>-->
<style>
.head {
	position: fixed;
	z-index: 100;
	top: 0;
	left: 0;
	width: 100%;
	height: 70px;
	background: url(JRT002A/img/background.png);
}
h4 {
	margin-left: 3%;
}
p {
	margin-left: 4%;
}
.b {
	margin-left: 6%;
}
.problem {
	width: 100%;
	height: 500px;
	position: absolute;
	margin-top: 70px;
}
.answer{
	color:red;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="head">
		<h3 align="center"><%=paperInfo.getPaperName()%> </h3>
		<h4 align="center">姓名：${sessionScope.studentName} </h4>
			<hr>
	</div>
	<div class="problem">
		<form action="" name="paperForm" method="post" onkeydown="if(event.keyCode==13){return false;}">
			<input type="hidden" name="paperId" id="paperId" value="<%=paperInfo.getPaperId()%>">
			
		<%-- 	<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==3){%>
				<h4>三、判断题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=3){k++;continue;};
				  %>
				   <p><%=i-k%>.<%=info.getTitle() %></p>
				   <div style="text-align: center">
					填写答案(T或F):<input  type="text" style="width:5%" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>"/><br>
				   </div>
				<%} %>
			<%	break;}
			 } %>
			<hr/> --%>
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==4){%>
				<h4>四、填空题 每题<%=pt.getMark() %>分,共<%=pt.getCt()%>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=4){k++;continue;};
				  %>
				  <p><strong><%=i-k%>.</strong><%=info.getTitle() %></p>
				 	<textarea  type="text" style="width:100%;resize:none; height: 50px;" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>" ><%=info.getsAnswer() %></textarea>
					<%-- 填写答案:<input  type="text" style="width:80%" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>" value="<%=info.getsAnswer() %>"/> --%><br>
				  <br>
				  <strong class='answer'>正确答案:<%=info.getrAnswer() %></strong><br/><br>
				  <strong style="color: red">填空题<%=i-k %>分数</strong><input type="number"  id="fileScore<%=i-k %>" name="fileScoreItem"  >
				  
				 
				<%} %>
			<%	break;}
			 } %>
			
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==5){%>
				<h4>五、简答题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=5){k++;continue;};
				  %>
				   <p><strong><%=i-k%>.</strong><%=info.getTitle() %></p>
				   <div style="text-align: center">
					<textarea style="width:100%;resize:none; height: 80px;" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>" value="<%=info.getsAnswer() %>"><%=info.getsAnswer() %></textarea>
					<%-- 填写答案:<input  type="text" style="width:80%" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>" value="<%=info.getsAnswer() %>"/> --%><br>
				    </div>
				     <br>
				    <strong  class='answer'>正确答案:<%=info.getrAnswer() %></strong><br/><br>
				    <strong style="color: red">简答题<%=i-k %>分数</strong><input type="number"  id="shortScore<%=i-k %>" name="shortScoreItem"  >
				   <br>
				<%} %>
			<%	break;}
			 } %>
			 <br>
			<hr>
			 <br>
			<input type="button" class="button" value="提交"  onclick="closew()" style="margin-left: 45%;margin-right: 20px" >
			<input type="submit" class="button" value="关闭"  >
		</form>
		<!-- <form action="Exam/insertTJ.do" method="post" id="fileShort" name="fileShort">
		<p>填空题分数<p><input type="number" id="fileScore" name="fileScore" required >
		<p>简答题分数<p><input type="number" id="shortScore" name="shortScore" required ><br/><br>
		<input type="submit" value="提交"  id="tijiao" name="tijiao"  >
		
	
		
	</form> -->

	</div>

</body>
</html>
