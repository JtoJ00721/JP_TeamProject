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
#in_holder {
	display: inline-block;
	width: 90%;
	height: auto;
}

#in_table {
	width: 100%;
	border-collapse: collapse;
}

#in_table caption {
	font-weight: bolder;
	font-size: 30px;
	margin: 30px 0px;
}

#in_table thead{
	border:3px dashed gray;
	border-bottom: none;
}

#in_table td {
	border: 1px solid black;
}

#in_table th {
	padding: 8px 0px;
}

#to_io_input {
	width: 90%;
	padding: 20px 0px;
	background-color: coral;
	font-size: 20px;
	font-weight: bolder;
	border:none;
	outline: none;
}

#to_io_input:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<section id="in_holder">
		<table id="in_table">
			<caption>최근 매입</caption>
			<thead>
				<tr>
					<th>거래일자</th>
					<th>상품명</th>
					<th>거래처</th>
					<th>대표</th>
					<th>수량</th>
					<th>매입단가</th>
					<th>매입금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</section>
	<div>
		<button id="to_io_input" type="button">새로운 매입매출 기록</button>
	</div>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		setTimeout(function() {
			let Deep = document.querySelector("nav button:first-child");
			let Dark = document.querySelector("nav button:nth-child(2)");
			let Fantasy = document.querySelector("nav button:nth-child(3)");

			Deep.style.borderRadius = "0px 0px 15px 0px";
			Dark.style.borderRadius = "0px 0px 15px 15px";
			Dark.style.backgroundColor = "cornflowerblue";
			Fantasy.style.borderRadius = "0px 0px 0px 15px";
		}, 69);
		
		let to_insert = document.querySelector("#to_io_input");
		to_insert.addEventListener("click", function(){
			document.location.href = "${rootPath}/io/input";
		});
	})
</script>
</html>