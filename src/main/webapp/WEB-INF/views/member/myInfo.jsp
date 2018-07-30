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
.myInfoImg {
	width: 70%;
	height: 30%;
}

.card-body {
	display: none;
}

.card-body.active {
	display: inline-block;
}

.infoTitle {
	float: left;
	font-weight: bold;
}

.infoContext {
	width: 100%;
	background-color: transparent;
	border: 0px solid;
}

.context {
	margin-bottom: 10%;
	border-bottom: 1px solid gray;
}

.infoContext:focus {
	outline: none;
}

.btn-one, .btn-one:link, .btn-one:visited {
	font-weight: bold;
	color: #339966;
}

.btn-two, .btn-two:link, .btn-two:visited {
	font-weight: bold;
	color: gray;
}

.btn-save, .btn-cancel {
	display: none;
}

.btn-usc {
	height: 50px;
	width: auto;
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	margin: auto;
}
.btn-secondary {
	background-color: #339966;
	border-color: #339966
}

.btn-secondary:active, .btn-secondary:focus, .btn-secondary:hover {
	background-color: #CFF09E;
	border-color: #CFF09E
}
#changePicBtn{
	float: none;
	margin-top: 10px;
}
#inputFileMemberPic, #submit-btn{
 	display: none;
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
	<div class="col-6" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		<div class="card text-center">
		<div class="card-header">
			<h4 style="display: inline-block;">설정</h4>
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item"><a class="nav-link active" href="#">내 정보</a></li>
				<li class="nav-item"><a class="nav-link" href="#">멤버초대 및 탈퇴</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Disabled</a></li>
			</ul>
		</div>
		<div class="card-body active">
			<div class="row">
			<div class="col-md-4">
				<c:choose>
					<c:when test="${sessionScope.member.memberPicture!=null }">
						<c:set var="memberPic" value="../resources/upload/member/${sessionScope.member.memberPicture }"/>
					</c:when>
					<c:otherwise>
						<c:set var="memberPic" value="../resources/upload/member/whale.png"/>
					</c:otherwise>
				</c:choose>
				<img src="${memberPic }" class="img-circle rounded-circle border myInfoImg">
				<form action="/changeMemberPic.do" method="post" enctype="multipart/form-data" name="memberPic">
				<input type="file" name="inputFileMemberPic" id="inputFileMemberPic" accept="image/*" onchange="submitFile();" required/>
				<input type="submit" id="submit-btn"/>
				</form>
				<input type="button" class="btn btn-secondary btn-xl" id="changePicBtn" value="변경하기" onclick="callInputFile();"/>
				
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-8 context">
						<label class="label infoTitle">이메일</label><br>
						<input class="infoContext" type="text" readonly value="${sessionScope.member.memberId }">
					</div>
					<div class="col-md-4">
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">이름</label><br>
						<input class="infoContext name-con" type="text" placeholder="이름을 입력하세요(필수)" value="${sessionScope.member.memberName }">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update">수정</a>
					<a href="#" class="btn-one btn-save" onclick="saveMyInfo('name');">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">부서명</label><br>
						<input class="infoContext depart-con" type="text" placeholder="부서명을 입력하세요" value="${sessionScope.member.memberDepartName }">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update">수정</a>
					<a href="#" class="btn-one btn-save" onclick="saveMyInfo('depart');">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">주요업무</label><br>
						<input class="infoContext mainTask-con" type="text" placeholder="주요업무를 입력하세요" value="${sessionScope.member.memberMainTask }">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update">수정</a>
					<a href="#" class="btn-one btn-save" onclick="saveMyInfo('mainTask');">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">비밀번호 변경</label><br>
						<input id="changePassword" class="infoContext" type="password" placeholder="현재 비밀번호를 입력해주세요">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update changepw">수정</a>
					<a href="#" class="btn-one btn-save" onclick="changePw();">확인</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-12">
						<input type="button" class="btn btn-secondary btn-xl" onclick="location.href='/logout.do'" value="로그아웃"/>
					</div>
				</div>
			</div>
			</div>
		</div>
		<div class="card-body">
		</div>
		<div class="card-body">
		</div>
	</div>
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>
<script>
		$(".nav-item").click(function(){
			var index = $(this).index();
			$(".card-body").attr('class','card-body');
			$(".nav-link").attr('class','nav-link');
			$(this).children('a').attr('class','nav-link active');
			$(".card-body:eq("+index+")").attr('class','card-body active');
		});
		$(".btn-update").click(function(){
			$(this).css('display','none');
			$(this).siblings().css('display','inline-block');
		});
		$(".btn-cancel").click(function(){
			$(this).siblings(".btn-update").css('display','inline-block');
			$(this).css('display','none');
			$(this).siblings('.btn-save').css('display','none');
		});
		$(".btn-save").click(function(){
			$(this).siblings(".btn-update").css('display','inline-block');
			$(this).css('display','none');
			$(this).siblings('.btn-cancel').css('display','none');
		});
		$(".infoContext").click(function(){
 			$(this).parent().next().find('.btn-update').css('display','none');
			$(this).parent().next().find('.btn-save').css('display','inline-block');
			$(this).parent().next().find('.btn-cancel').css('display','inline-block');
		});
		function saveMyInfo(category){
			var context = $('.'+category+'-con').val();
			if(category=='name' && context==''){
				$('.name-con').parent().css('border-bottom','1px solid red');
				alert('이름은 필수 입력사항입니다');
			} else {
				$.ajax({
					url: "/changeMyInfo.do",
					type: "post",
					data: {
						category: category,
						context: context
					},
					success: function(data){
						$('.name-con').parent().css('border-bottom','1px solid gray');
						$('#myInfoDiv').load(window.location.href+" #myInfoDiv");
					},
					error: function(data){
						console.log('실패');
					}
				});
			}
		};
		function changePw(){
			var memberPw = $('#changePassword').val();
			$.ajax({
	  			url : "/checkLogin.do",
	  			type : "post",
	  			data : {
	  				memberId : '${sessionScope.member.memberId }',
	  				memberPw : $('#changePassword').val()
	  			},
	  			success : function(data) {
	  				if(data.result=='failedPw' || memberPw==''){
	  					alert('비밀번호를 확인해주세요');
	  					$('#changePassword').parent().css('border-bottom','1px solid red');
	  				} else {
	  					location.href="/changePwPage.do"
	  				}
	  			},
	  			error : function(data) {
	  				console.log("실패");
	  			}
	  		});
		}
		function callInputFile(){
			$('#inputFileMemberPic').trigger('click');
		}
		function submitFile(){
			$('#submit-btn').trigger('click');
		}
	</script>
</body>
</html>