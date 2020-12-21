<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 제목을 넣어야 하지롱</title>
<style>
#product_holder {
	display: inline-block;
	width: 90%;
}

#product_table {
	width: 100%;
	border-collapse: collapse;
}

#product_table caption {
	font-size: 30px;
	font-weight: bolder;
	margin: 30px 0px;
}

#product_table thead {
	border: 3px dashed gray;
	border-bottom: none;
}

#product_table th {
	padding: 8px 0px;
}

#product_table td {
	border: 1px solid black;
	padding: 5px 0px;
}

#product_table tr {
	transition: all 0.3s;
}

#product_table tbody tr:hover {
	background-color: #ddd;
}

#to_pro_insert {
	width: 90%;
	font-size: 20px;
	font-weight: bolder;
	padding: 20px 0px;
	background-color: coral;
	border: none;
	outline: none;
}

#to_pro_insert:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<section id="product_holder">
		<table id="product_table">
			<caption>사고파는 상품 목록</caption>
			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>품목</th>
					<th>제조원</th>
					<th>주매입처</th>
					<th>과세구분</th>
					<th>매입단가</th>
					<th>판매단가</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${PROLIST}" var="items" varStatus="i">
					<tr class="pro_item" data-id="${items.p_code}">
						<td>${items.p_code}</td>
						<td>${items.p_name}</td>
						<td>${items.p_item}</td>
						<td>${items.p_menuf}</td>
						<td>${items.p_dcode}</td>
						<td>${items.p_vat}</td>
						<td>${items.p_iprice}</td>
						<td>${items.p_oprice}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
	<div>
		<button id="to_pro_insert">새 상품 추가하기</button>
	</div>
</body>

<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {

						// 헤더와 네비 효과 스크립트 시작
						setTimeout(function() {
							let Deep = document
									.querySelector("nav button:nth-child(3)");
							let Dark = document
									.querySelector("nav button:nth-child(4)");
							let Fantasy = document
									.querySelector("nav button:nth-child(5)");

							Deep.style.borderRadius = "0px 0px 15px 0px";
							Dark.style.borderRadius = "0px 0px 15px 15px";
							Dark.style.backgroundColor = "cornflowerblue";
							Fantasy.style.borderRadius = "0px 0px 0px 15px";

						}, 69);
						// 헤더와 네비 효과 스크립트 끝

						// 상품정보 상세보기로 이동 스크립트 시작
						document
								.querySelector("table#product_table")
								.addEventListener(
										"click",
										function(e) {
											let id = e.target.closest("TR").dataset.id;
											if (id === undefined || id === "") {
												return false;
											}
											if (confirm("상품코드 : " + id
													+ " 의 정보를 자세히 보고 조작하실래요?")) {
												document.location.href = "${rootPath}/product/detail?id="
														+ id;
											}
										})
						// 상품정보 상세보기로 이동 스크립트 끝

						// 새로운 상품추가로 이동 스크립트 시작
						let to_insert = document
								.querySelector("#to_pro_insert");
						to_insert
								.addEventListener(
										"click",
										function() {
											document.location.href = "${rootPath}/product/input"
										})
						// 새로운 상품추가로 이동 스크립트 끝
					})
</script>
</html>