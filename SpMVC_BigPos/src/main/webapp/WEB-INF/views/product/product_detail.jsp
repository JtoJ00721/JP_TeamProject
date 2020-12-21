<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 상세보기</title>
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

#pro_item_holder {
	display: inline-block;
	border: 20px solid gray;
	text-align: left;
	width: 70%;
}

#det_pro_btn_box button {
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

#det_pro_btn_box button:nth-child(2) {
	background-color: crimson;
}

#det_pro_btn_box button:nth-child(3) {
	background-color: olive;
}

#det_pro_btn_box button:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<div id="main_div">
		<h1>여기는 상품 상세보기지롱</h1>
		<div id="pro_item_holder">
			<ul>
				<li data-id="${PROVO.p_code}">상품코드 : ${PROVO.p_code}</li>
				<li>상품명 : ${PROVO.p_name}</li>
				<li>품목 : ${PROVO.p_item}</li>
				<li>제조원 : ${PROVO.p_menuf}</li>
				<li>주매입처 : ${PROVO.p_dcode}</li>
				<li>과세구분 : ${PROVO.p_vat}</li>
				<li>매입단가 : ${PROVO.p_iprice}</li>
				<li>판매단가 : ${PROVO.p_oprice}</li>
			</ul>
		</div>
		<div id="det_pro_btn_box">
			<button type="button">수정</button>
			<button type="button">삭제</button>
			<button type="button">리스트로</button>
		</div>
	</div>
</body>

<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {

						let taxing = document.querySelector("li:nth-child(6)");

						if (taxing.innerHTML == "과세구분 : 1") {
							taxing.innerHTML = "과세구분 : 과세상품"
						} else if (taxing.innerHTML == "과세구분 : 2") {
							taxing.innerHTML = "과세구분 : 면세상품"
						} else {
							taxing.innerHTML = "과세구분 : 잘못 입력됨 쩔쩔이를 혼내주세요 ><"
						}

						let id = document.querySelector("li:first-child").dataset.id;
						document
								.querySelector(
										"#det_pro_btn_box button:first-child")
								.addEventListener(
										"click",
										function() {
											if (confirm("이 상품정보를 수정하실래요?")) {
												document.location.href = "${rootPath}/product/update?id="
														+ id;
											}
										})

						document
								.querySelector(
										"#det_pro_btn_box button:nth-child(2)")
								.addEventListener(
										"click",
										function() {
											if (confirm("이 상품정보를 무자비하게 파괴하실 건가요? ><"))
												document.location.href = "${rootPath}/product/delete?id="
														+ id;
										})

						document
								.querySelector(
										"#det_pro_btn_box button:nth-child(3)")
								.addEventListener(
										"click",
										function() {
											if (confirm("상품정보 리스트로 돌아가실래요? ><"))
												document.location.href = "${rootPath}/product/list";
										})
					})
</script>
</html>