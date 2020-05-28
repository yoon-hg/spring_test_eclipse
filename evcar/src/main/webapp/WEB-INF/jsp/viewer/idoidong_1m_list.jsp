<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이도이동 1월 합계</title>
</head>
<body>
	<table class="table table-board" border="1px" width="80%" align="center">
		<tr>
			<td>회사</td>
			<td>날짜</td>
			<td>총 충전 용량</td>
			<td>총 가격</td>
			<td>시</td>
			<td>동</td>
		</tr>
		<c:forEach items="${list}" var="total">
			<tr>
				<td>${total.bId}</td>
				<td>${total.rechgEstSdt}</td>
				<td>${total.rechgWEnergy}</td>
				<td>${total.cost}</td>
				<td>${total.pnuSiNm}</td>
				<td>${total.pnuDongNm}</td>
			</tr> 
		</c:forEach>
	</table>
</body>
</html>