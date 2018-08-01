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

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

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
	box-sizing: border-box;
}
#background {
	background-color: #F5F5F5;
	margin: 0px;
	padding: 0px;
}
/* 기본 구조 스타일 끝 */


.fullProgressBox {
	width: 100%;
	height: 100%;
	background-color: #F5F5F5;
}
 
 .progressTitle {
	width: 100%;
	height: 5%;
	float: left;
 }
 
 .progressTitle h5 {
  	margin-top: 8px;
 }
 
 
 .progressHeader {
 	border-top: 1px solid black;
 	border-left: 1px solid black;
 	border-right: 1px solid black;
	width: 22%;
	height: 100%;
	background-color: #CFF09E;
	float: left;
	text-align: center;
 }
 
 .progressBody {
	border: 1px solid black;
	width: 22%;
	height: 88%;
	background-color: #FFF;
	float: left;
 }

.bodyEmpty {
	width: 4%;
	height: 88%;
	float: left;
}

.bodyEmpty{
	padding-top:22%;
}

.headEmpty {
	width: 4%;
	height: 100%;
	float: left;
}

.titleEmpty {
	border-top: 1px solid black;
	width: 100%;
	height: 2%;
	float: left;
}


.progressPost {
	border: 1px solid black;
	float: left;
	padding: 1% 5%;
	width: 98%;
	margin: 1%;
}


.progressPost img {
	width: 10%;
	height: 10%;
	margin-right: 3%;
	
}

.progressPost img:hover {
	cursor: pointer;
}


input[type=checkbox] {
	transform: scale(1.5);
	margin-right: 4%;
	margin-left: 4%;
	margin-top: 3%;
}

</style>


<script>

	function changeCheckBox(category) {
		
		switch(category) {
		
		case 'sug': 
			$(".sugImg").hide();
			$(".sugCheckBox").show();
			
			$(".workImg").show();
			$(".workCheckBox").hide();
			$(".finImg").show();
			$(".finCheckBox").hide();
			$(".stopImg").show();
			$(".stopCheckBox").hide();
			
			break;
		case 'work': 
			$(".workImg").hide();
			$(".workCheckBox").show();
			
			$(".sugImg").show();
			$(".sugCheckBox").hide();
			$(".finImg").show();
			$(".finCheckBox").hide();
			$(".stopImg").show();
			$(".stopCheckBox").hide();
			
			break;
		case 'fin': 
			$(".finImg").hide();
			$(".finCheckBox").show();
			
			$(".sugImg").show();
			$(".sugCheckBox").hide();
			$(".workImg").show();
			$(".workCheckBox").hide();
			$(".stopImg").show();
			$(".stopCheckBox").hide();
			
			break;
		case 'stop': 
			$(".stopImg").hide();
			$(".stopCheckBox").show();
			
			$(".sugImg").show();
			$(".sugCheckBox").hide();
			$(".workImg").show();
			$(".workCheckBox").hide();
			$(".finImg").show();
			$(".finCheckBox").hide();
			
			break;
		}
		
	}
	
	
	
	function checkBox(postNo) {
		
		 var hideValue = $(".checkBox:checked").length;
		 if(hideValue==0) {
			 
			$(".sugImg").show();
			$(".sugCheckBox").hide();
			$(".workImg").show();
			$(".workCheckBox").hide();
			$(".finImg").show();
			$(".finCheckBox").hide();
			$(".stopImg").show();
			$(".stopCheckBox").hide();
		 }
		 
		 var postNo = [];
		 $("input[name='sug_cb']:checked").each(function(i){
			 postNo.push($(this).val());
			 
		 });
		 console.log("postNo:"+postNo);
		 
		
	}

</script>


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
		
			<div class="progressTitle">
				<h5><b>프로젝트 진행 현황</b>
				<img src="../resources/images/project/help-round-button.png"/>
				<span style="font-size:small;">진행 상황을 한 눈에 볼 수 있습니다. 진행 상태를 변경할 수 있습니다.</span></h5>
				
			</div>
			<div class="titleEmpty"></div>
			
			<div class="progressTitle">
			<div class="progressHeader"><h5><b>발의된 이슈</b></h5></div>
			<div class="headEmpty"></div>
			<div class="progressHeader"><h5><b>진행 중</b></h5></div>
			<div class="headEmpty"></div>
			<div class="progressHeader"><h5><b>완료</b></h5></div>
			<div class="headEmpty"></div>
			<div class="progressHeader"><h5><b>일시중지</b></h5></div>
			</div>
			
			<div class="progressBody">
			
				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='suggest'}">
					<div class="progressPost" draggable="true">
						
						<img src="../resources/images/project/suggest.png" class="sugImg" onclick="changeCheckBox('sug');"/>
						<span class="sugCheckBox" style="display: none;">
						<input type="checkbox" class="checkBox" name="sug_cb" value="${postList.postNo}" onClick="checkBox(${postList.postNo});">
						</span>
						${postList.postTitle}<br>
						${postList.memberName}<br>
						${postList.postDate}

					</div>
				</c:if>
				</c:forEach>
			
			</div>
			
			<div class="bodyEmpty" align="center">
				<img  src="../resources/images/project/next.png" /><br><br>
				<img  src="../resources/images/project/pre.png" />
			</div>
			
			<div class="progressBody">

				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='working'}">
					<div class="progressPost" draggable="true">
						
						<img src="../resources/images/project/working.png" class="workImg" onclick="changeCheckBox('work');"/>
						<span class="workCheckBox" style="display: none;">
						<input type="checkbox" class="checkBox" onClick="checkBox();">
						</span>
						${postList.postTitle}<br>
						${postList.memberName}<br>
						${postList.postDate}

					</div>
				</c:if>
				</c:forEach>
			
			</div>
			
			<div class="bodyEmpty" align="center">
				<img  src="../resources/images/project/next.png" /><br><br>
				<img  src="../resources/images/project/pre.png" />
			</div>
			
			<div class="progressBody">
			
				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='finish'}">
					<div class="progressPost" draggable="true">
						
						<img src="../resources/images/project/finish.png" class="finImg" onclick="changeCheckBox('fin');"/>
						<span class="finCheckBox" style="display: none;">
						<input type="checkbox" class="checkBox" onClick="checkBox();">
						</span>
						${postList.postTitle}<br>
						${postList.memberName}<br>
						${postList.postDate}

					</div>
				</c:if>
				</c:forEach>
				
			
			</div>

			<div class="bodyEmpty" align="center">
				<img  src="../resources/images/project/next.png" /><br><br>
				<img  src="../resources/images/project/pre.png" />
			</div>			

			<div class="progressBody">
			
				<c:forEach items="${postList}" var="postList">
				<c:if test="${postList.postProgress=='stop'}">
					<div class="progressPost" draggable="true">
						
						<img src="../resources/images/project/stop.png" class="stopImg" onclick="changeCheckBox('stop');"/>
						<span class="stopCheckBox" style="display: none;">
						<input type="checkbox" class="checkBox" onClick="checkBox();">
						</span>
						${postList.postTitle}<br>
						${postList.memberName}<br>
						${postList.postDate}

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