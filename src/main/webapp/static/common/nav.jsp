<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<nav class="wrap-nav">
	<div class="container">
		<ul class="nav nav-pills text-center student-nav">
			<shiro:hasPermission name="PRE_stat_menu">
				<li <c:if test="${menu eq 'stat' }">class="active"</c:if>><a
					href="${ctx }/index/stat">统计查询</a></li>
			</shiro:hasPermission>
			<li <c:if test="${menu eq 'stuAdmin' }">class="active"</c:if>><a
				href="${ctx }/index/stuAdmin">学生平台管理</a></li>
			<li <c:if test="${menu eq 'sysAdmin' }">class="active"</c:if>><a
				href="${ctx }/index/sysAdmin">系统管理</a></li>
		</ul>
	</div>
</nav>