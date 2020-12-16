<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쩔쩔이는 도망가려고 하고있다!!!</title>
</head>
<body>
	<h1>웹페이지 개발자인 쩔쩔이의 실수로 자바스크립트가 작동을 하지 않습니다 메일로 문제점을 자세히 보내서 놈을 혼내주세요</h1>
	<button class="home_again" type="button">음....홈화면?</button>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		
		let to_home = document.querySelector(".home_again");
		
		to_home.addEventListener("click", function(){
			document.location.href = "${rootPath}";
		})
	})
</script>
</html>