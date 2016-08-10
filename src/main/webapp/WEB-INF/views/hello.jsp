<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>JPetStore Demo</title>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
	<meta http-equiv="Cache-Control" content="max-age=0" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="Pragma" content="no-cache" />
</head>

<body>


<div id="Menu">
	<div id="MenuContent">
		<sec:authorize access="!isAuthenticated()">
			<a href="${pageContext.request.contextPath}/account/signonForm">Sign In</a>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<a href="${pageContext.request.contextPath}/account/signoff">Sign Out</a>
		</sec:authorize>
	</div>
</div>


<div id="Footer">
	<div id="Banner">
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.account" var="account" />
			你好, ${account.username}<!-- XSS -->
		</sec:authorize>
		<br/>
		${message}
	</div>
</div>



</body>
</html>