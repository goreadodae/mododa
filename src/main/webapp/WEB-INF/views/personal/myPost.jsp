<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>


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
							result+='<li class="feed-contents"><div class="row"><div class="col-md-12"><span onclick="getPost('+data[i].postNo+')" class="btn btn-link" style="float:left;">"'+data[i].postTitle+'"</span></div>'+
							'<br><div class="col-md-9">'+
							  '<img id="memberImg2" src="'+data[i].myImg+'"/>&nbsp;&nbsp;<span>'+data[i].myName+'</span>&nbsp;&nbsp;&nbsp;&nbsp;'+
							  '<span>'+data[i].postDate+'</span>'+
							  '<a class="btn btn-link btn-sm" href="#" style="float:none;">'+data[i].proName+'</a><hr style="color:grey;"></div>'+
							  '</div></li>';
							}
						$(".feed-list").append(result);
						$(".feed-list").append("<span>마지막입니다.</sapn>");
					}
				},
				error : function() {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
				}
			})
		}
	}
	
</script>
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
					<h5>내가 쓴글</h5>
				</div>
				<div class="headerFunction" id="headerFun">
					<!-- 검색기능버튼과 글쓰기 버튼. -->
					<button type="button" class="btn btn-outline-light btn-lg"
						id="searchShow" onclick="searchShow();">
						<i class="fas fa-search" style="color: grey;"></i>
					</button>

					<button type="button" onclick="location='/write.do'" class="btn btn-outline-success">
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


		<div class="viewContents col-md-12">
			<!-- 내용출력하는 부분 -->
			<ul class="feed-list">
			<c:forEach var="my" items="${mypost }">
				<li class="feed-contents">
					<div class="row">
						<div class="col-md-12">
						<span onclick="getPost(${my.postNo})" class="btn btn-link" style="float:left;">"${my.postTitle }"</span>
						</div>
						<div class="col-md-9">
						<c:choose>
							 <c:when test="${my.myImg !=null}">
							  <c:set var="writerImg" value="${my.myImg }"/>
							 </c:when>
							 <c:otherwise>
							 	<c:set var="writerImg" value="../resources/upload/member/whale.png"/>
							 </c:otherwise>
							</c:choose>
							<img id="memberImg2" src="${writerImg }" />&nbsp;&nbsp;${my.myName }&nbsp;&nbsp;&nbsp;&nbsp;${my.postDate }
						<a class="btn btn-link btn-sm" href="#" style="float:none;">${my.proName }</a><!-- 프로젝트 이름 클릭하면 프로젝트처음 화면으로 이동해야 됨. -->
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
