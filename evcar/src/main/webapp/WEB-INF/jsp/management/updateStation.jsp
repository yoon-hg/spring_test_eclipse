<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<% String context = request.getContextPath(); %>
	<table>
		<form action="<%=context%>/updateStation.do" method="post">
		
		<c:forEach items="${station}" var="station">
			<div class="createForm">
				<label>충전소 ID</label>
				<input type="text" name="st_id" class="createForm" value="${station.stId}">
			</div>
			<div class="createForm">
				<label>충전소 명</label>
				<input type="text" name="st_nm" class="createForm" value="${station.stNm}">
			</div>
			<div class="createForm">
				<label>시</label>
				<input type="text" name="pnu_si_nm" class="createForm" value="${station.pnuSiNm}">
			</div>
			<div class="createForm">
				<label>도로명 주소</label>
				<input type="text" name="addr_rd_m" class="createForm" value="${station.addrRdM}">
			</div>
			<div class="createForm">
				<label>상세주소</label>
				<input type="text" name="addr_rd_d" class="createForm" value="${station.addrRdD}">
			</div>
			<div class="createForm">
				<label>지번주소</label>
				<input type="text" name="addr_ld_m" class="createForm" value="${station.addrLdM}">
			</div>
			<div class="createForm">
				<label>상세주소</label>
				<input type="text" name="addr_ld_d" class="createForm" value="${station.addrLdD}">
			</div>
			<div class="Formfooter">
				<button type="submit" class="btn_button" >작성하기</button>
				<a href="<%=context%>/deleteStation.do?stId=${station.stId}">삭제하기</a>
			</div>
			</c:forEach>
		</form>
	</table>
</body>
</html>