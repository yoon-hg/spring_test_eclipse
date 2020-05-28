<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
$(document).ready(function(){
	var once = true;
	if(once){
		once = false;
		$.ajax({
			url : "codemenuAjax.do",
			type : "GET",
			dataType : "json",
			success:function(result){
				console.log(result);
				$(".aa").find("li").remove().end();
				$.each(result.menu,function(index, item){
					var str="<li id="+cdGrpNm+" class='123'>";
					str+=item.cdGrpNm;
					str+="</li>";
					$(".aa").append(str);
				});
				
				$("#1").on('click',function(){
					console.log("hi");
				});
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n error:"+error);
			}
		});
	}
	
});
</script>
</head>
<body>
<ul class="aa">
	<li id="1">1</li>
	<li id="2">2</li>
	<li id="3">3</li>
	<li id="4">4</li>
</ul>
</body>
</html>