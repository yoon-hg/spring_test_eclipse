<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% String context = request.getContextPath(); %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
$(document).ready(function(){
	
	//시를 입력하고 입력한 시의 대한 동이 검색되도록 설정
	$("#pnu_si_nm").on('click',function(){
		var check = true;
		if(check && $("#pnu_si_nm option:selected").val() != ""){
			console.log(check);
			check=false;
			console.log($("#pnu_si_nm option:selected").val());
			var form = {"pnu_si_nm" : $("#pnu_si_nm option:selected").val()};
			$.ajax({
				url: "stationAjax.do",
				type: "POST",
				dataType: "json",
				data:form,
				success:function(result){
					console.log(result);
					//alert("성공"+result.list[0].pnuDongNm);
					$("#pnu_dong_nm").find("option").remove().end();
					$("#pnu_dong_nm").append("<option value="+""+">선택</option>");
					$.each(result.list, function(i,item){
						$("#pnu_dong_nm").append("<option value="+item.pnuDongNm+">"+item.pnuDongNm+"</option>")
					});
					
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
			}
	});
	
		
		//조회버튼을 눌렀을 시 검색
		$("#search").on('click',function(){
			Search();
		});
		
		//입력창에서 엔터를 눌렀을 시 검색
		$("#st_nm").keydown(function(key){
			if(key.keyCode == 13){
				Search();
			}
		});
		
		$(document).keydown(function(key){
			if(key.keyCode == 37){
				index_size = $(".slider li").length;
				console.log("index_size "+index_size);
			    console.log(index);
				PrevSlide();
			} else if(key.keyCode == 39){
				index_size = $(".slider li").length;
				console.log("index_size "+index_size);
			    console.log(index);
				NextSlide();
			}
		});
		
		
		//입력시 표시창에 조회가 되도록 설정
		var $slider = $('.slider');
		var index = 0;
		var index_size = 0;
		
		function Search(){
			  var content={"pnu_si_nm" : $("#pnu_si_nm option:selected").val(),
						"pnu_dong_nm" : $("#pnu_dong_nm option:selected").val(),
						"parking_fee_yn" : $("#parking_fee_yn option:selected").val(),
						"st_nm" : $("#st_nm").val()};
			console.log($("#pnu_si_nm option:selected").val()+
						$("#pnu_dong_nm option:selected").val()+
						$("#parking_fee_yn option:selected").val()+
						$("#st_nm").val());
			var index_size = 0;
			$.ajax({
				url : "searchAjax.do",
				type: "POST",
				dataType: "json",
				data: content,
				success:function(result){
					index_size = Object.keys(result.search).length;
					console.log(index_size);
					$(".slider").find("li").remove().end();
					var x = 1;
					 $.each(result.search,function(i){
							var str="<li id="+x+" style="+"opacity"+">";
							str+="<p>"+x+"/"+index_size+"<p>";
							str+="<h2>"+result.search[i].stNm+"</h2><br>";
							str+="<p>"+"주소  		: "+result.search[i].addrRdM+"</p>";
							str+="<p>"+"상세 주소 	: "+result.search[i].addrRdD+"</p><br>";
							str+="<p>"+"주차비 여부 :  "+result.search[i].parkingFeeYn+"</p>";
							str+="</li>";
							$(".slider").append(str);
							if(x==1){
								var $slider = $('.slider'),
							    $firstSlide = $slider.find('li').eq(0) // 첫번째 슬라이드
							  .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기
							}
							x++;
					});
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		  }
		  
		
		  function PrevSlide(){ // 이전버튼 함수
		    var $prevSlide = $slider.find('li').eq(index)
		   .stop(true).animate({'opacity':0},400); 
		    $nextSlide = $slider.find('li').eq(index-1)
		    .stop(true).animate({'opacity':1},400);
		    if(index<0)index=index_size-2;
		    else index--;
		  }
		  
		  function NextSlide(){ // 다음 버튼 함수
			if(index>=index_size-1)index = -1;
		    var $prevSlide = $slider.find('li').eq(index) 
		    .stop(true).animate({'opacity':0},400);
		    $nextSlide = $slider.find('li').eq(index+1)
		    .stop(true).animate({'opacity':1},400);
		    index++;
		  }
		  
		  
		  
		
		$('#next').on('click', function(){ //다음버튼 클릭
			index_size = $(".slider li").length;
			console.log("index_size "+index_size);
			console.log("index "+index);
		    NextSlide();
		 });
		
		$('#prev').on('click', function(){ //이전 버튼 클릭하면
			index_size = $(".slider li").length;
			console.log("index_size "+index_size);
		    console.log(index);
		    PrevSlide();
		 });

});
</script>
<style type="text/css">

	.slider {
	  list-style:none;
	  height:500px;
	  overflow:hidden;
	  background-color:#E0F2F7;
	}
	.slider li {
	  margin-top:150px;
	  margin-left:50px;
	  position:absolute;
	  top:0;
	  left:0;
	  width:70%;
	  height:400px;
	  opacity:0;
	}
	
	.btn button {
	  margin-top:10px;
	  border:1px solid #ccc;
	  background-color:#fff;
	  color:#666;
	  font-size:1.5rem;
	  cursor:pointer;
	}

</style>
</head>
<body>
	<div align=center>
		<select id="pnu_si_nm">
			<option value="">선택</option>
			<option value="제주시">제주시</option>
			<option value="서귀포시">서귀포시</option>
		</select>
		<select id="pnu_dong_nm">
			<option value="">선택</option>
		</select>
		주차비 여부 : 
		<select id="parking_fee_yn">
			<option value="">선택</option>
			<option value="Y">Y</option>
			<option value="N">N</option>
		</select>
		충전소 명 : <input type="text" id="st_nm">
		<button type="button" id="search">조회</button>
	</div>
	<div>
		<ul class="slider">
	</ul> 
	</div>
	<div class="btn" align=center>
	    <button type="button" id="prev"><</button>
	    <button type="button" id="next">></button>
	  </div>
	  
	<form onsubmit="return false">
	</form>

</body>
</html>