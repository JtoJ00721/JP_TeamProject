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

#product_pop {
	display: none;
	width: 700px;
	height: 700px;
	border: 5px dashed black;
	width: 700px;
}

#pro_dept_table {
	width: 100%;
	border-collapse: collapse;
}

#pro_dept_table caption {
	font-size: 30px;
	margin: 30px 0px;
	font-weight: bolder;
}

#pro_dept_table th {
	padding: 8px 0px;
}

#pro_dept_table td {
	border: 1px solid black;
	padding: 5px 0px;
}

#pro_dept_table tbody tr {
	transition: all 0.3s;
}

#pro_dept_table tbody tr:hover {
	background-color: #ddd
}
</style>
</head>
<body>
	<h1>여기는 매입매출 입력창이지롱</h1>
	<form id="io_form">
		<div>
			<label>거래날짜(필수) : </label><input id="io_date" type="date"
				name="io_date" value="${DATE}" />
		</div>
		<div>
			<label>거래시각(필수) : </label><input id="io_time" type="time"
				name="io_time" value="${TIME}" />
		</div>
		<div>
			<label>거래처코드(필수) : </label>
			<button id="d_select" type="button">거래처 선택</button>
			<input class="hidden" id="io_dcode" name="io_dcode" />
		</div>
		<div>
			<label>거래구분(필수) : </label>
			<button id="in_or_out" type="button">이 버튼을 클릭하지 않고 이대로 놔두면
				매입으로 기록됩니다</button>
			<input class="hidden" id="io_inout" name="io_inout" />
		</div>
		<div>
			<label>상품코드(필수) : </label>
			<button type="button">상품선택</button>
			<input class="hidden" id="io_pcode" name="io_pcode" />
		</div>
		<div>
			<label id="tex_show">과세여부(필수) :</label><input class="hidden"
				id="io_vat" name="io_vat" />
		</div>
		<div>
			<label>수량(필수) : </label><input type="number" min="1" id="io_qty"
				name="io_qty" />
		</div>
		<div>
			<label>단가(필수) : </label><input type="number" min="0" id="io_price"
				name="io_price" value="" />
		</div>
		<div class="hidden">
			<label>금액 : </label><input id="io_amt" name="io_amt" />
		</div>
		<div class="hidden">
			<label>세액 : </label><input id="io_tax" name="io_tax" />
		</div>
		<div class="hidden">
			<label>합계 : </label><input id="io_total" name="io_total" />
		</div>
		<div id="io_input_btn_box">
			<button type="button">매입매출 정보 저장</button>
			<button type="button">리스트로</button>
		</div>
	</form>

	<div id="product_pop">
		<button id="close_pop" type="button">나가기</button>
		<div>
			<table id="pro_dept_table">
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
											document.location.href = "${rootPath}/io/list/in";
										})
						// 리스트로 버튼 스크립트 끝

						// 선택된 tag 변수들 시작
						let io_form = document.querySelector("io_form");
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
						let tex_show = document.querySelector("#tex_show")
						let io_total = document.querySelector("#io_total");
						// 선택된 tag 변수들 끝

						io_vat.value = 1; // 과세여부 기초설정

						// 매입매출 거래구분 토글 스크립트 시작
						let inout_toggle = 8;
						document.querySelector("#in_or_out").addEventListener(
								"click", function() {
									inout_toggle = inout_toggle * -1;
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
														.round(amt * 1.1);
											}
											// 세금계산 스크립트 끝

											// 최종 확인과 submit 스크립트 시작
											if (confirm("결재금액 : "
													+ io_price.value
													* io_qty.value
													+ "\n세액 : "
													+ io_tax.value
													+ "\n입출합계 : "
													+ (Math.round(io_amt.value
															+ io_tax.value))
													+ "\n저장하시겠습니까?")) {
												//io_form.submit();
											}
											// 최종 확인과 submit 스크립트 끝

										})
						// 저장버튼 스크립트 끝

					})
</script>
</html>