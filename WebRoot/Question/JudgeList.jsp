<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>判断题管理</title>
    
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
				title:'判断题列表展示',
				//width:1160,
				fitColumns:true,
				url:'shortAnswer/searchShortAnswer.do?type=3',
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
					console.log(rowData);
					$("#shortAnswerDetail").dialog({closed: false});
					$("#cid").combobox("setValue",rowData.cid);
 					$("#cStage").combobox("setValue",rowData.cStage);
 					$("#cStage").combobox("setText",rowData.cStage_show);
					$("#nycd").combobox("setValue",rowData.nycd);
					$("#isShow").combobox("setValue",rowData.show);
					$("#id").val(rowData.id);
					$("#title").val(rowData.title);
					$("#aid").val(rowData.aid);
					$("#answer").combobox("setValue",rowData.answer);
					$("#remark").val(rowData.remark);					
				}
			});
			
			$('#ListTable').datagrid('getPager').pagination({ 
				 /* pageSize: 10,//每页显示的记录条数，默认为10  
	             pageList: [10, 20, 30],//可以设置每页记录条数的列表 */  
			});
			
			$("#shortAnswerDetail").dialog({    
			    width:600,    
			    height:400,
			    top:50,
			    modal:true,
			    title:' 题目详情',
			    iconCls:'icon-edit',
			    closed: true,
			    buttons:[{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){
						if($("#cid").combobox("getValue")==""||$("#nycd").combobox("getValue")==""
								||$("#isShow").combobox("getValue")==""||$("#title").val()==""
								||$("#answer").combobox("getValue")==""||$("#remark").val()==""
								||$("#cStage").combobox("getValue")==""){
							$.messager.alert('失败提示','所有信息不可为空，请确认！');
						}else{
							$.post("shortAnswer/submitShortAnswer.do",
									{
										'id':$("#id").val(),
										'aid':$("#aid").val(),
										'cid':$("#cid").combobox("getValue"),
										'cStage':$("#cStage").combobox("getValue"),
										'nycd':$("#nycd").combobox("getValue"),
										'isShow':$("#isShow").combobox("getValue"),
										'title':$("#title").val(),
										'answer':$("#answer").combobox("getValue"),
										'remark':$("#remark").val(),
										'type':'3'
									},
									function(data){
										console.log(data);
					 					if(data=="true"){
					 						$.messager.alert('保存提示','恭喜，保存成功！');
					 						$("#shortAnswerDetail").dialog({closed: true});
					 						//showAllProblem();
					 						$('#ListTable').datagrid("reload");
					 					}else{
					 						$.messager.alert('保存提示','抱歉，保存失败！');
					 					}
									});
						}
						
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
						$("#shortAnswerDetail").dialog({closed: true});
					}
				}]
			}); 
			//搜索 所属课程-课程阶段 关联
			$("#s_course").combobox({
				onSelect:function(data){
					console.log(data.id);
					$("#s_cStage").combobox({
						url:"course/courseStageList.do?cid="+data.id
					});
				}
			});
			$("#cid").combobox({
				onSelect:function(data){
					console.log(data.id);
					$("#cStage").combobox({
						url:"course/courseStageList.do?cid="+data.id
					});
				}
			});
		});
		
		function addProblem(){
			$("#id").val("0");
			$("#aid").val("0");
			$("#cid").combobox("setValue","");
			$("#cStage").combobox("setValue","");
			$("#nycd").combobox("setValue","");
			$("#isShow").combobox("setValue","");
			$("#title").val("");
			$("#answer").combobox("setValue","");
			$("#remark").val("");
			$("#shortAnswerDetail").dialog({closed: false});
		}
		
		function delProblem(){
			var array = $("#ListTable").datagrid("getSelections");//取到选中行的对象，返回数组
			console.log(array);
			if(array.length==0){
				$.messager.alert("删除失败","删除失败，您没有选中任何用户");
			}else{
				var arr = new Array();
				$.each(array, function(i,obj){//循环变量数组，取出每个对象，i索引，obj每个对象
					arr.push(obj.id);//从每个对象中取出id，拼接字符串，逗号分隔
				});
				//str=str.substring(0,str.length-1);//截取字符串，去掉最后一个逗号
				console.log(arr);
				$.messager.confirm("删除提示","确定删除"+array.length+"条数据",function(isTrue){
					if(isTrue){
						$.post("shortAnswer/delShortAnswer.do",{'arr':arr},function(data){
							if(data=="true"){
								$.messager.alert("删除成功","删除成功，共删除"+array.length+"条数据！");
		 						showAllProblem();
		 					}else{
		 						$.messager.alert("删除失败","数据库连接异常！");
		 					}
						});
					}else{
						$.messager.alert("取消删除","删除操作已取消");
					}
				});
			}
		}
		
		function updateProblem(){
			var array = $("#ListTable").datagrid("getSelections");
			if (array.length==0) {
				$.messager.alert("修改提示","您未选择任何一行，请先选中一行后再进行操作");
			} else if(array.length>1){
				$.messager.alert("修改提示","最多选择一行，请重新选择");
			}else{
				$("#shortAnswerDetail").dialog({closed: false});
				$("#cid").combobox("setValue",array[0].cid);
				$("#cStage").combobox("setValue",array[0].cStage);
				$("#cStage").combobox("setText",array[0].cStage_show);
				$("#nycd").combobox("setValue",array[0].nycd);
				$("#isShow").combobox("setValue",array[0].show);
				$("#id").val(array[0].id);
				$("#title").val(array[0].title);
				$("#aid").val(array[0].aid);
				$("#answer").combobox("setValue",array[0].answer);
				$("#remark").val(array[0].remark);
			}
		}
		
		function searchProblem(){
			$('#searchForm').form('submit', {    
			    url:"shortAnswer/searchShortAnswer.do?type=3",    
			    onSubmit: function(){    
			    	
			    },    
			    success:function(data){    
			    	var data1 = JSON.parse(data);
			    	$('#ListTable').datagrid("loadData",data1);
					
			    	var total = data1.total;
					if (total<=0) {
						$.messager.alert("查询提示","未找到数据,请修改查询条件！");
					} else {
						$.messager.alert("查询成功","查询完成，共找到"+total+"条数据！");
					}
			    	/**
			    	* 解决查询后，点击分页显示全部数据的问题：
			    	* 获取到datagrid的queryParams（请求数据时向后台传递的参数），并把查询条件赋在里面
			    	*/
			    	queryParams = $('#ListTable').datagrid("options").queryParams;
	            	 queryParams.s_course = $("#s_course").combobox("getValue");
	            	 queryParams.s_cStage = $("#s_cStage").combobox("getValue");
	            	 queryParams.s_nycd = $("#s_nycd").combobox("getValue");
	            	 queryParams.s_isShow = $("#s_isShow").combobox("getValue");
	            	 queryParams.s_title = $("#s_title").val();
			    }    
			});  
		}
		
		function removeSearch(){
			$("#s_course").combobox("setValue","");
			$("#s_cStage").combobox("setValue","");
			$("#s_nycd").combobox("setValue","");
			$("#s_isShow").combobox("setValue","2");
			$("#s_title").val("");
		}
		
		function showAllProblem(){
			removeSearch();
			//$('#ListTable').datagrid("options").queryParams = "";
			queryParams = $('#ListTable').datagrid("options").queryParams;
           	 queryParams.s_course = "0";
           	 queryParams.s_cStage = "0";
           	 queryParams.s_nycd = "0";
           	 queryParams.s_isShow = "2";
           	 queryParams.s_title = "";
			$('#ListTable').datagrid({
				url:'shortAnswer/searchShortAnswer.do?type=3',
				pagination:true,
				onLoadSuccess:function(){}
			});
			$(this).blur();
		}
	</script>

  </head>
  
  <body>
	<!-- 
		简答题展示列表 表格
	 -->
	<table id="ListTable">   
	    <thead>   
	        <tr>   
	        	<th field="ck" checkbox="true" width="20"></th>
	            <!-- <th data-options="field:'id',align:'center'" width="100">题目编号</th> -->   
	            <th data-options="field:'course',align:'center'" width="100">所属课程</th>   
	            <th data-options="field:'cStage_show',align:'center'" width="100">课程阶段</th>   
	            <th data-options="field:'title',align:'center'" width="300">题目内容</th>   
	            <th data-options="field:'nycd_show',align:'center'" width="100">难易程度</th>   
	            <th data-options="field:'isShow_show',align:'center'" width="100">是否使用</th>      
	        </tr>   
	    </thead>  
	</table> 
		
	<!-- 
		自定义表格工具栏
	 -->
	 <div id="toolbar" style="padding-bottom: 10px">
		 	<form action="" method="post" id="searchForm" style="margin-left: 15px; margin-top: 10px;">
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="addProblem()">新增题目</a>&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delProblem()">删除题目</a>&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateProblem()">修改题目</a>&nbsp;
	 		
	 		<!--
	 		 <a href="#" class="easyui-linkbutton" iconCls="icon-large-chart" plain="true" style="margin-top: -5px" onclick="showAllProblem()">全部题目</a>
	 		 <a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="">导出Excel</a>&nbsp;
	 	 	 -->
	 	 	 <br/>
		 		所属课程：<input id="s_course" class="easyui-combobox" name="s_course"   
						data-options="valueField:'id',textField:'course',url:'course/courseList.do',width:100,panelHeight:'auto',editable:false" />&nbsp;
		 		课程阶段：<input id="s_cStage" class="easyui-combobox" name="s_cStage"   
						data-options="valueField:'id',textField:'stage',url:'',width:100,panelHeight:'auto',editable:false" />&nbsp;
		 		题目内容：<input type="text" name="s_title" class="inputCls" id="s_title">&nbsp;
		 		难易程度：<select id="s_nycd" class="easyui-combobox" name="s_nycd" data-options="width:100,panelHeight:'auto',editable:false">   
						    <option value="0" selected="selected"></option>
						    <option value="1">简单</option>     
						    <option value="2">中等</option>     
						    <option value="3">困难</option>      
						</select>  &nbsp;
				是否使用：<select id="s_isShow" class="easyui-combobox" name="s_isShow" data-options="width:50,panelHeight:'auto',editable:false">   
						    <option value="2" selected="selected"></option>        
						    <option value="1">是</option>     
						    <option value="0">否</option> 
						</select>  
	 		&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-search" style="margin-top: -5px" onclick="searchProblem()">查询题目</a>
	 		&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" style="margin-top: -5px" onclick="showAllProblem()">清空查询</a>
	 		</form>	
	 </div>	
		
	<!-- 
		简答题详情页
	 -->
	<div id="shortAnswerDetail">
			<input type="hidden" id="id" name="id" value="0">
			<input type="hidden" id="aid" name="aid" value="0">
			<table style="width: 560px; margin:0 auto; margin-top: 20px; font-size: 14px; font-family:'微软雅黑' ; " cellspacing="10">
				<tr>
					<td style="text-align: right;">所属课程:</td>
					<td>
						<input id="cid" class="easyui-combobox" name="cid"   
						data-options="valueField:'id',textField:'course',url:'course/courseList.do',width:100,panelHeight:'auto',editable:false" />  
					</td>
					<td style="text-align: right;">课程阶段:</td>
					<td>
						<input id="cStage" class="easyui-combobox" name="cStage"   
						data-options="valueField:'id',textField:'stage',url:'',width:100,panelHeight:'auto',editable:false" />  
					</td>
					<td style="text-align: right;">是否使用:</td>
					<td>
						<select id="isShow" class="easyui-combobox" name="isShow" data-options="width:50,panelHeight:'auto',editable:false">   
						    <option value="1">是</option>     
						    <option value="0">否</option>         
						</select>  
					</td>
			</tr>
			<tr>
					
					<td style="text-align: right;">难易程度:</td>
					<td>
						<select id="nycd" class="easyui-combobox" name="nycd" data-options="width:100,panelHeight:'auto',editable:false ">   
						    <option value="1">简单</option>     
						    <option value="2">中等</option>     
						    <option value="3">困难</option>      
						</select>  
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">题目：</td>
					<td colspan="5">
						<textarea id="title" name="title" style="width: 450px; resize:none; border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑'"></textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">标准答案：</td>
					<td colspan="5">
						<select id="answer" class="easyui-combobox" name="answer" data-options="width:50,panelHeight:'auto',editable:false ">   
						    <option value="对">对</option>     
						    <option value="错">错</option>        
						</select> 
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">答案解析：</td>
					<td colspan="5">
						<textarea id="remark" name="remark" style="width: 450px; resize:none; border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑'"></textarea>
					</td>
				</tr>
			</table>
	</div>  	
		
		
  </body>
</html>
