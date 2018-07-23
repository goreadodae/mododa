<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>협업툴 모두다 MODODA</title>
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
<script src="http://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<style type="text/css">
#topbar {
	height: 100px;
	border-bottom: 1px solid #c8c8c8;
	padding: 0px;
}

#logo-img {
	height: 80px;
	vertical-align: middle;
	top: 10%;
	right: 50%;
	position: absolute;
}
.btn {
    border-width: 2px;
    float: right;
    height: 40%;
    width: 50%;
    font-size: 180%;
    position: absolute;
    bottom: 0;
}
.btn-primary {
    background-color: #CFF09E;
    border-color: #CFF09E
}

.btn-primary:active,
.btn-primary:focus,
.btn-primary:hover {
    background-color: #CFF09E !important;
    border-color: #CFF09E !important;
}
h1{
	color: white;
	font-weight: 700;
}
h3{
	color: white;
	font-weight: 500;
}
</style>
</head>
<body>
	<script>
	var timerID;
	var time=10;
	$(window).ready(function(){
		setTimeout('go_url()',10000)  // 10초후 go_url() 함수를 호출한다.
		timerID = setInterval("decrementTime()", 1000);
	});

     function go_url(){
        location.href="/mainPage.do";
     };
     function decrementTime(){
    	 if(time>0) {
    		 time--;
    		 console.log(time);
    		 $('#sc').text(time);
    	 }
    	 else{
    		 clearInterval(timeID);
    	 }
     }
	</script>
	<div class="row">
		<div class="col-md-5" id="topbar">
			<img id="logo-img"
				src="../resources/images/layout-img/main_logo_rec.png"
				style="left: 20%;" />
		</div>
		<div class="col-7" id="topbar"></div>
	</div>
	<div class="row">
		<div class="col-md-12 mx-auto">
			<center>
				<img class="img-fluid"
					src="../resources/index_img/intro_img/intro_6.PNG" style="height: 480px; width: auto;">
			</center>
		</div>
	</div>
	<div class="row" style="height: 400px;">
		<div class="col-md-12" style="background-color: #339966!important;">
			<div class="row">
				<div class="col-md-7" style="margin-top: 10%; left: 10%;">
				<h1>인증이 완료되었습니다</h1>
				<h3><span id="sc"></span>초 후 자동으로 메인 페이지로 이동합니다</h3>
				</div>
				<div class="col-md-5">
				<button onclick="location.href='/mainPage.do'" class="btn btn-primary" style="">메인 페이지로 이동</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>