<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
	<div class="pageHeader">
	</div>
	
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="${ctx}/account/role!input.action" target="dialog"><span>添加</span></a></li>
				<li><a class="delete" href="${ctx}/account/role!delete.action?id={sid_role}" target="ajaxTodo" title="确定要删除吗？" warn="请选择一个角色"><span>删除</span></a></li>
				<li><a class="edit" href="${ctx}/account/role!input.action?id={sid_role}" target="dialog" warn="请选择一个角色"><span>查看/修改</span></a></li>
			</ul>
		</div>
	
		<table class="list" width="100%" layoutH="66">
			<thead>
				<tr>
					<th width="50%">名称</th>
					<th width="50%">授权</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="allRoleList">
				<tr target="sid_role" rel="${id}">
					<td>${name}</td>
					<td>${authNames}</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="panelBar" >

		</div>
	</div>
</div>