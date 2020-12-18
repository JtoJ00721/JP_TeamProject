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
.hidden {
	display: none;
}
</style>
</head>
<body>
	<h1>여기는 매입매출 입력창이지롱</h1>
	<form>
		<div>
			<label>ID(필수) : </label><input id="io_seq" name="io_seq" />
		</div>
		<div>
			<label>거래일(필수) : </label><input id="io_date" name="io_date" />
		</div>
		<div>
			<label>거래시각(필수) : </label><input id="io_time" name="io_time" />
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
			<label>과세여부(필수) : </label><input class="hidden" id="io_vat" name="io_vat" />
		</div>
		<div>
			<label>수량(필수) : </label><input id="io_qty" name="io_qty" />
		</div>
		<div>
			<label>단가(필수) : </label><input id="io_price" name="io_price" />
		</div>
		<div>
			<label>금액 : </label><input id="io_amt" name="io_amt" />
		</div>
		<div>
			<label>세액 : </label><input name="io_tax" name="io_tax" />
		</div>
		<div>
			<label>합계 : </label><input name="io_total" name="io_total" />
		</div>
		<div id="io_input_btn_box">
			<button type="button">매입매출 정보 저장</button>
			<button type="button">리스트로</button>
		</div>
	</form>
</body>
</html>