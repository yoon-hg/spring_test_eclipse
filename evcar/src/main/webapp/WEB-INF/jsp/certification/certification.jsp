<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>충전소 사용인증 결과</title>
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	그리드
	<script type="text/javascript" src="https://nhn.github.io/tui.grid/latest/dist/tui-grid.js" ></script> 
	페이징
	<script type="text/javascript" src="https://nhn.github.io/tui.pagination/latest/dist/tui-pagination.js"></script>
	테마
	<script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>

	
	<link rel="stylesheet" type="text/css" href="css/certification/tui-grid.css" />
	<link rel="stylesheet" type="text/css" href="css/certification/tui-example-style.css" />
	<link rel="stylesheet" type="text/css" href="css/certification/tui-pagination.css" />
	
	<script type="text/javascript" src="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.js"></script>
	<link rel="stylesheet" type="text/css" href="https://nhn.github.io/tui.date-picker/latest/examples/css/tui-example-style.css" />
	<link href="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.css" rel="stylesheet">
	
	그리드 함수 생성
	<script type="text/javascript" src="js/certification/grid_renderer.js"></script> -->
	
<script type="text/javascript">
$(document).ready(function(){
	var page_num = 0;
	var totalRecordCount = 0;
	var recordCountPerPage = 0;  
	var pageSize = 0;
	var grid;
	var Grid = tui.Grid;
	Grid.setLanguage('ko');
	var content={"stationNm":$('#stationNm').val(),
			"certificationNb":$('#certificationNb').val(),
			"pa_fa":$('#ps_fa option:selected').val(),
			"date1":$('#date1').val(),
			"date2":$('#date2').val(),
			"page_num" : page_num};
	
	
	//데이터 가져오기 toast
	$.ajax({
		url: "searchCertification.do",
		method : "POST",
		dataType : "json",
		async : false, 
		data : content,
		success : function(result){
			console.log(result);
			
			grid = new tui.Grid({
			      el: document.getElementById('grid'),
			      scrollX: false,
			      scrollY: false,
			      bodyHeight: 400,
			      columns: [
			        {
			          header: '인증요청번호',
			          name: 'memAuthInputNo',
			          sortingType: 'asc',
			          sortable: true
			        },
			        {
			          header: '인증요청일시',
			          name: 'memAuthReqDt',
			          sortingType: 'asc',
			          sortable: true
			        },
			        {
			          header: '충전기명',
			          name: 'chgrNm',
			          sortingType: 'asc',
			          sortable: true
			        },
			        {
			          header: '응답일시',
			          name: 'resDt',
			          sortingType: 'asc',
			          sortable: true
			        },
			        {
			          header: '인증결과',
			          name: 'sf',
			          sortingType: 'asc',
			          sortable: true,
			          renderer:{
			           		type:CustomReqBtnRenderer
			          }
			        },
			        {
				      header: '사유',
				      name: 'authRsltValid',
				      sortingType: 'asc',
				      sortable: true
				    }
			      ],
			      showDummyRows: true
			    });
			//테마 설정
			tui.Grid.applyTheme('default',{
				outline: {
			        border: '#d7d7d7',
			        showVerticalBorder :true
			    },
		        row: {
		            even: {
		              background: '#F6F6F6'
		            },
		            hover: {
		              background: '#ccc'
		            }
		          },
			    cell: {
			        normal: {
			            background: '#fff',
			            border: '#d7d7d7',
			            text:'#000'
			        },
			        header: {
			            background: '#fff',
			            text:'#000',
			            border: '#d7d7d7'
			        },
			        focused: {
			            border: 'transparent'
			        },
			        selectedHeader: {
			        	background: '#fff',
			            text:'#000',
			            border: '#000'
			        }
			    }
			});

			//데이터 리셋
			grid.resetData(result.search);
			//페이지 정보 저장 (ajax 동기식 전환)
			totalRecordCount = result.paginationInfo.totalRecordCount;
			recordCountPerPage = result.paginationInfo.recordCountPerPage;
			pageSize = result.paginationInfo.pageSize;
			
		},
		error:function(request, status, error){
			alert(" code: "+request.status+"\n error: "+error);
		}
	});
	
	
	/* function ajax_page(num){
		form = {"page_num" : num};
		$.ajax({
			url: "ajaxtest.do",
			method : "POST",
			dataType : "json",
			data : form,
			success : function(result){
				console.log(result);
				grid.resetData(result.list);
			},
			error:function(request, status, error){
				alert(" code: "+request.status+"\n error: "+error);
			}
		});
	} */
	
	//조회
	$('#search').on('click',function(){
		Search(0);
		console.log($('#stationNm').val()+
				$('#certificationNb').val()+
				$('#ps_fa option:selected').val()+
				$('#date1').val()+"~"+
				$('#date2').val());
		
	});
	
	
	function Search(page_num){
		content={"stationNm":$('#chgrNm').val(),
					"certificationNb":$('#certificationNb').val(),
					"pa_fa":$('#ps_fa option:selected').val(),
					"date1":$('#date1').val(),
					"date2":$('#date2').val(),
					"page_num" : page_num};
		$.ajax({
			url : "searchCertification.do",
			data : content,
			dataType : "json",
			method : "POST",
			async : false,
			success : function(result){
				console.log(result);
				grid.resetData(result.search);
				
				totalRecordCount = result.paginationInfo.totalRecordCount;
				recordCountPerPage = result.paginationInfo.recordCountPerPage;
				pageSize = result.paginationInfo.pageSize;
				pagination.reset(totalRecordCount);
				
			},
			error : function(request, status, error){
				alert(" code: "+request.status+"\n error: "+error);
			}
		});
	}
	
	//페이징
	var pagination = new tui.Pagination('pagination1', {
	    totalItems: totalRecordCount,
	    itemsPerPage: recordCountPerPage,
	    visiblePages: pageSize
	});
	
	
	pagination.on('beforeMove', function(eventData) {
		if(eventData.page == 1){
		   page_num = 0;
		}else{
		   	page_num = (eventData.page-1)*recordCountPerPage;
		}
		  console.log(page_num);
		  //ajax_page(page_num);
		  Search(page_num);
	});
	
	/* (document).on('click','.tui-grid-table tbody tr',function(){
		console.log(grid.getRow($(this).index()));
	}); */
	
	//그리드 ROW 선택시 row 색 변경되도록 이벤트 추가
	grid.on('click',function(ev) {
		console.log(grid.getRowAt(ev.rowKey, true));
		grid.setSelectionRange({
		    start: [ev.rowKey, 0],
		    end: [ev.rowKey, grid.getColumns().length]
		 });
		/* $('#approval').on('click',function(){
			alert("check");
		}); */
		if(grid.getRow(ev.rowKey).sf == "인증실패"){
			alert("인증실패");
		}
   	});
	
	
	//입력창에서 엔터를 눌렀을 시 검색
	$('.insert').keydown(function(key){
		if(key.keyCode == 13){
			Search(0);
		}
	});
	
	$("#ps_fa").on('change',function(){
		Search(0);
	}); 
	
	function open_window(){
		var url = 'searchStation.do?search='+$('#chgrNm').val();
		window.open(url ,"chargerSearch", 
		       "toolbar=no, width=650, height=467, directories=no, status=no,    scrollorbars=no, resizable=no");
	}
	
	
	$('.btn_chgr').on('click',function(){
		open_window();
	});
	
});


