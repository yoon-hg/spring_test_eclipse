<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Footer
<div id="footer">
    <ul>
    <li class="frst">
        <a href="#" target="_blank">카페 도움말</a></li>
    <li>
        <a href="#" target="_blank">카페 이용약관</a></li>
    <li>
        <a href="#" target="_blank">카페 운영원칙</a></li>
    <li>
        <a href="#" target="_blank"><strong>개인정보취급방침</strong></a></li>
    <li>
        <a href="#" target="_blank">책임의 한계와 법적고지</a></li>
    <li>
        <a href="#" target="_blank">게시중단요청서비스</a></li>
    <li>
        <a href="#" target="_blank">고객센터</a></li>
    </ul>
    <p class="info">
        지식iN 게시물 내용에 대해 NHN은 보증하지 않으며, 이에 대한 판단의 책임은 이용자 본인에게 있습니다.
    </p>
    <address>
        <a href="#" target="_blank" class="logo"><img src="images/tiles/footer/jinwoo_logo.png" width="62" height="15" alt="NHN"></a>
        <em>Copyright ©</em>
        <a href="#" target="_blank">NHN Corp.</a>
        <span>All Rights Reserved.</span>
    </address>
</div> -->
<script>
$(document).ready(function(){
	var documentH = $(document).height();
	var headerH = $('#header').height();
	var footerH = $('#footer2').height();
	var containerH = $('#container').height();
	var loginH = $('#login').height();
	console.log(documentH+" "+loginH+" "+headerH+" "+footerH+" "+containerH+" "+(documentH-headerH-containerH));
	
	//$('#footer').css({'position':'absolute','top':(documentH)+'px'});
	
	//163 = headerH + footerH;
	//footer 위치 변경
	/* $(window).resize(function() {
		//console.log("##window 리사이즈##");
		var windowH = screen.height; //사용자 모니터 높이
		var brHeaderH = window.outerHeight - window.innerHeight; //브라우저 상단 헤더 높이
		windowH = windowH - brHeaderH;
		console.log(windowH);
		var headerH = $('#header').height();
		var headerbarH = '120';
		
		$('#footer2').css({'height':(documentH-headerH-containerH-loginH-110)+'px'});
	}); */
	
	$('#footer2').css({'height':documentH-headerH-containerH-loginH-110+'px'}); 
});	
</script>

<!-- Footer -->
<div id="footer2">
    <ul>
    <li class="frst">
        <a href="#" target="_blank">문의하기</a></li>
    <li>
        <a href="#" target="_blank">신고하기</a></li>
    <li>
        <a href="#" target="_blank">포토갤러리 도움말</a></li>
    <li>
        <a href="#" target="_blank">이용약관</a></li>
    <li>
        <a href="#" target="_blank">갤러리 운영원칙</a></li>
    <li>
        <a href="#" target="_blank"><strong>개인정보취급방침</strong></a></li>
    <li>
        <a href="#" target="_blank">책임의 한계와 법적고지</a></li>
    <li>
        <a href="#" target="_blank">게시중단요청서비스</a></li>
    <li>
        <a href="#" target="_blank">고객센터</a></li>
    </ul>
    <p class="info">
        모든 이미지는 회원이 직접 올린 것이며, 사진에 대한 권리는 해당 저작권자에게 있습니다.<br>
        타인의 저작물을 불법적으로 이용시에는 제재가 가해질 수 있으며, 이에 대하여 당사는 책임지지 않습니다.
    </p>
    <address>
        <a href="http://www.jinwoosi.co.kr/" target="_blank" class="logo"><img src="../images/tiles/footer/jinwoo_logo.png" width="62" height="15"></a>
        <em>Copyright ©</em>
        <a href="http://www.jinwoosi.co.kr/" target="_blank"> JINWOO Soft Innovation</a>
        <span>All Rights Reserved.</span>
    </address>
</div>
<!-- //Footer -->
<!-- //UI Object -->
