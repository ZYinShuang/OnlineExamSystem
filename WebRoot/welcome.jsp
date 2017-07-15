<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
	<script type="text/javascript" src="easyui/jquery.min.js"></script>   
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
  </head>
  <script type="text/javascript">
  
  function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {  
            //If JSONData is not an object then JSON.parse will parse the JSON string in an Object  
            var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData)  
                    : JSONData;  
  
            var CSV = '';  
            //Set Report title in first row or line  
  
            CSV += ReportTitle + '\r\n\n';  
  
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
            var fileName = "MyReport_";  
            //this will remove the blank-spaces from the title and replace it with an underscore  
            fileName += ReportTitle.replace(/ /g, "_");  
  
            //Initialize file format you want csv or xls  
            var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);  
  
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
        alert(1);
             var data = JSON.stringify($('#tablef').datagrid('getData').rows);  
            alert(data);  
            if (data == '')  
                return;  
  
            JSONToCSVConvertor(data, "Download", true);  
          }
  </script>
  <body>
   <table id="tablef" class="easyui-datagrid" title="DBOSS系统--任务展示"  
        style="width:100%;padding-top: 0px;"  
        data-options="region:'center',border:false,rownumbers:true,pagination:true,url:'logoperate.htm',singleSelect:false,collapsible:true,toolbar:'#tb'">  
        <thead>  
            <tr>  
                <th data-options="field:'ck',checkbox:true"></th>  
                <th data-options="field:'status'">Status</th>  
                <th data-options="field:'system'">System</th>  
                <th data-options="field:'etl_job'">Etl_job</th>  
                <th data-options="field:'etl_desc'">Etl_desc</th>  
                <th data-options="field:'job_type'">Job_type</th>  
                <th data-options="field:'frequency'">Frequency</th>  
                <th data-options="field:'stream'">Stream</th>  
                <th data-options="field:'dependency'">Dependency</th>  
                <th data-options="field:'src_script'">Src_script</th>  
                <th data-options="field:'is_timetrigger'">Is_timetrigger</th>  
                <th data-options="field:'job_type'">Job_type</th>  
                <th data-options="field:'start_time'">Start_time</th>  
                <th data-options="field:'group_server'">Group_server</th>  
                <th data-options="field:'creator'">Creator</th>  
            </tr>  
        </thead>  
    </table>  
    <div id="tb" style="padding:5px;height:auto">  
        <div style="margin-bottom:5px">  
             
        </div>  
        <div>  
            <a href="#" class="easyui-linkbutton"  
                data-options="iconCls:'icon-search'" onclick="doAllSearch()">Search</a>  
            <a href="#" class="easyui-linkbutton" style="width:12%"  
                onclick="window.location='task.htm'">新增作业</a> <a href="#"  
                class="easyui-linkbutton" style="width:12%">修改作业</a> <a href="#"  
                class="easyui-linkbutton" style="width:12%">无效作业</a> <a href="#"  
                class="easyui-linkbutton" style="width:12%">下线作业</a> <a href="#"  
                class="easyui-linkbutton" style="width:12%">有效作业</a> <a href="#"  
                class="easyui-linkbutton" style="width:12%">批量新增</a> <a href="#"  
                class="easyui-linkbutton" style="width:12%" onclick="exporte()">导出</a>  
        </div>  
    </div>  
  </body>
</html>
