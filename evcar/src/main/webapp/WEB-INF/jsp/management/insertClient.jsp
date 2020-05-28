<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
        // 자동으로 팝업 창이 닫히게 하는 함수
        function popupClose(form) {
            // form의 target을 부모 창으로 설정함            
            form.target = opener.name;
            
            form.submit();
            
            if (opener != null) {
                opener.insert = null;
                
                self.close();
            }
        }
    </script>
<h1>고객 등록</h1>
<% String context = request.getContextPath(); %>
	<table>
		<form action="<%=context%>/insertClient.do" method="post">
		
			<div class="createForm">
				<label>충전사업자 ID</label>
				<input type="text" id= "provider_id" name="provider_id" class="createForm">
			</div>
			<div class="createForm">
				<label>고객명</label>
				<input type="text" id= "cust_nm" name="cust_nm" class="createForm">
			</div>
			<div class="createForm">
				<label>구분</label>
				<input type="text" id = "cust_tp" name="cust_tp" class="createForm">
			</div>
			<div class="createForm">
				<label>전화번호</label>
				<input type="text" id= "tel" name="tel" class="createForm">
			</div>
			<div class="Formfooter">
				<button type="submit" class="btn_button"  onclick="window.close()">작성하기</button>
			</div>
		</form>
	</table>
</body>
</html>