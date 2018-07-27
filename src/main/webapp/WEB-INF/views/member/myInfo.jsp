<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>협업툴 모두다 MODODA</title>
<style>
	.myInfoImg{
		width: 70%;
		height: auto;
	}
	.card-body{
		display: none;
	}
	.card-body.active{
		display: inline-block;
	}
	.infoTitle{
		float: left;
	}
	.infoContext{
		width: 100%;
		background-color: transparent;
    	border: 0px solid;
	}
	.context{
		margin-bottom: 10%;
		border-bottom: 1px solid gray;
	}
	.infoContext:focus{
		outline: none;
	}
	.btn-one,
	.btn-one:link,
	.btn-one:visited{
		font-weight: bold;
		color: #339966;
	}
	.btn-two,
	.btn-two:link,
	.btn-two:visited{
		font-weight: bold;
		color: gray;
	}
	.btn-save,
	.btn-cancel{
		display: none;
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
			$(this).prev(".btn-update").css('display','inline-block');
			$(this).css('display','none');
			$(this).prev('.btn-save').css('display','none');
		});
	</script>
	<div class="card text-center">
		<div class="card-header">
			<h4 style="display: inline-block;">설정</h4>
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item"><a class="nav-link active" href="#">내 정보</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
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
				<button>변경하기</button>
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-8 context">
						<label class="label infoTitle">이름</label><br>
						<input class="infoContext" type="text" placeholder="이름을 입력하세요(필수)" value="${sessionScope.member.memberName }">
					</div>
					<div class="col-md-4">
					<a href="#" class="btn-one btn-update">수정</a>
					<a href="#" class="btn-one btn-save">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">이메일</label><br>
						<input class="infoContext" type="text" readonly value="${sessionScope.member.memberId }">
					</div>
					<a href="#" class="btn-one btn-update active">수정</a>
					<a href="#" class="btn-one btn-save">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">부서명</label><br>
						<input class="infoContext" type="text" placeholder="부서명을 입력하세요" value="${sessionScope.member.memberDepartName }">
					</div>
					<div class="col-md-4"><button class="btn btn-secondary btn-xl btn-update">수정</button>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">주요업무</label><br>
						<input class="infoContext" type="text" placeholder="주요업무를 입력하세요" value="${sessionScope.member.memberMainTask }">
					</div>
					<div class="col-md-4"><button class="btn btn-secondary btn-xl btn-update">수정</button>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">비밀번호 변경</label><br>
						<input class="infoContext" type="text" placeholder="비밀번호 변경하기">
					</div>
					<div class="col-md-4"><button class="btn btn-secondary btn-xl">수정</button>
					</div>
					<div class="col-md-12">
						<button class="btn btn-secondary btn-xl" onclick="/logout.do">로그아웃</button>
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