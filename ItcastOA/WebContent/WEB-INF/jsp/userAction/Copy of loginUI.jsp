<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
	<link href="${pageContext.request.contextPath}/style/blue/login.css" type=text/css rel=stylesheet>
	<script type="text/javascript">
		$(function(){
			document.forms[0].loginName.focus();
		});
		
		// 在被嵌套时就刷新上级窗口
		if(window.parent != window){
			window.parent.location.reload(true);
		}
	</script>
</head>

<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0 class=PageBody >



<!-- 显示表单 -->
<s:form action="userAction_login" focusElement="loginNameInput">
    <div id="CenterAreaBg"> 
        <div id="CenterArea">
            <div id="LoginInfo">
                <table BORDER=0 CELLSPACING=0 CELLPADDING=0 width=100%>
                	<tr>
                		<td colspan="3"><!-- 显示错误 -->
							<font color="red"><s:fielderror/></font>
                		</td>
                	</tr>
                    <tr>
                    <td>姓名：</td>
                        <td>
                        	<s:textfield name="loginName" size="20" tabindex="1" cssClass="TextField required" id="loginNameInput" />
                        </td>
                        <td rowspan="2" style="padding-left:10px;">
                        	<input type="image" tabindex="3" src="${pageContext.request.contextPath}/images/dl.gif"/>
                        </td>
                    </tr>
                    <tr>
                    <td>密码：</td>
                        <td><s:password name="password" id="aa" size="20" tabindex="2" showPassword="false" cssClass="TextField required" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </s:form>
</body>

</html>

