<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div class="page">
	<div class="pageHeader">
		<form id="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/province/province.action" method="post">
		<input type="hidden" name="page.pageNo" id="pageNum" value="${page.pageNo}"/>
		<input type="hidden" name="page.orderBy" id="orderField" value="${page.orderBy}"/>
		<input type="hidden" name="page.order" id="order" value="${page.order}"/>
		<div class="searchBar">
			<ul class="searchContent">
                <li>
                    <label>省份名称:</label><input type="text" class="textInput" name="filter_EQS_provinceName" value="${param['filter_EQS_provinceName']}" size="9"/>
                </li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>

		</div>
		</form>
	</div>
	<div class="dashed-line"></div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="toolBar-btn" href="${ctx}/province/province!input.action" target="dialog">添加</a></li>
				<li><a class="toolBar-btn2" href="${ctx}/province/province!delete.action?id={sid_user}" target="ajaxTodo" title="确定要删除吗?删除将会删除该省下所有市、区县信息" warn="请选择一个省份">删除</a></li>
				<li><a class="toolBar-btn" href="${ctx}/province/province!input.action?id={sid_user}" target="dialog" warn="请选择一个用户">查看/修改</a></li>
			</ul>
		</div>
        <div layouth="111">
		<table class="list" width="100%">
			<thead>
				<tr>
                    <th width="50%">省份ID</th>
					<th width="50%">省份名称</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="page.result">
				<tr target="sid_user" rel="${id}">
                    <td>${id}&nbsp;</td>
                    <td>${provinceName}&nbsp;</td>
                </tr>
				</s:iterator>
			</tbody>
		</table>
            </div>
		
		<div class="panelBar" >
			<div class="pages">
				<span>共${page.totalCount}条,共${page.totalPages}页</span>
			</div>
			
			<div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.pageSize}" pageNumShown="10" currentPage="${page.pageNo}"></div>

		</div>
	
	</div>
</div>