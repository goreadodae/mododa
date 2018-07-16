<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤더</title>
<style>

	div{
		box-sizing:border-box;
	}
	
	.header{
		margin : 0px;
		padding : 0px;
	}
	#banner{
		background-color : #339966;
		color : white;
		height : 30px;
		margin : 0px;
		padding : 0px;
		text-align:center;
		line-height: 25px;
		font-size: 15px;
	}
	
	#topbar{
		height:50px;
		border-bottom : 1px solid #c8c8c8;
		padding:0px;
	}
	
	#logo-img{
		height:40px;
		vertical-align: middle;
		top:10%;
		left:50%;
		position:absolute;
	}
	
	
	#menu-img{
		height:25px;
		top:25%;
		left:20%;
		position:absolute;
	}
	
	#cancel-img{
		height:50%;
		vertical-align: middle;
		top:22%;
		right:3%;
		position:absolute;
		cursor :pointer;
	}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
	integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
	crossorigin="anonymous"></script>
	
</head>
<script>
<!-- 팝업창 쿠키  -->
	/* 1. 쿠키 만들기 */
	function setCookie(name, value, expiredays) {
		var today = new Date();
	   	today.setDate(today.getDate() + expiredays);
	    document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
	}
	
	/* 2. 쿠키 가져오기 */
	function bannerClose() { 
		$("#banner").hide();
	} 
	
	/* 3. 오늘하루 그만보기 */
	function closePopupNotToday(){	             
		setCookie('notToday','Y', 1);
		$("#top-message").hide();
	}
	
	/* 4. 띄우기 */
	$(window).ready(function(){
		if(getCookie("notToday")!="Y"){
			$("#top-message").show();
		} 
	});
<!-- 팝업창 쿠키 끝-->
</script>

<body>
<div class="header">
	<!-- 팝업창 -->
	<div class="row">
  		<div class="col-12" id="banner">
  			모두다에 대해 더 알고싶다면 여기를 클릭해 주세요.
  			<img id="cancel-img" onclick="bannerClose();" src="../resources/images/layout-img/cancel.png"/>
  		</div>
	</div>
	
	<!-- 상단바 -->
	<div class="row" >
  		<div class="col-3" id="topbar">
  			<img id="menu-img" src="../resources/images/layout-img/menu.png"/>
  		</div>
  		
  		<div class="col-5" id="topbar">
  			<img id="logo-img" src="../resources/images/layout-img/main_logo_rec.png"/>
  		</div>
  		
  		<div class="col-4" id="topbar">
  			<!-- 회원 썸네일 -->
  		</div>
	</div>
</div>

</body>
</html>