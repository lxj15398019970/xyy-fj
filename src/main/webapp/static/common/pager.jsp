<%@ page contentType="text/html;charset=UTF-8"%>
<div class="tfoot">
	<!-- totalCount总行数,numPerPage每页显示行数,currentPage当前是第几页 -->
	<form onsubmit="return goPage(this)">
		<div id="pagination" class="pagination"
			totalCount="${page.totalCount}" totalPages="${page.totalPages}"
			numPerPage="${page.pageSize}" pageNumShown="10"
			currentPage="${page.pageNo}">
			<!-- 这里显示分页 -->
		</div>
		<div class="go-pagination">
			<span class="go-pagination-num"><span>共${page.totalCount}页，去第</span>
				<input type="text" />页 </span> <a href="javascript:void(0);"
				onclick="goPage(this);" class="btn">go</a>
		</div>
	</form>
</div>
