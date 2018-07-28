<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

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
		$("#content-frame").load("/bookmark.do");
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
							$(".feed-list").append("<div>내용없어요</div>");
							}else{
						$(".feed-list").empty();
						var result="";
						for(var i=0;i<data.length;i++)
							{
							result+=
								'<li class="feed-contents"><div class="row"><div class="col-md-12"><span onclick="getPost('+data[i].postNo+');"class="btn btn-link" style="float:left;">'+data[i].postTitle+'</span></div>'+
								'<div class="col-md-12">&nbsp&nbsp&nbsp'+ data[i].postWriter +' &nbsp&nbsp&nbsp '+ data[i].postDate+'</div>'+
								'<div class="col-md-9"><a href="#" class="btn btn-link" style="float:left;">'+data[i].proName+'</a></div>'+
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
/* 	
	//글쓰기 버튼 기능 추가 by 영진.
	function toWriteFn(){
		$('#toWrite').show();
	}
	 */
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
					<h5>북마크</h5>
				</div>
				<div class="headerFunction" id="headerFun">
					<!-- 검색기능버튼과 글쓰기 버튼. -->
					<button type="button" class="btn btn-outline-light btn-lg"
						id="searchShow" onclick="searchShow();">
						<i class="fab fa-searchengin" style="color: grey;"></i>
					</button>


					<!-- 한영진이 버튼 연결 -->	
					<button type="button" onclick="location='/write.do'" class="btn btn-outline-success">
						<i class="fas fa-edit"></i>글쓰기
					</button>

				</div>
			</div>
			<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
			<div id="contentSearch" class="headertitle" style="display: none;">
				<i class="fab fa-searchengin" style="color: grey;"></i> <input
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
									<img src="../resources/images/icon/checked-allot.png"></img>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-allot.png"></img> 할당된 할
										일</a> <a class="dropdown-item" href="#"><img
										src="../resources/images/icon/play-button.png"></img> 진행중</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/pause.png"></img> 일시중지</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-complete.png"></img> 완료</a>
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
								</div>
							</div>
							<span onclick="getPost(${book.postNo});" class="btn btn-link" style="float:left;">${book.postTitle }</span>
							</div>
							<div class="col-md-9"><img id="memberImg2" src="${book.writerImg }">&nbsp;&nbsp;${book.postWriter }&nbsp;&nbsp;&nbsp;&nbsp;${book.postDate }
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

	
				
			<!-- 글쓰기 모달!! div!!  -->
 	
<%--  		<div id="toWrite" class="modal fade" style="background-color:white;">
      
       
         <div class="offset-md-1 col-md-10 offset-md-1 modal-content" style="padding:0px; border:none;">
     		

         </div>
     
      </div>  --%>
		
	<!-- 글쓰기 모달 끝!   -->
		
			

<jsp:include page="/testareum.do"></jsp:include>

</body>
</html>