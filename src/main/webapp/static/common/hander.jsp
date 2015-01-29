<%@page import="cn.thinkjoy.xyy.zhbd.utils.UserUtil"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!--顶部开始-->
<div id="top">
	<div class="container">
		<p class="text-right">
			<span class="user-name">尊敬的 <%=UserUtil.getName()%>&nbsp;</span>欢迎您使用智慧迎新平台<a href="${ctx }/logout" class="exit">［退出登录］</a>
		</p>
	</div>
</div>
<!--顶部结束-->
<!--头部开始-->
<header id="header">
	<div class="container">
		<div class="row-fluid">
			<div class="span4">
				<h1 id="logo">智慧迎新教师管理平台</h1>
			</div>
			<div class="span8">
				<a href="#" class="question-btn pull-right">我要提问</a>
				<form class="form-search teacher-form-search pull-right">
					<div class="input-append">
						<input class="search-query" type="text" />
						<button type="submit" class="btn">搜索</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>
<!--头部结束-->
