<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join test</title>
</head>
<body>
<h2>JOIN TEST</h2>
<table class="table table-board" border="1px" width="80%" align="center">
		<c:forEach items="${result}" var="list" varStatus="i">
			<tr>
				<td>${list.providerId}</td>
				<td>${list.stId}</td>
				<td>${list.chgrId}</td>
				<td>${list.chgrNm}</td>
				<td>${list.gpsXpos}</td>
				<td>${list.gpsYpos}</td>
				<td>${list.pnuNo}</td>
				<td>${list.doNm}</td>
				<td>${list.siNm}</td>
				<td>${list.dongNm}</td>
			</tr>
		</c:forEach>
</table>
</body>
</html>