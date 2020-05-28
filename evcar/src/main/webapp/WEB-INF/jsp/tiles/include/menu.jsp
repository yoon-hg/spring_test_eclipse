<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- UI Object -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
jQuery(function($){
     
    // Side Menu
    var menu_v = $('div.menu_v');
    var sItem = menu_v.find('>ul>li');
    var ssItem = menu_v.find('>ul>li>ul>li');
    var lastEvent = null;
     
    sItem.find('>ul').css('display','none');
    menu_v.find('>ul>li>ul>li[class=active]').parents('li').attr('class','active');
    menu_v.find('>ul>li[class=active]').find('>ul').css('display','block');
 
    function menu_vToggle(event){
        var t = $(this);
         
        if (this == lastEvent) return false;
        lastEvent = this;
        setTimeout(function(){ lastEvent=null }, 200);
         
        if (t.next('ul').is(':hidden')) {
            sItem.find('>ul').slideUp(100);
            t.next('ul').slideDown(100);
        } else if(!t.next('ul').length) {
            sItem.find('>ul').slideUp(100);
        } else {
            t.next('ul').slideUp(100);
        }
         
        if (t.parent('li').hasClass('active')){
            t.parent('li').removeClass('active');
        } else {
            sItem.removeClass('active');
            t.parent('li').addClass('active');
        }
    }
    sItem.find('>a').click(menu_vToggle).focus(menu_vToggle);
     
    function subMenuActive(){
        ssItem.removeClass('active');
        $(this).parent(ssItem).addClass('active');
    };
    ssItem.find('>a').click(subMenuActive).focus(subMenuActive);
     
    //icon
    menu_v.find('>ul>li>ul').prev('a').append('<span class="i"></span>');
});
</script>

<div id="menu_v" class="menu_v">
    <ul>
    	<li style=" font-family:LG PC;">
    		<a style="font-size:20px; color:#fff; padding-top: 50px; padding-bottom: 50px;  background-color:#404040">충전기 사업자</a>
    	</li>
	    <li><a href="#"><span>기초정보관리</span></a>
	        <ul>
		        <li><a href="#"><span>충전사업자관리</span></a></li>
		        <li><a href="#"><span>유지관리업체관리</span></a></li>
	        </ul>
	    </li>
	    <li><a href="#"><span>기본정보관리</span></a>
	        <ul>
		        <li><a href="station.do?bar=2"><span>총전소관리</span></a></li>
		        <li><a href="#"><span>충전기관리</span></a></li>
	        </ul>
	    </li>
	    <li><a href="#"><span>충전기운영관리</span></a>
	    	<ul>
		        <li><a href="certification.do?bar=2"><span>인증이력</span></a></li>
		        <li><a href="#"><span>충전이력</span></a></li>
		        <li><a href="#"><span>고장/정비이력</span></a></li>
		        <li><a href="#"><span>제어이력</span></a></li>
		        <li><a href="#"><span>경보이력</span></a></li>
	        </ul>
	    </li>
	    <li><a href="#"><span>고객관리</span></a>
	        <ul>
		        <li><a href="#"><span>고객관리</span></a></li>
		        <li><a href="#"><span>충전단가관리</span></a></li>
		        <li><a href="#"><span>회원카드</span></a></li>
		        <li><a href="#"><span>정산</span></a></li>
		        <li><a href="receiveMain.do?bar=2"><span>정산이력</span></a></li>
		        <li><a href="#"><span>신용결제이력</span></a></li>
	        </ul>
	    </li>
	    <li><a href="#"><span>시스템관리</span></a>
	        <ul>
		        <li><a href="#"><span>사용자관리</span></a></li>
		        <li><a href="#"><span>공지사항</span></a></li>
	        </ul>
	    </li>
	    <li><a href="#"><span>사이트관리</span></a>
	        <ul>
		        <li><a href="#"><span>메뉴관리</span></a></li>
	        </ul>
	    </li>
    </ul>
</div>
<!-- //UI Object -->
