<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>hi</h2>
<form action="test">
	���̵� : <input type="text" name="id" value=${memberVO.user_id}> <br>
	��й�ȣ : <input type="text" name="pw" value=${memberVO.user_pw}> <br>
	�̸� : <input type="text" name="name" value=${memberVO.user_name}> <br>
	�̸��� : <input type="text" name="email" value=${memberVO.user_email}> <br>
	<input type="submit" value="����">
</form>
${list}

</body>
</html>