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
	<h1>!신선한 상품정보!</h1>
	<form id="pro_form" method="POST">
		<div>
			<label>상품코드(필수) : </label><input id="p_code" name="p_code" value="${PROVO.p_code}"/>
		</div>
		<div>
			<label>상품명(필수) : </label><input id="p_name" name="p_name" value="${PROVO.p_name}" />
		</div>
		<div>
			<label>품목 : </label><input id="p_item" name="p_item" value="${PROVO.p_item}" />
		</div>
		<div>
			<label>제조원 : </label><input id="p_menuf" name="p_menuf" value="${PROVO.p_menuf}" />
		</div>
		<div>
			<label>주매입처 : </label><span id="is_select">아직 선택되지 않음</span><input
				class="hidden" id="p_dcode" name="p_dcode" value="${PROVO.p_dcode}" />
			<button id="find_dept" type="button">목록에서 찾기</button>
		</div>
		<div>
			<label class="hidden">과세구분(필수) : </label><input class="hidden"
				id="p_vat" name="p_vat"/>
			<button id="is_tex" type="button">여기를 클릭하지 않고 이대로 놔두면 과세
				상품으로 저장</button>
		</div>
		<div>
			<label>매입단가(필수) : </label><input id="iprice" name="p_iprice"  value="${PROVO.p_iprice}"/>
		</div>
		<div>
			<label>판매단가(필수) : </label><input id="oprice" name="p_oprice"  value="${PROVO.p_oprice}"/>
		</div>
		<div id="pro_form_btn">
			<button type="button" id="pro_insert">상품정보 저장하기</button>
			<button type="button" id="to_pro_list">입력 관두기</button>
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
						let form = document.querySelector("#pro_form");
						let save = document.querySelector("#pro_insert");

						let p_name = document.querySelector("#p_name");
						let p_item = document.querySelector("#p_item");
						let p_menuf = document.querySelector("#p_menuf");
						let p_dcode = document.querySelector("#p_dcode");
						let is_select = document.querySelector("#is_select");
						let p_code = document.querySelector("#p_code");

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
												is_tex.innerText = "여기를 클릭하지 않고 이대로 놔두면 과세 상품으로 저장"
											} else if (tex_toggle == -7) {
												is_tex.innerText = "여기를 클릭하지 않고 그대로 놔두면 면세 상품으로 저장"
											} else {
												alert("자바스크립트가\n엄청난 섬광과 천지를 뒤흔드는 듯한 폭음과 함께 그렇게 두동강이 났습니다\n쩔쩔이한테 고치라고 시키세요 ><")
												document.location.href = "${rootPath}/javascriptiswrong"
											}
										});
						// 세금 부과여부 토글버튼 스크립트 끝

						// 저장 버튼 클릭시 모든 유효성 검사와 submit 스크립트 시작
						save
								.addEventListener(
										"click",
										function() {

											// 상품코드 유효성 검사 시작
											if (p_code.value === "") {
												alert("상품코드를 입력해 주세요 ><");
												p_code.focus();
												return false;
											} else if (p_code.value.length != 13) {
												alert("상품코드는 EAN-13 바코드 구조로 띄어쓰기 없이 더도말고 덜도말고 13자! ><");
												p_code.focus();
												return false;
											} else if (isNaN(p_code.value)) {
												alert("상품코드는 숫자만 입력해 주세요 ><");
												p_code.focus();
												return false;
											}
											// 상품코드 유효성 검사 끝

											// 상품명 유효성검사 시작
											if (p_name.value === "") {
												alert("상품명은 반드시 입력해 주세요 ><");
												p_name.focus();
												return false;
											} else if (p_name.value.length > 50) {
												alert("이렇게 긴 상품 이름은 못 외워요!\n50자 이하로 적어주세요 ><");
												p_name.focus();
												return false;
											}
											// 상품명 유효성검사 끝

											//품목 유효성검사 시작
											if (p_item.value.length > 50) {
												alert("품목 내용이 너어무 길어서 제 머리가 아파요\n50자 이하로 입력해주세요 ><")
												p_item.focus();
												return false;
											}
											//품목 유효성검사 끝

											// 제조원 유효성검사 시작
											if (p_menuf.value.length > 50) {
												alert("제조원 이름의 길이가 제 머리의 용량을 뛰어넘었습니다...\n50자 이하로 줄여서 살려주세요 ><");
												p_menuf.focus();
												return false;
											}
											// 제조원 유효성검사 끝

											// 주매입처 값 설정 및 유효성 검사 시작
											if (is_select.innerText == "아직 선택되지 않음") {
												if (confirm("주매입처가 선택되지 않았습니다 그냥 둘까요? ><")) {
													p_dcode.value = "";
												} else {
													return false;
												}
											}

											// 과세 면세 구분 시작
											if (tex_toggle == 7) {
												p_vat.value = 1;
												alert("과세 상품으로 저장됩니다");
											} else if (tex_toggle == -7) {
												p_vat.value = 2;
												alert("면세 상품으로 저장됩니다");
											} else {
												alert("자바스크립트 폭★8\n멍청한 쩔쩔이놈이 고칠때까지 기다려야 합니다 ><")
												document.location.href = "${rootPath}/javascriptiswrong"
											}

											// 과세 면세 구분 끝

											// 매입, 판매 단가 검사 및 submit 시작
											if (iprice.value === "") {
												alert("매입단가는 반드시 입력해 주세요 ><")
												iprice.focus();
												return false
											} else if (isNaN(iprice.value)) {
												alert("매입단가는 반드시 정수만 입력해 주세요 ><");
												iprice.focus();
												return false;
											} else if (oprice.value === "") {
												alert("판매단가가 자동 계산됩니다");
												oprice.value = Math
														.round(((iprice.value * 1.1) * 1.22));
												if (isNaN(oprice.value)) {
													alert("판매단가는 반드시 정수만 입력해 주세요 ><");
													focus(oprice)
													return false;
												}
												form.submit();
											} else if (oprice.value < (iprice.value * 1.1)) {
												if (confirm("이렇게 팔면 남는게 없어요...\n저장해야 해요? ><")) {
													form.submit();
												} else {
													oprice.fucus();
													return false;
												}
											} else {
												form.submit();
											}
										});
						// 매입, 판매 단가 검사 및 submit 끝

						//  모든 유효성 검사와 submit 스크립트 끝

						// 입력 그만두고 리스트로 가기 스크립트 시작
						let quit = document.querySelector("#to_pro_list");
						quit
								.addEventListener(
										"click",
										function() {
											document.location.href = "${rootPath}/product/list";
										});
						// 입력 그만두고 리스트로 가기 스크립트 끝

						// 거래처 선택 팝업 관련 스크립트 시작

						// 팝업 열고닫기 스크립트 시작
						let close = document.querySelector("#close_pop");
						let popup = document.querySelector("#product_pop");

						let find_dept = document.querySelector("#find_dept");

						find_dept.addEventListener("click", function() {
							popup.style.display = "inline-block"
						})

						close.addEventListener("click", function() {
							popup.style.display = "none";
						})
						// 팝업 열고닫기 스크립트 끝

						// 팝업 리스트 항목 선택 스크립트 시작
						document.querySelector("table#pro_dept_table")
								.addEventListener("click", function(e) {
									let id = e.target.closest("TR").dataset.id;

									is_select.innerText = id;
									p_dcode.value = id;
									popup.style.display = "none";
								})
						// 팝업 리스트 항목 선택 스크립트 끝

						// 거래처 선택 팝업 관련 스크립트 끝

					})
</script>
</html>