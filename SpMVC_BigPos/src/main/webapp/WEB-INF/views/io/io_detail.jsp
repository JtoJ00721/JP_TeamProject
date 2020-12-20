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
	<h1>여기는 매입매출 상세보기지롱</h1>
	<ul>
		<li>${IOVO.io_seq}</li>
		<li>${IOVO.io_date}</li>
		<li>${IOVO.io_time}</li>
		<li>${IOVO.io_dcode}</li>
		<li>${IOVO.io_inout}</li>
		<li>${IOVO.io_pcode}</li>
		<li>${IOVO.io_vat}</li>
		<li>${IOVO.io_qty}</li>
		<li>${IOVO.io_price}</li>
		<li>${IOVO.io_amt}</li>
		<li>${IOVO.io_tax}</li>
		<li>${IOVO.io_total}</li>
	</ul>
	<div id="det_io_btn_box">
		<button type="button">수정</button>
		<button type="button">삭제</button>
		<button type="button">리스트로</button>
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
										"#det_btn_box button:first-child")
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