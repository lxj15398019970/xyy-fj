<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page import="org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter" %>
<%@ page import="org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter" %>
<%@ page import="org.springframework.security.web.WebAttributes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>分拣系统平台DEMO显示</title>
<link href="themes/css/login.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/static/jquery/jquery-1.7.1.min.js" type="text/javascript"></script>
<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#j_username").focus();
		});
	</script>
</head>

<body>
	<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<!-- <a href="#"><img src="themes/default/images/login_logo.gif" /></a> -->
			</h1>
			<div class="login_headerContent">
				<h2 class="login_title"><img src="themes/default/images/login_title.png" /></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
				<form id="loginForm" name="loginForm" action="${ctx}/j_spring_security_check" method="post">
					<p>
						<label>用户名:</label>
						<input type='text' id='j_username' name='j_username' size="20" class="login_input"
					<s:if test="not empty param.error">
						value='<%=session.getAttribute(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY)%>'</s:if> />
					</p>
					<p>
						<label>密码:</label>
						<input type='password' id='j_password' name='j_password' size="20" class="login_input"/>
					</p>
					<p>
						<label>&nbsp;</label>
						<span><input type="checkbox" name="_spring_security_remember_me"/></span>
						两周内记住我
					</p>
					<div class="login_bar">
						<input value=" " type="submit" class="sub" alt="登陆" />
					</div>
				</form>
			</div>
			<div class="login_banner"><img src="themes/default/images/login_banner.jpg" /></div>
			<div class="login_main">
			</div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2010 <a href="#">ld</a> Inc. All Rights Reserved.
		</div>
	</div>
</body>
</html>