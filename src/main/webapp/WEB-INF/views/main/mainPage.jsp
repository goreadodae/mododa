<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레이아웃 샘플입니다.</title>
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
<script
  src="http://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<style>
body {
	overflow-x: hidden;
	height: 100%;
}

div {
	margin: 0px;
	padding: 0px;
}

#background {
	background-color: #F5F5F5;
	margin: 0px;
	padding: 0px;
}

/* header */
.header {
	margin: 0px;
	padding: 0px;
}

#banner {
	background-color: #339966;
	color: white;
	height: 30px;
	margin: 0px;
	padding: 0px;
	text-align: center;
	line-height: 25px;
	font-size: 15px;
}

#topbar {
	height: 50px;
	border-bottom: 1px solid #c8c8c8;
	padding: 0px;
}

#logo-img {
	height: 40px;
	vertical-align: middle;
	top: 10%;
	left: 50%;
	position: absolute;
}

#menu-img {
	height: 25px;
	top: 25%;
	left: 20%;
	position: absolute;
}

#cancel-img {
	height: 50%;
	vertical-align: middle;
	top: 22%;
	right: 3%;
	position: absolute;
	cursor: pointer;
}

/* leftbar */
.leftbar {
	background-color: #F5F5F5;
	position: relative;
	height: auto;
}

ul {
	float: right;
	width: 80%;
}

li {
	list-style: none;
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
	margin-right: 10px;
}

.icon {
	margin-right: 5%;
}

.list-title {
	color: #464646;
}

div {
	box-sizing: border-box;
}

/* rightbar */
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

table {
	padding: 20px;
	margin: 20px;
}

/* contents */
#contents{
	padding : 0px;
}

#content-frame{
	height:100%;
	width : 100%;
	padding : 0px;
	frameborder : 0px;
	border : 0px;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.6); /* Black w/ opacity */
}
.modal-content{
	margin: 20% auto;
}
#modal-close {
	width: 20px;
	margin-top: 20px;
	margin-right: 20px;
	float: right;
}
.btn {
    border-width: 2px
}
.btn-primary {
    background-color: #CFF09E;
    border-color: #CFF09E
}

.btn-primary:active,
.btn-primary:focus,
.btn-primary:hover {
    background-color: #CFF09E;
    border-color: #CFF09E
}

.btn-secondary {
    background-color: #339966;
    border-color: #339966
}

.btn-secondary:active,
.btn-secondary:focus,
.btn-secondary:hover {
    background-color: #CFF09E;
    border-color: #CFF09E
}
</style>

<script>
	//leftbar, rightbar 높이 설정
	$(document).ready(function() {
		resizeContent();
	});

	$(window).resize(function() {
		resizeContent();
	});
	
	function resizeContent() {
		var windowHeight = $(window).height();
		var topHeight = $('.header').height();
		
		$('#background').css({
			'height' : (windowHeight-topHeight) + 'px'
		});
	}
	
	//배너 닫기
	function bannerClose() {
		$("#banner").hide();
	}
	
	//contents 화면 전환
	jQuery(function($) {
		   $("#newsfeed").click(function() {
		      $("#content-frame").remove();
		      $("#contents").append("<div id='content-frame'></div>");
		      $("#content-frame").load("");
		   });

		   $("#callpost").click(function() {
			   $("#content-frame").remove();
			   $("#contents").append("<div id='content-frame'></div>");
			   $("#content-frame").load("/testareum.do");
		   });
		   
		   $("#project").click(function() {
			   $("#content-frame").remove();
			   $("#contents").append("<div id='content-frame'></div>");
			   $("#content-frame").load("");
		   });

	});
	
	function open_pop(flag) {
		$('#mailModal').show();
	};
	//팝업 Close 기능
	function close_pop(flag) {
		$('#mailModal').hide();
	};
	function sendEmail(){
		$('#mailModal').hide();
		location.href='/confirmEmail.do';
	}
	<% if(((Member)(session.getAttribute("member"))).getMemberEmailCertify().equals("N")) {%>
		console.log('aaaaaa');
		open_pop();
	<%}%>
</script>

<!-- 지은이가 사용할 스크립트 -->
<script>

/* 지은 프로젝트부분 contents 화면 전환 함수 */
jQuery(function($) {
   $("#createProject").click(function() {
	   $("#content-frame").remove();
	   $("#contents").append("<div id='content-frame'></div>");
	   $("#content-frame").load("/gotoCreateProject.do");
   });

});

</script>

