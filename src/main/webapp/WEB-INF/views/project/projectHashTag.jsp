<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>

<!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해시태그</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<!-- 준석이 스타일 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!-- CDN방식으로 아이콘 사용을 위한 링크 추가 -->
<link rel="stylesheet" type="text/css" href="/css/personal/personalPage.css">
<!-- 개인페이지 공통 style저장. -->
</head>


<style>
/* 기본 구조 스타일 시작 */
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
/* 기본 구조 스타일 끝 */
</style>

<script>

	function searchShow() {
		$("#showHeader").css("display", "none");
		$("#contentSearch").css("display", "");
	}
	
	function searchCancle() {
		$("#keyword").val("");
		$("#showHeader").css("display", "");
		$("#contentSearch").css("display", "none");
		$("#content-frame").load("/bookmark.do");
	}
	
	function searchPrivate() // 검색
	{
		var keyword=$("#keyword").val();
		console.log(keyword);
		if(keyword =="")
			{
			alert("검색어를 입력하세요.");
			}else{
				$.ajax({
					url:"",
					type:"post",
					data:{"keyword":keyword},
					dataType:"json",
					success:function(data){
						if(data.length==0)
							{
							$(".feed-list").empty();
							$(".feed-list").append("<div>내용없어요</div>");
							}else{
						$(".feed-list").empty();
						var result="";
						for(var i=0;i<data.length;i++)
							{
/* 							result+=
								'<li class="feed-contents"><div class="row"><div class="col-md-12"><span onclick="getPost('+data[i].postNo+');"class="btn btn-link" style="float:left;">'+data[i].postTitle+'</span></div>'+
								'<div class="col-md-12">&nbsp&nbsp&nbsp'+ data[i].postWriter +' &nbsp&nbsp&nbsp '+ data[i].postDate+'</div>'+
								'<div class="col-md-9"><a href="#" class="btn btn-link" style="float:left;">'+data[i].proName+'</a></div>'+
								'<div class="col-md-3"><button type="button" class="btn btn-success btn-sm" style="float: right;" onclick="delBookmark('+data[i].postNo+');">'+
								'<span class="ico"> <i class="far fa-bookmark"style="color:yellow;"></i></span>'+
								'</button></div>'+
								'</div><hr style="color:grey;"></li>'; */
							}
						$(".feed-list").append(result);
						$(".feed-list").append("<span>마지막입니다.</sapn>");
					   } 
				   },
					error:function()
					{
						alert("error");
					}
				})
			}
				
				
	}
	
	/* 	
	 //글쓰기 버튼 기능 추가 by 영진.
	 function toWriteFn(){
	 $('#toWrite').show();
	 }
	 */
</script>


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


		<div class="viewHeader">
		
			<div id="showHeader">
				<!-- 기본으로 출력되는 헤더 -->
				<div class="headerTitle" id="headerTitle">
					<h5><b>해시태그</b></h5>
				</div>
				
				<div class="headerFunction" id="headerFun">
					<!-- 검색기능버튼과 글쓰기 버튼. -->
					<button type="button" class="btn btn-outline-light btn-lg" id="searchShow" onclick="searchShow();">
						<i class="fas fa-search" style="color: grey;"></i>
					</button>

					<!-- 한영진이 버튼 연결 -->	
					<button type="button" onclick="location='/write.do'" class="btn btn-outline-success">
						<i class="fas fa-edit"></i>글쓰기
					</button>
				</div>
				
			</div>
			
			<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
			<div id="contentSearch" class="headertitle" style="display: none;">
				&nbsp;&nbsp;<i class="fas fa-search" style="color: grey;"></i> 
				<input type="text" id="keyword" name="keyword" placeholder="제목 또는 글 작성자로 검색" />
				<div class="headerFunction" id="searchFun">
					<!-- 검색과 취소버튼 -->
					<button type="button" class="btn btn-outline-success btn-sm"
						onclick="searchPrivate()" style="float:left; padding:10px;">검색</button>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onclick="searchCancle();" style="padding:10px;">취소</button>
				</div>
			</div>
		</div>

		<div class="viewContents  col-md-12">
		
			<!-- 내용출력하는 부분 -->
			<ul class="feed-list">
				<c:forEach items="${postList}" var="postList">
					<li class="feed-contents">
						<div class="row">
							<div class="col-md-12">
							<span onclick="getPost(${postList.postNo});" class="btn btn-link" style="float:left;">${postList.postTitle}</span>
							</div>
							
							<div class="col-md-9">
							<img id="memberImg2" src="${postList.memberPicture}">&nbsp;&nbsp;${postList.memberName}&nbsp;&nbsp;&nbsp;&nbsp;${postList.postDate}
							</div>
							
						</div>
						${postList.postTag}
						<hr style="color: grey;">
					</li>
				</c:forEach>
				<span>마지막입니다.</span>
			</ul>
		</div>



		</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>

<jsp:include page="/post.do"></jsp:include> <!-- 게시글 보기 -->

</body>
</html>