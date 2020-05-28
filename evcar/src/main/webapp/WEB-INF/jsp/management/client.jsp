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
	<script type="text/javascript">
        function insertPopup() {
            // window.name = "부모창 이름";            
            window.name = "client.do";
            
            // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
            window.open("insertClient.do", "insert",
                    "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
        }
    </script>
	<table class="table table-board" border="1px" align="center">
		<tr>
			<td colspan="3">
				<a href="javascript:insertPopup();"> 등록</a>
			</td>
			<form action="<%=context%>/evmain.do">
				<input type="hidden" name ="id" value="client">
				<td colspan="2" align="right">고객 명 <input type="text" name="search">
				<button type="submit" >조회</button></td>
			</form>
			
		</tr>
		<tr>
			<td> 구분 </td>
			<td> 고객명 </td>
			<td> 사업자번호/생년월일 </td>
			<td> 전화번호 </td>
			<td> 팩스번호 </td>
		</tr>
		<c:forEach items="${client}" var ="client">
			<tr>
				<td> ${client.custTp} </td>
				<td> <a href="<%=context%>/evmain.do?custId=${client.custId}&id=updateClient">${client.custNm}</td>
				<td> ${client.bizTaxId} </td>
				<td> ${client.tel} </td>
				<td> ${client.fax} </td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>