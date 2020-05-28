<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String context = request.getContextPath(); %>
	<form method="post" action="<%=context%>/main.do">
		<input type = text name="id">
		<button type = submit name ="station" >충전소 관리</button>
	</form>
	
	<form method="post" action="<%=context%>/main.do">
		<input type = text name="id">
		<button type = submit name ="client" >고객 관리</button>
	</form>
</body>
</html>