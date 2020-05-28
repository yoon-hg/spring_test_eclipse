<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	
	<!-- 그리드 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.grid/latest/dist/tui-grid.js" ></script> 
	<link rel="stylesheet" type="text/css" href="css/certification/tui-grid.css" />
	<link rel="stylesheet" type="text/css" href="css/certification/tui-example-style.css" />
	
	<!-- 페이징 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.pagination/latest/dist/tui-pagination.js"></script>
	<link rel="stylesheet" type="text/css" href="css/certification/tui-pagination.css" />
	
	<!-- 테마 -->
	<script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>
	
	
	<!-- 선택박스 -->
	<script type="text/javascript" src="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.js"></script>
	<link href="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.css" rel="stylesheet" />
	

	
	
<title>Insert title here</title>
</head>
<body>
<div id="body"><tiles:insertAttribute name="body"/></div>
</body>
</html>