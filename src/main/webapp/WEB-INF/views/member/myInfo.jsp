<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>협업툴 모두다 MODODA</title>
<style>
.myInfoImg {
	width: 70%;
	height: auto;
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
</style>
</head>
<body>
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
	</script>
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
						<c:set var="memberPic" value="${sessionScope.member.memberPicture }"/>
					</c:when>
					<c:otherwise>
						<c:set var="memberPic" value="../resources/upload/member/whale.png"/>
					</c:otherwise>
				</c:choose>
				<img src="${memberPic }" class="img-circle rounded-circle border myInfoImg">
				<center><button class="btn btn-secondary btn-xl" id="changePicBtn">변경하기</button></center>
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
</body>
</html>