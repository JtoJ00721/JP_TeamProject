<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 제목을 넣어야 하지롱</title>
</head>
<body>
	<h1>여기는 거래처 상세정보창이지롱</h1>
	<div>
		<ul>
			<li>${DEPTVO.d_code}</li>
			<li>${DEPTVO.d_name}</li>
			<li>${DEPTVO.d_sid}</li>
			<li>${DEPTVO.d_ceo}</li>
			<li>${DEPTVO.d_tel}</li>
			<li>${DEPTVO.d_addr}</li>
			<li>${DEPTVO.d_product}</li>
		</ul>
	</div>
	<div id="det_dept_btn_box">
		<button>수정</button>
		<button>삭제</button>
		<button>리스트로</button>
	</div>
</body>
<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						let id = document.querySelector("li:first-child").innerText;

						document
								.querySelector(
										"#det_dept_btn_box button:first-child")
								.addEventListener(
										"click",
										function() {
											if (confirm("이 거래처정보를 수정할래요?")) {
												document.location.href = "${rootPath}/dept/update?id="
														+ id;
											}
										})

						document
								.querySelector(
										"#det_dept_btn_box button:nth-child(2)")
								.addEventListener(
										"click",
										function() {
											if (confirm("이 거래처정보를 가차없이 삭제할래요? ><")) {
												document.location.href = "${rootPath}/dept/delete?id="
														+ id;
											}
										})

						document
								.querySelector(
										"#det_dept_btn_box button:nth-child(3)")
								.addEventListener(
										"click",
										function() {
											if (confirm("다시 리스트로 보내드립니다")) {
												document.location.href = "${rootPath}/dept/list";
											}
										})
					})
</script>
</html>