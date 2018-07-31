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
							<h3>@호출된 글</h3>
						</div>
						<div class="headerFunction" id="headerFun">
							<!-- 검색기능버튼과 글쓰기 버튼. -->
							<button type="button" class="btn btn-link btn-lg"
								onclick="searchShow();">
								<i class="fab fa-searchengin" style="color: grey;"></i>
							</button>

							<button type="button" class="btn btn-outline-success">
								<i class="fas fa-edit"></i>글쓰기
							</button>

						</div>
					</div>
					<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
					<div id="contentSearch" class="headertitle" style="display: none;">
						<i class="fab fa-searchengin" style="color: grey;"></i> <input
							type="text" id="keyword" name="leyword" size=80 style="border: none;"
							placeholder="제목/작성자 검색" />
						<div class="headerFunction" id="searchFun">
							<!-- 검색과 취소버튼 -->
							<button type="button" class="btn btn-outline-success btn-sm"
								onclick="search();">검색!</button>
							<button type="button" class="btn btn-outline-secondary btn-sm"
								onclick="searchCancle();">취소</button>
						</div>
					</div>
				
					<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
					<div id="contentSearch" class="headertitle" style="display: none;">
						<i class="fab fa-searchengin" style="color: grey;"></i> 
						<input type="text" name="newsKeyword" size=80 style="border: none;"
							placeholder="제목/작성자 검색" />
						<div class="headerFunction" id="searchFun"> <!-- 검색과 취소버튼 -->
							<button type="button" class="btn btn-outline-success btn-sm"
								onclick="search();">검색!</button>
							<button type="button" class="btn btn-outline-secondary btn-sm" onclick="searchCancle();">취소</button>
						</div>
					</div>
				</div>

				<div class="viewContents">
					<!-- 내용출력하는 부분 -->
					<ul class="feed-list">
						<li class="feed-contents">
							<div>
								<h4>Id</h4>
								<br> <a class="btn btn-link btn-sm">n개의 소식 더 보기</a>
								<!-- 아코디언이나 collapse사용? -->
							</div>
						</li>
						<li class="feed-contents">
							<div>
								<h4>우와 자장면이다</h4>
								<br> <a class="btn btn-link btn-sm">n개의 소식 더 보기</a>
								<!-- 아코디언이나 collapse사용? -->
							</div>
						</li>
						<li class="feed-contents">
							<div>
								<h4>우와 곱창이당</h4>
								<br> <a class="btn btn-link btn-sm">n개의 소식 더 보기</a>
								<!-- 아코디언이나 collapse사용? -->
							</div>
						</li>
						<li class="feed-contents">
							<div>
								<h4>우와 맥주당</h4>
								<br> <a class="btn btn-link btn-sm">n개의 소식 더 보기</a>
								<!-- 아코디언이나 collapse사용? -->
							</div>
						</li>


					</ul>

				</div>
			</div>
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		<jsp:include page="/post.do"></jsp:include>
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>

</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
	integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
	crossorigin="anonymous"></script>
<!-- CDN방식으로 부트스트랩 링크 추가 -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<!-- CDN방식으로 아이콘 사용을 위한 링크 추가 -->

<link rel="stylesheet" type="text/css" href="/css/personal/personalPage.css">
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

	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>★모두다-Collaboration Tool★</title>

</head>
<body>


	<!-- jstl은 나중에~~ -->

	
	


</body>
</html> --%>