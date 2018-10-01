<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>部门列表</title>
	<%@ include file="/WEB-INF/jsp/public/common.jspf" %>
</head>
<body>
 
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
          部门管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id="TableTitle">
            	<td width="150px">部门名称</td>
				<td width="150px">上级部门名称</td>
				<td width="200px">职能说明</td>
				<td>相关操作</td>
            </tr>
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="departmentList">
        
        <s:iterator value="#departmentList">
			<tr class="TableDetail1 template">
				<td><s:a action="departmentAction_list?parentId=%{id}">${name}</s:a> &nbsp;</td>
				<td style="color: blue;" >${parent.name}&nbsp;</td>
				<td>${description}&nbsp;</td>
				<td>
					<s:a action="departmentAction_delete?id=%{id}&parentId=%{parent.id}" onclick="return window.confirm('这将删除所有的下级部门，您确定要删除吗？')">删除</s:a>
					<s:a action="departmentAction_editUI?id=%{id}">修改</s:a>
					&nbsp;
				</td>
			</tr>
		</s:iterator>	
			
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
    
        <div id="TableTail_inside">
                 <s:a action="departmentAction_addUI?parentId=%{parentId}"><font color="blue">新建</font></s:a>
            <s:if test="#parent != null">
				<s:a action="departmentAction_list?parentId=%{#parent.parent.id}"><font color="blue">返回上一级</font></s:a>
            </s:if>
        </div>
    </div>
</div>
<div>
说明：此处部门可以有下级部门，单击部门名称进入

</div>

</body>
</html>
