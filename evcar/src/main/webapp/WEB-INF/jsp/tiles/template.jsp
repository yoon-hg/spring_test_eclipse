<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jinwoo evcar</title>
<link rel="shortcut icon" type="image⁄x-icon" href="images/tiles/jinwoo_logo_mark.png">

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/tiles/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='css/tiles/menu.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='css/tiles/tiles_layout.css'/>">

	<!-- 그리드 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.grid/latest/dist/tui-grid.js" ></script> 
	<link rel="stylesheet" type="text/css" href="css/certification/tui-grid.css" />
	<link rel="stylesheet" type="text/css" href="css/certification/tui-example-style.css" />
	
	<!-- 페이징 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.pagination/latest/dist/tui-pagination.js"></script>
	<link rel="stylesheet" type="text/css" href="css/certification/tui-pagination.css" />
	
	<!-- 테마 -->
	<script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>
	
	<!-- 달력 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.js"></script>
	<link rel="stylesheet" type="text/css" href="https://nhn.github.io/tui.date-picker/latest/examples/css/tui-example-style.css" />
	<link href="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.css" rel="stylesheet">
	
	<!-- 선택박스 -->
	<script type="text/javascript" src="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.js"></script>
	<link href="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.css" rel="stylesheet" />
	
	<!-- 그리드 함수 생성 -->
	<script type="text/javascript" src="js/certification/grid_renderer.js"></script>
	

</head>
<style type="text/css">

</style>
<script type="text/javascript">
$(document).ready(function(){
	var url = document.location.href.split("?");
	console.log(url[1]);
	if(url[1] == 'bar=1'){
		console.log("check_1");
		$("#header a").removeClass("on");
	    $("#monitor").addClass("on");
	} else if(url[1] == 'bar=2'){
		console.log("check_2");
		$("#header a").removeClass("on");
	    $("#buisness").addClass("on");
	}
});
</script>
<body style="text-align:center; ">

<!-- UI Object -->
<div id="wrap">
	<div id="login">
        <tiles:insertAttribute name="login" />
    </div>
    <!-- header -->
    <div id="header" >
        <tiles:insertAttribute name="header" />
    </div>
    <!-- //header -->
    <!-- container -->
    <div id="container">
        <!-- snb -->
        <div class="snb">
            <tiles:insertAttribute name="menu" />
        </div>
        <!-- //snb -->
        <!-- content -->
        <div id="content">
            <tiles:insertAttribute name="body" />
        </div>
        <!-- //content -->
    </div>
    <!-- //container -->
    <!-- footer -->
    <div id="footer">
        <tiles:insertAttribute name="footer" />
    </div>
    <!-- //footer -->
</div>
<!-- //UI Object -->
	
	
</body>
</html>