<body>
	<div>
		<!-- header -->
		<div class="header">

			<!-- 팝업창 -->
			<div class="row">
				<div class="col-12" id="banner">
					모두다에 대해 더 알고싶다면 여기를 클릭해 주세요. <img id="cancel-img"
						onclick="bannerClose();"
						src="../resources/images/layout-img/cancel.png" />
				</div>
			</div>

			<!-- 상단바 -->
			<div class="row">
				<div class="col-3" id="topbar">
					<img id="menu-img" src="../resources/images/layout-img/menu.png" />
				</div>

				<div class="col-5" id="topbar">
					<img id="logo-img"          
						src="../resources/images/layout-img/main_logo_rec.png" />
				</div>

				<div class="col-4" id="topbar">
					<!-- 회원 썸네일 -->
				</div>
			</div>
		</div>
		<!-- header 끝 -->
		<div class="row">

			<!-- left bar -->
			<div class="col-3" id="background">
				<div class="leftbar">
					<br>
					<ul>
						<li class="list-title">전체 정보</li>
						<li class="list-group-item" id="newsfeed"><img src="../resources/images/layout-img/lightning.png" class="icon"> 뉴스피드</li>
						<li class="list-group-item" id="callpost"><img src="../resources/images/layout-img/arroba.png" class="icon"> 호출된 글</li>
						<li class="list-group-item" id="bookmark"><img src="../resources/images/layout-img/bookmark.png" class="icon"> 북마크</li>
						<li class="list-group-item" id="mypost"><img src="../resources/images/layout-img/file.png" class="icon"> 내가 쓴글</li>
						<li class="list-group-item" id="calendar"><img src="../resources/images/layout-img/calendar.png" class="icon"> 전체 캘린더</li>
					</ul>

					<br>


					<ul>
						<li class="list-title">프로젝트</li>
						<li class="list-group-item" id="createProject"><img src="../resources/images/layout-img/plus.png" class="icon"> 새 프로젝트 만들기</li>
					</ul>

				</div>
			</div>
			<!-- left bar 끝-->


			<!-- contents -->
			<div class="col-6" id="contents">
			</div>
			<!-- contents 끝 -->


			<!-- right bar -->
			<div class="col-3" id="background">
				<!-- 테이블을 이용한 경우 -->
				<table width="300px">
					<!-- 자료실 메뉴 -->
					<tr style="float: right;">
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-dark dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">자료실</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">할 일</a> <a
										class="dropdown-item" href="#">의사결정</a> <a
										class="dropdown-item" href="#">이미지</a> <a
										class="dropdown-item" href="#">파일</a> <a class="dropdown-item"
										href="#">링크</a>
								</div>
							</div>
						</td>
					</tr>

					<!-- 할 일 -->
					<tr>
						<td>
							<div class="dropdown-divider"></div>
							<h5>할 일</h5>
							<br>

							<div class="btn-group">
								<button type="button" class="btn btn-link dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<img src="../resources/images/icon/checked-allot.png"></img>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-allot.png"></img> 할당된 할
										일</a> <a class="dropdown-item" href="#"><img
										src="../resources/images/icon/play-button.png"></img> 진행중</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/pause.png"></img> 일시중지</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-complete.png"></img> 완료</a>
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
								</div>
							</div> <a href="#">할 일 제목1</a> <a href="#" style="font-size: 80%">할
								일 작성자</a><br>

							<div class="btn-group">
								<button type="button" class="btn btn-link dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<img src="../resources/images/icon/checked-allot.png"></img>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-allot.png"></img> 할당된 할
										일</a> <a class="dropdown-item" href="#"><img
										src="../resources/images/icon/play-button.png"></img> 진행중</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/pause.png"></img> 일시중지</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-complete.png"></img> 완료</a>
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
								</div>
							</div> <a href="#">할 일 제목2</a> <a href="#" style="font-size: 80%">할
								일 작성자</a><br>
						</td>
					</tr>

					<!-- 할 일의 더보기 -->
					<tr style="float: right;">
						<td><br> <a href="#" style="font-size: 80%">더보기 ></a></td>
					</tr>

					<!-- 의사결정 -->
					<tr>
						<td>
							<div class="dropdown-divider"></div>
							<h5>의사결정</h5>
							<br>
							<p>
								<a href="#"><img src="../resources/images/icon/decision.png"></img>
									의사결정 제목1</a> <a href="#" style="font-size: 80%">의사결정 지목된 사람</a><br>
							</p>
							<p>
								<a href="#"><img src="../resources/images/icon/decision.png"></img>
									의사결정 제목2</a> <a href="#" style="font-size: 80%">의사결정 지목된 사람</a><br>
							</p>
						</td>
					</tr>

					<!-- 의사결정의 더보기 -->
					<tr style="float: right;">
						<td><br> <a href="#" style="font-size: 80%">더보기 ></a></td>
					</tr>


				</table>
			</div>
			<!-- right bar 끝 -->
		</div>
		<!-- 메일인증 모달 -->
		<div id="mailModal" class="modal">

			<!-- Modal 내용 -->
			<div class="modal-content" style="width: 40%; height: 30%;">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-11"></div>
					<div class="col-1">
						<img src="../resources/images/post/close.png" id="modal-close" onclick="close_pop();" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
					<h2 style="float: left; margin-left: 40px; color: #339966; font-weight: bold;">메일 인증</h2>
					</div>
					<div class="col-md-12" style="margin-top: 5%;">
						<p style="width:80%; margin: 0 auto; text-align: center; color: gray; font-size: 20px;">이메일 인증을 통해 모두다를 시작해보세요<br>인증 메일은 30분 동안 유효합니다.</p>
					</div>
					<div class="offset-md-8 col-md-4" style="margin-top: 5%;">
						<button onclick="sendEmail();" class="btn btn-primary btn-xl">인증 메일 보내기</button>
					</div>
				</div>
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 팝업모달 끝 -->
		<!-- 이메일인증여부확인 -->
	</div>
</body>
</html>