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

	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap.css" rel="stylesheet">
	<style type="text/css">
		body {
			background:url(${ctx}/static/dwz/themes/default/images/html-bg-x.jpg) repeat-x center top;
		}

		.form-signin {
			position: absolute;
			left:50%;
			top:40%;
			margin-left: -180px;
			margin-top: -160px;
			width: 300px;
			padding: 19px 30px 29px;
			background-color: #fff;
			border: 1px solid #e5e5e5;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
			-moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
			box-shadow: 0 1px 2px rgba(0,0,0,.05);
		}
		.form-signin .form-signin-heading,
		.form-signin .checkbox {
			margin-bottom: 10px;
		}
		.form-signin input[type="text"],
		.form-signin input[type="password"] {
			font-size: 16px;
			height: auto;
			margin-bottom: 15px;
			padding: 7px 9px;
		}
		.sub-btn{
			border-radius: 0;
			background: #e8e8e8;
			outline: none;
			border: none;
			box-shadow: none;
			text-shadow: none;
			padding: 11px 19px;
			font-size: 17.5px;
			background: #2fade7;
			color: #fff;
			width: 100%;
		}
		.form-signin-heading{
			text-align: center;
		}

	</style>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-responsive.css" rel="stylesheet">

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	<script src="${ctx}/static/bootstrap/2.3.2/js/html5shiv.js"></script>
	<![endif]-->



<%--<link href="themes/css/login.css" rel="stylesheet" type="text/css" />--%>
<script src="${ctx}/static/jquery/jquery-1.7.1.min.js" type="text/javascript"></script>
<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#j_username").focus();
		});
	</script>
</head>

<body>

<div class="container">
	<form class="form-signin"  id="loginForm" name="loginForm" action="${ctx}/j_spring_security_check" method="post">
		<h2 class="form-signin-heading">分拣系统平台登录</h2>
		<input type='text' id='j_username' name='j_username' size="20" class="input-block-level"
				<s:if test="not empty param.error">
					value='<%=session.getAttribute(UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY)%>'</s:if> />


		<input type='password' id='j_password' name='j_password' size="20" class="input-block-level"/>
		<label class="checkbox">
			<input type="checkbox" value="remember-me" name="_spring_security_remember_me"/> 两周内记住我
		</label>
		<button class="sub-btn" type="submit">登录</button>
	</form>

</div>

</body>
</html>