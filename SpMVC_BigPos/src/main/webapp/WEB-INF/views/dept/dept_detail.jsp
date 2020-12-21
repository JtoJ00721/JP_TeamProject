<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처정보 상세보기</title>
<style>
#main_div {
	text-align: center;
}

h1 {
	text-align: center;
}

li {
	font-size: 25px;
	margin: 10px 0px;
}

#dept_item_holder {
	display: inline-block;
	border: 20px solid gray;
	text-align: left;
	width: 70%;
}

#det_dept_btn_box button {
	border: none;
	outline: none;
	border-radius: 15px;
	background-color: cornflowerblue;
	color: white;
	font-size: 20px;
	font-weight: bolder;
	padding: 20px;
	margin: 20px;
	padding: 20px;
	transition: all 0.7s;
}

#det_dept_btn_box button:nth-child(2) {
	background-color: crimson;
}

#det_dept_btn_box button:nth-child(3) {
	background-color: olive;
}

#det_dept_btn_box button:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<div id="main_div">
		<h1>여기는 거래처 상세정보창이지롱</h1>
		<div id="dept_item_holder">
			<ul>
				<li data-id="${DEPTVO.d_code}">거래처코드 : ${DEPTVO.d_code}</li>
				<li>거래처이름 : ${DEPTVO.d_name}</li>
				<li>사업자번호 : ${DEPTVO.d_sid}</li>
				<li>대표자명 : ${DEPTVO.d_ceo}</li>
				<li>대표전화 : ${DEPTVO.d_tel}</li>
				<li>주소 : ${DEPTVO.d_addr}</li>
				<li>주요품목 : ${DEPTVO.d_product}</li>
			</ul>
		</div>
		<div id="det_dept_btn_box">
			<button>수정</button>
			<button>삭제</button>
			<button>리스트로</button>
		</div>
	</div>
</body>
<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						let id = document.querySelector("li:first-child").dataset.id;

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