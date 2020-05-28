<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이도이동 목록</title>
</head>
<body>
	<table class="table table-board" border="1px" width="50%" align="center">
		<tr>
			<td>회사</td>
			<td>stID</td>
			<td>chargeID</td>
			<td>날짜</td>
			<td>충전 용량</td>
			<td>가격</td>
			<td>시</td>
			<td>동</td>
		</tr>
		<c:forEach items = "${list}" var="charge">
			<tr>
				<td>${charge.bId}</td>
				<td>${charge.stId}</td>
				<td>${charge.chgrId}</td>
				<td>${charge.rechgEstFnshDt}</td>
				<td>${charge.rechgWEnergy}</td>
				<td>${charge.cost}</td>
				<td>${charge.pnuSiNm}</td>
				<td>${charge.pnuDongNm}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>