</script>

   
<style type="text/css">
     .tui-grid-border-line-bottom{
     	z-index: 1;
     }
     .tui-grid-layer-state{
     	z-index: 1;
     }
	.label{
		border: 1px solid #d7d7d7;
		width : 100px;
		text-align : center;
	}
	.label_hidden{
		width : 100px;
		text-align : center;
	}
</style>
</head>
<body id=scrollBody style="margin: 0 auto; overflow-x:scroll;">
	<div id="selected_menu" style="text-align:left; margin-top: 20px; font-family: LG PC ">
		<b>충전기운영관리</b>
		<b>></b>
		<b>인증이력</b>
	</div>
	<table style ="border: 1px solid #d7d7d7; margin-top :20px; width: 1100px; maring:0 auto; font-family: LG PC;">
		<tr >
			<!-- <td>충전소 명</td>
			<td><input type ="text" id="stationNm"/> -->
			<td class="label">충전기 명</td>
			<td > 
				<input type="text" id="chgrNm" name="chgrNm" class="form-controlb bordernone insert" />
				<span id="btn_chgr" class="form-inline btn_chgr" style="border: 1px solid; padding:3px 10px; cursor: pointer; font-size:10px; font-weight:bold;">
					<a>조회</a>
				</span>
			</td>
			<td class="label">인증번호</td>
			<td><input type ="text" id="certificationNb" style="width : 130px;"/>
			<td class="label_hidden">
				
			</td>
			<td class="label_hidden">
				
			</td>
			<td class="label_hidden">
				
			</td>
		</tr>
		<tr>
			<td class="label">인증결과</td>
			<td>
				<select id="ps_fa" class="insert" style="width : 150px;">
					<option value="">선택</option>
					<option value="1">인증성공</option>
					<option value="0">인증실패</option>
				</select>
			</td>
			<td class="label">조회기간</td>
			<td colspan="3">
				
				<div class="tui-datepicker-input tui-datetime-input tui-has-focus" style=" z-index: 200;">
			        <input id="date1" type="text" aria-label="Date-Time">
			        <span class="tui-ico-date"></span>
			        <div id="startpicker-container" style="margin-left: -1px;"></div>
			    </div>
			    <span>~</span>
			    <div class="tui-datepicker-input tui-datetime-input tui-has-focus" style=" z-index: 200;">
			        <input id="date2" type="text" aria-label="Date-Time">
			        <span class="tui-ico-date"></span>
			        <div id="endpicker-container" style="margin-left: -1px;"></div>
			    </div>
			    
			    <script class="code-js">
			    var today = new Date();
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
			            [new Date(2019, 1, 1), new Date(2200, 1, 1)],
			        	[new Date(2019, 1, 1), new Date(2200, 1, 1)]
			        ]
			    });
			    </script>
			</td>
			<td class="label_hidden">
				<span id="search" class="insert" style="border: 1px solid; padding:3px 10px; cursor: pointer;">
					<a>조회</a>
				</span>
			</td>
			<td class="label_hidden">
				
			</td>
		</tr>
	</table>
	
	
	
	<div id="grid" style=" z-index: 1; "></div>
    <div id="pagination1" class="tui-pagination"></div>
</body>
</html>