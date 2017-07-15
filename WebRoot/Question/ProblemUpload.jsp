<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProblemUpload.jsp' starting page</title>
    
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
	
	<style>
		th{
			align:center;
		}
	</style>
	<script type="text/javascript">
	    
		$(function(){
			//搜索 所属课程-课程阶段 关联
			$("#s_course").combobox({
				onSelect:function(data){
					console.log(data.id);
					$("#s_cStage").combobox({
						url:"course/courseStageList.do?cid="+data.id
					});
				}
			});
			$("#upload").click(function(){
			    if($("#s_course").combobox("getValue")==""){
			    	$.messager.alert('输入提示','课程不能为空！');
			    	return;
			    }
			    if($("#s_cStage").combobox("getValue")==""){
			    	$.messager.alert('输入提示','课程阶段不能为空！');
			    	return;
			    }
				var url = $("#problemType").combobox("getValue");
				$("#shangchuan").attr("action",url);
				$("#shangchuan").submit();
			});
			
			
			$("#uploadClass").click(function(){
			   
			  	
				$("#shangchuanClass").attr("action","upload/file/upClass.do");
				$("#shangchuanClass").submit();
				alert("ok!");
			});
			
			
			
		
		});
		
	</script>
  </head>
  
  <body>
    <center> 
	<form id="shangchuan" name="shangchuan" action="" method="post"
		enctype="multipart/form-data" >
		${requestScorp.success}
		所属课程：<input id="s_course" class="easyui-combobox" name="s_course"   
				data-options="valueField:'id',textField:'course',url:'course/courseList.do',width:100,panelHeight:'auto',editable:false" />&nbsp;
 		课程阶段：<input id="s_cStage" class="easyui-combobox" name="s_cStage"   
				data-options="valueField:'id',textField:'stage',url:'',width:100,panelHeight:'auto',editable:false" />&nbsp;
 		<br><br>
 		题目类型：
 		<select class="easyui-combobox" id="problemType" name="problem_type" panelHeight="auto">
 			<option value="upload/file/single.do">单选题</option>
 			<option value="upload/file/multi.do">多选题</option>
 			<option value="upload/file/judge.do">判断题</option>
 			<option value="upload/file/fill.do">填空题</option>
 			<option value="upload/file/answer.do">简答题</option>
 		</select>
 		<input type="file" id="file" name="file" style=""/> 
		<input type="button" id="upload" name="upload" value="上传"/>
 		
			<h4>选择题 格式如下：*.xlsx</h4>
	     <table  border="1" style="width:90%;">
	     	<tr>
	     		<th>题目</th>
	     		<th>选项A</th>
	     		<th>选项B</th>
	     		<th>选项C</th>
	     		<th>选项D</th>
	     		<th>选项E</th>
	     		<th>难易程度</th>
	     		<th>答案</th>
	     		<th>答案解析</th>
	     	</tr>
	     </table>
			<h4>填空题 格式如下：*.xlsx</h4>
	     <table  border="1" style="width:90%;">
	     	<tr>
	     		<th>题目(填空请使用《 》)</th>
	     		<th>难易程度</th>
	     		<th>答案(请用##分割)</th>
	     		<th>答案解析</th>
	     	</tr>
	     </table>
			<h4> 简答、判断题格式如下：*.xlsx</h4>
	     <table  border="1" style="width:90%;">
	     	<tr>
	     		<th>题目</th>
	     		<th>难易程度</th>
	     		<th>答案(判断题答案为：对，错)</th>
	     		<th>答案解析</th>
	     	</tr>
	     </table>
	     
	     	
	     
	</form>
	</center>	
	 <center> 
	</center>	
  </body>
</html>
