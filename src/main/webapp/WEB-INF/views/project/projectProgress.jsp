<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 진행 현황</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

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


.fullProgressBox {
	border: 1px solid black;
	width: 100%;
	height: 100%;
	background-color: #FFF;
}

.progressHead {
	border: 1px solid black;
	width: 100%;
	height: 5%;
	background-color: #FFF;
	float: left;
}

.progressBody {
	border: 1px solid black;
	width: 25%;
	height: 90%;
	background-color: #FFF;
	float: left;
}



/* 기본 구조 스타일 끝 */
</style>

<body>

<!-- header -->
<jsp:include page="/header.do"></jsp:include>
<!-- header 끝 -->

<div class="row" style="background-color: #F5F5F5;">
	<!-- left bar -->
	<jsp:include page="/leftbar.do"></jsp:include>
	<!-- left bar 끝-->


	<!-- contents -->
	<div class="col-8" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		
		<div class="fullProgressBox">		
		

		
			<div class="progressHead"><h5><b>프로젝트 진행 현황</b></h5></div>
			
			<div class="progressHead">
				<div class="progressBody"><h5><b>발의</b></h5></div>
				<div class="progressBody"><h5><b>진행</b></h5></div>
				<div class="progressBody"><h5><b>완료</b></h5></div>
				<div class="progressBody"><h5><b>중지</b></h5></div>
			</div>
			
			<div class="progressBody">
				
				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='suggest'}">
				<div style="background-color:yellow" draggable="true">
				글 제목: ${postList.postTitle}<br>
				작성일: ${postList.postDate}<br>
				작성자사진: ${postList.memberPicture}<br>
				작성자: ${postList.memberName}<br>
				</div>
				</c:if>
				</c:forEach>
				
			</div>
			<div class="progressBody">
				
				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='working'}">
				<div style="background-color:green" draggable="true">
				글 제목: ${postList.postTitle}<br>
				작성일: ${postList.postDate}<br>
				작성자사진: ${postList.memberPicture}<br>
				작성자: ${postList.memberName}<br>
				</div>
				</c:if>
				</c:forEach>
				
			</div>
			<div class="progressBody">
				
				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='finish'}">
				<div style="background-color:red" draggable="true">
				글 제목: ${postList.postTitle}<br>
				작성일: ${postList.postDate}<br>
				작성자사진: ${postList.memberPicture}<br>
				작성자: ${postList.memberName}<br>
				</div>
				</c:if>
				</c:forEach>
				
			</div>
			<div class="progressBody">
				
				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='stop'}">
				<div style="background-color:purple" draggable="true">
				글 제목: ${postList.postTitle}<br>
				작성일: ${postList.postDate}<br>
				작성자사진: ${postList.memberPicture}<br>
				작성자: ${postList.memberName}<br>
				</div>
				</c:if>
				</c:forEach>
				
			</div>
		
		
		</div>
	
	</div>
	<!-- contents 끝 -->



</div>

</body>
</html>