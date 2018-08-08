<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="/resources/favicon.ico">
	<link rel="shortcut icon" href="/resources/favicon.ico">
	<title>협업툴 모두다 MODODA</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
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
        location.href="/index.jsp";
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
			<div class="row">
			<div class="offset-md-2 col-md-4" style="padding-top: 2%; padding-bottom: 2%;">
				<center>
				<img src="../resources/images/error/mailError.png" style="width: 280px; margin: auto;"/>
				</center>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-12">
						<strong style="font-size: 100px; color: #CFF09E;">ERROR!</strong>
					</div>
					<div class="col-md-12">
						<label style="font-weight: bold;">
							죄송합니다.<br>
							모두다는 메일인증 후 이용이 가능합니다.
						</label>
						<label>
							메인페이지에서 메일인증을 해주시기 바랍니다.<br>
							궁금한 점이 있으시면 언제든 고객센터를 통해<br>
							문의해 주시기 바랍니다. 감사합니다.<br>
						</label>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	<div class="row" style="height: 300px;">
		<div class="col-md-12" style="background-color: #339966!important;">
			<div class="row">
				<div class="col-md-7" style="margin-top: 6%; left: 10%;">
				<h1>메일 인증 에러</h1>
				<h3><span id="sc"></span>초 후 자동으로 메인 페이지로 이동합니다</h3>
				</div>
				<div class="col-md-5">
				<button onclick="location.href='/index.jsp'" class="btn btn-primary" style="">메인 페이지로 이동</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>