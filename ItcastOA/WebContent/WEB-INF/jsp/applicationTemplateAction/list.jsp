<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>表单模板列表</title>
   	<%@ include file="/WEB-INF/jsp/public/common.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            模板管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
            	<td width="250px"><b>模板名称</b></td>
				<td width="250px"><b>所用流程</b></td>
                <td>相关操作</td>
            </tr>
        </thead>
        <tr align="center">
        <td>模板一</td>
        <td>上交流程</td>
        <td><font color="blue">修改</font></td>
        </tr>
         <tr align="center">
        <td>模板二</td>
        <td>修改流程</td>
        <td><font color="blue">修改</font></td>
        </tr>
         <tr align="center">
        <td>模板三</td>
        <td>批改流程</td>
        <td><font color="blue">修改</font></td>
        </tr>
         <tr align="center">
        <td>模板四</td>
        <td>删除流程</td>
        <td><font color="blue">修改</font></td>
        </tr>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="documentTemplateList">
        
        <s:iterator value="applicationTemplateList">
			<tr class="TableDetail1 template">
				<td>${name}&nbsp;</td>
				<td>${processDefinitionKey}&nbsp;</td>
				<td>
					<s:a action="applicationTemplateAction_delete?id=%{id}" onclick="return delConfirm()">删除</s:a>
					<s:a action="applicationTemplateAction_editUI?id=%{id}">修改</s:a>
					<s:a action="applicationTemplateAction_download?id=%{id}">下载</s:a>
				</td>
			</tr>
		</s:iterator>	
			
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
			<s:a action="applicationTemplateAction_addUI"><font color="blue">新建</font></s:a>
        </div>
    </div>

</div>
</body>
</html>
