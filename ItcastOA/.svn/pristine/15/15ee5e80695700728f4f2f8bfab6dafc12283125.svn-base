<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>部署流程定义</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
</head>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            部署流程定义
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <s:form action="processDefinitionAction_add" enctype="multipart/form-data">

        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
						<td>请选择流程定义文档(zip格式)</td>
                        <td><input type="file" name="upload" class="InputStyle {required:true, accept:'.zip'}" style="width:450px;" /> *</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- 表单操作 -->
        <div id="InputDetailBar">
              <input type="image" height="30px"  src="${pageContext.request.contextPath}/style/images/2.jpg"/>
             <a href="javascript:history.go(-1);"><font color="blue">返回</font></a>
        </div>
    </s:form>
</div>


</body>
</html>
