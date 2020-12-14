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
	height: 100%;
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
			<c:when test="${BODY == 'IO_LIST'}">
				<%@ include file="/WEB-INF/views/io/iolist.jsp"%>
			</c:when>
						<c:when test="${BODY == 'IO_DETAIL'}">
				<%@ include file="/WEB-INF/views/io/io_detail.jsp"%>
			</c:when>
						<c:when test="${BODY == 'IO_INPUT'}">
				<%@ include file="/WEB-INF/views/io/io_input.jsp"%>
			</c:when>
		</c:choose>
		<h1>내용을 구경하거나 끄적이고 싶은 리스트를 선택해 주세요</h1>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</body>
</html>