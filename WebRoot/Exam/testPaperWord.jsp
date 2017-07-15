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
<%response.setContentType("application/msword;charset=UTF-8");
  response.setHeader("Content-Disposition","attachment;filename=testPaper.doc");    //用word打开页面
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'testPaper.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style>
.head {
	position: fixed;
	z-index: 100;
	top: 0;
	left: 0;
	width: 100%;
	height: 70px;
}
h4 {
	margin-left: 3%;
}
p {
	margin-left: 4%;
}
h3 {
	margin-left: 6%;
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
</head>
<body>
	<div class="head">
		<h3 align="center"><%=paperInfo.getPaperName()%></h3>
	</div>
	<div class="problem">
		<form action="paper/paperSubmit" name="paperForm" method="post">
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==1){%>
				<h4>一、单选题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1;i<=listSM.size();i++){ 
				   PaperTest info = listSM.get(i-1);
				   int type = info.getType();
				   if(type==2)continue;
				   String item = info.getItem();
				   String[] items = item.split("#@#");%>
				   <p><%=i%>.<%=info.getTitle() %></p>
				  <% for(int j=1,c=65;j<items.length;j++,c++){%>
					<h3><%=(char)c%>、<%=items[j]%></h3><br>
				  <%}%>
				<%} %>
			<%	break;}
			 } %>
			
			<hr />
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
				   <p><%=i-k%>.<%=info.getTitle() %></p>
				   <%for(int j=1,c=65;j<items.length;j++,c++){%>
					<h3><%=(char)c%>、<%=items[j]%></h3><br>
				  <%}%>
				<%} %>
			<%	break;}
			 } %>
			<hr />
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==3){%>
				<h4>三、判断题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=3){k++;continue;};
				  %>
				   <p><%=i-k%>.<%=info.getTitle() %></p>
			
				<%} %>
			<%	break;}
			 } %>
			<hr/>
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==4){%>
				<h4>四、填空题 每题<%=pt.getMark() %>分,共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=4){k++;continue;};
				  %>
				  <p><%=i-k%>.<%=info.getTitle() %></p>
				
				<%} %>
			<%	break;}
			 } %>
			<hr/>
			<%for(int t=0;t<listType.size();t++){
				PaperTest pt = listType.get(t);
				if(pt.getType()==5){%>
				<h4>五、简答题 每题(<%=pt.getMark() %>),共<%=pt.getCt() %>题, <%=pt.getCt()* pt.getMark()%>分 </h4>
				<%for(int i=1,k=0;i<=listJFA.size();i++){ 
				   PaperTest info = listJFA.get(i-1);
				   int type = info.getType();
				   if(type!=5){k++;continue;};
				  %>
				   <p><%=i-k%>.<%=info.getTitle() %></p>
				   <br>
				<%} %>
			<%	break;}
			 } %>
			<hr/>
		</form>
	</div>
</body>
</html>
