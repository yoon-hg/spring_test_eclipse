<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		ul{
			list-style:none;
		} 
		li{	
			display:inline;
			margin: 8px;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
      $( document ).ready( function() {
        $("#client").click(function(){
        	console.log("고객 페이지로 들어갑니다~");
        	//페이지 이동
        	location.href = "evmain.do?id=client";
        });
        $("#station").click(function(){
        	console.log("충전소 페이지로 들어갑니다~");
        	//페이지 이동
        	location.href = "evmain.do?id=station";
        });
        $("#station").mouseover(function(event) {
            $("#station_contents").css("visibility", "Visible");
            $("#station_contents").css("top", event.target.offsetTop +40);
            $("#station_contents").css("left", event.target.offsetLeft );
        });
        $("#station").mouseout(function(event){
        	$("#station_contents").css("visibility", "hidden");
        });
        
        $("#client").mouseover(function(event) {
            $("#client_contents").css("visibility", "Visible");
            $("#client_contents").css("top", event.target.offsetTop +40);
            $("#client_contents").css("left", event.target.offsetLeft );
        });
        $("#client").mouseout(function(event){
        	$("#client_contents").css("visibility", "hidden");
        });
      });
    </script>
</head>
<body>
<% String context = request.getContextPath(); %>
	<ul>
		<li class="nav-item">
			<button type = submit id = "station" name = station >충전소 관리</button>
		</li>
		<li class="nav-item">
			<button type = submit id = "client" name = client >고객 관리</button>
		</li>
	</ul>
	
	<div id="client_contents" style="border:solid 2px #F6D8CE; visibility: hidden; position: absolute;">
    	충전소  고객목록
	</div>
	
	<div id="station_contents" style="border:solid 2px #F6D8CE; visibility: hidden; position: absolute;">
    	충전소 목록
	</div>

</body>
</html>