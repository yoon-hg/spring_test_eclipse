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
	아이디 : <input type="text" name="id" value=${memberVO.user_id}> <br>
	비밀번호 : <input type="text" name="pw" value=${memberVO.user_pw}> <br>
	이름 : <input type="text" name="name" value=${memberVO.user_name}> <br>
	이메일 : <input type="text" name="email" value=${memberVO.user_email}> <br>
	<input type="submit" value="전송">
</form>
${list}

</body>
</html>