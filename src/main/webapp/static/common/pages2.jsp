<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="pages">
	<span>每页显示</span>
	<select name="numPerPage"
		onchange="dialogPageBreak({numPerPage:this.value,pageNum:1})">
		<c:forEach items="${fn:split('10,20,50',',')}" var="model">
			<option value="${model}" 
				<c:if test="${model==page.pageSize}">selected="selected"</c:if>
			>${model}
			</option>
		</c:forEach>
	</select> <span>&nbsp;共${page.totalCount}条,共${page.totalPages}页</span>
</div>
<div class="pagination" targetType="dialog" totalCount="${page.totalCount}"
	numPerPage="${page.pageSize}" pageNumShown="10" currentPage="${page.pageNo}"></div>
