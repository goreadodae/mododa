<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="icon" href="/resources/favicon.ico">
	<link rel="shortcut icon" href="/resources/favicon.ico">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>협업툴 모두다 MODODA</title>


<link rel="stylesheet" type="text/css"
	href="/css/personal/personalPage.css">
<!-- 개인페이지 공통 style저장. -->

<script>
	function searchShow() {
		$("#showHeader").css("display", "none");
		$("#contentSearch").css("display", "");
	}

	function searchCancle() {
		$("#keyword").val("");
		$("#showHeader").css("display", "");
		$("#contentSearch").css("display", "none");
		location.href="mypost.do";

		//검색 이후 결과가 나오거나 없으면, 어쨋든 실행 후 취소 버튼 누르면 다시 내가 쓴 글 보여줄 수 있도록 새로 로드필요
	}
	//돋보기 아이콘 클릭 후 검색어 입력 후 검색버튼누르면 검색하는 function.
	function searchTitle() {
		var keyword = $("#keyword").val();
		if (keyword == "") {
			alert("검색어를 입력하세요!!!")
		} else {
			$.ajax({
				url : "/searchTitle.do",
				type : "POST",
				data : {
					"keyword" : keyword
				},
				success : function(data) {
					if (data.length == 0) {
						$(".feed-list").empty();
						$(".feed-list").append('<div class="row">'+
							  	'<div class="col-md-12"><center>'+	
						'<img src="../resources/images/layout-img/main_logo_square.png" style="width:50%;height:30%"/><br>'+
						'<span font-size="12px;">검색결과가 존재하지 않습니다..</span></div></div>');
					} else {
						var result="";
						$(".feed-list").empty();
						for(var i=0;i<data.length;i++)
							{
							result+='<li class="feed-contents"><div class="row"><div class="col-md-12"><a onclick="getPost('+data[i].postNo+')" id="postTitle"  class="btn btn-link" style="float:left;"><b>"'+data[i].postTitle+'"</b></a></div>'+
							'<br><div class="col-md-12">'+
							  '<img id="memberImg2" src="../resources/upload/member/'+data[i].myImg+'"/>&nbsp;&nbsp;<span>'+data[i].myName+'</span>&nbsp;&nbsp;&nbsp;&nbsp;'+
							  '<span>'+data[i].postDate+'</span>'+
							  '<a class="btn btn-link btn-sm" onclick="postChange('+data[i].proNo+')" id="proName" style="float:right;color:#339966">'+data[i].proName+'</a><hr style="color:grey;"></div>'+
							  '</div></li>';
							}
						$(".feed-list").append(result);
					}
				},
				error : function() {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
				}
			})
		}
	}
		
	
	// private번호 가져오기
	
	$(document).ready(function(){
		
	$.ajax({
		url : "/setPrivateSpace.do",
		type : "post",
		success : function(data){
		console.log("나의 프라이빗 번호 받아오기를 성공했어여!")
		console.log("이건 나의 프라이빗 번호"+data)
		var str=""
			str += '<input type="hidden" id="myPrivateNo" value="'+data.myPrivateNo+'"/>'
			$('#goWriting').append(str);
			str="";
		},
		error : function(data){
			console.log("에러라능");
		}
	});
	});
	
	
	function goWriting(){
		console.log("클릭");
		var myPrivateNo = $('#myPrivateNo').val();
		console.log(myPrivateNo);
		
		location.href="/writePage.do?currentProjectNo="+myPrivateNo;
		
	}
	///요기까지
	function postChange(proNo){
		location.href="/projectPost.do?proNo="+proNo;
	}
	
</script>
</head>

<style>
body {
	overflow-x: hidden;
	overflow-y: hidden;
	height: 100vh;

}
div {
	margin: 0px;
	padding: 0px;
}
.col-md-12 a:hover{
	background-color:#f8f9fa;
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
		<div class="content">
		<div class="viewHeader">
			<div id="showHeader">
				<!-- 기본으로 출력되는 헤더 -->
				<div class="headerTitle" id="headerTitle">
					<h5><b>내가 쓴글</b></h5>
				</div>
				<div class="headerFunction" id="headerFun">
					<!-- 검색기능버튼과 글쓰기 버튼. -->
					<button type="button" class="btn btn-outline-light btn-lg"
						id="searchShow" onclick="searchShow();">
						<i class="fas fa-search" style="color: grey;"></i>
					</button>

					<button type="button" id="goWriting" onclick="goWriting();" class="btn btn-outline-success">
						<i class="fas fa-edit"></i>글쓰기
					</button>

				</div>
			</div>
			<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
			<div id="contentSearch" class="headertitle" style="display: none;">
				<i class="fas fa-search" style="color: grey;"></i> 
				<input type="text" id="keyword" name="keyword" 
				 placeholder="제목 검색" />
				<div class="headerFunction" id="searchFun">
					<!-- 검색과 취소버튼 -->
					<button type="button" class="btn btn-outline-success btn-sm"
						onClick="searchTitle();" style="float:left;">검색!</button>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onClick="searchCancle();">취소</button>
				</div>
			</div>
		</div>


		<div class="viewContents col-md-12" style="overflow-y:auto;">
			<!-- 내용출력하는 부분 -->
			<ul class="feed-list">
			<c:if test="${empty mypost }">
					<center>
					<img src="../resources/images/layout-img/main_logo_square.png" style="width:50%;height:30%"/><br>
					<span font-size="12px;">아직 글이 없어요..<br>프라이빗공간이나 프로젝트에 글을 작성해보면 어떨까요??</span>
					</center>
			</c:if>
			<c:forEach var="my" items="${mypost }">
				<li class="feed-contents">
					<div class="row">
						<div class="col-md-12">
						<a onclick="getPost(${my.postNo})" class="btn btn-link" id="postTitle" style="float:left;"><b>"${my.postTitle }"</b></a>
						</div>
						<div class="col-md-12">
							<img id="memberImg2" src="../resources/upload/member/${my.myImg }" />&nbsp;&nbsp;${my.myName }&nbsp;&nbsp;&nbsp;&nbsp;${my.postDate }
						<a class="btn btn-link btn-sm" onclick="postChange(${my.proNo });" id="proName" style="float:right;color:#339966">${my.proName }</a>
					 	</div>
					</div>
					<hr style="color: grey;">
				</li>
				</c:forEach>
				</ul>
		</div>
	</div>
<jsp:include page="/post.do"></jsp:include>
		
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>

</body>
</html>
