<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<!-- 그리드 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.grid/latest/dist/tui-grid.js" ></script> 
	<!-- 페이징 -->
	<script type="text/javascript" src="https://nhn.github.io/tui.pagination/latest/dist/tui-pagination.js"></script>
	<!-- 테마 -->
	<script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>

	
	<link rel="stylesheet" type="text/css" href="css/certification/tui-grid.css" />
	<link rel="stylesheet" type="text/css" href="css/certification/tui-example-style.css" />
	<link rel="stylesheet" type="text/css" href="css/certification/tui-pagination.css" />
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			var page_num = 0;
			var totalRecordCount = 0;
			var recordCountPerPage = 0;  
			var pageSize = 0;
			var grid;
			var Grid = tui.Grid;
			Grid.setLanguage('ko');
			
			var content={
					"name":$('#name').val(),
					"station":$('#station option:selected').val(),
					"page_num" : page_num};
			
			
			//데이터 가져오기 toast
			$.ajax({
				url: "searchStationAjax.do",
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
					      bodyHeight: 200,
					      columns: [
					        {
					          header: '충전소ID',
					          name: 'stId',
					        },
					        {
					          header: '충전기ID',
					          name: 'chgrId',
					        },
					        {
					          header: '충전소 명',
					          name: 'chgrNm'
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
					grid.resetData(result.searchStation);
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
				   	page_num = (eventData.page-1)*5;
				}
				  console.log(page_num);
				  Search(page_num);
			});
			
			$('#search').on('click',function(){
				Search(0);
			});
			
			$("#name").keydown(function(key){
				if(key.keyCode == 13){
					Search(0);
				}
			});
			
			function Search(page_num){
				content={"name":$('#name').val(),
						"station":$('#station option:selected').val(),
						"page_num" : page_num};
				$.ajax({
					url : "searchStationAjax.do",
					data : content,
					dataType : "json",
					method : "POST",
					async : false,
					success : function(result){
						console.log(result);
						grid.resetData(result.searchStation);
						
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
			
			$(document).on('click','.tui-grid-table tbody tr',function(){
				console.log(grid.getRow($(this).index()).chgrNm);
				window.opener.document.getElementById("chgrNm").value = grid.getRow($(this).index()).chgrNm;
				window.close();
			});
		});
	</script>
</head>
<body style="margin: 0 auto; width :500px;">
	<table align="center" style ="margin : 20px">
		<tr>
			<td>
				<select id="station">
					<option value="0">충전기명</option>
					<option value="1">충전기식별번호</option>
				</select>
			</td>
			<td>
				<input type="text" id="name" value="${search}">
			</td>
			<td>
				<span id="search" style="border: 1px solid; padding:1px 10px; cursor: pointer;">
					<a>조회</a>
				</span>
			</td>
		</tr>
	</table>
	<div id="grid"></div>
	<div id="pagination1" class="tui-pagination"></div>
</body>
</html>