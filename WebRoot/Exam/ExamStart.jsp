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
				url:'paper/searchList.do',
				pagination:true,//底部显示分页工具栏
				//pageNumber:1,
				pageSize:10,
				pageList:[10,20,30],
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
					var arr = new Array();
					arr.push(rowData.paperId);//从每个对象中取出id，拼接字符串，逗号分隔
					$.post("paper/rePaper.do",{
					'arr' : arr
					},function(data){
						if(data==1){
							$.messager.alert("答卷提示","已经作答过该试卷！");
						}else{
							$("#searchForm").attr("action","paper/export.do");
							$("#paperId").attr("value",rowData.paperId);
							$("#searchForm").submit();
						}
					});
				}
			});
			
			$('#ListTable').datagrid('getPager').pagination({ 
				 /* pageSize: 10,//每页显示的记录条数，默认为10  
	             pageList: [10, 20, 30],//可以设置每页记录条数的列表 */  
			});
		});
		
		function exportPaper(){
			var array = $("#ListTable").datagrid("getChecked");//取到选中行的对象，返回数组
			console.log(array);
			if(array.length==0){
				$.messager.alert("提示","请选择要考试的试卷");
				return;
			}else if(array.length>1){
				$.messager.alert("提示","请选择一份试卷进行考试");
				return;
			}else{
				$("#searchForm").attr("action","paper/export.do");
				$("#paperId").attr("value",array[0].paperId);
				$("#searchForm").submit();
			}
		}
		
		
		function rePaper(){
			var array = $("#ListTable").datagrid("getChecked");
		
			if(array.length==0){
				$.messager.alert("提示","请选择要考试的试卷");
				return;
			}else if(array.length>1){
				$.messager.alert("提示","请选择一份试卷进行考试");
				return;
			}else{
				var arr = new Array();
			$.each(array, function(i, obj) {//循环变量数组，取出每个对象，i索引，obj每个对象
				arr.push(obj.paperId);//从每个对象中取出id，拼接字符串，逗号分隔
				$.post("paper/rePaper.do",{
				'arr' : arr
				
				},function(data){
				if(data==1){
				/*答完试卷还可以继续答  */
				/* 	$.messager.confirm("答卷提示","已经答过该试卷是否继续答题，继续答题会覆盖以前的答案！",function(isTrue){
					if(isTrue){
							
				exportPaper();
					}
				}); */
			/*答完试卷不能再答  */
				$.messager.alert("答卷提示","已经作答过该试卷！");
				}else{
			exportPaper();
				}
				
				});
			});
			
			
			}
		
		}
	</script>
  </head>
  <body>
 
	<table id="ListTable">   
	    <thead>   
	        <tr>   
	        	<th field="ck" checkbox="true" width="20"></th>
	            <th data-options="field:'paperId',align:'center'" width="200">试卷编号</th>   
	            <th data-options="field:'subject',align:'center'" width="150">所属课程</th>     
	            <th data-options="field:'stage',align:'center'"   width="200">课程阶段</th>      
	            <th data-options="field:'paperName',align:'center'" width="200">试卷名称</th>      
	            <th data-options="field:'isstate',align:'center'" width="100">启用状态</th>      
	            <th data-options="field:'examTime',align:'center'" width="100">考试时间</th>      
	        </tr>   
	    </thead>  
	</table> 
		
	<!-- 
		自定义表格工具栏
	 -->
	 <div id="toolbar">
		 	<form action="" method="post" id="searchForm" name="searchForm" style="margin-left: 15px; margin-top: 10px;" >
	 	<!-- 	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"  onclick="exportPaper()">开始答卷</a>&nbsp; -->
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"  onclick="rePaper()">开始答卷</a>&nbsp;
	 		<input type="hidden" name="paperId" id="paperId" value="">
	 		<input type="hidden" name="flag" id="flag" value="student">
	 		</form>	
	 </div>	
	</div>  	
  </body>
</html>
