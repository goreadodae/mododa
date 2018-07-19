<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		//검색 이후 결과가 나오거나 없으면, 어쨋든 실행 후 취소 버튼 누르면 다시 내가 쓴 글 보여줄 수 있도록 새로 로드필요
	}
	//돋보기 아이콘 클릭 후 검색어 입력 후 검색버튼누르면 검색하는 function.
	function searchTitle(){ 
	 var keyword = $("#keyword").val;
		$.ajax({
			url:"/searchTitle.do",
			type:"POST",
			data:{keyword:keyword},
			success:function(responseData){
				alert(data);
				console.log(data);
			},
			error:function(){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>★모두다-Collaboration Tool★</title>


</head>
<body>


	<!-- jstl은 나중에~~ -->

	<div class="content">
		<div class="viewHeader">
			<div id="showHeader">
				<!-- 기본으로 출력되는 헤더 -->
				<div class="headerTitle" id="headerTitle">
					<h5>내가 쓴 글/댓글</h5>
				</div>
				<div class="headerFunction" id="headerFun">
					<!-- 검색기능버튼과 글쓰기 버튼. -->
					<button type="button" class="btn btn-link btn-lg"
						onclick="searchShow();">
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
				<input type="text" id="keyword" name="keyword" size=80
					style="border: none;" placeholder="제목 검색" />
				<div class="headerFunction" id="searchFun">
					<!-- 검색과 취소버튼 -->
					<button type="button" class="btn btn-outline-success btn-sm"
						onClick="searchTitle();">검색!</button>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onClick="searchCancle();">취소</button>
				</div>
			</div>
		</div>


		<div class="viewContents">
			<!-- 내용출력하는 부분 -->

			<ul class="feed-list">
				<li class="feed-contents">
					<div>
						<span>"우와 돈가스당"</span>
						<div class="user_img">
							<img src="/IMG/test.PNG" /> <span style="background-color: red;">글쓴이</span>
							<span style="background-color: blue;">댓글작성시간</span>
						</div>
						<a class="btn btn-link btn-sm">띵킹띵킹</a>
						<hr style="color: grey;">
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<div class="user_img">
							<img src="/IMG/test1.PNG" /> <span
								style="background-color: red;">글쓴이</span> <span
								style="background-color: blue;">댓글작성시간</span>
						</div>
						<a class="btn btn-link btn-sm">n개의 소식 더 보기</a>
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<br> <span style="background-color: red;">글쓴이</span> <span
							style="background-color: blue;">댓글작성시간</span> <a
							class="btn btn-link btn-sm">n개의 소식 더 보기</a>
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<br> <span style="background-color: red;">글쓴이</span> <span
							style="background-color: blue;">댓글작성시간</span> <a
							class="btn btn-link btn-sm">n개의 소식 더 보기</a>
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<br> <span style="background-color: red;">글쓴이</span> <span
							style="background-color: blue;">댓글작성시간</span> <a
							class="btn btn-link btn-sm">n개의 소식 더 보기</a>
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<br> <span style="background-color: red;">글쓴이</span> <span
							style="background-color: blue;">댓글작성시간</span> <a
							class="btn btn-link btn-sm">n개의 소식 더 보기</a>
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<br> <span style="background-color: red;">글쓴이</span> <span
							style="background-color: blue;">댓글작성시간</span> <a
							class="btn btn-link btn-sm">n개의 소식 더 보기</a>
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<div class="user_img">
							<img src="/IMG/test.PNG" /> <span style="background-color: red;">글쓴이</span>
							<span style="background-color: blue;">댓글작성시간</span>
						</div>
						<a class="btn btn-link btn-sm">띵킹띵킹</a>
						<hr style="color: grey;">
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>
				<li class="feed-contents">
					<div>
						<h5>"우와 돈가스당"</h5>
						<div class="user_img">
							<img src="/IMG/test.PNG" /> <span style="background-color: red;">글쓴이</span>
							<span style="background-color: blue;">댓글작성시간</span>
						</div>
						<a class="btn btn-link btn-sm">띵킹띵킹</a>
						<hr style="color: grey;">
						<!-- 아코디언이나 collapse사용? -->
					</div>
				</li>

			</ul>

		</div>
	</div>


</body>
</html>