<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매입매출 리스트</title>
<style>
#out_holder {
	display: inline-block;
	width: 80%;
	height: auto;
}

#out_table {
	width: 100%;
	border-collapse: collapse;
}

#out_table caption {
	font-weight: bolder;
	font-size: 30px;
	margin: 30px 0px;
}

#out_table thead {
	border: 3px dashed gray;
	border-bottom: none;
}

#out_table th {
	padding: 8px 0px;
}

#out_table td {
	border: 1px solid black;
	padding: 5px 0px;
}

#out_table tbody tr {
	transition: all 0.3s;
}

#out_table tbody tr:hover {
	background-color: #ddd;
}

#in_holder {
	display: inline-block;
	width: 80%;
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

#in_table thead {
	border: 3px dashed gray;
	border-bottom: none;
}

#in_table th {
	padding: 8px 0px;
}

#in_table tbody tr {
	transition: all 0.3s;
}

#in_table tbody tr:hover {
	background-color: #ddd;
}

#in_table td {
	border: 1px solid black;
	padding: 5px 0px;
}

#to_io_input {
	border: none;
	outline: none;
	width: 80%;
	font-size: 20px;
	font-weight: bolder;
	padding: 20px 0px;
	background-color: coral;
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
					<th>상품코드</th>
					<th>거래처코드</th>
					<th>수량</th>
					<th>매입단가</th>
					<th>매입금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${IN}" var="in" varStatus="i">
					<tr class="ining" data-price="${in.io_amt}" data-id="${in.io_seq}">
						<td>${in.io_date}</td>
						<td>${in.io_pcode}</td>
						<td>${in.io_dcode}</td>
						<td>${in.io_qty}</td>
						<td class="in_price">${in.io_price}</td>
						<td>${in.io_amt}</td>
					</tr>
				</c:forEach>
				<tr style="background-color: yellow">
					<td></td>
					<td>매입합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td class="all_in_price">0</td>
				</tr>
			</tbody>
		</table>
	</section>

	<section id="out_holder">
		<table class="items" id="out_table">
			<caption>최근 매출</caption>
			<thead>
				<tr>
					<th>거래일자</th>
					<th>상품코드</th>
					<th>거래처코드</th>
					<th>수량</th>
					<th>매출단가</th>
					<th>매출금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${OUT}" var="out" varStatus="i">
					<tr class="outing" data-price="${out.io_amt}" data-id="${out.io_seq}">
						<td>${out.io_date}</td>
						<td>${out.io_pcode}</td>
						<td>${out.io_dcode}</td>
						<td>${out.io_qty}</td>
						<td class="out_price">${out.io_price}</td>
						<td>${out.io_amt}</td>
					</tr>
				</c:forEach>

				<tr style="background-color: yellow">
					<td></td>
					<td>매출액합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td class="all_out_price">0</td>
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
			// header와 nav 효과 스크립트 시작
			let Deep = document.querySelector("nav button:first-child");
			let Dark = document.querySelector("nav button:nth-child(2)");
			let Fantasy = document.querySelector("nav button:nth-child(3)");

			Deep.style.borderRadius = "0px 0px 15px 0px";
			Dark.style.borderRadius = "0px 0px 15px 15px";
			Dark.style.backgroundColor = "cornflowerblue";
			Fantasy.style.borderRadius = "0px 0px 0px 15px";
			// header와 nav 효과 스크립트 끝

			// 합계계산 스크립트 시작
			let io_in = document.querySelectorAll(".ining");
			let io_out = document.querySelectorAll(".outing");

			let in_total = 0;
			let out_total = 0;

			io_in.forEach(function(item_data) {
				in_total += Number(item_data.dataset.price);
			});

			io_out.forEach(function(item_data) {
				out_total += Number(item_data.dataset.price);
			});

			document.querySelector(".all_in_price").innerText = in_total;
			document.querySelector(".all_out_price").innerHTML = out_total;
			// 합계계산 스크립트 끝

		}, 69);

		let to_insert = document.querySelector("#to_io_input");
		to_insert.addEventListener("click", function() {
			document.location.href = "${rootPath}/io/input";
		});

		// 디테일보기 이동 스크립트 시작
		document.querySelector("table#in_table").addEventListener(
				"click",
				function(e) {
					let id = e.target.closest("TR").dataset.id;
					if(id === undefined) {
						return false;
					}
					if (confirm("매입매출정보 : " + id + " 의 정보를 자세히 보고 조작하실래요?")) {
						document.location.href = "${rootPath}/io/detail?id="
								+ id;
					}
				})

		document.querySelector("table#out_table").addEventListener(
				"click",
				function(e) {
					let id = e.target.closest("TR").dataset.id;
					if(id === undefined) {
						return false;
					}
					if (confirm("매입매출정보 : " + id + " 의 정보를 자세히 보고 조작하실래요?")) {
						document.location.href = "${rootPath}/io/detail?id="
								+ id;
					}
				})
		// 디테일보기 이동 스크립트 끝

	})
</script>
</html>