<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/jsp/public/common.jspf"%>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/style/images/logout.jpg');">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2 align="center">您已退出ERP系统</h2>
	<hr>
	<div align="center">
		<table>
			<tr align="center">
				<td align="center"><a href="${pageContext.request.contextPath}/userAction_loginUI.action"><font color="yellow">重新进入系统</font></a></td>
				<td><a href="javascript: window.open('','_self');window.close();"><font color="blue">关闭当前窗口</font></a></td>
			</tr>
			<tr></tr>


		</table>
	</div>


</body>
</html>
