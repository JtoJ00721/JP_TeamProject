<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입매출 디테일 보기</title>
<style>
#main_div {
	text-align: center;
}

li {
	font-size: 25px;
	margin: 10px 0px;
}

#io_item_holder {
	display: inline-block;
	border: 20px solid gray;
	text-align: left;
	width: 70%;
}

#det_io_btn_box button {
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

#det_io_btn_box button:nth-child(2) {
	background-color: crimson;
}

#det_io_btn_box button:nth-child(3) {
	background-color: olive;
}

#det_io_btn_box button:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<div id="main_div">
		<h1>여기는 매입매출 상세보기지롱</h1>
		<div id="io_item_holder">
			<ul>
				<li data-id="${IOVO.io_seq}">상품코드 : ${IOVO.io_seq}</li>
				<li>거래일자 : ${IOVO.io_date}</li>
				<li>거래시각 : ${IOVO.io_time}</li>
				<li>거래처코드 : ${IOVO.io_dcode}</li>
				<li>매입매출 구분 : ${IOVO.io_inout}</li>
				<li>상품코드 : ${IOVO.io_pcode}</li>
				<li>과세구분 : ${IOVO.io_vat}</li>
				<li>수량 : ${IOVO.io_qty}</li>
				<li>단가 : ${IOVO.io_price}</li>
				<li>금액 : ${IOVO.io_amt}</li>
				<li>세액 : ${IOVO.io_tax}</li>
				<li>합계 : ${IOVO.io_total}</li>
			</ul>
		</div>
		<div id="det_io_btn_box">
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

						let id = document.querySelector("li:first-child").dataset.id;
						document
								.querySelector(
										"#det_io_btn_box button:first-child")
								.addEventListener(
										"click",
										function() {
											if (confirm("이 매입매출정보를 수정하실래요?")) {
												document.location.href = "${rootPath}/io/update?id="
														+ id;
											}
										})

						document
								.querySelector(
										"#det_io_btn_box button:nth-child(2)")
								.addEventListener(
										"click",
										function() {
											if (confirm("이 매입매출정보를 무자비하게 파괴하실 건가요? ><"))
												document.location.href = "${rootPath}/io/delete?id="
														+ id;
										})

						document
								.querySelector(
										"#det_io_btn_box button:nth-child(3)")
								.addEventListener(
										"click",
										function() {
											if (confirm("매입매출정보 리스트로 돌아가실래요? ><"))
												document.location.href = "${rootPath}/io/list";
										})
					})
</script>
</html>