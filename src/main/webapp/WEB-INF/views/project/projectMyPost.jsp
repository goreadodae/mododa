<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>

<!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="/resources/favicon.ico">
	<link rel="shortcut icon" href="/resources/favicon.ico">
	<title>협업툴 모두다 MODODA</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>


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
	height: 100vh;
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
	 	location.href = "/projectMyPost.do?proNo=" + proNo;
	}
	
	function searchMyPost() // 검색
	{
		var keyword = $("#keyword").val();
		var proNoStr = $("#proNo").val();
	 	var proNo = proNoStr.substring(6);
		//console.log(keyword+"/"+proNo);
		
		
		if(keyword == "") {
			alert("검색어를 입력하세요.");
		} else {
			
				$.ajax({
					url : "/searchMyPostProTitle.do",
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
							$(".feed-list").append('<div class="row">'+
								  	'<div class="col-md-12"><center>'+	
									'<img src="../resources/images/layout-img/main_logo_square.png" style="width:50%;height:30%"/><br>'+
									'<span font-size="12px;">검색결과가 존재하지 않습니다..</span></div></div>');
							
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
  								result += '<li class="feed-contents"><div class="row"><div class="col-md-12">';
  								if(data[i].postProgress=='suggest'){
  									result+='<img id="statusImg1" src="../resources/images/post/light-bulbOn.png" title="발의된 이슈"/>';
  								}else if(data[i].postProgress=='working'){
  									result+='<img id="statusImg1" src="../resources/images/post/play-buttonOn.png" title="진행 중"/>';
  								}else if(data[i].postProgress=='stop'){
  									result+='<img id="statusImg1" src="../resources/images/post/pauseOn.png" title="일시 정지"/>';
  								}else{
  									result+='<img id="statusImg1" src="../resources/images/post/checked.png" title="완료"/>';
  								}
	 							result+= '<a onclick="getPost('+searchResult[i].postNo+');" id="postTitle" class="btn btn-link" ><b>'+searchResult[i].postTitle+'</b></a></div>'
	 									  + '<div class="col-md-9"><img id="memberImg2" src="../resources/upload/member/'+searchResult[i].memberPicture+'">&nbsp;&nbsp;'+searchResult[i].memberName
	 									  + '&nbsp;&nbsp;&nbsp;&nbsp;'+searchResult[i].postDate+'</div>'
	 									  + '</div><hr style="color: grey;"></li>';
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
					<h5><b>내가 쓴 글</b></h5>
				</div>
				
				<div class="headerFunction" id="headerFun">
						<!-- 검색기능버튼과 글쓰기 버튼. -->
						<button type="button" class="btn btn-outline-light btn-lg"
							id="searchShow" onclick="searchShow();">
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
				<input type="text" id="keyword" name="keyword" placeholder="제목 또는 글 작성자로 검색" />
				<div class="headerFunction" id="searchFun">
					<!-- 검색과 취소버튼 -->
					<button type="button" class="btn btn-outline-success btn-sm"
						onclick="searchMyPost()" style="float:left; padding:10px;">검색</button>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onclick="searchCancle();" style="padding:10px;">취소</button>
				</div>
			</div>
		</div>

		<div class="viewContents  col-md-12" style="overflow:auto;">
		
			<!-- 내용출력하는 부분 -->
			<ul class="feed-list">
				<c:if test="${empty postList }">
						<center>
							<img src="../resources/images/layout-img/main_logo_square.png"style="width: 50%; height: 25%;" /><br> 
							<span font-size="12px;">아직 프로젝트에 글을 안 남기셨네요.. 글을 남겨보면 어떨까요??</span>
						</center>
					</c:if>
				<c:forEach items="${postList}" var="postList">
					<li class="feed-contents">
						<div class="row">
							<div class="col-md-12">
							<c:choose>
									<c:when test="${postList.postProgress eq 'suggest' }">
										<c:set var="statusImg" value="../resources/images/post/light-bulbOn.png" />
										<c:set var="statusTxt" value="발의된 이슈"/>
									</c:when>
									<c:when test="${postList.postProgress eq 'working' }">
										<c:set var="statusImg" value="../resources/images/post/play-buttonOn.png"/>
										<c:set var="statusTxt" value="진행 중"/>
									</c:when>
									<c:when test="${postList.postProgress eq 'stop' }">
										<c:set var="statusImg" value="../resources/images/post/pauseOn.png"/>
										<c:set var="statusTxt" value="일시 중지"/>	
									</c:when>
									<c:otherwise>
										<c:set var ="statusImg" value="../resources/images/post/checked.png"/>
										<c:set var="statusTxt" value="완료"/>
									</c:otherwise>
									</c:choose>
								<img id="statusImg1" src="${statusImg }" title="${statusTxt }"/>
							<a onclick="getPost(${postList.postNo});" id="postTitle" class="btn btn-link"><b>"${postList.postTitle}"</b></a>
							</div>
							
							<div class="col-md-9">
							<img id="memberImg2" src="../resources/upload/member/${postList.memberPicture}">&nbsp;&nbsp;${postList.memberName}&nbsp;&nbsp;&nbsp;&nbsp;${postList.postDate}
							</div>
						</div>
						<hr style="color: grey;">
					</li>
					
				</c:forEach>
			</ul>
			<input type="hidden" id="proNo" value="${requestScope['javax.servlet.forward.query_string']}" />
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