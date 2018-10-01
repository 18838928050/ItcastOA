<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>版块列表</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
    <style type="text/css">
    	.disabledA{
    		color: gray; 
    		/** text-decoration: underline; */ 
    		cursor: pointer;
    	}
    </style>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            版块管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align="CENTER" valign="MIDDLE" id="TableTitle">
            	<td width="250px">版块名称</td>
                <td width="300px">版块说明</td>
                <td>相关操作</td>
            </tr>
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="forumList">
        
        <s:iterator value="#forumList" status="status">
			<tr class="TableDetail1 template">
				<td>${name}&nbsp;</td>
				<td>${description}&nbsp;</td>
				<td>
					<s:a action="forumManageAction_delete?id=%{id}" onclick="return delConfirm()">删除</s:a>
					<s:a action="forumManageAction_editUI?id=%{id}">修改</s:a>
					
					<!-- 最上面的不能用上移 -->
					<s:if test="#status.first">
						<span class="disabledA">上移</span>
					</s:if>
					<s:else>
						<s:a action="forumManageAction_moveUp?id=%{id}">上移</s:a>
					</s:else>
					
					<!-- 最下面的不能用下移 -->
					<s:if test="#status.last">
						<span class="disabledA">下移</span>
					</s:if>
					<s:else>
						<s:a action="forumManageAction_moveDown?id=%{id}">下移</s:a>
					</s:else>
					
				</td>
			</tr>
		</s:iterator>	
		
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="forumManageAction_addUI"><font color="blue">新建</font></s:a>
        </div>
    </div>
</div>


</body>
</html>
