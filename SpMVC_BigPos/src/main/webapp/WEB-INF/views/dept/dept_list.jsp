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
#dept_holder {
	display: inline-block;
	width: 90%;
}

#dept_table {
	width: 100%;
	border-collapse: collapse;
}

#dept_table caption {
	font-size: 30px;
	margin: 30px 0px;
	font-weight: bolder;
}

#dept_table thead {
	border: 3px dashed gray;
	border-bottom: none;
}

#dept_table th {
	padding: 8px 0px;
}

#dept_table td {
	border: 1px solid black;
}

#to_dept_input {
	width: 90%;
	background-color: coral;
	font-size: 20px;
	font-weight: bolder;
	padding: 20px 0px;
	outline: none;
	border: none;
	font-size: 20px;
	font-weight: bolder;
	font-weight: bolder;
}

#to_dept_input:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<section id="dept_holder">
		<table id="dept_table">
			<caption>거래처들</caption>
			<thead>
				<tr>
					<th>거래처코드</th>
					<th>거래처명</th>
					<th>사업자번호</th>
					<th>대표자명</th>
					<th>대표전화</th>
					<th>주소</th>
					<th>주요품목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${DEPTLIST}" var="items" varStatus="i">
					<tr class="dept_item" data-id="${items.d_code}">
						<td>${items.d_code}</td>
						<td>${items.d_name}</td>
						<td>${items.d_sid}</td>
						<td>${items.d_ceo}</td>
						<td>${items.d_tel}</td>
						<td>${items.d_addr}</td>
						<td>${items.d_product}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
	<div>
		<button id="to_dept_input" type="button">새로운 거래처 추가하기</button>
	</div>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		setTimeout(function() {
			let Deep = document.querySelector("nav button:nth-child(2)");
			let Dark = document.querySelector("nav button:nth-child(3)");
			let Fantasy = document.querySelector("nav button:nth-child(4)");

			Deep.style.borderRadius = "0px 0px 15px 0px";
			Dark.style.borderRadius = "0px 0px 15px 15px";
			Dark.style.backgroundColor = "cornflowerblue";
			Fantasy.style.borderRadius = "0px 0px 0px 15px";
		}, 69);

		let to_insert = document.querySelector("#to_dept_input");
		to_insert.addEventListener("click", function() {
			document.location.href = "${rootPath}/dept/input";
		});
	});
</script>
</html>