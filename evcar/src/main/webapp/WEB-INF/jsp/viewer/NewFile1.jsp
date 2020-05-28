<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" type="text/css" href="css/certification/tui-example-style.css" />
    <link rel="stylesheet" type="text/css" href="css/certification/tui-pagination.css" />
	
	<script type="text/javascript" src="js/certification/tui-pagination.js"></script>
	
	
</head>
<body>
	<h2>확인</h2>
	<div class="code-html">
        <div id="pagination" class="tui-pagination"></div>
    </div>
	<script class="code-js">
    var pagination = new tui.Pagination('pagination', {
        totalItems: 500
    });

    pagination.on('beforeMove', function(eventData) {
    });

    </script>
</body>
</html>