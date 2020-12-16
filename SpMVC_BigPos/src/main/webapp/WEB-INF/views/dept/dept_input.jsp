<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 제목을 넣어야 하지롱</title>
</head>
<body>
	<h1>여기는 거래처정보 입력창이지롱</h1>
	<form id="dept_form" method="POST">
		<div>
			<label>거래처코드</label><input name="d_code" />
		</div>
		<div>
			<label>거래처명</label><input name="d_name" />
		</div>
		<div>
			<label>사업자번호</label><input name="d_sid" />
		</div>
		<div>
			<label>대표자명</label><input name="d_ceo" />
		</div>
		<div>
			<label>대표전화</label><input name="d_tel" />
		</div>
		<div>
			<label>주소</label><input name="d_addr" />
		</div>
		<div>
			<label>주요품목</label><input name="d_product" />
		</div>
		<div id="dept_form_btn">
			<button id="dept_insert" type="button">거래처 저장하기</button>
			<button id="to_dept_list" type="button">입력 관두기</button>
		</div>
	</form>
</body>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		
		let form = document.querySelector("#dept_form");
		
		let save = document.querySelector("#dept_insert");
		let quit = document.querySelector("#to_dept_list");
		
		save.addEventListener("click", function(){
			form.submit();
		});
		
		quit.addEventListener("click", function(){
			document.location.href = "${rootPath}/dept/list"
		})
	});
</script>
</html>