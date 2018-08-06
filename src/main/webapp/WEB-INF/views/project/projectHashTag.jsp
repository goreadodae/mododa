<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>

<!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 해시태그</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!-- CDN방식으로 아이콘 사용을 위한 링크 추가 -->
<link rel="stylesheet" type="text/css" href="/css/personal/personalPage.css">
<!-- 개인페이지 공통 style저장. -->
</head>


<style>
/* 기본 구조 스타일 시작 */
body {
	overflow-x: hidden;
	overflow-y: hidden;
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

	window.onload = function () { // 하위메뉴 유지
		var proNoStr = $("#proNo").val();
	    var proNo = proNoStr.substring(6);
	    $('li[id^="sub_' + proNo + '_"]').show();
	    liClose(proNo);
	}


	function searchShow() {
		$("#showHeader").css("display", "none");
		$("#contentSearch").css("display", "");
	}
	
	function searchCancle() {
		$("#keyword").val("");
		$("#showHeader").css("display", "");
		$("#contentSearch").css("display", "none");
		var proNoStr = $("#proNo").val();
	 	var proNo = proNoStr.substring(6);
	 	location.href = "/projectHashTag.do?proNo=" + proNo;
	}
	
	function searchHashTag() // 검색
	{
		var keyword = $("#keyword").val();
		var proNoStr = $("#proNo").val();
	 	var proNo = proNoStr.substring(6);
		//console.log(keyword+"/"+proNo);
		
		
		if(keyword == "") {
			alert("검색어를 입력하세요.");
		} else {
			
				$.ajax({
					url : "/searchHashTag.do",
					type : "post",
					data : { 
						keyword : keyword,
						proNo : proNo
					},
					
					success : function(data) {
						
 						var searchResult = data.searchResult;
						
						console.log(searchResult.length);
						
						if(searchResult.length == 0) {
							
							$(".feed-list").empty();
							$(".feed-list").append("<div>내용없어요</div>");
							
						} else {
								
							$(".feed-list").empty();
								
							var result="";
							
							for(var i=0 ; i<searchResult.length ; i++) {
								
								/* 
								var date = new Date(searchResult[i].postDate.time);
								var dateStr = date.toString();
								var printDate = dateStr.substring(0,10)+" "+dateStr.substring(16,24)+" KST "+dateStr.substring(11,15);
								
								// Mon Jul 30 2018 18:56:04 GMT+0900 (한국 표준시)
								// Mon Jul 30 18:56:04 KST 2018
								
								console.log(printDate); */


  								result += '<li class="feed-contents"><div class="row"><div class="col-md-12">'
	 									  + '<span onclick="getPost('+searchResult[i].postNo+');" class="btn btn-link" style="float:left;">'+searchResult[i].postTitle+'</span></div>'
	 									  + '<div class="col-md-9"><img id="memberImg2" src="'+searchResult[i].memberPicture+'">&nbsp;&nbsp;'+searchResult[i].memberName
	 									  + '&nbsp;&nbsp;&nbsp;&nbsp;'+searchResult[i].postDate+'</div>'
	 									  + '</div>'+searchResult[i].postTag+'<hr style="color: grey;"></li>';
							}
								
							$(".feed-list").append(result);

							
						} 

				    },
					error:function() {
						console.log("실패");
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
	 
	 
	 function onLocation() { // 글쓰기 찾아가는 메소드
		 
			var proNoStr = $("#proNo").val();
		 	var proNo = proNoStr.substring(6);
			//proNo=?
		 	console.log(proNo);
			location.href = "/writePage.do?currentProjectNo="+proNo;
			 
	}
</script>


<body>

<!-- header -->
<jsp:include page="/projectHeader.do"></jsp:include>
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
						<!-- 페이지 클릭시 글쓰기 페이지에 현재 프로젝트 번호 전송  -->
						<button type="button" onclick="onLocation();"class="btn btn-outline-success">
							<i class="fas fa-edit"></i>글쓰기
						</button>
				</div>
				
			</div>
			
			<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
			<div id="contentSearch" class="headertitle" style="display: none;">
				<i class="fas fa-search" style="color: grey; padding-left: 2%;"></i> 
				<input type="text" id="keyword" name="keyword" placeholder="해시태그로 검색(여러 개는 , 로 구분)" />
				<div class="headerFunction" id="searchFun">
					<!-- 검색과 취소버튼 -->
					<button type="button" class="btn btn-outline-success btn-sm"
						onclick="searchHashTag()" style="float:left; padding:10px;">검색</button>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onclick="searchCancle();" style="padding:10px;">취소</button>
				</div>
			</div>
		</div>

		<div class="viewContents  col-md-12" style="overflow:auto; height:84%;">
		
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
			</ul>
			<div align="center">
			<span>마지막입니다.</span>
			<input type="hidden" id="proNo" value="${requestScope['javax.servlet.forward.query_string']}" />
			</div>
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