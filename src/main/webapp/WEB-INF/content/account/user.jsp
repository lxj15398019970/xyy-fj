<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
	<div class="pageHeader">
		<form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/account/user.action" method="post">
		<input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
		<input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
		<input type="hidden" name="page.order" id="order" value="${page.order}"/>
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>登录名:</label><input type="text" name="filter_EQS_loginName" value="${param['filter_EQS_loginName']}" size="9"/>
				</li>
				<li>
					<label>姓名或Email:</label><input type="text" name="filter_LIKES_name_OR_email" value="${param['filter_LIKES_name_OR_email']}" />
				</li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				</ul>
			</div>
		</div>
		</form>
	</div>
	
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="${ctx}/account/user!input.action" target="dialog"><span>添加</span></a></li>
				<li><a class="delete" href="${ctx}/account/user!delete.action?id={sid_user}" target="navTabTodo" title="确定要删除吗？" warn="请选择一个用户"><span>删除</span></a></li>
				<li><a class="edit" href="${ctx}/account/user!input.action?id={sid_user}" target="dialog" warn="请选择一个用户"><span>查看/修改</span></a></li>
				<li class="line">line</li>
				<li class=""><a class="icon" href="#"><span>导入EXCEL</span></a></li>
				<li class="line">line</li>
				<li class=""><a class="icon" href="#"><span>导出EXCEL</span></a></li>
			</ul>
		</div>
	
		<table class="list" width="98%" layoutH="116">
			<thead>
				<tr>
					<th width="80">登录名</th>
					<th width="80">姓名</th>
					<th width="120">电邮</th>
					<th width="80">角色</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="page.result">
				<tr target="sid_user" rel="${id}">
					<td>${loginName}&nbsp;</td>
					<td>${name}&nbsp;</td>
					<td>${email}&nbsp;</td>
					<td>${roleNames}&nbsp;</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
		
		<div class="panelBar" >
			<div class="pages">
				<span>共${page.totalCount}条,共${page.totalPages}页</span>
			</div>
			
			<div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.pageSize}" pageNumShown="10" currentPage="${page.pageNo}"></div>

		</div>
	
	</div>
</div>