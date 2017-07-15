<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jereh.entity.PaperHead"%>
<%@ page import="com.jereh.entity.PaperTest"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 String path        = request.getContextPath();
 String basePath    = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 PaperHead  paperInfo      =(PaperHead)session.getAttribute("paperInfo");
 List<PaperTest>  listType =(List)session.getAttribute("paperType");
 List<PaperTest>  listSM   =(List)session.getAttribute("listSM");
 List<PaperTest>  listJFA  =(List)session.getAttribute("listJFA");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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


</style>

<script type="text/javascript">
	window.onload = function(){
		document.onkeydone = function(){
			document.forms[0].onsubmit = function(){
				return false;
			};
		}
	}

</script>



</head>
<body>
	<div class="head">
		<h3 align="center"><%=paperInfo.getPaperName()%> </h3>
	</div>
	<div class="problem">
	<!-- onkeydown="if(event.keyCode==13){return false;}" -->
		<form action="paper/paperSubmit.do" name="paperForm" method="post"  autocomplete="off">
			<input type="hidden" name="paperId" id="paperId" value="<%=paperInfo.getPaperId()%>">
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==1){%>
				<h4>一、单选题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				
				<script type="text/javascript">
					$(function(){
						$("#submitBtn").click(function(){
						var a =$('input[type="radio"]:checked').val();
						
							$.messager.confirm('提交提示','确定提交试卷？',function(r){    
							    if (r){    
							    	
							    		$("form").get(0).submit(); 
							    	
							         
							    }    
							});  
							
						});
					});
				
				</script>
				
				<%for(int i=1;i<=listSM.size();i++){ 
				   PaperTest info = listSM.get(i-1);
				   int type = info.getType();
				   if(type==2)continue;
				   String item = info.getItem();
				   String[] items = item.split("#@#");%>
				   <p><%=i%>.<%=info.getTitle().replace("\n", "<br/><span style='margin-right:30px;'></span>") %></p>
				  <% for(int j=1,c=65;j<items.length;j++,c++){
				    if(items[j].lastIndexOf(",")==items[j].length()-1){
				    	items[j] = items[j].substring(0,items[j].length()-1);
				    }
				  %>
					<input class="b" required type="radio" id="sOption" name="sOption_<%=info.getPid()%>" value ='<%=URLEncoder.encode(items[j],"utf-8")%>'/><%=(char)c%>、<%=items[j]%><br>
				  <%}%>
				<%} %>
			<%	break;}
			 } %>
			
			<!-- <hr /> -->
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==2){%>
				<h4>二、多选题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listSM.size();i++){ 
				   PaperTest info = listSM.get(i-1);
				   int type = info.getType();
				   if(type==1){k++;continue;}
				   String item = info.getItem();
				   String[] items = item.split("#@#");%>
				   <p><%=i-k%>.<%=info.getTitle().replace("\n", "<br/><span style='margin-right:30px;'></span>") %></p>
				   <%for(int j=1,c=65;j<items.length;j++,c++){
				    if(items[j].lastIndexOf(",")==items[j].length()-1){
				    	items[j] = items[j].substring(0,items[j].length()-1);
				    }
				   %>
					<input class="b" type="checkbox" id="mOption_<%=info.getPid()%>_<%=j%>" name="mOption_<%=info.getPid()%>_<%=j%>" value ='<%=URLEncoder.encode(items[j],"utf-8")%>' /><%=(char)c%>、<%=items[j]%><br>
				  <%}%>
				<%} %>
			<%	break;}
			 } %>
			<!-- <hr /> -->
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==3){%>
				<h4>三、判断题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=3){k++;continue;};
				  %>
				   <p><%=i-k%>.<%=info.getTitle().replace("\n", "<br/><span style='margin-right:30px;'></span>") %></p>
				   <div style="text-align: center">
					填写答案(T或F):<input  type="text" style="width:5%" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>"/><br>
				   </div>
				<%} %>
			<%	break;}
			 } %>
			<!-- <hr/> -->
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==4){%>
				<h4>四、填空题 每题<%=pt.getMark() %>分,共<%=pt.getCt()%>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=4){k++;continue;};
				  %>
				  <p><%=i-k%>.<%=info.getTitle().replace("\n", "<br/><span style='margin-right:30px;'></span>") %></p>
				  <div style="text-align: center">
					<textarea style="width:90%;resize:none; height: 50px;" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>"></textarea>
					<%-- <input   type="text" style="width:80%" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>"/> --%><br>
				  </div>
				<%} %>
			<%	break;}
			 } %>
			<!-- <hr/> -->
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==5){%>
				<h4>五、简答题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=5){k++;continue;};
				  %>
				   <p><%=i-k%>.<%=info.getTitle().replace("\n", "<br/><span style='margin-right:30px;'></span>") %></p>
				   <div style="text-align: center">
					 <textarea style="width:90%;resize:none; height: 80px;" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>"></textarea> 
					<%-- 填写答案:<input   type="text" style="width:80%" id="Option_<%=info.getPid()%>" name="Option_<%=info.getPid()%>"/><br> --%>
				    </div>
					<br>
				<%} %>
			<%	break;}
			 } %>
			<!-- <hr/> -->
			<input type="button" value="考试完成" style="margin-left: 50%" id="submitBtn">
		</form>
	</div>
</body>
</html>
