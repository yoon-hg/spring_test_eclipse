<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>jQuery 슬라이드</title>
<style>
	ul {
  		list-style: none;
	}
	li{
		display:inline;
	}
	.box{
		clear:both;
		float:left;
		width:100px;
		height:50px;
		background-color:yellow;
		border:1px solid skyblue;
		margin:50px;
		border-radius:10px;
	}
	
	.hide{
		float:left;
		cursor:pointer;
	}
	
	.show{
		float:left;
		margin-right:20px;
		cursor:pointer;
	}
	
	.hello{
		width:500px; 
		height:500px; 
		background:pink; 
		position:absolute; 
		top:100px; 
		left:100px;
	}
	
	.btn {
	  position: absolute;
	  bottom: 30px;
	  left: 50%;
	  margin-left: -70px;
	}
	
	.btn .on {
	  background-color: #000;
	}
	
	.btn li:hover {
	  background-color: #000;
	}
	
	.btn li:last-child {
	  margin-right: 0px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script>
$(function(){
	
	function moveImage(next){
	}
	  var ex_show = $('.show');
	  var ex_hide = $('.hide');
	  var ex_box = $('.box');
	  
	  ex_show.click(function(){
	    ex_box.slideDown('slow');
	  	});
	  
	  ex_hide.click(function(){
	    ex_box.slideUp('slow');
	  	});
	  
	  $('.hello').animate({
		  top:100,  /* 옴겨질 위치 */
		  left:500
		},1000); /* 시간조정값 */
	});
</script>
</head>
<body>
<h3>하이</h3>
<b class="show">show click~~</b>
<b class="hide">hide click~~</b>
<div class="box"></div>
<div class="hello"></div>
	<ul class="btn">
	    <li class="box"></li>
	    <li class="box"></li>
	    <li class="box"></li>
	    <li class="box"></li>
 	</ul>
</body>
</html>
