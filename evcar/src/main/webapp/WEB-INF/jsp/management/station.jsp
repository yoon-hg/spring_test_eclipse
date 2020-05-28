<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var pagination1 = new tui.Pagination('pagination1', {
    totalItems: 500,
    itemsPerPage: 10,
    visiblePages: 5
});



</script>

</head>
<body>
	<div id="selected_menu" style="text-align:left; margin-top: 20px; font-family: LG PC ">
		<b>기본정보관리</b>
		<b>></b>
		<b>충전소관리</b>
	</div>
<% String context = request.getContextPath(); %>
	<script type="text/javascript">
        function insertPopup() {
            // window.name = "부모창 이름";            
            window.name = "station.do";
            
            // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
            window.open("insertStation.do", "insert",
                    "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
        }
    </script>

	<table class="table table-board" border="1px" align="center">
		<tr>
			<td colspan="4"><a href="javascript:insertPopup();"> 등록</a></td>
			
			<form action="<%=context%>/evmain.do">
				<input type="hidden" name ="id" value="station">
				<td colspan="2" align="right">충전소 명 <input type="text" name="search">
				<button type="submit" >조회</button></td>
			</form>
			
		</tr>
		<tr>
			<td>충전소ID</td>
			<td>충전소명</td>
			<td>도로명주소</td>
			<td>상세주소</td>
			<td>지번주소</td>
			<td>상세주소</td>
		</tr>
		<c:forEach items="${list}" var="station">
			<tr>
				<td>${station.stId}</td>
				<td><a href="<%=context%>/evmain.do?stId=${station.stId}&id=updateStation">${station.stNm}</td>
				<td>${station.addrRdM}</td>
				<td>${station.addrRdD}</td>
				<td>${station.addrLdM}</td>
				<td>${station.addrLdD}</td>
			</tr>
		</c:forEach>
		<div id="pagination" class="tui-pagination"></div>
	</table>
</body>
</html>