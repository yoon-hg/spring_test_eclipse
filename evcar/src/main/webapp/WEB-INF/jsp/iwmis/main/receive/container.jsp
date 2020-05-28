<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.String" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
$(document).ready(function(){
	$('#close').on('click',function(){
		console.log("check");
		window.close();
	});
});
</script>
<style type="text/css">
table {
	margin-top:20px;
    width: 100%;
    border-top: 1px solid #d7d7d7;
    border-collapse: collapse;
    
  }
  th, td {
    border-bottom: 1px solid #d7d7d7;
    padding: 10px;
  }
  .center{
  	padding-top : 10px;
  	text-align:center;
  	margin:20px;
  }
  body{
  	font-family: LG PC;
  	margin:20px;
  }
  
</style>
</head>
<body>
<table style =" width: 800px; margin:auto;">
	<tr >
		<td id="stId" style="border-right :1px solid #d7d7d7;">${id.stId}</td>
		<td id="chgrNm" style="border-right :1px solid #d7d7d7;">${id.chgrNm}</td>
		<td id="cmdTp" style="border-right :1px solid #d7d7d7;">${id.cmdTp}</td>
		<td id="resDt">${id.resDt}</td>
	</tr>
	<tr style="text-align:center;">
		<td colspan="2">
			RecvMsg
		</td>
		<td colspan="2">
			ResMsg
		</td>
	</tr>
	<tr>
		<td id="recvMsg" colspan="2">
			<c:forEach items="${vorecv}" var="recvMsg" varStatus="i">
				${recvMsg} <br>
			</c:forEach>
		</td>
		<td id=resMsg colspan="2">
			<c:forEach items="${vores}" var="resMsg" varStatus="i">
				${resMsg} <br>
			</c:forEach>
		</td>
	</tr>
</table>
	<div class="center">
        <span id="close" style="border: 1px solid; padding:5px 10px; cursor: pointer; ">
			<a>창 닫기</a>
		</span>
    </div>
</body>
</html>