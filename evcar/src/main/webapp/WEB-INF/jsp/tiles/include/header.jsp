<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <script type="text/javascript">
$(document).ready(function(){
	$('#monitor').on('click',function(){
		console.log("monitor");
		//$("#header a").removeClass("on");
	    $("#monitor").addClass("on");
	});
	
	$('#buisness').on('click',function(){
		console.log("buisness");
		//$("#header a").removeClass("on");
	    $("#buisness").addClass("on");
	});
});
</script> -->
<div>
<!-- tiles 적용 테스트 -->
<a id="monitor" onClick="self.location='content1.do?bar=1'">충전기 모니터링</a>
<a id="buisness" onClick="self.location='content2.do?bar=2'">충전기 사업자</a>
</div>