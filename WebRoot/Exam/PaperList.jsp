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
				url:'paper/searchPaper.do',
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
					$("#searchForm").attr("action","paper/export.do");
					$("#paperId").attr("value",rowData.paperId);
					$("#searchForm").submit();	
				}
			});
			
			$('#ListTable').datagrid('getPager').pagination({ 
				 /* pageSize: 10,//每页显示的记录条数，默认为10  
	             pageList: [10, 20, 30],//可以设置每页记录条数的列表 */  
			});
			
			
			
			$("#createPaperOption").dialog({    
			    width:600,    
			    height:600,
			    top:50,
			    modal:true,
			    title:' 生成试卷条件',
			    iconCls:'icon-edit',
			    closed: true,
			    buttons:[{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){
						var totalPoint = 0;
						var paperId     = $("#pId").val();
						var examTime    = $("#examTime").val();
						var paperName   = $("#paperName").val();
						var courseId     = $("#courseId").combobox("getValue");
						var courseStage = $("#cStage").combobox("getValue");
						var isclass     =  $("#isclass").combobox("getValue");
						var name       = $("#name").combobox("getValue");
						var singlePoint = Number($("#singlePoint").val());
						var s_eCount    = Number($("#s_eCount").val());
						var s_mCount    = Number($("#s_mCount").val());
						var s_dCount    = Number($("#s_dCount").val());
						var multPoint   = Number($("#multPoint").val());
						var m_eCount    = Number($("#m_eCount").val());
						var m_mCount    = Number($("#m_mCount").val());
						var m_dCount    = Number($("#m_dCount").val());
						var judgePoint  = Number($("#judgePoint").val());
						var j_eCount    = Number($("#j_eCount").val());
						var j_mCount    = Number($("#j_mCount").val());
						var j_dCount    = Number($("#j_dCount").val());
						var fillPoint   = Number($("#fillPoint").val());
						var f_eCount    = Number($("#f_eCount").val());
						var f_mCount    = Number($("#f_mCount").val());
						var f_dCount    = Number($("#f_dCount").val());
						var answerPoint = Number($("#answerPoint").val());
						var a_eCount    = Number($("#a_eCount").val());
						var a_mCount    = Number($("#a_mCount").val());
						var a_dCount    = Number($("#a_dCount").val());
						totalPoint = singlePoint*(s_eCount+s_mCount+s_dCount)
								   + multPoint  *(m_eCount+m_mCount+m_dCount)
								   + judgePoint *(j_eCount+j_mCount+j_dCount)
								   + fillPoint  *(f_eCount+f_mCount+f_dCount)
								   + answerPoint*(a_eCount+a_mCount+a_dCount);
						if(totalPoint>100||totalPoint<100){
							$.messager.alert('提示','总分应为100分,现在总分为'+totalPoint+'分,请确认！');
							return;
						}else{
						var d={ "courseStage" : courseStage,
								"isclass"	  : isclass,
								"name"		:  name,
								"paperId"     : paperId,
							    "examTime"    : examTime,
							    "paperName"   : paperName,
							    "courseId"     : courseId,
								"answerPoint"  : answerPoint,
								"fillPoint"    : fillPoint,
								"judgePoint"   : judgePoint,
								"multPoint"    : multPoint,
							    "singlePoint"  : singlePoint,
							    "j_eCount"     : j_eCount,
							    "j_mCount"     : j_mCount,
							    "j_dCount"     : j_dCount,
							    "f_eCount"     : f_eCount,
							    "f_mCount"     : f_mCount,
							    "f_dCount"     : f_dCount,
							    "a_eCount"     : a_eCount,
							    "a_mCount"     : a_mCount,
							    "a_dCount"     : a_dCount,
							    "m_eCount"     : m_eCount,
							    "m_mCount"     : m_mCount,
							    "m_dCount"     : m_dCount,
							    "s_eCount"     : s_eCount,
							    "s_mCount"     : s_mCount,
							    "s_dCount"     : s_dCount
					        };
							$.ajax({
								type:"POST",
								url:"paper/insert.do",
								dataType:"json",
						        contentType:"application/json",
							    data:JSON.stringify(d),
							    async:false, 
							    success:function(data){
						        if(data==true){
			 						$.messager.alert('保存提示','恭喜，保存成功！');
			 						$("#createPaperOption").dialog({closed: true});
			 						$('#ListTable').datagrid("reload");
			 					}else{
			 						$.messager.alert('保存提示','抱歉，保存失败！');
			 					}
							}});
							
						}
					}
				},{
					text:'关闭',
					iconCls:'icon-cancel',
					handler:function(){
						$("#createPaperOption").dialog({closed: true});
					}
				}]
			}); 
			//搜索 所属课程-课程阶段 关联
			$("#courseId").combobox({
				onSelect:function(data){
					console.log(data.id);
					$("#cStage").combobox({
						url:"course/courseStageList.do?cid="+data.id
					});
				}
			});
			
			
		});
		
		function addProblem(){
			$("#createPaperOption").dialog({closed: false});
		}
		function exportPaper(){
			var array = $("#ListTable").datagrid("getChecked");//取到选中行的对象，返回数组
			if(array.length==0){
				$.messager.alert("提示","请选择要导出的试卷");
				return;
			}else if(array.length>1){
				$.messager.alert("提示","请选择一份试卷进行导出");
				return;
			}else{
				$("#searchForm").attr("action","paper/export.do");
				$("#paperId").attr("value",array[0].paperId);
				$("#searchForm").submit();
			}
		}
		
		
		
		
		function closePaper(){
		
		var array = $("#ListTable").datagrid("getSelections");//取到选中行的对象，返回数组
		console.log(array);
		var arrpaperId = new Array();
		$.each(array,function(i,obj){
		arrpaperId.push(obj.paperId);
		});
		console.log(arrpaperId);
		if(arrpaperId.length==0){
		$.messager.alert("失败提示","未选中一行信息！");
		}else{
		$.post("paper/setState.do",{
					'arrpaperId':arrpaperId,
					
				
				},function(result){
					
					$.messager.alert("计算完成","停用成功");
					$('#ListTable').datagrid("reload");
				});
		}
		}
		
		
		
		function openPaper(){
		
		var array = $("#ListTable").datagrid("getSelections");//取到选中行的对象，返回数组
		console.log(array);
		var arrpaperId = new Array();
		$.each(array,function(i,obj){
		arrpaperId.push(obj.paperId);
		});
		console.log(arrpaperId);
		if(arrpaperId.length==0){
		$.messager.alert("失败提示","未选中一行信息！");
		}else{
		$.post("paper/setStateOpen.do",{
					'arrpaperId':arrpaperId,
					
				
				},function(result){
					
					$.messager.alert("计算完成","启用成功");
					$('#ListTable').datagrid("reload");
				});
		}
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
	            <th data-options="field:'paperId',align:'center'" width="200">试卷编号</th>   
	            <th data-options="field:'subject',align:'center'" width="150">所属课程</th>     
	            <th data-options="field:'stage',align:'center'"   width="200">课程阶段</th>      
	            <th data-options="field:'paperName',align:'center'" width="200">试卷名称</th> 
	            <th data-options="field:'isclass',align:'center'" width="200">考试班级</th>
	            <th data-options="field:'name',align:'center'" width="200">阅卷老师</th>        
	            <th data-options="field:'isstate',align:'center'" width="100">启用状态</th>      
	            <th data-options="field:'examTime',align:'center'" width="100">考试时间</th>      
	        </tr>   
	    </thead>  
	</table> 
		
	<!-- 
		自定义表格工具栏
	 -->
	 <div id="toolbar">
		 	<form action="" method="post" id="searchForm" name="searchForm" style="margin-left: 15px; margin-top: 10px;" target="_parent">
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="addProblem()">试卷生成</a>&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true"  onclick="openPaper()">启用试卷</a>&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-no" plain="true"  onclick="closePaper()">停用试卷</a>&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true"  onclick="exportPaper()">导出试卷</a>&nbsp;
	 		<input type="hidden" name="paperId" id="paperId" value="">
	 		<input type="hidden" name="flag" id="flag" value="teacher">
	 		</form>	
	 </div>	
		
	<!-- 
		简答题详情页
	 -->
	<div id="createPaperOption">
			<input type="hidden" id="id" name="id" value="0">
			<input type="hidden" id="aid" name="aid" value="0">
			<table style="width: 550px; margin:0 auto; margin-top: 20px; font-size: 14px; font-family:'微软雅黑' ; " cellspacing="5">
				<tr>
					<td style="text-align: right;">试卷编号:</td>
					<td>
						<input id="pId" type="text" name="pId" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 150px;" />  
					</td>
					<td style="text-align: right;">考试时长:</td>
					<td>
						<input id="examTime" type="text" name="examTime" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 150px;" />分钟
					</td>
				</tr>
					<td style="text-align: right;">试卷标题:</td>
					<td colspan="3">
						<input id="paperName" type="text" name="paperName" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 400px;" />
					</td>
				<tr>
					<td style="text-align: right;">所属课程:</td>
					<td>
						<input id="courseId" class="easyui-combobox" name="courseId"   
						data-options="valueField:'id',textField:'course',url:'course/courseList.do',width:150,panelHeight:'auto',editable:false" />  
					</td>
					
					
					
					
					<td style="text-align: right;">课程阶段:</td>
					<td>
						<input id="cStage" class="easyui-combobox" name="cStage"   
						data-options="valueField:'id',textField:'stage',url:'',width:150,panelHeight:'auto',editable:false" />  
					</td>
				</tr>
				 <tr>
				<td style="text-align: right;">考试班级:</td>
					<td>
						<input id="isclass" class="easyui-combobox" name="isclass"   
						data-options="valueField:'isclass',textField:'isclass',url:'login/showClass.do',width:150,panelHeight:'auto',editable:false" />  
					</td>
					
					<td style="text-align: right;">阅卷老师:</td>
					<td>
						<input id="name" class="easyui-combobox" name="name"   
						data-options="valueField:'name',textField:'name',url:'login/showTeacher.do',width:150,panelHeight:'auto',editable:false" />  
					</td>
				</tr>
				
			</table>
			
			<table style="width: 550px; text-align:center; margin:0 auto; margin-top: 20px; font-size: 14px; font-family:'微软雅黑' ; ">
				<tr style="color:red; font-weight: bold;">
					<td></td>
					<td>单选题</td>
					<td>分值
						<input id="singlePoint" type="text" name="singlePoint" style="border:0px;border-bottom:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" />
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>难度</td>
					<td>简单</td>
					<td>中等</td>
					<td>困难</td>
				</tr>
				<tr>
					<td>题目数</td>
					<td><input id="s_eCount" type="text" name="s_eCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="s_mCount" type="text" name="s_mCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="s_dCount" type="text" name="s_dCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
				</tr>
				
				<tr style="color:red; font-weight: bold;">
					<td></td>
					<td>多选题</td>
					<td>分值
						<input id="multPoint" type="text" name="multPoint" style="border:0px;border-bottom:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" />
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>难度</td>
					<td>简单</td>
					<td>中等</td>
					<td>困难</td>
				</tr>
				<tr>
					<td>题目数</td>
					<td><input id="m_eCount" type="text" name="m_eCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="m_mCount" type="text" name="m_mCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="m_dCount" type="text" name="m_dCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
				</tr>
				
				<tr style="color:red; font-weight: bold;">
					<td></td>
					<td>判断题</td>
					<td>分值
						<input id="judgePoint" type="text" name="judgePoint" style="border:0px;border-bottom:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" />
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>难度</td>
					<td>简单</td>
					<td>中等</td>
					<td>困难</td>
				</tr>
				<tr>
					<td>题目数</td>
					<td><input id="j_eCount" type="text" name="j_eCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="j_mCount" type="text" name="j_mCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="j_dCount" type="text" name="j_dCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
				</tr>
				
				<tr style="color:red; font-weight: bold;">
					<td></td>
					<td>填空题</td>
					<td>分值
						<input id="fillPoint" type="text" name="fillPoint" style="border:0px;border-bottom:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" />
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>难度</td>
					<td>简单</td>
					<td>中等</td>
					<td>困难</td>
				</tr>
				<tr>
					<td>题目数</td>
					<td><input id="f_eCount" type="text" name="f_eCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="f_mCount" type="text" name="f_mCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="f_dCount" type="text" name="f_dCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
				</tr>
				
				<tr style="color:red; font-weight: bold;">
					<td></td>
					<td>简答题</td>
					<td>分值
						<input id="answerPoint" type="text" name="answerPoint" style="border:0px;border-bottom:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" />
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>难度</td>
					<td>简单</td>
					<td>中等</td>
					<td>困难</td>
				</tr>
				<tr>
					<td>题目数</td>
					<td><input id="a_eCount" type="text" name="a_eCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="a_mCount" type="text" name="a_mCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
					<td><input id="a_dCount" type="text" name="a_dCount" style="border:1px solid #95B8E7; font-size: 14px; font-family:'微软雅黑';width: 50px;" /></td>
				</tr>
			</table> 
	</div>  	
		
		
  </body>
</html>
