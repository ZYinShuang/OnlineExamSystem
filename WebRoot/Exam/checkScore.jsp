<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考试试卷管理</title>
    
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

		var queryParams;
		$(function(){
			$('#ListTable').datagrid({
				rownumbers:true,//显示第一列序号
				title:'试卷列表展示',
				//width:1160,
				//fitColumns:true,
				url:'login/checkPaper.do',
				//pagination:true,//底部显示分页工具栏
				//pageNumber:1,
				//pageSize:10,
				//pageList:[10,20,30],
				rowStyler:function(index,rows){//行样式，index索引，rows行对象
					if (index%2!=0) {
						return "background-color:#F5F5F5";
					} else {
						return "background-color:#FFFFFF";
					}
				},
				toolbar: "#toolbar",
				onBeforeLoad:function(){
					console.log($('#ListTable').datagrid("options").queryParams);
				},
				onDblClickRow:function(rowIndex, rowData){
					//$.messager.alert("温馨提示","哈哈哈哈哈哈哈，没有修改功能！");
				
				}
			});
			
			$('#ListTable').datagrid('getPager').pagination({ 
				 /* pageSize: 10,//每页显示的记录条数，默认为10  
	             pageList: [10, 20, 30],//可以设置每页记录条数的列表 */  
			});
		});
		function exportPaper(){
			$('#searchForm').form('submit', {
				url : "login/checkPaper.do",
				onSubmit : function() {
					//alert($("#paperId").combobox("getValue"));
				},
				success : function(data) {
					var data1 = JSON.parse(data);
					$('#ListTable').datagrid("loadData", data1);
				}
			});
		}
		
	
	</script>
  </head>
  <body>
 
	<table id="ListTable">   
	    <thead>   
	        <tr>   
	        	<th field="ck" checkbox="true" width="20"></th>
	            <th data-options="field:'paperId',align:'center'" width="200">试卷编号</th>  
	            <th data-options="field:'studentId',align:'center'" width="150">学生编号</th>     
	            <th data-options="field:'score',align:'center'"   width="200">成绩</th>           
	        </tr>   
	    </thead>  
	</table> 
		
	<!-- 
		自定义表格工具栏
	 -->
	 <div id="toolbar">
		 	<form action="" method="post" id="searchForm" name="searchForm" style="margin-left: 15px; margin-top: 10px;" >
		 	试卷编号:<input id="paperId" class="easyui-combobox" name="paperId"  
				data-options="valueField:'paperId',textField:'paperId',url:'login/checkPaper.do',width:150,panelHeight:'auto',editable:false" />&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"  onclick="exportPaper()">查询成绩</a>&nbsp;
	 		<input type="hidden" name="paperId" id="paperId" value="">
	 		<input type="hidden" name="flag" id="flag" value="student">
	 		</form>	
	 </div>	
	</div>  	
  </body>
</html>
