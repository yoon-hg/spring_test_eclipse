<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
var once = true;
$(document).ready(function(){
	$(document).on('mouseover', '.menu span', function () {
	    $('.dept02_1').slideDown(200);
	    $('.dept02_2').slideDown(200);
	    $('.dept02_3').slideDown(200);
	    $('.dept02_4').slideDown(200);
	});
	
	$(document).on('mouseover', 'div', function () {
	    if (!$(this).hasClass('menu')) {
	        $('.dept02_1').slideUp(200);
	        $('.dept02_2').slideUp(200);
	        $('.dept02_3').slideUp(200);
	        $('.dept02_4').slideUp(200);
	    }
	});
	
	
	
	var name = "";
	if(once){
		once = false;
		$.ajax({
			url : "codemenuAjax.do",
			type : "GET",
			dataType : "json",
			success:function(result){
				var menu_id = result.menu[0].cdGrp;
				var x=1;
				var number = 0;
				$.each(result.menu,function(index, item){
					var str="<li id="+index+">";
					str+=item.cdGrpNm;
					str+="</li>";
					if(menu_id == item.cdGrp){
						$(".menu .dept02_"+x).append(str);
					} else{
						menu_id = item.cdGrp;
						x++;
						$(".menu .dept02_"+x).append(str);
					}
					var param;
					$(".menu .dept02_"+x+" li").on('click', function(){
						if(name != $(this).text()){
							console.log($(this).text());
							param = {"cdGrp":$(this).text()};
							content(param);
							name = $(this).text();
						}
						
					});
					
				});
				
				
			}, 
			
			error:function(request,status,error){
				alert("code:"+request.status+"\n error:"+error);
			}
		});
	}
	
	
	
	
	function content(data){
		$.ajax({
			url : "contentAjax.do",
			type : "POST",
			dataType : "json",
			data : data,
			success:function(result){
				//console.log(result);
				$(".content").find("li").remove().end();
				$.each(result.codeContent,function(index,item){
					var str = "";
					if(index==0) {
						str+="<li><h2>"+item.cdGrpNm+"</h2><br></li>";
						$(".content").append(str);
					}
					str="<li>";
					str+="공통 코드 : "+item.commCd+"<br>";
					str+="코드 명 : "+item.cdNm+"<br>";
					str+="</li>"
					$(".content").append(str);
				});
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n error:"+error);
			}
		});
	}
});
</script>
<style>
	
	.menu{
		display:inline;
		text-align:center;
		list-style:none;
		height:70px;
		background-color:bisque;
		border-radius: 15px 15px;
	}
	.dept01{
		float:left;
		display:inline;
		list-style:none;
		wifth : 25%;
		line-height : 50px;
		cursor:pointer;
	}
	
	.dept01 li{
		list-style:none;
	}
	
	.menu .dept02_1 li:hover{
		font-weight: bold;
	}
	.menu .dept02_2 li:hover{
		font-weight: bold;
	}
	.menu .dept02_3 li:hover{
		font-weight: bold;
	}
	.menu .dept02_4 li:hover{
		font-weight: bold;
	}

	.dept02 {
		display:none;
	}
	
	
	.content{
		overflow:auto;
		list-style:none;
		background-color: linen;
		border-radius: 10px 10px;
		height:500px;
		width:100%;
	} 
	.content li{
		margin-left:70px;
		margin-top:150px;	
		margin: 8px;
		height:50px;
	}
	
	
	
</style>
</head>
<body>
<div class="menu">
	<ul class="dept01">
		<li>
			<span>C</span>
			<ul class="dept02_1">
			</ul>
		</li>
	</ul>
</div>
<div class="menu">
	<ul class="dept01">
		<li>
			<span>ME</span>
			<ul class="dept02_2">
			</ul>
		</li>
	</ul>
</div>	
<div class="menu">
	<ul class="dept01">
		<li>
			<span>PR</span>
			<ul class="dept02_3">
			</ul>
		</li>
	</ul>
</div>	
<div class="menu">
	<ul class="dept01">
		<li>
			<span>PS</span>
			<ul class="dept02_4">
			</ul>
		</li>
	</ul>
</div>	




<div class ="content">
	<ul>
	</ul>
</div>

</body>
</html>