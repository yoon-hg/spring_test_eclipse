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
		<form action="<%=context%>/updateClient.do" method="post" target="client.do">
		<c:forEach items="${client}" var="client">
			<div class="createForm">
				<label>고객 ID</label>
				<input type="text" name="cust_id" class="createForm" value="${client.custId}">
			</div>
			<div class="createForm">
				<label>충전사업자 ID</label>
				<input type="text" name="provider_id" class="createForm" value="${client.providerId}">
			</div>
			<div class="createForm">
				<label>고객명</label>
				<input type="text" name="cust_nm" class="createForm" value="${client.custNm}">
			</div>
			<div class="createForm">
				<label>구분</label>
				<input type="text" name="cust_tp" class="createForm" value="${client.custTp}">
			</div>
			<div class="createForm">
				<label>전화번호</label>
				<input type="text" name="tel" class="createForm" value="${client.tel}">
			</div>
			<div class="createForm">
				<label>팩스</label>
				<input type="text" name="fax" class="createForm" value="${client.fax}">
			</div>
			<div class="Formfooter">
				<input type="submit" class="btn_button">
				<a href="<%=context%>/deleteClient.do?custId=${client.custId}">삭제하기</a>
			</div>
			</c:forEach>
		</form>
	</table>
</body>
</html>