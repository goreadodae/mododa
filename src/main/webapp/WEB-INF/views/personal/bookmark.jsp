
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<!-- CDN방식으로 아이콘 사용을 위한 링크 추가 -->

<link rel="stylesheet" type="text/css"
	href="/css/personal/personalPage.css">
<!-- 개인페이지 공통 style저장. -->
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
<script>
	
	function searchShow() {
		$("#showHeader").css("display", "none");
		$("#contentSearch").css("display", "");
	}
	function searchCancle() {
		$("#keyword").val("");
		$("#showHeader").css("display", "");
		$("#contentSearch").css("display", "none");
	
		location.href="bookmark.do";
	}
	
	function delBookmark(bookNo){
		var result = confirm("북마크 해제 하겠습니까??");
		if(result){
		var delBookNo = bookNo;
		$.ajax({
			url:"/delBookmark.do",
			type:"POST",
			data:{"delBookNo":delBookNo},
			success:function(data){
				$("#content-frame").load("/bookmark.do");
			},
			error:function(){
				alert("error!");
			}
		})
	}
		else{
			alert("취소되었습니다.");
			}
		}
	function searchBook()// 북마크 글 작성한 회원이름,또는 글 제목을 검색.
	{
		var keyword=$("#keyword").val();
		console.log(keyword);
		if(keyword =="")
			{
			alert("검색어를 입력하세요!!");
			}else{
				$.ajax({
					url:"/searchBook.do",
					type:"post",
					data:{"keyword":keyword},
					dataType:"json",
					success:function(data){
						if(data.length==0)
							{
							$(".feed-list").empty();
							$(".feed-list").append('<div class="row">'+
								  	'<div class="col-md-12"><center>'+	
									'<img src="../resources/images/layout-img/main_logo_square.png" style="width:50%;height:30%"/><br>'+
									'<span font-size="12px;">검색결과가 존재하지 않습니다..</span></div></div>');
							}else{
						$(".feed-list").empty();
						var result="";
						for(var i=0;i<data.length;i++)
							{
							result+=
								'<li class="feed-contents"><div class="row"><div class="col-md-12"><span onclick="getPost('+data[i].postNo+');"class="btn btn-link" style="float:left;">'+data[i].postTitle+'</span></div>'+
								'<div class="col-md-9"><img id="memberImg2" src="'+data[i].writerImg+'">&nbsp;&nbsp;&nbsp;'+ data[i].postWriter +' &nbsp;&nbsp;&nbsp; '+ data[i].postDate+'<a href="#" class="btn btn-link" style="float:none;">'
								+data[i].proName+'</a></div>'+
								'<div class="col-md-3"><button type="button" class="btn btn-success btn-sm" style="float: right;" onclick="delBookmark('+data[i].postNo+');">'+
								'<span class="ico"> <i class="far fa-bookmark"style="color:yellow;"></i></span>'+
								'</button></div>'+
								'</div><hr style="color:grey;"></li>';
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
		<div class="content">
		<div class="viewHeader">
			<div id="showHeader">
				<!-- 기본으로 출력되는 헤더 -->
				<div class="headerTitle" id="headerTitle">
					<h5>북마크</h5>
				</div>
				<div class="headerFunction" id="headerFun">
					<!-- 검색기능버튼과 글쓰기 버튼. -->
					<button type="button" class="btn btn-outline-light btn-lg"
						id="searchShow" onclick="searchShow();">
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
				<i class="fas fa-search" style="color: grey;"></i> <input
					type="text" id="keyword" name="keyword" placeholder="제목&글 작성자로 검색" />
				<div class="headerFunction" id="searchFun">
					<!-- 검색과 취소버튼 -->
					<button type="button" class="btn btn-outline-success btn-sm"
						onclick="searchBook()" style="float:left;">검색!</button>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onclick="searchCancle();">취소</button>
				</div>
			</div>
		</div>

		<div class="viewContents  col-md-12">
			<!-- 내용출력하는 부분 -->
			<ul class="feed-list">
				<c:forEach var="book" items="${bookmark }">
					<li class="feed-contents">
						<div class="row">
							<div class="col-md-12">
							<div class="btn-group">
							<button type="button" class="btn btn-link dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<img id="statusImg" src="../resources/images/post/lightbulb.png" />
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" onclick="changeProgress('발의된 이슈');"><img src="../resources/images/post/lightbulb.png" /> 발의된 이슈</a> 
								<a class="dropdown-item" onclick="changeProgress('진행 중');"><img src="../resources/images/icon/play-button.png" /> 진행 중</a> 
								<a class="dropdown-item" onclick="changeProgress('일시중지');"><img src="../resources/images/icon/pause.png" /> 일시중지</a> 
								<a class="dropdown-item" onclick="changeProgress('완료');"><img src="../resources/images/icon/checked-allot.png" /> 완료</a>
							</div>
						</div>
							<span onclick="getPost(${book.postNo});" class="btn btn-link" style="float:left;">${book.postTitle }</span>
							</div>
							<div class="col-md-9">
							<c:choose>
							 <c:when test="${book.writerImg !=null}">
							  <c:set var="writerImg" value="${book.writerImg }"/>
							 </c:when>
							 <c:otherwise>
							 	<c:set var="writerImg" value="../resources/upload/member/whale.png"/>
							 </c:otherwise>
							</c:choose>
							<img id="memberImg2" src="${writerImg }">&nbsp;&nbsp;${book.postWriter }&nbsp;&nbsp;&nbsp;&nbsp;${book.postDate }
							<a href="#" class="btn btn-link" style="float:none;" >${book.proName }</a></div>
							<div class="col-md-3"><button type="button" class="btn btn-success btn-sm"
								style="float: right;" onclick="delBookmark(${book.postNo});">
								<span class="ico"> <i class="far fa-bookmark"
									style="color: yellow;"></i>
								</span>
							</button>
							</div>
						</div>
						<hr style="color: grey;">
					</li>
				</c:forEach>
				<span>마지막입니다.</span>
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
