<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>审批流程列表</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
    <script type="text/javascript">
	    function showProcessImage( pdId ){
	    	// alert("原文：" + pdId);
	    	
	    	pdId = encodeURI(pdId);
	    	// alert("第一次URL编码：" + pdId);

	    	pdId = encodeURI(pdId);
	    	// alert("第二次URL编码：" + pdId);
	    	
            var url = "processDefinitionAction_downloadProcessImage.action?id=" + pdId + "&t=" + new Date();
            window.showModalDialog(url, null, "dialogHeight:500px;dialogWidth:600px;resizable:yes");
        }
    </script> 
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
           作业流程管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr height="40px" align=center valign=middle id=TableTitle style="font-size: 20px;">
            	<td width="200px"><b>流程名称</b></td>
				<td width="80px"><b>最新版本</b></td>
                <td width="300px"><b>说明</b></td>
                <td><b>相关操作</b></td>
            </tr>
        </thead>
     <tr height="3px">
     
     </tr>
<tr align="center" height="15px">
<td>上交流程</td>
<td>版本一</td>
<td>先点击部署，再上交</td>
<td><font color="blue">删除</font></td>
</tr>
<tr align="center" height="15px">
<td>批改流程</td>
<td>批改版本</td>
<td>先点击部署，再上交</td>
<td><font color="blue">删除</font></td>
</tr>
<tr align="center" height="15px">
<td>修改流程</td>
<td>修改版本</td>
<td>先点击部署，再上交</td>
<td><font color="blue">删除</font></td>
</tr>
<tr align="center" height="15px">
<td>删除流程</td>
<td>版本三</td>
<td>先点击部署，再上交</td>
<td><font color="blue">删除</font></td>
</tr>
		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="processDefList">
        
        <s:iterator value="#processDefinitionList">
			<tr class="TableDetail1 template">
				<td>${name}&nbsp;</td>
				<td align="CENTER">${version}&nbsp;</td>
				<td>${description}&nbsp;</td>
				<td>
					<s:a action="processDefinitionAction_delete" onclick="return delConfirm()">
						<s:param name="key" value="%{@java.net.URLEncoder@encode(key, 'utf-8')}"></s:param>
						删除
					</s:a>
					<a href="javascript: showProcessImage('${id}')">查看流程图</a>
				</td>
			</tr>
		</s:iterator>	
			
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <table border="0" cellspacing="0" cellpadding="10" align="left">
                <tr>
			        <td><div class="FuncBtn">
                            <div class=FuncBtnHead></div>
                            <div class=FuncBtnMemo><s:a action="processDefinitionAction_addUI"><font color="blue">部署流程定义文档</font></s:a></div>
                            <div class=FuncBtnTail></div>
                        </div></td>
                </tr>
			</table>
        </div>
    </div>
</div>

</body>
</html>
