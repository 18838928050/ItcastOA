<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>导航菜单</title>
	<%@ include file="/WEB-INF/jsp/public/common.jspf"%>
	<link type="text/css" rel="stylesheet" href="style/blue/menu.css" />
	
	<script type="text/javascript">
		function menuClick( menuDiv ){
			// $(".MenuLevel2").not( $(menuDiv).next() ).hide();
			$(menuDiv).next().toggle(); // show(), hide(), toggle()
		}
	</script>
	
</head>
<body style="margin: 0">
<div id="Menu"> 

    <ul id="MenuUl">
		<%-- 顶级菜单 --%>
		<s:iterator value="#application.topPrivilegeList">
		<s:if test="#session.user.hasPrivilegeByName(name)">
	        <li class="level1">
	            <div onClick="menuClick(this);" class="level1Style">
	            	${name}
	            </div>
	            <%-- 二级菜单 display: none; --%>
	            <ul  class="MenuLevel2">
	            	<s:iterator value="children">
	            	<s:if test="#session.user.hasPrivilegeByName(name)">
		                <li class="level2" style="background-color: red;">
		                    <div class="level2Style">
			                    <a target="right" href="${pageContext.request.contextPath}/${url}.action"> ${name}</a>
		                 	</div>
		                </li>
	                </s:if>
	            	</s:iterator>
	            </ul>
	        </li>
        </s:if>
		</s:iterator>        
    </ul>
    
</div>
</body>
</html>