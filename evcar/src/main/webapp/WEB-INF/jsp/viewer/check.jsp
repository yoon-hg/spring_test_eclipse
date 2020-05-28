<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>제이쿼리</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.7.2.js"></script>
<script src="https://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

<script type="text/javascript" src="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.js"></script>
<link rel="stylesheet" type="text/css" href="https://nhn.github.io/tui.date-picker/latest/examples/css/tui-example-style.css" />
<link href="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
	  var index = 0;
	  var $slider = $('.slider'),
	      $firstSlide = $slider.find('li').eq(index) // 첫번째 슬라이드
	  .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기
	  

	  function PrevSlide(){ // 이전버튼 함수
	    var $prevSlide = $slider.find('li').eq(index)
	   .stop(true).animate({'opacity':0},400); 
	    $nextSlide = $slider.find('li').eq(index-1)
	    .stop(true).animate({'opacity':1},400);
	    if(index<0)index=5;
	    index--;
	    $(".btn b").removeClass("on");
	    $(".btn b").eq(index).addClass("on");
	  }
	  
	  function NextSlide(){ // 다음 버튼 함수
		if(index>=5)index = -1;
	    var $prevSlide = $slider.find('li').eq(index) 
	    .stop(true).animate({'opacity':0},400);
	    $nextSlide = $slider.find('li').eq(index+1)
	    .stop(true).animate({'opacity':1},400);
	    index++;
	    $(".btn b").removeClass("on");
	    $(".btn b").eq(index).addClass("on");
	  }
	  
	  function CheckSlide(num){
		  var $prevSlide = $slider.find('li').eq(index) 
		    .stop(true).animate({'opacity':0},400);
		    $nextSlide = $slider.find('li').eq(num)
		    .stop(true).animate({'opacity':1},400);
		    index = num;
		    $(".btn b").removeClass("on");
		    $(".btn b").eq(index).addClass("on");
	  }
	  var isPause = false;
	  var interval;
	  function startInterval(){
		  if(!isPause){
			  	  console.log("go");
			  	  interval = setInterval(function(){
				  NextSlide();
			  },1000);
		  } else{
			  clearInterval(interval);
			  console.log("stop");
		  }
	  }
	  
	  
	  $('#next').on('click', function(){ //다음버튼 클릭
		
		console.log(index);
	    NextSlide();
	  	
	  	
	  });
	    $('#prev').on('click', function(){ //이전 버튼 클릭하면
	    	console.log(index);
	    	PrevSlide();
	    
	  });
	    
	   $('.btn b').on('click', function(){ //원 버튼 클릭시
		   var idx = $(this).attr("id");
		   console.log($(this).index()); 
		   CheckSlide(idx);
		    
		});
	   $('#go').on('click', function(){ //자동움직임 버튼 시작
		   isPause = false; //자동 슬라이드 설정
		   startInterval();
		   console.log("go");
	  });
	   $('#stop').on('click', function(){ //자동움직임 버튼 정지
		  isPause = true; //자동 슬라이드 설정
		  startInterval();
		  console.log("stop");
	  });

	   
});

</script>
<style type="text/css">
	.slider {
	  list-style:none;
	  height:500px;
	  overflow:hidden;
	}
	.slider li {
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:500px;
	  opacity:0;
	}
	.btn {
	  text-align:center;
	}
	.go_stop {
	  text-align:right;
	}
	.go_stop  button{
	  background-color:#fff;
	}
	

	.btn button {
	  margin-top:10px;
	  border:1px solid #ccc;
	  background-color:#fff;
	  color:#666;
	  font-size:1.5rem;
	  cursor:pointer;
	}
	.btn b {
	  background-color:#fff;
	  cursor:pointer;
	  border-radius: 50%;
	}
	
	.btn .on {
	  background-color: #000;
	}
	
	.btn b:hover {
	  background-color: #000;
	}
	
	
</style>
</head>
<body>
	  <ul class="slider">
	    <li style="background-color:darkslateblue"></li>
	    <li style="background-color:darksalmon"></li>
	    <li style="background-color:dodgerblue"></li>
	    <li style="background-color:firebrick"></li>
	    <li style="background-color:forestgreen"></li>
	    <li style="background-color:dimgrey"></li>
	  </ul>
	  <div class="go_stop">
	    <button type="button" id="go"><img src="images/slider/start.png"></button>
	    <button type="button" id="stop"><img src="images/slider/Pause.png"></button>
	  </div>
	  <div class="btn">
	    <button type="button" id="prev"><</button>
	    <b class="on" id="0">○</b>
	    <b id="1">○</b>
	    <b id="2">○</b>
	    <b id="3">○</b>
	    <b id="4">○</b>
	    <b id="5">○</b>
	    <button type="button" id="next">></button>
	  </div>
	  
	  <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
        <input id="date1" type="text" aria-label="Date-Time">
        <span class="tui-ico-date"></span>
        <div id="startpicker-container" style="margin-left: -1px;"></div>
    </div>
    <span>~</span>
    <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
        <input id="date2" type="text" aria-label="Date-Time">
        <span class="tui-ico-date"></span>
        <div id="endpicker-container" style="margin-left: -1px;"></div>
    </div>
    <script class="code-js">
    var today = new Date();
    var lang = 'ko';
    var picker = tui.DatePicker.createRangePicker({
    	language: 'ko',
        startpicker: {
            date: today,
            input: '#date1',
            container: '#startpicker-container'
        },
        endpicker: {
            date: today,
            input: '#date2',
            container: '#endpicker-container'
        },
        selectableRanges: [
            [new Date(2019, 1, 1), new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())],
        	[new Date(2019, 1, 1), new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ]
    });
    </script>
	
	  
	  
</body>
</html>