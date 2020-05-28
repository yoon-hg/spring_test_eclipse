<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<!-- 선택박스 -->
	<script type="text/javascript" src="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.js"></script>
	<link href="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.css" rel="stylesheet" />
	
	
</head>
<body>
<h2>hi</h2>
    <div id="select-box" style="width: 200px"></div>
    <script class="code-js">
      var selectBox = new tui.SelectBox('#select-box', {
        placeholder: 'Please select an option.',
        data: [
          {
            label: 'Fruits',
            data: [{ label: 'Apple', value: 'apple' }, { label: 'Banana', value: 'banana' }]
          },
          { label: 'The quick brown fox jumps over the lazy dog.', value: 'none' },
          {
            label: 'Colors',
            data: [
              { label: 'Red', value: 'red' },
              { label: 'Yellow', value: 'yellow' },
              { label: 'Green', value: 'green', disabled: true },
              { label: 'Blue', value: 'blue', disabled: true },
              { label: 'Purple', value: 'purple' }
            ]
          }
        ],
        autofocus: true
      });
      
      console.log(selectBox);
      
    </script>
</body>
</html>