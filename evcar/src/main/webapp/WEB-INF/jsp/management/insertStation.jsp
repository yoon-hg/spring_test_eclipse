<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>충전소 등록</title>
</head>
<body>
<h1>충전소 등록</h1>
<% String context = request.getContextPath(); %>
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

	<table>
		<form action="<%=context%>/insertStation.do" method="post">
			<input type = hidden  name ="id" value="station">
			<div class="createForm">
				<label>충전소 명</label>
				<input type="text" id= "st_nm" name="st_nm" class="createForm">
			</div>
			<div class="createForm">
				<label>시</label>
				<input type="text" id= "pnu_si_nm" name="pnu_si_nm" class="createForm">
			</div>
			<div class="createForm">
				<label>도로명 주소</label>
				<input type="text" id= "addr_rd_m" name="addr_rd_m" class="createForm">
			</div>
			<div class="createForm">
				<label>상세주소</label>
				<input type="text" id = "addr_rd_d" name="addr_rd_d" class="createForm">
			</div>
			<div class="createForm">
				<label>지번주소</label>
				<input type="text" id= "addr_ld_m" name="addr_ld_m" class="createForm">
			</div>
			<div class="createForm">
				<label>상세주소</label>
				<input type="text" id= "addr_ld_d" name="addr_ld_d" class="createForm">
			</div>
			<div class="Formfooter">
				<input type="submit" class="btn_button"  onclick="window.close()">
			</div>
		</form>
	</table>
</body>
</html>