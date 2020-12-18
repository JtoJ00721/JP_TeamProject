<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 거래처 추가</title>
<style>
	.hidden {
		display: none;
	}
</style>
</head>
<body>
	<h1>!따끈한 거래처정보!</h1>
	<form id="dept_form" method="POST">
		<div class="hidden">
			<label>거래처 코드(필수) : </label><input id="d_code" name="d_code"
				value="${ID}" />
		</div>
		<div>
			<label>거래처명(필수) : </label><input id="d_name" name="d_name"
				value="${DEPTVO.d_name}" />
		</div>
		<div>
			<label>사업자번호(필수) : </label><input id="d_sid" name="d_sid"
				value="${DEPTVO.d_sid}" />
		</div>
		<div>
			<label>대표자명(필수) : </label><input id="d_ceo" name="d_ceo"
				value="${DEPTVO.d_ceo}" />
		</div>
		<div>
			<label>대표전화(필수) : </label><input id="d_tel" name="d_tel"
				value="${DEPTVO.d_tel}" />
		</div>
		<div>
			<label>주소 : </label><input id="d_addr" name="d_addr"
				value="${DEPTVO.d_addr}" />
		</div>
		<div>
			<label>주요품목 : </label><input id="d_product" name="d_product"
				value="${DEPTVO.d_product}" />
		</div>
		<div id="dept_form_btn">
			<button id="dept_insert" type="button">거래처정보 저장하기</button>
			<button id="to_dept_list" type="button">입력 관두기</button>
		</div>
	</form>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function() {

		let form = document.querySelector("#dept_form");

		let save = document.querySelector("#dept_insert");
		let quit = document.querySelector("#to_dept_list");

		let d_name = document.querySelector("#d_name");
		let d_sid = document.querySelector("#d_sid");
		let d_ceo = document.querySelector("#d_ceo");
		let d_tel = document.querySelector("#d_tel");
		let d_addr = document.querySelector("#d_addr");
		let d_product = document.querySelector("#d_product");

		// 저장버튼 클릭시 유효성 검사와 submit 스크립트 시작
		save.addEventListener("click", function() {

			// 거래처명 유효성 검사 시작
			if (d_name.value === "") {
				alert("거래처명은 반드시 입력해야 합니다 ><")
				d_name.focus();
				return false;
			} else if (d_name.value.length > 20) {
				alert("거래처 이름이 너무 길어서 까먹게 돼요\n제 거래처명 기억력은 20글자 까지에요 ><");
				d_name.focus();
				return false;
			}
			// 거래처명 유효성 검사 끝

			// 사업자번호 유효성검사 시작
			if (d_sid.value === "") {
				alert("사업자번호는 반드시 입력해야 합니다 ><");
				d_sid.focus();
				return false;
			} else if (d_sid.value.length > 13) {
				alert("사업자 번호는 13자 까지만! ><");
				d_sid.focus();
				return false;
			}
			// 사업자번호 유효성검사 끝

			// 대표자명 유효성검사 시작
			if (d_ceo.value === "") {
				alert("대표자명은 반드시 입력해야 합니다 ><");
				d_ceo.focus();
				return false;
			} else if (d_ceo.value.length > 20) {
				alert("이렇게 긴 대표자명은 머리에 담아둘수가 없어요\n20자 이하로 입력해 주세요 ><");
				d_ceo.focus();
				return false;
			}
			// 대표자명 유효성검사 끝

			// 대표전화 유효성검사 시작
			if (d_tel.value === "") {
				alert("대표전화는 반드시 입력해야 합니다 ><");
				d_tel.focus();
				return false;
			} else if (d_tel.value.length > 20) {
				alert("대표전화번호가 20글자가 넘어가면 제가 햇갈리기 시작합니다\n20자 이하로 줄여주세요 ><")
				d_tel.focus();
				return false;
			}
			// 대표전화 유효성검사 끝

			// 주소 유효성검사 시작
			if (d_addr.value.length > 125) {
				alert("주소가 너무 길어서 포스트잇이 모자라요\n 125자 이하로 입력해 주세요 ><");
				d_addr.focus();
				return false;
			}
			// 주소 유효성검사 끝

			// 주요품목 유효성검사 시작
			if (d_product.value.length > 125) {
				alert("주요품목 글자의 길이를 버틸수가 없습니다!\n125자 이하로 써주세요")
				d_product.focus();
				return false;
			}
			// 주요품목 유효성검사 끝
			form.submit();
		});
		// 저장버튼 클릭시 유효성 검사와 submit 스크립트 끝

		// 입력 그만두고 리스트로 돌아가기 스크립트 시작
		quit.addEventListener("click", function() {
			document.location.href = "${rootPath}/dept/list"
		})
		// 입력 그만두고 리스트로 돌아가기 스크립트 끝
	});
</script>
</html>