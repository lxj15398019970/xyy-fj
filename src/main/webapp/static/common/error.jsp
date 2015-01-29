<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%
	response.setStatus(200);
%>
<%
	Throwable ex = null;
	if (request.getAttribute("javax.servlet.error.exception") != null){
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
	//记录日志
	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(ex.getMessage(), ex);
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>请求异常</title>
</head>

<body>
	<h2>404 - 页面不存在.</h2>
	<p>
		<a href="<c:url value="/"/>">返回首页</a>
	</p>
</body>
</html>