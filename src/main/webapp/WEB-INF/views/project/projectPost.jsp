<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 별 프로젝트 글 보기</title>

<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<!-- CDN방식으로 부트스트랩 링크 추가 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!-- CDN방식으로 아이콘 사용을 위한 링크 추가 -->
<link rel="stylesheet" type="text/css" href="/css/personal/personalPage.css">
<!-- 개인페이지 공통 style저장. -->
</head>


<script>
	function searchShow() {
		$("#showHeader").css("display", "none");
		$("#contentSearch").css("display", "");
	}

	function searchCancle() {
		$("#keyword").val("");
		$("#showHeader").css("display", "");
		$("#contentSearch").css("display", "none");

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
					alert(data);
					console.log(data);
				},
				error : function() {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
				}
			})
		}
	}
</script>



<body>


	<!-- jstl은 나중에~~ -->

	<div class="content">
		<div class="viewHeader">
			<div id="showHeader">
				<!-- 기본으로 출력되는 헤더 -->
				<div class="headerTitle" id="headerTitle">
					<h5>프로젝트 글</h5>
				</div>
				<div class="headerFunction" id="headerFun">
					<!-- 검색기능버튼과 글쓰기 버튼. -->
					<button type="button" class="btn btn-outline-light btn-lg"
						id="searchShow" onclick="searchShow();">
						<i class="fab fa-searchengin" style="color: grey;"></i>
					</button>

					<button type="button" class="btn btn-outline-warning">
						<i class="fas fa-edit"></i>글쓰기
					</button>

				</div>
			</div>
			<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
			<div id="contentSearch" class="headertitle" style="display: none;">
				<i class="fab fa-searchengin" style="color: grey;"></i> 
				<input type="text" id="keyword" name="keyword" 
				 placeholder="제목 검색" />
				<div class="headerFunction" id="searchFun">
					<!-- 검색과 취소버튼 -->
					<button type="button" class="btn btn-outline-success btn-sm"
						onClick="searchTitle();">검색</button>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onClick="searchCancle();">취소</button>
				</div>
			</div>
		</div>


		<div class="viewContents col-md-12">
			<!-- 내용출력하는 부분 -->
			<ul class="feed-list">
 				<c:forEach items="${postList}" var="postList">
				<li class="feed-contents">
					<div>
						<span>${postList.postTitle}</span> <!-- 제목 클릭하면 글 볼 수 있도록 연결해야됨.. -->
						<div class="writeInfo" style="position:relative;">
							<img id="memberImg" src="../resources/images/post/close.png" /> <span>글쓴이</span>
							<br><span>${postList.postDate}</span>
						</div>
						<a class="btn btn-link btn-sm" href="#">프로젝트이름</a><!-- 프로젝트 이름 클릭하면 프로젝트처음 화면으로 이동해야 됨. -->
						<hr style="color: grey;">
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>


</body>
</html>