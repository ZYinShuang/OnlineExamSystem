<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>简答题管理</title>

<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>

<style type="text/css">
.inputCls {
	height: 22px;
	width: 100px;
	margin: 0;
	padding: 0 2px;
	margin-top: 17px;
	border: 1px solid #95B8E7;
}
</style>

<script type="text/javascript">
	var queryParams;
	$(function() {
		$('#ListTable').datagrid({
			rownumbers : true,//显示第一列序号
			title : '课程列表展示',
			//width:1160,
			//fitColumns:true,
			url : 'course/searchCourse.do',
			pagination : true,//底部显示分页工具栏
			//pageNumber:1,
			pageSize : 10,
			pageList : [ 10, 20, 30 ],
			rowStyler : function(index, rows) {//行样式，index索引，rows行对象
				if (index % 2 != 0) {
					return "background-color:#F5F5F5";
				} else {
					return "background-color:#FFFFFF";
				}
			},
			toolbar : "#toolbar",
			onBeforeLoad : function() {
				console.log($('#ListTable').datagrid("options").queryParams);
			},
			onDblClickRow : function(rowIndex, rowData) {
				/* console.log(rowData);
				$("#shortAnswerDetail").dialog({closed: false});
				$("#isShow").combobox("setValue",rowData.show);
				$("#id").val(rowData.id);
				$("#course").val(rowData.course);
				
				
				initEditTable(rowData.id); */
				$.messager.alert("课程信息不允许修改！", "课程信息已被绑定，不允许修改！");
			}
		});

		$('#ListTable').datagrid('getPager').pagination({
		/* pageSize: 10,//每页显示的记录条数，默认为10  
		pageList: [10, 20, 30],//可以设置每页记录条数的列表 */
		});

		$("#shortAnswerDetail")
				.dialog(
						{
							width : 600,
							height : 400,
							top : 50,
							modal : true,
							title : ' 课程详情',
							iconCls : 'icon-edit',
							closed : true,
							buttons : [
									{
										text : '保存',
										iconCls : 'icon-save',
										handler : function() {
											var sIds = new Array();
											var isShows = new Array();
											var stage = new Array();
											var isOk = 1;
											for (var i = 0; i < $("#tt")
													.datagrid('getRows').length; i++) {
												$('#tt').datagrid('endEdit', i);
												sIds[i] = $('#tt').datagrid(
														'getRows')[i].id;
												isShows[i] = $('#tt').datagrid(
														'getRows')[i].show;
												stage[i] = $('#tt').datagrid(
														'getRows')[i].stage;
												if (isShows[i] == ""
														|| stage[i] == "") {
													isOk = 0;
												}
											}
											console.log(sIds);
											console.log(isShows);
											console.log(stage);
											console.log(isOk);
											if ($("#isShow").combobox(
													"getValue") == ""
													|| $("#course").val() == ""
													|| isOk == 0) {
												$.messager.alert('失败提示',
														'所有信息不可为空，请确认！');
											} else {
												$
														.post(
																"course/submitCourse.do",
																{
																	'cid' : $(
																			"#id")
																			.val(),
																	'course' : $(
																			"#course")
																			.val(),
																	'isShow' : $(
																			"#isShow")
																			.combobox(
																					"getValue"),
																	'isShows' : isShows,
																	'stage' : stage
																},
																function(data) {
																	console
																			.log(data);
																	if (data == "true") {
																		$.messager
																				.alert(
																						'保存提示',
																						'恭喜，保存成功！');
																		$(
																				"#shortAnswerDetail")
																				.dialog(
																						{
																							closed : true
																						});
																		//showAllProblem();
																		$(
																				'#ListTable')
																				.datagrid(
																						"reload");
																	} else {
																		$.messager
																				.alert(
																						'保存提示',
																						'抱歉，保存失败！');
																	}
																});
											}
										}
									}, {
										text : '关闭',
										iconCls : 'icon-cancel',
										handler : function() {
											$("#shortAnswerDetail").dialog({
												closed : true
											});
										}
									} ]
						});
		//搜索 所属课程-课程阶段 关联
		$("#s_course").combobox({
			onSelect : function(data) {
				console.log(data.id);
				$("#s_cStage").combobox({
					url : "course/courseStageList.do?cid=" + data.id
				});
			}
		});
		$("#cid").combobox({
			onSelect : function(data) {
				console.log(data.id);
				$("#cStage").combobox({
					url : "course/courseStageList.do?cid=" + data.id
				});
			}
		});
	});

	function addProblem() {
		$("#isShow").combobox("setValue", "");
		$("#id").val("0");
		$("#course").val("");
		initEditTable(0);
		$("#tt").datagrid('loadData', {
			total : 0,
			rows : []
		});

		$("#shortAnswerDetail").dialog({
			closed : false
		});
	}

	function delProblem() {
		var array = $("#ListTable").datagrid("getSelections");//取到选中行的对象，返回数组
		if (array.length == 0) {
			$.messager.alert("删除失败", "删除失败，您没有选中任何数据");
		} else {
			var arr = new Array();
			$.each(array, function(i, obj) {//循环变量数组，取出每个对象，i索引，obj每个对象
				arr.push(obj.id);//从每个对象中取出id，拼接字符串，逗号分隔
			});
			//str=str.substring(0,str.length-1);//截取字符串，去掉最后一个逗号
			console.log(arr);
			$.messager.confirm("删除提示", "删除数据将导致关联课程失效！确定删除" + array.length
					+ "条数据", function(isTrue) {
				if (isTrue) {
					$.post("course/delCourse.do", {
						'arr' : arr
					}, function(data) {
						if (data == "true") {
							$.messager.alert("删除成功", "删除成功，共删除" + array.length
									+ "条数据！");
							showAllProblem();
						} else {
							$.messager.alert("删除失败", "数据库连接异常！");
						}
					});
				} else {
					$.messager.alert("取消删除", "删除操作已取消");
				}
			});
		}
	}

	function updateProblem() {
		var array = $("#ListTable").datagrid("getSelections");
		if (array.length == 0) {
			$.messager.alert("修改提示", "您未选择任何一行，请先选中一行后再进行操作");
		} else if (array.length > 1) {
			$.messager.alert("修改提示", "最多选择一行，请重新选择");
		} else {
			$("#shortAnswerDetail").dialog({
				closed : false
			});
			$("#isShow").combobox("setValue", array[0].show);
			$("#id").val(array[0].id);
			$("#course").val(array[0].course);

			initEditTable(rowData.id);
		}
	}

	function searchProblem() {
		$('#searchForm').form('submit', {
			url : "course/searchCourse.do",
			onSubmit : function() {

			},
			success : function(data) {
				var data1 = JSON.parse(data);
				$('#ListTable').datagrid("loadData", data1);

				var total = data1.total;
				if (total <= 0) {
					$.messager.alert("查询提示", "未找到数据,请修改查询条件！");
				} else {
					$.messager.alert("查询成功", "查询完成，共找到" + total + "条数据！");
				}
				/**
				 * 解决查询后，点击分页显示全部数据的问题：
				 * 获取到datagrid的queryParams（请求数据时向后台传递的参数），并把查询条件赋在里面
				 */
				queryParams = $('#ListTable').datagrid("options").queryParams;
				queryParams.s_isShow = $("#s_isShow").combobox("getValue");
				queryParams.s_title = $("#s_title").val();
			}
		});
	}

	function removeSearch() {
		$("#s_isShow").combobox("setValue", "2");
		$("#s_title").val("");
	}

	function showAllProblem() {
		removeSearch();
		queryParams = $('#ListTable').datagrid("options").queryParams;
		queryParams.s_isShow = "2";
		queryParams.s_title = "";
		$('#ListTable').datagrid({
			url : 'course/searchCourse.do',
			pagination : true,
			onLoadSuccess : function() {
			}
		});
		$(this).blur();
	}

	function initEditTable(cid) {
		$('#tt').datagrid({
			title : '课程阶段',
			//iconCls:'icon-edit',
			width : 500,
			height : 250,
			noheader : true,
			singleSelect : true,
			idField : 'id',
			border : false,
			fitColumns : true,
			toolbar : '#ttBar',
			url : 'course/showCourseStageList.do?cid=' + cid,
			columns : [ [ {
				field : 'stage',
				title : '课程阶段',
				width : 150,
				editor : 'text'
			}, {
				field : 'show',
				title : '是否使用',
				width : 50,
				align : 'center',
				formatter : function(value) {
					var val = "否";
					if (value == true || value == "1") {
						val = "是";
					} else if (value == false || value == "0") {
						val = "否";
					} else if (value == "") {
						val = "";
					}
					return val;
				},
				editor : {
					type : 'combobox',
					options : {
						valueField : 'value',
						textField : 'label',
						data : [ {
							label : '是',
							value : '1'
						}, {
							label : '否',
							value : '0'
						} ],
						panelHeight : 'auto',
						editable : false
					}
				}
			} ] ],
			onClickRow : function(index, row) {
				for (var i = 0; i < $("#tt").datagrid('getRows').length; i++) {
					$('#tt').datagrid('endEdit', i);
				}

				$('#tt').datagrid('beginEdit', index);

				/* var editor = $('#tt').datagrid('getEditors', index);
				
				editor[0].target.blur(function(){
				 $('#tt').datagrid('endEdit', index);
				});
				editor[1].target.blur(function(){
				 $('#tt').datagrid('endEdit', index);
				}); */

				/*
				var isFocus=$("#tRow").is(":focus");  
				if(true==isFocus){  
				    alert("focus");  
				}else{  
				    alert("blur");  
				}  
				 */

			}
		});
	}

	function addStage() {
		$('#tt').datagrid("appendRow", {});
		for (var i = 0; i < $("#tt").datagrid('getRows').length; i++) {
			$('#tt').datagrid('endEdit', i);
		}
		$('#tt').datagrid('beginEdit', $("#tt").datagrid('getRows').length - 1);
	}

	function delStage() {
		var index = $('#tt').datagrid('getRowIndex',
				$("#tt").datagrid('getSelected'));
		$('#tt').datagrid("deleteRow", index);
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
				<th data-options="field:'id',align:'center'" width="200">课程ID</th>
				<th data-options="field:'course',align:'center'" width="300">课程名称</th>
				<th data-options="field:'isShow_show',align:'center'" width="200">是否使用</th>
			</tr>
		</thead>
	</table>

	<!-- 
		自定义表格工具栏
	 -->
	<div id="toolbar" style="padding-bottom: 10px">
		<form action="" method="post" id="searchForm"
			style="margin-left: 15px; margin-top: 10px;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="addProblem()">新增课程</a>&nbsp; <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove" plain="true"
				onclick="delProblem()">删除课程</a>&nbsp;
			 
	 		<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateProblem()">修改课程</a>&nbsp; -->
	 		 
			&nbsp;&nbsp;&nbsp;&nbsp; 课程名称：<input type="text" name="s_title"
				class="inputCls" id="s_title">&nbsp; 是否使用：<select
				id="s_isShow" class="easyui-combobox" name="s_isShow"
				data-options="width:50,panelHeight:'auto',editable:false">
				<option value="2" selected="selected"></option>
				<option value="1">是</option>
				<option value="0">否</option>
			</select> &nbsp; <a href="#" class="easyui-linkbutton" iconCls="icon-search"
				style="margin-top: -5px" onclick="searchProblem()">查询题目</a> &nbsp; <a
				href="#" class="easyui-linkbutton" iconCls="icon-remove"
				style="margin-top: -5px" onclick="showAllProblem()">清空查询</a>
		</form>
	</div>

	<!-- 
		简答题详情页
	 -->
	<div id="shortAnswerDetail" style="padding-left: 40px;">
		<input type="hidden" id="id" name="id" value="0"> <input
			type="hidden" id="aid" name="aid" value="0">
		<table
			style="width: 400px; margin:0 auto; margin-top: 20px; margin-left:-20px; font-size: 14px; font-family:'微软雅黑' ; "
			cellspacing="10">
			<tr>
				<td style="text-align: right;">课程名称:</td>
				<td><input id="course" type="text" name="course" /></td>
				<td style="text-align: right;">是否使用:</td>
				<td><select id="isShow" class="easyui-combobox" name="isShow"
					data-options="width:50,panelHeight:'auto',editable:false">
						<option value="1">是</option>
						<option value="0">否</option>
				</select></td>
			</tr>
		</table>

		<table id="tt" style="display: none">
		</table>
		<p></p>
		<div id="ttBar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="addStage()">新增阶段</a>&nbsp; <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove" plain="true"
				onclick="delStage()">删除阶段</a>&nbsp;
		</div>
	</div>


</body>
</html>
