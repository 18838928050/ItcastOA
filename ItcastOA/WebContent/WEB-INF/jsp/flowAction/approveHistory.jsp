<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>流转记录</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            审批流转记录
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">

    <table cellspacing="0" cellpadding="0" class="TableStyle">
		<!-- 表头-->
        <tr align="CENTER" valign="MIDDLE" id="TableTitle">
            <td width="115">审批人</td>
			<td width="115">审批时间</td>
			<td width="100">是否通过</td>
            <td>审批意见</td>
        </tr>
		
	    <tbody id="TableData" class="dataContainer" datakey="approveInfoList">
	        <!--显示数据列表-->
	        
	        <s:iterator value="#approveInfos">
			<tr class="TableDetail1 template">
				<td>${approver.name}&nbsp;</td>
				<td>${approveTime}&nbsp;</td>
				<td>${approval ? '同意' : '不同意'}&nbsp;</td>
				<td>${comment}&nbsp;</td>
			</tr>
	        </s:iterator>

        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
             <a href="javascript:history.go(-1);"><font color="blue">返回</font></a>
        </div>
    </div>
</div>

<div class="Description">
	说明：<br />
	1，审批信息列表按审批时间升序排列。<br />
</div>

</body>
</html>
