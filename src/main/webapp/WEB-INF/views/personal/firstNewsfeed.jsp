<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<!-- icon -->

<link rel="stylesheet" type="text/css" href="/css/personal/personalPage.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function searchShow() {
		$("#showHeader").css("display", "none");
		$("#contentSearch").css("display", "");
	}
	function searchCancle() {
		$("#keyword").val("");
		$("#showHeader").css("display", "");
		$("#contentSearch").css("display", "none");
		location.href="newsfeed.do"; //수정

	}
	/* 초대취소 */
	function inviteReject(proNo, memberNo){
		console.log(proNo);
		console.log(memberNo);
		$.ajax({
			url: "/inviteProMemberCancel.do",
			type: "post",
			data: {
				memberNo: memberNo,
				proNo: proNo
			}, success: function(data){
				$('#failedAlertMessage').text('거절하셨습니다');
				$('#failedAlert').show('slow');
				setTimeout(function () { $('#failedAlert').hide('slow'); window.location.reload(); }, 1500);
			}
		});
	}
	/* 초대승인 */
	function acceptMember(proNo, memberNo){
		$.ajax({
			url: "/acceptMember.do",
			type: "post",
			data: {
				memberNo: memberNo,
				proNo: proNo
			}, success: function(data){
				$('#successAlertMessage').text('수락하셨습니다');
				$('#successAlert').show('slow');
				setTimeout(function () { $('#successAlert').hide('slow'); window.location.reload(); }, 1500);
			}
		});
	}
	function searchNews()// 뉴스피드.
	{
		var keyword=$("#keyword").val();
		console.log(keyword);
		if(keyword =="")
			{
			alert("검색어를 입력하세요!!");
			}else{
				$.ajax({
					url:"/searchNews.do",
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
							'<li class="feed-contents"><div class="row"><div class="col-md-12"><a onclick="getPost('+data[i].postNo+');" id="postTitle" class="btn btn-link" style="float:left;"><b>'+data[i].postTitle+'</b></a></div>'+
							'<div class="col-md-8"><img id="memberImg" src="../resources/upload/member/'+data[i].pWriterImg+'"/><span id="postcontent" style="font-size:12px;">'+data[i].postContent+'</span><br>'+ data[i].postWriter +' &nbsp;&nbsp; '+ data[i].postDate+'</div>'+
							'<div class="col-md-4">';
							if(data[i].postProgress=='suggest'){
								result+='<img id="statusImg1" src="../resources/images/post/light-bulbOn.png" title="발의된 이슈"/>';
							}else if(data[i].postProgress=='working'){
								result+='<img id="statusImg1" src="../resources/images/post/play-buttonOn.png" title="진행 중"/>';
							}else if(data[i].postProgress=='stop'){
								result+='<img id="statusImg1" src="../resources/images/post/pauseOn.png" title="일시 정지"/>';
							}else{
								result+='<img id="statusImg1" src="../resources/images/post/checked.png" title="완료"/>';
							}
						result+='<a onclick="postChange('+data[i].proNo+');" id="proName" class="btn btn-link" style="float:none;">'+data[i].proName+'</a></div>'+
							'<div class="col-md-3"></div>'+
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

	function postChange(proNo){
		location.href="/projectPost.do?proNo="+proNo;
	}
	
	$(document).ready(function(){
	 	var memberNo= ${sessionScope.member.memberNo};
		$.ajax({
			url: "/invitingWorkOnMemberList.do",
			type: "post",
			data: {
				memberNo: memberNo
			},
			success: function(data){
				var str="";
 				for(var i=0; i<data.memberInvitingProList.length; i++){
					str+="<li class='feed-contents'><div class='row'>"
						+"<div class='col-md-12' style='margin-top: 10px;'>"
						+"<label style='float: left; font-size: 20px;'>\""+data.memberInvitingProList[i].proTitle+"\"</label>"
						+"<label style='font-size: 15px; margin-top: 6px;'>&nbsp;프로젝트에 초대되었습니다.</label>"
						+"</div>"
						+"<div class='col-md-12'>"
						+"<img src='../resources/images/project/crown.png' style='float: right;'/>"
						+"<label style='float: right;'>"+data.memberInvitingProList[i].leaderName+"</label>"
						+"</div>"
						+"<div class='col-md-12'>"
						+"<a onclick='inviteReject("
						+data.memberInvitingProList[i].proNo+","+data.memberInvitingProList[i].memberNo
						+");' style='color: gray; float: right; margin-left: 10px;'>거절하기</a>"
						+"<a style='color: #339966; float: right;' onclick='acceptMember("
						+data.memberInvitingProList[i].proNo+","+data.memberInvitingProList[i].memberNo
						+");'>수락하기</a>"
						+"</div></div><hr style='color: grey;'></li>";
				}
				$('#proMemberListDiv').prepend(str);
			},
			error: function(data){
				console.log("실패");
			}
			
		});
	});
	
</script>
<style>
.col-md-12 a:hover{
	background-color:#f8f9fa;
	
}
</style>
</head>
<body>
<div class="content">
				<div class="viewHeader">
					<div id="showHeader">
						<!-- 기본으로 출력되는 헤더 -->
						<div class="headerTitle" id="headerTitle">
							<h5><b>뉴스피드</b></h5>
						</div>
						<div class="headerFunction" id="headerFun">
							<!-- 검색기능버튼과 글쓰기 버튼. -->
							<button type="button" class="btn btn-link btn-lg"
								id="searchShow" onclick="searchShow();">
								<i class="fas fa-search" style="color: grey;"></i>
							</button>

							<button type="button" onclick="location='/write.do'" class="btn btn-outline-success">
								<i class="fas fa-edit"></i>글쓰기
							</button>
						</div>
					</div>
					<!-- 돋보기 아이콘 눌렀을 때 출력되는 헤더 -->
					<div id="contentSearch" class="headertitle" style="display: none;">
						<i class="fas fa-search" style="color: grey;"></i> <input
							type="text" id="keyword" name="keyword" size=80 style="border: none;"			
							placeholder="제목/작성자 검색" />
						<div class="headerFunction" id="searchFun">
							<!-- 검색과 취소버튼 -->
							<button type="button" class="btn btn-outline-success btn-sm"
								onclick="searchNews();"style="float:left;">검색!</button>
							<button type="button" class="btn btn-outline-secondary btn-sm"
								onclick="searchCancle();">취소</button>
						</div>
					</div>
				</div>
				
				<div class="viewContents col-md-12">
					<!-- 내용출력하는 부분 -->
					<ul class="feed-list" id="proMemberListDiv">
						<c:forEach var="news" items="${newsfeed }">
						<li class="feed-contents">
							<div class="row">
								<div class="col-md-12">
								<a onclick="getPost(${news.postNo });" class="btn btn-link" style="float:left" id="postTitle"><b>${news.postTitle }</b></a>
								</div>
								<div class="col-md-8">
									<img id="memberImg" src="../resources/upload/member/${news.pWriterImg }" />
									<span id="postcontent" style="font-size:12px;">${news.postContent }</span><br>
									<span>${news.postWriter }&nbsp;&nbsp;${news.postDate }</span>
								</div>
								<div class="col-md-4">
								<c:choose>
									<c:when test="${news.postProgress eq 'suggest' }">
										<c:set var="statusImg" value="../resources/images/post/light-bulbOn.png" />
										<c:set var="statusTxt" value="발의된 이슈"/>
									</c:when>
									<c:when test="${news.postProgress eq 'working' }">
										<c:set var="statusImg" value="../resources/images/post/play-buttonOn.png"/>
										<c:set var="statusTxt" value="진행 중"/>
									</c:when>
									<c:when test="${news.postProgress eq 'stop' }">
										<c:set var="statusImg" value="../resources/images/post/pauseOn.png"/>
										<c:set var="statusTxt" value="일시 중지"/>	
									</c:when>
									<c:otherwise>
										<c:set var ="statusImg" value="../resources/images/post/checked.png"/>
										<c:set var="statusTxt" value="완료"/>
									</c:otherwise>
									</c:choose>
									<img id="statusImg1" src="${statusImg }" title="${statusTxt }"/>&nbsp;
									<a onclick="postChange(${news.proNo });" class="btn btn-link" id="proName" style="float:none;" >${news.proName }</a>
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

</body>
</html>