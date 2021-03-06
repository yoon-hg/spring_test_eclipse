<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<style type="text/css">
body{
	margin: 0 auto; 
	width :450px;
	font-family: LG PC;
}
#name{
	padding : 5px;
	border: 1px solid #ddd;
	border-left-width:0px;
	border-right-width:0px;
	border-top-width:0px;
	border-bottom-width:1px;
	height:20px;
	width: 130px;
}
table {
    border-top: 3px solid #d7d7d7;
    border-collapse: collapse;
    border-bottom: 3px solid #d7d7d7;
    
  }
  td{
  	padding : 10px;
  }
</style>
<body >
	<script type="text/javascript">
		$(document).ready(function(){
			var page_num = 0;
			var totalRecordCount = 0;
			var recordCountPerPage = 0;  
			var pageSize = 0;
			var grid;
			var Grid = tui.Grid;
			var selectValue = '0';
			Grid.setLanguage('ko');
			
			var content={
					"name":$('#name').val(),
					"station":selectValue,
					"page_num" : page_num};
			
			var selectBox = new tui.SelectBox('#select-box1', {
			        data: [
			          { label: '충전기명', value: '0' },
			          { label: '충전기식별번호', value: '1' }
			        ],
			        autofocus: true
			});
			
			//데이터 가져오기 toast
			$.ajax({
				url: "searchChgrAjax.do",
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
					          width: 120
					        },
					        {
					          header: '충전기ID',
					          name: 'chgrId',
					          width: 80
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
				  Search_page(page_num);
			});
			
			$('#search_content').on('click',function(){
				console.log(selectValue);
				Search_page(0);
			});
			
			$("#name").keydown(function(key){
				if(key.keyCode == 13){
					Search_page(0);
				}
			});
			
			selectBox.on('change', function(ev) {
		        console.log(ev.type, ev.prev.getLabel() + "-> "  + ev.curr.getValue());
		        selectValue = ev.curr.getValue();
			});
			
		    
			function Search_page(page_num){
				content={"name":$('#name').val(),
						"station":selectValue,
						"page_num" : page_num};
				$.ajax({
					url : "searchChgrAjax.do",
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
				window.opener.document.getElementById("chgrId").value = grid.getRow($(this).index()).chgrNm;
				window.close();
			});
			
			
		});
	</script>
	<table align="center" style ="margin : 20px">
		<tr>
			<td>
				<div id="select-box1" style="width: 150px;"></div>
			    
			</td>
			<td>
				<input type="text" id="name" value="${search}">
			</td>
			<td>
				<span id="search_content" style="border: 1px solid; padding:5px 10px; cursor: pointer;">
					<a>조회</a>
				</span>
			</td>
		</tr>
	</table>
	<div id="grid"></div>
	<div id="pagination1" class="tui-pagination"></div>
</body>
</html>