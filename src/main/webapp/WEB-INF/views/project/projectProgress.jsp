<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 이슈 진행 현황</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</head>

<style>
/* 기본 구조 스타일 시작 */
html {
	margin-left: 15px;
}
body {
	overflow-x: hidden;
/* 	overflow-y: hidden; */
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
@media screen and (max-width: 768px){
	html {
		margin-left: 15px;
    	margin-right: 7px;
	}
}
.progressHeader{
	background-color: #CFF09E;
	border-bottom: 1px solid black;
}
.progressContent{
	border: 1px solid black;
	background-color: white ;
	height: 64vmin;
}
.progressBody{
	overflow-y: hidden;
}
.progressPost {
	border: 1px solid black;
	margin: 1%;
}
</style>


<script>


	window.onload = function () { // 하위메뉴 유지
		var proNoStr = $("#proNo").val();
	    var proNo = proNoStr.substring(6);
	    $('li[id^="sub_' + proNo + '_"]').show();
	    liClose(proNo);
	}

	function changeCheckBox(category) { // 이미지랑 체크박스 변화
    
	    // 체크한 것이 없을 경우 창 꺼짐
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
    
	    switch(category) {
    
 	   case 'sug': 
	       $(".sugImg").hide();
	       $(".sugCheckBox").show();
       
	       $(".checkBox:checked").prop('checked',false); // 체크 해제
	       // value 초기화
	       $('#sugToWork').val('sugToWork');
	       $('#workToStop').val('workToStop');
	       $('#workToSug').val('workToSug');
	       $('#stopToFin').val('stopToFin');
	       $('#stopToWork').val('stopToWork');
	       $('#finToStop').val('finToStop');
       
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
	       $(".checkBox:checked").prop('checked',false); // 체크 해제
	       // value 초기화
	       $('#sugToWork').val('sugToWork');
	       $('#workToStop').val('workToStop');
	       $('#workToSug').val('workToSug');
	       $('#stopToFin').val('stopToFin');
	       $('#stopToWork').val('stopToWork');
	       $('#finToStop').val('finToStop');
       
	       $(".sugImg").show();
	       $(".sugCheckBox").hide();
	       $(".finImg").show();
	       $(".finCheckBox").hide();
	       $(".stopImg").show();
	       $(".stopCheckBox").hide();
       
	       break;
	    case 'stop': 
	       $(".stopImg").hide();
	       $(".stopCheckBox").show();
	       $(".checkBox:checked").prop('checked',false); // 체크 해제
	       // value 초기화
	       $('#sugToWork').val('sugToWork');
	       $('#workToStop').val('workToStop');
	       $('#workToSug').val('workToSug');
	       $('#stopToFin').val('stopToFin');
	       $('#stopToWork').val('stopToWork');
	       $('#finToStop').val('finToStop');
       
	       $(".sugImg").show();
	       $(".sugCheckBox").hide();
	       $(".workImg").show();
	       $(".workCheckBox").hide();
	       $(".finImg").show();
	       $(".finCheckBox").hide();
       
	       break;
	    case 'fin': 
 	      $(".finImg").hide();
	       $(".finCheckBox").show();
	       $(".checkBox:checked").prop('checked',false); // 체크 해제
	       // value 초기화
	       $('#sugToWork').val('sugToWork');
	       $('#workToStop').val('workToStop');
	       $('#workToSug').val('workToSug');
	       $('#stopToFin').val('stopToFin');
	       $('#stopToWork').val('stopToWork');
	       $('#finToStop').val('finToStop');
       
 	      $(".sugImg").show();
 	      $(".sugCheckBox").hide();
 	      $(".workImg").show();
	      $(".workCheckBox").hide();
	      $(".stopImg").show();
 	      $(".stopCheckBox").hide();
       
	       break;
    
	    }
   
 	}
	
	
	
	
	function check(category) { // 체크한 포스트를 함수 hidden의 value로 저장하기
		
		
		// 체크한 것이 없을 경우 창 꺼짐
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

		switch(category) {
			
			case 'sug': 
				$("input[name='sug_checkBox']:checked").each(function(i){
					 postNo.push($(this).val());
				 });
				$('#sugToWork').val(postNo);
				break;
			case 'work': 
				$("input[name='work_checkBox']:checked").each(function(i){
					 postNo.push($(this).val());
				 });
				$('#workToStop').val(postNo);
				$('#workToSug').val(postNo);
				break;
			case 'stop': 
				$("input[name='stop_checkBox']:checked").each(function(i){
					 postNo.push($(this).val());
				 });
				$('#stopToFin').val(postNo);
				$('#stopToWork').val(postNo);
				break;
			case 'fin': 
				$("input[name='fin_checkBox']:checked").each(function(i){
					 postNo.push($(this).val());
				 });
				$('#finToStop').val(postNo);
				break;
		}
		
		// console.log("check:" + postNo);

	}
	
	
	
	function updateProgress(category) { // ajax로 비즈니스 로직(hidden의 value사용)
		
		var postNoStr = "";
		var postProgress = "";
		
		var proNoStr = $("#proNo").val();
	    var proNo = proNoStr.substring(6);
	
		switch(category) {
		case 'sugToWork': 
			postNoStr = $('#sugToWork').val();
			if(postNoStr=='sugToWork') {
				alert("이동할 이슈를 선택해주세요.");
			} else {
				postProgress = 'working';
			}
			break;
		case 'workToSug': 
			postNoStr = $('#workToSug').val();
			if(postNoStr=='workToSug') {
				alert("이동할 이슈를 선택해주세요.");
			} else {
				postProgress = 'suggest';
			}
			break;
		case 'workToStop': 
			postNoStr = $('#workToStop').val();
			if(postNoStr=='workToStop') {
				alert("이동할 이슈를 선택해주세요.");
			} else {
				postProgress = 'stop';
			}
			break;
		case 'stopToWork': 
			postNoStr = $('#stopToWork').val();
			if(postNoStr=='stopToWork') {
				alert("이동할 이슈를 선택해주세요.");
			} else {
				postProgress = 'working';
			}
			break;
		case 'stopToFin': 
			postNoStr = $('#stopToFin').val();
			if(postNoStr=='stopToFin') {
				alert("이동할 이슈를 선택해주세요.");
			} else {
				postProgress = 'finish';
			}
			break;
		case 'finToStop': 
			postNoStr = $('#finToStop').val();
			if(postNoStr=='finToStop') {
				alert("이동할 이슈를 선택해주세요.");
			} else {
				postProgress = 'stop';
			}
			break;
		}
		
		
		
		if(postNoStr!="" && postProgress!="") { // 비즈니스 로직
			
			// console.log("total: "+postNoStr+"/progress: "+postProgress);
		
		
			$.ajax({
				
				url : "/updatePostProgress.do",
				type : "post",
				data : {
					postNoStr : postNoStr,
					postProgress : postProgress,
					proNo : proNo
				},
				success : function(data) {
					
					var postList = data.postList;
					
					
					$(".progressBody").empty();
					
					var suggestResult = "";
					var workingResult = "";
					var stopResult = "";
					var finishResult = "";
					
					var sug = "'sug'";
					var work = "'work'";
					var stop = "'stop'";
					var fin = "'fin'";
					
					
					for(var i=0 ; i<postList.length ; i++) {
						/* 
						var date = new Date(postList[i].postDate.time);
						var dateStr = date.toString();
						var printDate = dateStr.substring(0,10)+" "+dateStr.substring(16,24)+" KST "+dateStr.substring(11,15);
						 */
						
						if(postList[i].postProgress=='suggest') {
							suggestResult += '<div class="progressPost col" draggable="true">'
											 + '<img src="../resources/images/post/light-bulbOn.png" class="sugImg" onclick="changeCheckBox('+sug+');"/>'
											 + '<span class="sugCheckBox" style="display: none;">'
											 + '<input type="checkbox" class="checkBox" name="sug_checkBox" value="'+postList[i].postNo+'" onClick="check('+sug+');">'
											 + '</span><span onclick="getPost('+postList[i].postNo+');">'+postList[i].postTitle+'</span><br>'+postList[i].memberName+'<br>'+postList[i].postDate+'</div>';

						} else if(postList[i].postProgress=='working') {
							workingResult += '<div class="progressPost col" draggable="true">'
								 			 + '<img src="../resources/images/post/play-buttonOn.png" class="workImg" onclick="changeCheckBox('+work+');"/>'
								 			 + '<span class="workCheckBox" style="display: none;">'
								 			 + '<input type="checkbox" class="checkBox" name="work_checkBox" value="'+postList[i].postNo+'" onClick="check('+work+');">'
								 			 + '</span><span onclick="getPost('+postList[i].postNo+');">'+postList[i].postTitle+'</span><br>'+postList[i].memberName+'<br>'+postList[i].postDate+'</div>';
							
						} else if(postList[i].postProgress=='stop') {
							stopResult += '<div class="progressPost col" draggable="true">'
								 		  + '<img src="../resources/images/post/pauseOn.png" class="stopImg" onclick="changeCheckBox('+stop+');"/>'
								 		  + '<span class="stopCheckBox" style="display: none;">'
								 		  + '<input type="checkbox" class="checkBox" name="stop_checkBox" value="'+postList[i].postNo+'" onClick="check('+stop+');">'
								 		  + '</span><span onclick="getPost('+postList[i].postNo+');">'+postList[i].postTitle+'</span><br>'+postList[i].memberName+'<br>'+postList[i].postDate+'</div>';
							
						} else if(postList[i].postProgress=='finish') {
							finishResult += '<div class="progressPost col" draggable="true">'
								 			+ '<img src="../resources/images/post/checked.png" class="finImg" onclick="changeCheckBox('+fin+');"/>'
											+ '<span class="finCheckBox" style="display: none;">'
								 			+ '<input type="checkbox" class="checkBox" name="fin_checkBox" value="'+postList[i].postNo+'" onClick="check('+fin+');">'
								 			+ '</span><span onclick="getPost('+postList[i].postNo+');">'+postList[i].postTitle+'</span><br>'+postList[i].memberName+'<br>'+postList[i].postDate+'</div>';
							
						}
						
					
					}
					
					$("#suggestBody").append(suggestResult);
					$("#workingBody").append(workingResult);
					$("#stopBody").append(stopResult);
					$("#finishBody").append(finishResult);
					
				},
				error : function() {
					console.log("업데이트 실패");
				}
				
				
				
			});
			
		
		
		
		
		
		
			
		}
		
		
		
		
		
		
		
	}
	

</script>


<body>

<!-- header -->
<jsp:include page="/projectHeader.do"></jsp:include>
<!-- header 끝 -->

<div class="row" style="background-color: #F5F5F5;">
	<!-- left bar -->
	<jsp:include page="/leftbar.do"></jsp:include>
	<!-- left bar 끝-->


	<!-- contents -->
	<div class="col-8" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		
		<div class="fullProgressBox row">
		
			<div class="progressTitle col-12">
				<h5><b id="projectIssueTitle">프로젝트 이슈 진행 현황</b>
				<img src="../resources/images/project/help-round-button.png"/>
				<span style="font-size:small;">프로젝트 이슈를 한 눈에 볼 수 있습니다. 해당 이슈의 진행 상태를 변경할 수 있습니다.</span></h5>
				<input type="hidden" id="proNo" value="${requestScope['javax.servlet.forward.query_string']}" />
			</div>
			<div class="titleEmpty col-md-12"></div>
			<div class="col-md-12">
			<div class="row">
				<div class="col progressContent">
					<div class="row progressHeader">
					<div class="col-md-12"><h5><b>발의된 이슈</b></h5>
					</div></div>
					<div class="progressBody row" id="suggestBody">
						<c:forEach items="${postList}" var="postList">
						<c:if test="${postList.postProgress=='suggest'}">
							<div class="progressPost col" draggable="true">
								<img src="../resources/images/post/light-bulbOn.png" class="sugImg" onclick="changeCheckBox('sug');"/>
								<span class="sugCheckBox" style="display: none;">
								<input type="checkbox" class="checkBox" name="sug_checkBox" value="${postList.postNo}" onClick="check('sug');">
								</span>
								<span onclick="getPost(${postList.postNo});">${postList.postTitle}</span><br>
								${postList.memberName}<br>
								${postList.postDate}
							</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="col-md-1">
					<div class="bodyEmpty" align="center">
						<img src="../resources/images/project/next-arrow.png" onClick="updateProgress('sugToWork');" style="margin-top: 10%;" />
						<input type="hidden" id="sugToWork" value="sugToWork" />
							<br><br><br><br>
						<img src="../resources/images/project/pre-arrow.png" onClick="updateProgress('workToSug');" />
						<input type="hidden" id="workToSug" value="workToSug" />
					</div>
				</div>
				<div class="col progressContent">
					<div class="row progressHeader">
					<div class="col-md-12"><h5><b>진행 중</b></h5></div></div>
					<div class="progressBody row" id="workingBody">
						<c:forEach items="${postList}" var="postList">
						<c:if test="${postList.postProgress=='working'}">
							<div class="progressPost col" draggable="true">
								<img src="../resources/images/post/play-buttonOn.png" class="workImg" onclick="changeCheckBox('work');"/>
								<span class="workCheckBox" style="display: none;">
								<input type="checkbox" class="checkBox" name="work_checkBox" value="${postList.postNo}" onClick="check('work');">
								</span>
								<span onclick="getPost(${postList.postNo});">${postList.postTitle}</span><br>
								${postList.memberName}<br>
								${postList.postDate}
							</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
				
				<div class="col-md-1">
					<div class="bodyEmpty" align="center">
						<img src="../resources/images/project/next-arrow.png" onClick="updateProgress('workToStop');" />
						<input type="hidden" id="workToStop" value="workToStop" />
						<br><br><br><br>
						<img src="../resources/images/project/pre-arrow.png" onClick="updateProgress('stopToWork');" />
						<input type="hidden" id="stopToWork" value="stopToWork" />
					</div>
				</div>
				<div class="col progressContent">
					<div class="row progressHeader">
					<div class="col-md-12"><h5><b>일시중지</b></h5></div></div>
					<div class="progressBody row" id="stopBody">
						<c:forEach items="${postList}" var="postList">
						<c:if test="${postList.postProgress=='stop'}">
							<div class="progressPost col" draggable="true">
								<img src="../resources/images/post/pauseOn.png" class="stopImg" onclick="changeCheckBox('stop');"/>
								<span class="stopCheckBox" style="display: none;">
								<input type="checkbox" class="checkBox" name="stop_checkBox" value="${postList.postNo}" onClick="check('stop');">
								</span>
								<span onclick="getPost(${postList.postNo});">${postList.postTitle}</span><br>
								${postList.memberName}<br>
								${postList.postDate}
							</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="col-md-1">
					<div class="bodyEmpty" align="center">
						<img src="../resources/images/project/next-arrow.png" onClick="updateProgress('stopToFin');" />
						<input type="hidden" id="stopToFin" value="stopToFin" />
						<br><br><br><br>
						<img src="../resources/images/project/pre-arrow.png" onClick="updateProgress('finToStop');" />
						<input type="hidden" id="finToStop" value="finToStop" />
					</div>			
				
				</div>
				<div class="col progressContent">
					<div class="row progressHeader">
					<div class="col-md-12"><h5><b>완료</b></h5></div></div>
					<div class="progressBody row" id="finishBody">
						<c:forEach items="${postList}" var="postList">
						<c:if test="${postList.postProgress=='finish'}">
							<div class="progressPost col" draggable="true">
								<img src="../resources/images/post/checked.png" class="finImg" onclick="changeCheckBox('fin');"/>
								<span class="finCheckBox" style="display: none;">
								<input type="checkbox" class="checkBox" name="fin_checkBox" value="${postList.postNo}" onClick="check('fin');">
								</span>
								<span onclick="getPost(${postList.postNo});">${postList.postTitle}</span><br>
								${postList.memberName}<br>
								${postList.postDate}
							</div>
						</c:if>
						</c:forEach>	
					</div>
				</div>
			</div>
			</div>
			
		</div>
	
	</div>
	<!-- contents 끝 -->

	<jsp:include page="/post.do"></jsp:include> <!-- 게시글 보기 -->

</div>

</body>
</html>