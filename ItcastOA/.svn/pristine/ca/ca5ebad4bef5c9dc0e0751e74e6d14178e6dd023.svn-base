<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>配置权限</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
    <script language="javascript" src="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.js"></script>
	<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/blue/file.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.css" /> --%>
	<script type="text/javascript">
		$(function(){
			
			// 给所有的权限复选框添加事件
			$("[name=privilegeIds]").click(function(){

				// 自己选中或取消时，把所有的下级权限也都同时选中或取消
				$(this).siblings("ul").find("input").attr("checked", this.checked);
				
				// 当选中一个权限时，也要同时选中所有的直系上级权限
				if(this.checked){
					$(this).parents("li").children("input").attr("checked", true);
				}
				// 当取消一个权限时，同级没有选中的权限了，就也取消他的上级权限，再向上也这样做。
				else{
					if( $(this).parent().siblings("li").children("input:checked").size() == 0 ){
						$(this).parent().parent().siblings("input").attr("checked", false);
						
						var start = $(this).parent().parent();
						if( start.parent().siblings("li").children("input:checked").size() == 0 ){
							start.parent().parent().siblings("input").attr("checked", false);
						}
					}
				}
			});
			
		});
	</script>
</head>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            配置权限
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <s:form action="roleAction_setPrivilege">
    	<s:hidden name="id"></s:hidden>
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
      </div> <font color="black">  正在为【${role.name}】配置权限</font>
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
					<!--表头-->
					<thead>
						<tr align="LEFT" valign="MIDDLE" id="TableTitle">
							<td width="300px" style="padding-left: 7px;">
								<!-- 全选 -->
								<input type="checkbox" onClick="$('[name=privilegeIds]').attr('checked', this.checked)"/>
								<label for="cbSelectAll">全选</label>
							</td>
						</tr>
					</thead>
                   
			   		<!--显示数据列表-->
					<tbody id="TableData">
						<tr class="TableDetail1">
							<!-- 显示权限树 -->
							<td>


<ul id="root">
<%-- 第一级 --%>
<s:iterator value="#topPrivilegeList">
	<li>
		<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> >
		<label for="cb_${id}"><span class="folder">${name}</span></label>
		<ul>
		<%-- 第二级 --%>
		<s:iterator value="children">
			<li>
				<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> >
				<label for="cb_${id}"><span class="folder">${name}</span></label>
				<ul>
				<%-- 第三级 --%>
				<s:iterator value="children">
					<li>
						<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> >
						<label for="cb_${id}"><span class="folder">${name}</span></label>
					</li>
				</s:iterator>
				</ul>
			</li>
		</s:iterator>
		</ul>
	</li>
</s:iterator>
</ul>

							</td>
						</tr>
					</tbody>
                </table>
            </div>
        </div>
        
 	<script type="text/javascript">
		$("#root").treeview();
	</script>
 
        
        <!-- 表单操作 -->
        <div id="InputDetailBar">
              <input type="image" height="30px"  src="${pageContext.request.contextPath}/style/images/2.jpg"/>
             <a href="javascript:history.go(-1);"><font color="blue">返回</font></a>
        </div>
    </s:form>
</div>

</body>
</html>
