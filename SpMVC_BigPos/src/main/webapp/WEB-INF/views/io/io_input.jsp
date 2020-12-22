<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 매입매출을 입력</title>
<style>
.hidden {
	display: none;
}

body {
	text-align: center;
}

#dept_pop {
	display: none;
	width: 700px;
	height: 700px;
	border: 5px dashed black;
	width: 700px;
}

#io_dept_table {
	width: 100%;
	border-collapse: collapse;
}

#io_dept_table caption {
	font-size: 30px;
	margin: 30px 0px;
	font-weight: bolder;
}

#io_dept_table th {
	padding: 8px 0px;
}

#io_dept_table td {
	border: 1px solid black;
	padding: 5px 0px;
}

#io_dept_table tbody tr {
	cursor: pointer;
	transition: all 0.3s;
}

#io_dept_table tbody tr:hover {
	background-color: #ddd;
}

#product_pop {
	display: none;
	width: 700px;
	height: 700px;
	border: 5px dashed black;
	width: 700px;
}

#io_product_table {
	width: 100%;
	border-collapse: collapse;
}

#io_product_table caption {
	font-size: 30px;
	margin: 30px 0px;
	font-weight: bolder;
}

#io_product_table th {
	padding: 8px 0px;
}

#io_product_table td {
	border: 1px solid black;
	padding: 5px 0px;
}

#io_product_table tbody tr {
	cursor: pointer;
	transition: all 0.3s;
}

#io_product_table tbody tr:hover {
	background-color: #ddd
}

fieldset {
	display: inline-block;
	border: 5px solid black;
	border-radius: 10px;
	width: 700px;
	padding: 20px;
	text-align: left;
}

legend {
	font-size: 30px;
	font-weight: bolder;
}

form div {
	margin: 10px 0px;
	font-size: 20px;
}

form input {
	padding: 5px;
}

#io_input_btn_box button {
	padding: 10px;
	color: white;
	background-color: navy;
	border: none;
	outline: none;
	border-radius: 10px;
	font-weight: bold;
	transition: all 0.5s;
}

#io_input_btn_box button:nth-child(1):hover {
	background-color: cornflowerblue;
}

#io_input_btn_box button:nth-child(2):hover {
	background-color: yellowgreen;
}

#close_product_pop, #close_dept_pop {
	background-color: crimson;
	color: white;
	padding: 5px;
}
</style>
</head>
<body>
	<fieldset>
		<legend>여기는 매입매출 입력창이지롱</legend>
		<form id="io_form" method="POST">
			<div>
				<label>거래일(필수) : </label><input id="io_date" type="date"
					name="io_date" value="${DATE}" />
			</div>
			<div>
				<label>거래시각(필수) : </label><input id="io_time" type="time"
					name="io_time" value="${TIME}" />
			</div>
			<div>
				<label id="dcode">거래처코드(필수) : </label>
				<button id="d_select" type="button">거래처 선택</button>
				<input class="hidden" id="io_dcode" name="io_dcode"
					value="${IOVO.io_dcode}" />
			</div>
			<div>
				<label>거래구분(필수) : </label>
				<button id="in_or_out" type="button">이 버튼을 클릭하지 않고 이대로 놔두면
					매입으로 기록됩니다</button>
				<input class="hidden" id="io_inout" name="io_inout"
					value="${IOVO.io_inout}" />
			</div>
			<div>
				<label id="pcode">상품코드(필수) : </label>
				<button id="p_select" type="button">상품선택</button>
				<input class="hidden" id="io_pcode" name="io_pcode"
					value="${IOVO.io_pcode}" />
			</div>
			<div>
				<label id="tax_show">과세여부(필수) :</label><input class="hidden"
					id="io_vat" name="io_vat" value="${IOVO.io_vat}" />
			</div>
			<div>
				<label>수량(필수) : </label><input type="number" min="1" id="io_qty"
					name="io_qty" value="${IOVO.io_qty}" />
			</div>
			<div>
				<label>단가(필수) : </label><input type="number" min="0" id="io_price"
					name="io_price" value="${IOVO.io_price}" />
			</div>
			<div class="hidden">
				<label>금액 : </label><input id="io_amt" name="io_amt"
					value="${IOVO.io_amt}" />
			</div>
			<div class="hidden">
				<label>세액 : </label><input id="io_tax" name="io_tax"
					value="${IOVO.io_tax}" />
			</div>
			<div class="hidden">
				<label>합계 : </label><input id="io_total" name="io_total"
					value="${IOVO.io_total}" />
			</div>
			<div id="io_input_btn_box">
				<button type="button">매입매출 정보 저장</button>
				<button type="button">리스트로</button>
			</div>
		</form>

	</fieldset>
	<div>
		<div id="dept_pop">
			<button id="close_dept_pop" type="button">닫기</button>
			<div>
				<table id="io_dept_table">
					<caption>거래처 선택</caption>
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
			</div>
		</div>
	</div>

	<div id="product_pop">
		<button id="close_product_pop">닫기</button>
		<table id="io_product_table">
			<caption>상품 선택</caption>
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
					<tr class="pro_item" data-id="${items.p_code}"
						data-texing="${items.p_vat}">
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
	</div>
