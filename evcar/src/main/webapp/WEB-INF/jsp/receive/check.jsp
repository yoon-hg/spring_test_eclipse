<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
	<!-- 달력 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.js"></script>
	<link rel="stylesheet" type="text/css" href="https://nhn.github.io/tui.date-picker/latest/examples/css/tui-example-style.css" />
	<link href="https://nhn.github.io/tui.date-picker/latest/dist/tui-date-picker.css" rel="stylesheet">
	
	<!-- 선택박스 -->
	<script type="text/javascript" src="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.js"></script>
	<link href="https://nhn.github.io/toast-ui.select-box/latest/dist/toastui-select-box.css" rel="stylesheet" />
	
<script type="text/javascript">
$(document).ready(function(){
	var page_num = 0;
	var totalRecordCount = 0;
	var recordCountPerPage = 0;  
	var pageSize = 0;
	var grid;
	var Grid = tui.Grid;
	Grid.setLanguage('ko');
	var provider = new tui.SelectBox('#Provider', {
        data: [
          { label: '제주도청', value: 'JD' },
          { label: '조아렌트카', value: 'JO' },
          { label: '한국에너지', value: 'JP'},
          { label: 'Test', value: 'TD'}
        ]
      });
	
	
	var command = new tui.SelectBox('#Command', {
        data: [
		  { label: '전부', value: '' },
          { label: 'alarmHistory', value: 'alarmHistory' },
          { label: 'chargingEnd', value: 'chargingEnd' },
          { label: 'chargingInfo', value: 'chargingInfo'},
          { label: 'chargingStart', value: 'chargingStart'},
          { label: 'chargingInfo', value: 'chargingInfo'},
          { label: 'chgrStatus', value: 'chgrStatus'},
          { label: 'dAlarmHistory', value: 'dAlarmHistory'},
          { label: 'dChargingEnd', value: 'dChargingEnd'},
          { label: 'dChargingStart', value: 'dChargingStart'},
          { label: 'dPaymentInfo', value: 'dPaymentInfo'},
          { label: 'dReportUpdate', value: 'dReportUpdate'},
          { label: 'paymentInfo', value: 'paymentInfo'},
          { label: 'reportUpdate', value: 'reportUpdate'},
          { label: 'sendSms', value: 'sendSms'},
          { label: 'user', value: 'user'}
        ]
      });
	
	var maintenance = new tui.SelectBox('#Maintenance', {
        data: [
		  { label: '전부', value: '' },
          { label: '진우', value: '0000' },
          { label: '중앙제어', value: '0001' },
          { label: '시그넷', value: '0002'},
          { label: '스필', value: '0003'}
        ]
      });
	
	var content={
			"provider":provider.dropdown.selectedItem.nativeEl.value,
			"stId":$('#stId').val(),
			"chgrId":$('#chgrId').val(),
			"command":command.dropdown.selectedItem.nativeEl.value,
			"maintenance":maintenance.dropdown.selectedItem.nativeEl.value,
			"date1":$('#date1').val(),
			"date2":$('#date2').val(),
			"page_num" : page_num};
	
	
	//데이터 가져오기 toast
	$.ajax({
		url: "main/receiveListAjax.do",
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
			          header: '충전소ID',
			          name: 'stId'
			        },
			        {
			          header: '충전소 명',
			          name: 'chgrNm'
			        },
			        {
			          header: 'CMD_TP',
			          name: 'cmdTp'
			        },
			        {
			          header: 'CREATE_DT',
			          name: 'createDt'
			        },
			        {
			          header: 'RES_DT',
			          name: 'resDt'
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
		  Search(page_num);
	});
	
	function Search(page_num){
		content={"provider":provider.dropdown.selectedItem.nativeEl.value,
				"stId":$('#stId').val(),
				"chgrId":$('#chgrId').val(),
				"command":command.dropdown.selectedItem.nativeEl.value,
				"maintenance":maintenance.dropdown.selectedItem.nativeEl.value,
				"date1":$('#date1').val(),
				"date2":$('#date2').val(),
				"page_num" : page_num};
		$.ajax({
			url : "main/receiveListAjax.do",
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
	
	grid.on('click',function(ev) {
		console.log(grid.getRowAt(ev.rowKey, true));
		grid.setSelectionRange({
		    start: [ev.rowKey, 0],
		    end: [ev.rowKey, grid.getColumns().length]
		 });
		
		window_container(grid.getRowAt(ev.rowKey, true));
   	});
	
	function window_container(data){
		var dt = data.resDt.split(" ");
		var url = "main/container.do?stId="+data.stId+"&chgrNm="+encodeURIComponent(data.chgrNm)+"&cmdTp="+data.cmdTp+"&resDt="+dt[0]+"d"+dt[1] ;
		window.open(url ,"container", 
		       "toolbar=no, width=1100, height=700, directories=no, status=no,    scrollorbars=no, resizable=no");
	}
	
	
	function window_chgr(){
		var url = 'main/searchChgr.do?search='+encodeURIComponent($('#chgrId').val());
		window.open(url ,"chargerSearch", 
		       "toolbar=no, width=650, height=500, directories=no, status=no,    scrollorbars=no, resizable=no");
	}
	
	$('#btn_chgr').on('click',function(){
		window_chgr();
	});
	
	$('.selectedBox').on('click',function(){
		console.log($(this).attr("id"));
		switch($(this).attr("id")){
		case "Provider":
			command.close();
			maintenance.close();
			break;
		case "Maintenance":
			command.close();
			provider.close();
			break;
		case "Command":
			maintenance.close();
			provider.close();
			break;
		}
	});
	
	provider.on('change', function(ev) {
        Search(0);
	});
	
	command.on('change', function(ev) {
		Search(0);
	});
	
	maintenance.on('change', function(ev) {
		Search(0);
	});
	
	$('#search').on('click',function(){
		Search(0);
	});
	
	$('.input').keydown(function(key){
		if(key.keyCode == 13){
			Search(0);
		}
	});
	
	
	
	
	/////////////////////////////////////////////////////////////////////////
	
	function test(imageName) {
    LoadingWithMask('your site\'s image path');
    setTimeout("closeLoadingWithMask()", 3000);
}
 
function LoadingWithMask(gif) {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth  = window.document.body.clientWidth;
     
    //화면에 출력할 마스크를 설정해줍니다.
    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg ='';
      
    loadingImg +=" <img src='../gif/lodding/Lodding_200px.gif' style='position: absolute; display: block; margin: 0px auto;'/>";
 
    //화면에 레이어 추가
    $('body')
        .append(mask)
 
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : maskWidth,
            'height': maskHeight,
            'opacity' :'0.3'
    });
  
    //마스크 표시
    $('#mask').show();
  
    //로딩중 이미지 표시
    $('#loadingImg').append(loadingImg);
    $('#loadingImg').show();
}
 
function closeLoadingWithMask() {
    $('#mask, #loadingImg').hide();
    $('#mask, #loadingImg').empty(); 
}


	
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
	.input{
		border: 1px solid #ddd;
		border-left-width:0px;
		border-right-width:0px;
		border-top-width:0px;
		border-bottom-width:1px;
		height:20px;
		width: 130px;
	}
</style>
	<table style ="border: 1px solid #d7d7d7; margin-top : 30px; width: 1100px; maring:0 auto; font-family: HY나무M;">
		<tr style="border-bottom: 10px solid #fff; padding: 100 0 100 0">
			<td class="label">
				충전 사업자
			</td>
			<td>
			    <div id="Provider"  class="selectedBox" style="width: 150px; z-index: 200;"></div>
			</td>
			<td class="label">
				충전소
			</td>
			<td>
				<input id="stId" type="text" class="input">
			</td>
			<td class="label">
				충전기
			</td>
			<td>
				<input id="chgrId" type="text" class="input">
				<span id="btn_chgr" class="form-inline btn_chgr" style="border: 1px solid; padding:5px 10px; cursor: pointer; font-size:10px; font-weight:bold;">
					<a>조회</a>
				</span>
			</td>
			<td class="label">명령구분</td>
			<td>
				<div id="Command" class="selectedBox" style="width: 150px; z-index: 200;"></div>
			</td>
		</tr>
		<tr>
			<td  class="label">
				유지관리업체 
			</td>
			<td style=" z-index: 200;">
			    <div id="Maintenance" class="selectedBox" style="width: 150px; z-index: 200;"></div>
			</td>
			
			<td class="label">
				조회 기간
			</td>
			<td colspan="3" style="text-align:center">
				
				<div class="tui-datepicker-input tui-datetime-input tui-has-focus" style=" z-index: 200; ">
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
			<td>
				<span id="search" class="insert" style="border: 1px solid; padding:5px 10px; cursor: pointer;">
					<a>조회</a>
				</span>
			</td>
		</tr>
	</table>
	<div id="grid" style=" z-index: 0;"></div>
    <div id="pagination1" class="tui-pagination"></div>
    
