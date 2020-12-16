<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스기 웹앱 홈페이지</title>
</head>
<body>
	<h1>위 네비게이션에서 내용을 구경하거나 끄적이고 싶은 리스트를 선택해 주세요</h1>
	<h3>이 사이트의 모든 안내와 경고메시지는 우리 농농이가 합니다</h3>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		setTimeout(function(){
		let location = document.querySelector("nav button:first-child");
		location.style.backgroundColor = "cornflowerblue";
		location.style.borderRadius = "0px 0px 15px 0px";
		
		let sholder = document.querySelector("nav button:nth-child(2)");
		sholder.style.borderRadius = "0px 0px 0px 15px";
		
		let easter = document.querySelector("#home_easter");
		easter.style.color = "black";
		}, 69);
	});
</script>
</html>