</body>

<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						// 리스트로 버튼 스크립트 시작
						document
								.querySelector(
										"#io_input_btn_box button:nth-child(2)")
								.addEventListener(
										"click",
										function() {
											document.location.href = "${rootPath}/io/list";
										})
						// 리스트로 버튼 스크립트 끝

						// 선택된 tag 변수들 시작
						let io_form = document.querySelector("#io_form");
						let io_seq = document.querySelector("#io_seq");
						let io_date = document.querySelector("#io_date");
						let io_time = document.querySelector("#io_time");
						let io_dcode = document.querySelector("#io_dcode");
						let io_inout = document.querySelector("#io_inout");
						let io_pcode = document.querySelector("#io_pcode");
						let io_vat = document.querySelector("#io_vat");
						let io_qty = document.querySelector("#io_qty");
						let io_price = document.querySelector("#io_price");
						let io_amt = document.querySelector("#io_amt");
						let io_tax = document.querySelector("#io_tax");
						let tax_show = document.querySelector("#tax_show")
						let io_total = document.querySelector("#io_total");

						let d_select = document.querySelector("#d_select");
						let p_select = document.querySelector("#p_select");

						let product_pop = document
								.querySelector("#product_pop");
						let dept_pop = document.querySelector("#dept_pop");

						let in_or_out = document.querySelector("#in_or_out");
						// 선택된 tag 변수들 끝

						if (io_tax.value === "") {
							io_tax.value = 0; // 세액 기초설정
						}

						if (io_inout.value === "") {
							io_inout.value = 1; // 매입매출 기초설정
						}

						// 업데이트시 디스플레이 설정 스크립트 시작
						document.querySelector("#dcode").innerText = "거래처코드 : "
								+ io_dcode.value;
						document.querySelector("#pcode").innerText = "상품코드 : "
								+ io_pcode.value;

						if (io_inout.value == 1) {
							document.querySelector("#in_or_out").innerText = "이 버튼을 클릭하지 않고 이대로 놔두면 매입으로 기록됩니다"
						} else if (io_inout.value == 2) {
							document.querySelector("#in_or_out").innerText = "이 버튼을 클릭하지 않고 이대로 놔두면 매출로 기록됩니다"
						} else {
							alert("스크립트 오류! 쩔쩔이를 비난하세요 ><")
							document.location.href = "${rootPath}/javascriptiswrong"
							return false;
						}

						if (io_vat.value == 1) {
							tax_show.innerText = "과세여부 : 과세상품";
						} else if (io_vat.value == 2) {
							tax_show.innerText = "과세여부 : 면세상품";
						}
						// 업데이트시 디스플레이 설정 스크립트 끝

						// 거래처 팝업 스크립트 시작
						d_select.addEventListener("click", function() {
							product_pop.style.display = "none";
							dept_pop.style.display = "inline-block";
						})
						// 거래처 팝업 스크립트 끝

						// 상풉 팝업 스크립트 시작
						p_select.addEventListener("click", function() {
							dept_pop.style.display = "none";
							product_pop.style.display = "inline-block";
						})
						// 상풉 팝업 스크립트 끝

						// 팝업 닫기 스크립트 시작
						document.querySelector("#close_dept_pop")
								.addEventListener("click", function() {
									dept_pop.style.display = "none";
								})
						document.querySelector("#close_product_pop")
								.addEventListener("click", function() {
									product_pop.style.display = "none";
								})
						// 팝업 닫기 스크립트 끝

						//거래처 선택 스크립트 시작
						document
								.querySelector("table#io_dept_table")
								.addEventListener(
										"click",
										function(e) {
											let id = e.target.closest("TR").dataset.id;

											document.querySelector("#dcode").innerText = "거래처코드 : "
													+ id;
											io_dcode.value = id;
											dept_pop.style.display = "none";
										})
						//거래처 선택 스크립트 끝

						// 상품선택 스크립트 시작
						document
								.querySelector("table#io_product_table")
								.addEventListener(
										"click",
										function(e) {
											let id = e.target.closest("TR").dataset.id;
											let texing = e.target.closest("TR").dataset.texing;

											document.querySelector("#pcode").innerText = "상품코드 : "
													+ id;
											io_pcode.value = id;

											io_vat.value = texing;

											if (io_vat.value == 1) {
												tax_show.innerText = "과세여부 : 과세상품";
											} else if (io_vat.value == 2) {
												tax_show.innerText = "과세여부 : 면세상품";
											} else {
												alert("쩔쩔이가 변수 설정을 멍청하게 해놨어요... 메일로 응징합시다 ><");
												document.location.href = "${rootPath}/javascriptiswrong"
												return false
											}
											product_pop.style.display = "none";
										})
						// 상품선택 스크립트 끝

						// 매입매출 거래구분 토글 스크립트 시작
						let inout_toggle = 7;
						document
								.querySelector("#in_or_out")
								.addEventListener(
										"click",
										function() {
											inout_toggle = inout_toggle * -1;
											if (inout_toggle == 7) {
												in_or_out.innerText = "이 버튼을 클릭하지 않고 이대로 놔두면 매입으로 기록됩니다"
												io_inout.value = 1;
											} else if (inout_toggle == -7) {
												in_or_out.innerText = "이 버튼을 클릭하지 않고 이대로 놔두면 매출로 기록됩니다"
												io_inout.value = 2;
											} else {
												alert("스크립트 변수설정 폭★8 쩔쩔이한테 고치라고 하세요 ><");
												document.location.href = "${rootPath}/javascriptiswrong"
												return false;
											}
										})
						// 매입매출 거래구분 토글 스크립트 끝

						// 저장버튼 스크립트 시작
						document
								.querySelector(
										"#io_input_btn_box button:first-child")
								.addEventListener(
										"click",
										function() {

											// 날짜 유효성검사 스크립트 시작
											if (io_date.value.length > 10) {
												alert("쩔쩔이는 이 프로그램을 21세기에 만들었어요...\n본인이 100세기 이후에 살고있다면 이 앱에서 갈아타세요 ><")
												io_date.focus();
												return false;
											}
											// 날짜 유효성검사 스크립트 끝

											// 수량 유효성검사 스크립트 시작
											if (io_qty.value === "") {
												alert("수량에는 1이상의 숫자만 써서 올바르게 입력해주세요 ><");
												io_qty.focus();
												return false;
											}
											// 수량 유효성검사 스크립트 끝

											// 단가 유효성검사 스크립트 시작
											if (io_price.value === "") {
												alert("단가는 1이상의 숫자만으로 올바르게 입력해주세요 ><");
												io_price.focus();
												return false;
											}
											// 단가 유효성검사 스크립트 끝

											// 거래구분 스크립트 시작
											if (inout_toggle == 7) {
												io_inout.value = 1;
											} else if (inout_toggle == -7) {
												io_inout.value = 2;
											} else {
												alert("쩔쩔이가 변수설정을 잘못했어요!\n메일을 보내서 혼내줍시다 ><");
												document.location.href = "${rootPath}/javascriptiswrong";
												return false;
											}
											// 거래구분 스크립트 끝

											// 금액설정 스크립트 시작
											io_amt.value = io_qty.value
													* io_price.value;
											// 금액설정 스크립트 끝

											// 세금계산 스크립트 시작
											if (io_vat.value == 1) {
												let amt = Number(io_amt.value)
												io_tax.value = Math
														.round(amt * 0.1);
											}
											// 세금계산 스크립트 끝

											// 합계 계산 스크립트 시작
											io_total.value = Math
													.round(Number(io_amt.value)
															+ Number(io_tax.value));
											// 합계 계산 스크립트 끝

											// 거래처 유효성검사 시작
											if (io_dcode.value === "") {
												alert("거래처가 선택되지 않으면 기록할수 없어요 ><");
												return false;
											}
											// 거래처 유효성검사 끝

											// 상품코드 유효성검사 시작
											if (io_pcode.value === "") {
												alert("상품 선택되지 않으면 기록할수가 없어요 ><");
												return false;
											}
											// 상품코드 유효성검사 끝

											// 최종 확인과 submit 스크립트 시작
											if (confirm("결재금액 : "
													+ io_price.value
													* io_qty.value + "\n세액 : "
													+ io_tax.value
													+ "\n입출합계 : "
													+ io_total.value
													+ "\n저장하시겠습니까?")) {
												io_form.submit();
											}
											// 최종 확인과 submit 스크립트 끝

										})
						// 저장버튼 스크립트 끝

					})
</script>
</html>