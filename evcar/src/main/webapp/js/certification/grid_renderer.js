/**
 * CustomReqBtnRenderer
 *  그리드에 제어요청 버튼 삽입
 * */
function CustomReqBtnRenderer(props){
	var gridData = new Object();
	gridData.grid = props.grid;
	gridData.rowKey = props.rowKey;
	
	//console.log(gridData.grid.getRowAt(gridData.rowKey, true));
	//console.log(props);
	
	var rowData = gridData.grid.getRowAt(gridData.rowKey, true);
	var el = document.createElement('span');
	
	if(rowData.sf == '인증실패'){

		var reqButton = document.createElement("button");
		reqButton.className = "btn_basic_g";
		reqButton.className += " btn_request";
		
		var btnText = document.createTextNode( '인증실패' );
		reqButton.appendChild(btnText);
		el.appendChild(reqButton);
		reqButton.setAttribute("style","cursor: pointer;");
		reqButton.setAttribute("id", "approval");
	}
	else{
		var spanText = document.createTextNode( '인증성공' );
		el.appendChild(spanText);
		el.setAttribute("style", "font-weight:bold; ");
	}
	
	this.el = el;
}

CustomReqBtnRenderer.prototype.getElement = function(){
	return this.el;
}

CustomReqBtnRenderer.prototype.render = function(){
	
}
