<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스기 웹앱 홈페이지</title>
<style>
* {
	box-sizing: border-box;
	padding: 0px;
	margin: 0px;
}

html, body {
	width: 100%;
	height: 85%;
}

#body_contents {
	height: 100%;
	text-align: center;
}

#body_contents h1 {
	margin-top: 50px;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jspf"%>
	<%@ include file="/WEB-INF/views/include/nav.jspf"%>

	<div id="body_contents">
		<c:choose>
			<c:when test="${BODY == 'IOLIST'}">
				<%@ include file="/WEB-INF/views/io/iolist.jsp"%>
			</c:when>
			<c:when test="${BODY == 'PRODUCT_LIST'}">
				<%@ include file="/WEB-INF/views/product/product_list.jsp"%>
			</c:when>
			<c:when test="${BODY == 'DEPT_LIST'}">
				<%@ include file="/WEB-INF/views/dept/dept_list.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/main.jsp"%>
			</c:otherwise>
		</c:choose>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</body>
</html>