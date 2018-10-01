<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>待我审批</title>
  	<%@ include file="/WEB-INF/jsp/public/common.jspf" %>
</head>
<body> 

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            待我审批
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea" align="center">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
        <!-- 表头-->
        <thead>
            <tr align="CENTER" valign="MIDDLE" id="TableTitle">
				<td width="250">标题</td>
				<td width="115">学生姓名</td>
				<td width="115">上交日期</td>
				<td>相关操作</td>
			</tr>
		</thead>	
		<tr align="center">
		<td>高数作业</td>
		<td>付慧芳</td>
		<td>2017/10/5</td>
		<td colspan="2"><font color="blue">删除</font>_<font color="blue">修改</font></td>
		
		</tr>
			<tr  align="center">
		<td>高数作业</td>
		<td>付慧芳</td>
		<td>2017/10/5</td>
		<td colspan="2"><font color="blue">删除</font>_<font color="blue">修改</font></td>
		
		</tr>
			<tr  align="center">
		<td>高数作业</td>
		<td>付慧芳</td>
		<td>2017/10/5</td>
		<td colspan="2"><font color="blue">删除</font>_<font color="blue">修改</font></td>
		
		</tr>
		
			<tr  align="center">
		<td>高数作业</td>
		<td>付慧芳</td>
		<td>2017/10/5</td>
		<td colspan="2"><font color="blue">删除</font>_<font color="blue">修改</font></td>
		
		</tr>
			<tr  align="center">
		<td>高数作业</td>
		<td>付慧芳</td>
		<td>2017/10/5</td>
		<td colspan="2"><font color="blue">删除</font>_<font color="blue">修改</font></td>
		
		</tr>
		
		
			
		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="formList">
		
		<s:iterator value="#taskViewList">
			<tr class="TableDetail1 template">
				<td>${application.title}</td>
				<td>${application.applicant.name}&nbsp;</td>
				<td><s:date name="application.applyTime" format="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
				<td>
					<s:a action="flowAction_approveUI?applicationId=%{application.id}&taskId=%{task.id}">审批处理</s:a>
					<s:a action="flowAction_approveHistory?applicationId=%{application.id}">查看流转记录</s:a>
				</td>
			</tr>
		</s:iterator>	
			
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail"><div id="TableTail_inside"></div></div>
</div>

<!--分页信息-->
<div id=PageSelectorBar>
	<div id=PageSelectorMemo>
		页次：1/1页 &nbsp;
		每页显示：10条 &nbsp;
		总记录数：5条
	</div>
	<div id=PageSelectorSelectorArea>
		<a href="javascript:void(0)" title="首页" style="cursor: hand;">
		
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">3</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">4</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">5</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">6</span>
		<span class="PageSelectorNum PageSelectorSelected">7</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">8</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">9</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">10</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">11</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">12</span>
		
		
		转到：
		<input onFocus="this.select();" maxlength="2" class="inputStyle" type="text" value="1" name="currPage" tabindex="0"/>
		<input type="submit" name="goBtn" value="Go" class="MiddleButtonStyle" />
	</div>
</div>


</body>
</html>
