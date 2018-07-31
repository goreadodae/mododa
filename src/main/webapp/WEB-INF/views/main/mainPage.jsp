<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
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
.btn-primary {
    background-color: #CFF09E;
    border-color: #CFF09E
}

.btn-primary:active,
.btn-primary:focus,
.btn-primary:hover,
.btn-primary:click {
    background-color: #339966 !important;
    border-color: #339966 !important;
}

.btn-secondary {
	background-color: #339966;
	border-color: #339966
}

.btn-secondary:active, .btn-secondary:focus, .btn-secondary:hover {
	background-color: #CFF09E;
	border-color: #CFF09E
}
</style>
<body>

	<!-- header -->
	<jsp:include page="/header.do"></jsp:include>
	<!-- header 끝 -->

	<div class="row">
		<!-- left bar -->
		<jsp:include page="/leftbar.do"></jsp:include>
		<!-- left bar 끝-->


		<!-- contents -->
		<div class="col-6" id="contents" style="padding: 0;">
			<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
			<%-- <jsp:include page="/newsfeed.do"></jsp:include> --%>
		</div>
		<!-- contents 끝 -->


		<!-- right bar -->
		<jsp:include page="/rightbar.do"></jsp:include>
		<!-- right bar 끝 -->
		<!-- 메일인증 모달 -->
		<div id="mailModal" class="modal">
			<!-- Modal 내용 -->
			<div class="modal-content" style="width: 30%; height: auto;">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-11"></div>
					<div class="col-1">
						<img src="../resources/images/post/close.png" id="modal-close"
							onclick="close_pop();" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<h2
							style="float: left; margin-left: 40px; color: #339966; font-weight: bold;">메일
							인증</h2>
					</div>
					<div class="col-md-12" style="margin-top: 5%;">
						<p
							style="width: 80%; margin: 0 auto; text-align: center; color: gray; font-size: 20px;">
							이메일 인증을 통해 모두다를 시작해보세요<br>인증 메일은 30분 동안 유효합니다.
						</p>
					</div>
					<div class="col-md-4"></div>
					<div class="col-md-4" style="margin-top: 5%; margin-bottom: 10%;">
						<button onclick="sendEmail();" class="btn btn-primary">인증
							메일 보내기</button>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 팝업모달 끝 -->
		<!-- 이메일인증여부확인 -->
	</div>
<script>
/* 메일인증관련 함수 */
function open_pop(flag) {
	$('#mailModal').show();
};
//팝업 Close 기능
function close_pop(flag) {
	$('#mailModal').hide();
};
function sendEmail(){
	$('#mailModal').hide();
	$.ajax({
		url : '/confirmEmail.do',
		type : "post"
	});
};
var timerID;
var time=30*60;
var emailCertifyFlag = true;
$(document).ready(function(){
		<% if(((Member)(session.getAttribute("member"))).getMemberEmailCertify().equals("N")) {%>
		if(emailCertifyFlag){
			countTime();
			open_pop();
		}
	<%}%>
});

function countTime() {
	timerID = setInterval("decrementTime()", 1000);
	emailCertifyFlag = false;
};
function decrementTime(){
	 if(time>0) {
		 time--;
	 }
	 else{
		emailCertifyFlag = true;
		 clearInterval(timeID);
	 }
}
/* 메일인증과련함수 끝 */
</script>
</body>
</html>