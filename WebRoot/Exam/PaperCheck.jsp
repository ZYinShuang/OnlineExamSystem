<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jereh.entity.PaperHead"%>
<%@ page import="com.jereh.entity.PaperTest"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
 request.setCharacterEncoding("UTF-8");
 PaperHead  paperInfo      =(PaperHead)session.getAttribute("paperInfo");
 List<PaperTest>  listType =(List)session.getAttribute("paperType");
 List<PaperTest>  listJFA  =(List)session.getAttribute("listJFA");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>试卷批阅</title>
    
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
			var paperId = "${sessionScope.paperId }";
			$("#paperId").combobox("setValue",paperId);
		
			$('#ListTable').datagrid({
				rownumbers:true,//显示第一列序号
				title:'试卷列表展示',
				//width:1160,
				//fitColumns:true,
				url:'Exam/searchScore.do',
				queryParams: {
					paperId: paperId
				},
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
 				}, 
				 onDblClickRow:function(rowIndex, rowData){
				 	
				    $.post("<%=request.getContextPath()%>/Exam/studentPaper.do",
				    	{paperId:rowData.paperId,studentId:rowData.studentId,studentName:rowData.studentName},
				    	 function(data){
					    	//console.log(data);
					    	
                			//alert(rowData.studentName)
                			$('#paper').window('refresh', '<%=request.getContextPath()%>/Exam/StudentPaper.jsp'); 
                			$('#paper').window({    
							    width:800,    
							    height:800, 
							    top:50,   
							    modal:true  ,
							    closable:false 
							});  
                			$("#paper").window('open');
                			
                			//window.open('/Exam/StudentPaper.jsp');
					      
					    });
					  
					    	
					    	 $("#paper").window({
								onClose:function(){
								var sumfile = 0;
								var sumshort = 0;
								var file =document.getElementsByName("fileScoreItem");
								var short = document.getElementsByName("shortScoreItem");
								for (var i = 0, j = file.length; i < j; i++){
								//alert(file[i].value);
								sumfile+=Number(file[i].value);
								}
								
								for (var i = 0, j = short.length; i < j; i++){
								//alert(short[i].value);
								sumshort+=Number(short[i].value);
								}
								$.post("Exam/insertTJ.do",{
									'sumfile':sumfile,
									'sumshort':sumshort
							
							
								},function(result){
								if(result!=null){
								searchScore();
								
								}
								});
										
								}
									
								
							}); 
							
                			
                		
				} 
			});
			
			$('#ListTable').datagrid('getPager').pagination({ 
				 /* pageSize: 10,//每页显示的记录条数，默认为10  
	             pageList: [10, 20, 30],//可以设置每页记录条数的列表 */  
			});
			
		
			
		});
	/* 	function calcSubmit(){
			//$.messager.alert("提示","123");return;
			$("#searchForm").submit();
			searchScore();
			alert("OK");
		}
		function searchList(){
			var paperIdv = $("#paperId").combobox("getValue");
			
			if(paperIdv==""){
				return;
			}
			
			$.ajax({
				type:"get",
				url:"Exam/scoreList.do?paperId="+paperIdv,
			    success:function(data){
			      alert(data);
			      alert(paperIdv);
			      
		          $("#ListTable").datagrid("loadData",data);
		        
			    }
			   });
			   
		   
			  
		} */
			function calAllScore(){
			//alert("计算总分");
			var array = $("#ListTable").datagrid("getSelections");//取到选中行的对象，返回数组
			console.log(array);
			//学生id号数组arrsid
			var arrsid = new Array();
			//试卷号数组arrscore
			var arrpid = new Array();
			var allscore =new Array();
			$.each(array, function(i,obj){//循环变量数组，取出每个对象，i索引，obj每个对象
					arrsid.push(obj.studentId);//从每个对象中取出id，拼接字符串，逗号分隔
					arrpid.push(obj.paperId);
					var sum = obj.a_score+obj.f_score+obj.j_score+obj.m_score+obj.s_score;
					
					allscore.push(sum);
				});
			console.log(arrsid);
			console.log(arrpid);
			console.log(allscore);
			if(array.length==0){
			//$.messager.alert("计算失败","计算失败，您没有选中任何学生");
			}else{
				$.post("Exam/calAllScore.do",{
					'arrsid':arrsid,
					'arrpid':arrpid,
					'allscore':allscore
				
				},function(result){
					searchScore();
					$.messager.alert("计算完成","总分计算完成！请查看！");
				});
			}
			

			
		
		}
		
		function searchScore() {
		$('#searchForm').form('submit', {
			url : "Exam/searchScore.do",
			onSubmit : function() {

			},
			success : function(data) {
			//alert(data);
				var data1 = JSON.parse(data);
				$('#ListTable').datagrid("loadData", data1);
				
			
			}
		});
	
	}
	
	
			function jisuan() {
		$('#searchForm').form('submit', {
			url : "Exam/calcPaper.do",
			onSubmit : function() {

			},
			success : function(data) {
			calAllScore();
			searchScore();
			}
		});
	
	}
	
	/* $(function(){
		var paperId = "${sessionScope.paperId }";
		//alert(paperId);
		$("#paperId").combobox("setValue",paperId);
		//searchScore();
		$('#searchForm').form('submit', {
			url : "Exam/searchScore.do",
			onSubmit : function() {

			},
			success : function(data) {
				alert(data);
			
				var data1 = JSON.parse(data);
				$('#ListTable').datagrid("loadData", data1);
			}
		}); 
	}); */
	
	
	/*  $(function(){
		var fileScoreItem = $("input[name='fileScoreItem']");
			console.log(fileScoreItem);
			var fileScoreISum = 0;
			$.each(fileScoreItem,function(i,item){
				//fileScoreISum+=item.val();
				console.log(item);
				item.blur(function(){
					alert(1);
				}); 
			});
	}); */

	/* $("#paper").window({
		loader:function(p,s,e){
			s=function(){
				
			}
		}
	}); */
	function closew(){
	$('#paper').window('close');
	}
	
	
	
 function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {  
            //If JSONData is not an object then JSON.parse will parse the JSON string in an Object  
            var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData)  
                    : JSONData;  
  
            var CSV = '';  
            //Set Report title in first row or line  
  
           // CSV += ReportTitle + '\r\n\n';  
  
            //This condition will generate the Label/Header  
            if (ShowLabel) {  
                var row = "";  
  
                //This loop will extract the label from 1st index of on array  
                for ( var index in arrData[0]) {  
  
                    //Now convert each value to string and comma-seprated  
                    row += index + ',';  
                }  
  
                row = row.slice(0, -1);  
  
                //append Label row with line break  
                CSV += row + '\r\n';  
            }  
  
            //1st loop is to extract each row  
            for (var i = 0; i < arrData.length; i++) {  
                var row = "";  
  
                //2nd loop will extract each column and convert it in string comma-seprated  
                for ( var index in arrData[i]) {  
                    row += '"' + arrData[i][index] + '",';  
                }  
  
                row.slice(0, row.length - 1);  
  
                //add a line break after each row  
                CSV += row + '\r\n';  
            }  
  
            if (CSV == '') {  
                alert("Invalid data");  
                return;  
            }  
  
            //Generate a file name  
            var fileName = "成绩表";  
            //this will remove the blank-spaces from the title and replace it with an underscore  
            fileName += ReportTitle.replace(/ /g, "_");  
  
            //Initialize file format you want csv or xls  
            var uri = 'data:text/csv;charset=utf-8,' + encodeURI(CSV);  
  
            // Now the little tricky part.  
            // you can use either>> window.open(uri);  
            // but this will not work in some browsers  
            // or you will not get the correct file extension      
  
            //this trick will generate a temp <a /> tag  
            var link = document.createElement("a");  
            link.href = uri;  
  
            //set the visibility hidden so it will not effect on your web-layout  
            link.style = "visibility:hidden";  
            link.download = fileName + ".csv";  
  
            //this part will append the anchor tag and remove it after automatic click  
            document.body.appendChild(link);  
            link.click();  
            document.body.removeChild(link);  
        }  
	
 function exporte(){
 				
       	
            var data = JSON.stringify($('#ListTable').datagrid("getSelections"));  
            console.log(data);  
           
             if (data == '')  
                return;  
  			var a  = data.replace(/paperId/g,"试卷编号").replace(/studentId/g,"学生编号").replace(/studentName/g,"学生姓名")
  						.replace(/s_score/g,"单选题").replace("m_score","多选题").replace(/j_score/g,"判断题")
  						.replace(/f_score/g,"填空题").replace(/a_score/g,"简答题").replace(/sum_score/g,"总分");
  		
  			console.log(a);
            JSONToCSVConvertor(a, "", true);  
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
	            <th data-options="field:'studentId',align:'center'" width="150">学生编号</th>     
	            <th data-options="field:'studentName',align:'center'" width="150">学生姓名</th>
	            <th data-options="field:'s_score',align:'right'"   width="100">单选题分数</th>      
	            <th data-options="field:'m_score',align:'right'"   width="100">多选题分数</th>      
	            <th data-options="field:'j_score',align:'right'"   width="100">判断题分数</th>      
	            <th data-options="field:'f_score',align:'right',
	            styler: function(value,row,index){
					if (value <= 0){
						return 'background-color:#ffee00;color:red;';
					}
				}"   width="100">填空题分数</th>      
	            <th data-options="field:'a_score',align:'right',
	            styler: function(value,row,index){
					if (value <= 0){
						return 'background-color:#ffee00;color:red;';
					}
				}"   width="100">问答题分数</th>  
	            <th data-options="field:'sum_score',align:'right',
	            styler: function(value,row,index){
					if (value <= 0 || row.a_score+row.f_score+row.j_score+row.m_score+row.s_score !=value){
						return 'background-color:#ffee00;color:red;';
					}
				}"   width="100">总分数</th>  
	            <!-- <th data-options="field:'a_score',align:'right'"   width="100">阅卷老师</th>  -->   
	        </tr>   
	    </thead>  
	</table> 
	<div style="font-size: 12px; line-height: 25px; margin: 30px 20px;">
		<div style="color:red; font-weight:bold; font-size: 14px;">Tips:</div>
		① 初次查询，请先<b>选择试卷编号</b>，并点击<b>“计算分数”</b>。<br/>
		② 若<b>“填空题分数”/“简答题分数”</b>背景为<span style="background-color:#ffee00;color:red;">黄色</span>，表示该题未阅卷。<b>请双击该行阅卷</b>。<br/>
		③ 若<b>“总分数”</b>栏背景为<span style="background-color:#ffee00;color:red;">黄色</span>，表示未核算总分。<b>请全选后，点击“计算分数”</b>。
	</div>
	<!-- 
		自定义表格工具栏
	 -->
	 <div id="toolbar">
		 	<form action="Exam/calcPaper.do" method="post" id="searchForm" name="searchForm" style="margin-left: 15px; margin-top: 10px;" >
	 		试卷编号:<input id="paperId" class="easyui-combobox" name="paperId"  
				data-options="valueField:'paperId',textField:'paperId',url:'paper/paperList.do',width:150,panelHeight:'auto',editable:false" />&nbsp;
	 		<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-filter" plain="true"  onclick="javaScript:searchList()">查询</a>&nbsp; -->
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-filter" plain="true"  onclick="searchScore()">查询</a>&nbsp;
	 		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true"  onclick="jisuan()">计算分数</a>&nbsp;
	 		
	 	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true"  onclick="exporte()">导出试卷</a>&nbsp;
	 		<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true"  onclick="calAllScore()">计算总分数</a>&nbsp; -->

	 		</form>	
	 </div>		
	 <div id="paper" class="easyui-window" title="学生试卷" closed="true" style="width:800px;height:800px;padding:20px;overflow:auto;margin-top: 5px;" >
	 	 <!-- 
	 		<iframe src='<%=request.getContextPath()%>/Exam/StudentPaper.jsp' style='width:100%;height:100%' scrolling="auto" ></iframe>
	 	 -->
	 </div>

  </body>
</html>
