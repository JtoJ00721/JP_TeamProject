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
	<h1>여기는 상품 상세보기지롱</h1>
	<div>
		<ul>
			<li>${PROVO.p_code}</li>
			<li>${PROVO.p_name}</li>
			<li>${PROVO.p_item}</li>
			<li>${PROVO.p_menuf}</li>
			<li>${PROVO.p_dcode}</li>
			<li>${PROVO.p_vat}</li>
			<li>${PROVO.p_iprice}</li>
			<li>${PROVO.p_oprice}</li>
		</ul>
	</div>
	<div id="det_pro_btn_box">
		<button type="button">수정</button>
		<button type="button">삭제</button>
		<button type="button">리스트로</button>
	</div>
</body>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		
		let id = document.querySelector("li:first-child").innerText;
		document.querySelector("#det_btn_box button:first-child")
				.addEventListener("click", function() {
					if(confirm("이 상품정보를 수정하실래요?")){
						document.location.href = "${rootPath}/product/update?id=" + id; 
					}
				})
				
		document.querySelector("#det_pro_btn_box button:nth-child(2)").addEventListener("click", function(){
			if(confirm("이 상품정보를 무자비하게 파괴하실 건가요? ><"))
			document.location.href = "${rootPath}/product/delete?id=" + id;
		})
		
		document.querySelector("#det_pro_btn_box button:nth-child(3)").addEventListener("click", function(){
			if(confirm("상품정보 리스트로 돌아가실래요? ><"))
			document.location.href = "${rootPath}/product/list";
		})
	})
</script>
</html>