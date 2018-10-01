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

<body>



<!-- 显示表单 -->
<s:form action="userAction_login" focusElement="loginNameInput">
    <div id="CenterAreaBg" style="background-image: url('${pageContext.request.contextPath}/style/images/timg4.jpg');"> 
    <div style="height: 130px;">
    <h1 align="center" style="padding-top: 60px;" ><font color="green">ERP系统</font> </h1>
    
    
    </div>
    
        <div style="background-color: rgba(176,224,230,0.8); margin:auto;   bapadding-left:0; width: 60%;height: 350px;">
            <div >
            
            
                <table>
                <br><br><br>
                	<tr>
                		<td colspan="5" ><!-- 显示错误 -->
							<font color="red"><s:fielderror/></font>
                		</td>
                	</tr>
                    <tr>
                    <td style="font-size: 20px;padding-left:130px;">姓名：</td>
                       <td >
                        	<s:textfield name="loginName" size="30"/>
                        </td>
                        <td rowspan="2" style="padding-left:10px;">
                 	<input type="image" tabindex="3"  src="${pageContext.request.contextPath}/style/images/submit.gif">
                        </td>
                    </tr>
                    <tr>
                    <td style="font-size:20px;padding-left:130px;">密码：</td>
                        <td><s:password name="password" id="aa" size="30" tabindex="2" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </s:form>
      <div style="height: 100px;">
    
    
    </div>
</body>

</html>

