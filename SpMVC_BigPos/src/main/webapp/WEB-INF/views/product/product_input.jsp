<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 상품 추가</title>
<style>
.hidden {
	display: none;
}
</style>
</head>
<body>
	<h1>여기는 상품정보 입력창이지롱</h1>
	<form id="pro_form" method="POST">
		<div>
			<label>상품코드</label><input id="p_code" name="p_code" />
		</div>
		<div>
			<label>상품명</label><input id="p_name" name="p_name" />
		</div>
		<div>
			<label>품목</label><input id="p_item" name="p_item" />
		</div>
		<div>
			<label>제조원</label><input id="p_menuf" name="p_menuf" />
		</div>
		<div>
			<label>주매입처</label><input id="p_dcode" name="p_dcode" />
		</div>
		<div>
			<label class="hidden">과세구분</label><input class="hidden" id="p_vat"
				name="p_vat" />
			<button id="is_tex" type="button">현재 이 상품은 세금이 부과되어 있음</button>
		</div>
		<div>
			<label>매입단가</label><input id="iprice" name="p_iprice" />
		</div>
		<div>
			<label>판매단가</label><input id="oprice" name="p_oprice" />
		</div>
		<div id="pro_form_btn">
			<button type="button" id="pro_insert">상품 저장하기</button>
			<button type="button" id="to_pro_list">입력 관두기</button>
		</div>
	</form>
</body>
<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						let form = document.querySelector("#pro_form");
						let save = document.querySelector("#pro_insert");

						let p_name = document.querySelector("#p_name");

						let iprice = document.querySelector("#iprice");
						let oprice = document.querySelector("#oprice");

						let p_vat = document.querySelector("#p_vat");
						let is_tex = document.querySelector("#is_tex");
						let tex_toggle = 7;

						// 세금 부과여부 토글버튼 스크립트 시작
						is_tex
								.addEventListener(
										"click",
										function() {
											tex_toggle = (tex_toggle * -1);
											if (tex_toggle == 7) {
												is_tex.innerText = "현재 이 상품은 세금이 부과되어 있음"
											} else if (tex_toggle == -7) {
												is_tex.innerText = "현재 이 상품은 면세상품임 개꿀"
											} else {
												alert("자바스크립트가 엄청난 섬광과 천지를 뒤엎는듯한 폭음과 함께 그렇게 두동강이 났습니다 쩔쩔이한테 고치라고 시키세요 ><")
												document.location.href = "${rootPath}/javascriptiswrong"
											}
										});
						// 세금 부과여부 토글버튼 스크립트 끝

						// 모든 유효성 검사와 submit 스크립트 시작
						save.addEventListener("click", function() {

							// 상품명 유효성검사 시작
							if (p_name.value === "") {
								alert("상품명은 반드시 입력해 주세요 ><");
								p_name.focus();
								return false;
							} else if (p_name.value.length > 1300) {
								alert("이렇게 긴 이름은 농농이가 못 외워요! ><");
								p_name.focus();
								return false;
							}
							// 상품명 유효성검사 끝

							// 과세 면세 구분 시작
							if (tex_toggle == 7) {
								p_vat.value = 1;
								alert("과세 상품으로 저장됩니다");
							} else if (tex_toggle == -7) {
								p_vat.value = 2;
								alert("면세 상품으로 저장됩니다");
							} else {
								alert("자바스크립트 폭★8 멍청한 쩔쩔이놈이 고칠때까지 기다려야 합니다 ><")
								document.location.href = "${rootPath}/javascriptiswrong"
							}
							;
							// 과세 면세 구분 끝

							// 판매 단가 검사 및 submit 시작
							if (oprice.value === "") {
								alert("판매단가가 자동 계산됩니다");
								oprice.value = Math
										.round(((iprice.value * 1.1) * 1.22));
								form.submit();
							} else if (oprice.value < (iprice.value * 1.1)) {
								if (confirm("이렇게 팔면 남는게 없어요... 저장해야 해요? ><")) {
									form.submit();
								} else {
									oprice.fucus();
									return false;
								}
							} else {
								form.submit();
							}
						});
						// 판매 단가 검사 및 submit 끝

						//  모든 유효성 검사와 submit 스크립트 끝

						// 
						let quit = document.querySelector("#to_pro_list");
						quit
								.addEventListener(
										"click",
										function() {
											document.location.href = "${rootPath}/product/list";
										});

					})
</script>
</html>