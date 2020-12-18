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
</style>
</head>
<body>
	<h1>여기는 매입매출 입력창이지롱</h1>
	<form>
		<div>
			<label>거래일(필수) : </label><input id="io_date" type="date" name="io_date" value="${DATE}"/>
		</div>
		<div>
			<label>거래시각(필수) : </label><input id="io_time" type="time" name="io_time" value="${TIME}"/>
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
			<label>과세여부(필수) : </label><input class="hidden" id="io_vat"
				name="io_vat" />
		</div>
		<div>
			<label>수량(필수) : </label><input type="number" min="1" id="io_qty" name="io_qty" />
		</div>
		<div>
			<label>단가(필수) : </label><input type="number" min="0" id="io_price" name="io_price" />
		</div>
		<div class="hidden">
			<label>금액 : </label><input id="io_amt" name="io_amt" />
		</div>
		<div class="hidden">
			<label>세액 : </label><input name="io_tax" name="io_tax" />
		</div>
		<div class="hidden">
			<label>합계 : </label><input name="io_total" name="io_total" />
		</div>
		<div id="io_input_btn_box">
			<button type="button">매입매출 정보 저장</button>
			<button type="button">리스트로</button>
		</div>
	</form>
</body>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		// 리스트로 버튼 스크립트 시작
		document.querySelector("#io_input_btn_box button:nth-child(2)")
				.addEventListener("click", function() {
					document.location.href = "${rootPath}/io/list/in";
				})
		// 리스트로 버튼 스크립트 끝

		// 선택된 tag 변수들 시작
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
		let io_total = document.querySelector("#io_total");
		// 선택된 tag 변수들 끝

		// 저장버튼 스크립트 시작
		document.querySelector("#io_input_btn_box button:first-child")
				.addEventListener("click", function() {
					
				})
		// 저장버튼 스크립트 끝

	})
</script>
</html>