<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
</head>

<style>
@media screen and (max-width: 768px) {
	#leftBarBody, #rightBarBody {
		display: none;
	}
	#contents {
		width: 100vmin;
	}
	.topbar {
		width: 20% !important;
	}
	#menu-img {
		display: inline-block !important;
		height: 25px;
		top: 25%;
		left: 20%;
		position: absolute;
	}
	#mobileMenuContent{
		margin: 0;
		padding: 20px;
	}
	.row.leftbar>ul{
		padding-left: 10px;
		width: 99%;
	}
	.row.leftbar{
		width:100%;
		margin-left: 0px;
	}
}
@media screen and (max-width: 426px) {
	#menu-img{
		left: 40%;
	}
	#myInfoDiv{
		display: none;
	}
}
/* header */
.header {
	margin: 0px;
	padding: 0px;
}

#banner {
	background-color: #339966;
	color: white;
	height: 30px;
	margin: 0px;
	padding: 0px;
	text-align: center;
	line-height: 25px;
	font-size: 15px;
}

.topbar {
	height: 50px;
	border-bottom: 1px solid #c8c8c8;
	padding: 0px;
}

#logo-img {
	height: 40px;
	vertical-align: middle;
	top: 10%;
	left: 50%;
	position: absolute;
}

#menu-img {
	height: 25px;
	top: 25%;
	left: 20%;
	position: absolute;
}

#cancel-img {
	height: 50%;
	vertical-align: middle;
	top: 22%;
	right: 3%;
	position: absolute;
	cursor: pointer;
}

/* header */
.myInfo{
	height: 2.4rem; width: 2.4rem; position:absolute; top:0; bottom:0; margin:auto;
}
.myInfoPop{
	height: 100px; width: 100px;
}
#myInfoDropDown{
	height: auto; width: 400px;
}
.dropdown-item:active{
	background-color: #CFF09E !important;
}
#proMemberList{
	height: auto; width: 20rem;
}
.partnerListPic{
	height: 4rem; width: 4rem;
}
.proMemberListDropdown{
	height: 70%; width: auto; position:absolute; top:0; bottom:0; margin:auto; margin-top: 10px;
}
#inviteMemberBtn, #searchMemberText{
	width: 100%; margin-bottom: 15px;
}
.inviteMemberId {
	width: 100%;
	background-color: transparent;
	border: 0px solid;
	margin-bottom: 10%;
	border-bottom: 1px solid gray;
}
.inviteMemberId:focus {
	outline: none;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.6); /* Black w/ opacity */
}
.modal-content{
	margin: 15% auto;
}
#modal-close {
	width: 20px;
	margin-top: 20px;
	margin-right: 20px;
	float: right;
}
a:hover{
	cursor: pointer;
}
.btn-secondary {
	background-color: #339966 !important;
	border-color: #339966 !important;
}

.btn-secondary:active, .btn-secondary:focus, .btn-secondary:hover {
	background-color: #CFF09E !important;
	border-color: #CFF09E !important;
}
</style>
<script>
	/* 기본 구조 구성하는 스크립트 시작 */
	//leftbar, rightbar 높이 설정
	$(document).ready(function() {
		resizeContent();
	});

	$(window).resize(function() {
		resizeContent();
	});
	/* 모바일 시작  */
	$(document).ready(function(){
		if(document.body.clientWidth<=768){
			$('#contents').attr('class','col-12');
			$('#mobileMenuModal, .row.leftbar').click(function(e) {
				if(!$(e.target).hasClass("modal-content")) { mmm_close_pop();
				}
			});
			$('#mobileMenuModal').css('display','block !important');
		} else if(document.body.clientWidth<=426){
			
		} else {
			$('#contents').attr('class','col-6');
		}
		$('.openModal').click(function(){
			setTimeout(function(){ $('#menu-img').trigger('click'); }, 1);
		});
	});
	function mmm_open_pop(flag) {
		$('#mobileMenuModal').show();
	};
	//팝업 Close 기능
	function mmm_close_pop(flag) {
		$('#mobileMenuModal').hide();
	};
	/* 모바일 끝 */
	function resizeContent() {
		var windowHeight = $(window).height();
		var topHeight = $('.header').height();

		$('#background').css({
			'height' : (windowHeight-topHeight) + 'px'
		});
	}
	/* 기본 구조 구성하는 스크립트 끝 */
	/* 멤버 리스트를 보여주는 함수 */
	function showMemberList(){
		var proNoStr = $("#proNo").val();
	 	var proNo = proNoStr.substring(6);
	 	var memberNo= ${sessionScope.member.memberNo};
		var leaderNo;
		$.ajax({
			url: "/selectWorkOnMemberList.do",
			type: "post",
			data: {
				proNo: proNo,
				memberNo: memberNo
			},
			success: function(data){
				var str="";
				for(var i=0; i<data.memberList.length; i++){
					if(data.memberList[i].leader=='Y'){
						leaderNo = data.memberList[i].memberNo;
					}
				}
				for(var i=0; i<data.memberList.length; i++){
 					str+=
 					"<div class='col-md-4' style='margin-top: 10px;'>"
 					+"<img src='../resources/upload/member/"+data.memberList[i].memberPicture+"'"
					+"class='img-circle rounded-circle border partnerListPic'>"
					+"</div>"
					+"<div class='col-md-8' style='margin-top: 10px;'>"
					+"<div class='row'>"
					+"<div class='col-md-12'>"+data.memberList[i].memberName;
					if(data.memberList[i].leader=='Y'){
						leaderNo = data.memberList[i].memberNo;
						str+="<img src='../resources/images/project/crown.png'>";
					}
					if(data.memberList[i].memberNo==memberNo){
						str+="<label style='color: gray'>(me)</label>";
					}
					str+="</div>";
					if(data.memberList[i].inviteYN=='Y'){						
						str+="<div class='col-md-12'>"+data.memberList[i].memberId+"</div>";
					} else {
						str+="<div class='col-md-12'><span style='color: #339966; float: left;'>수락대기중...</span>";
						if(leaderNo==memberNo){
							str+="<a onclick='inviteCancel("
							+data.memberList[i].proNo+","+data.memberList[i].memberNo
							+");' style='color: gray; float: right;'>취소하기</a>";
						}
					}
					str+="</div></div>"
					+"</div>";
				}
				$('#proMemberListDiv').html(str);
			},
			error: function(data){
				console.log("실패");
			}
			
		});
	}
	/*  */
	function inviteMemberFunc(){
		var proNoStr = $("#proNo").val();
	 	var proNo = proNoStr.substring(6);
		$.ajax({
			url: "/inviteMemberAtHeader.do",
			type: "post",
			data:{
				inviteMemberId : $('#inviteMemberId').val(),
				proNo : proNo
			},
			success: function(data){
				switch(data.result){
				case "success": 
					$('#successAlertMessage').text('초대에 성공하였습니다');
					$('#successAlert').show('slow');
					setTimeout(function () { $('#successAlert').hide('slow'); }, 1500);
					$('#inviteMemberId').val('');
					$(".inviteMemberId").css('border-bottom','1px solid gray');
					$('#nothingLabel').text('');
					break;
				case "failed":
					$('#failedAlertMessage').text('초대를 실패했습니다');
					$('#failedAlert').show('slow');
					setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);break;
					break;
				case "nothing": 
					$('#nothingLabel').text('없는 아이디입니다');
					$(".inviteMemberId").css('border-bottom','1px solid red');
					break;
				case "having":
					$('#nothingLabel').text('초대중이거나 이미 멤버인 아이디입니다');
					$(".inviteMemberId").css('border-bottom','1px solid red');
					break;
				}
			},
			error: function(data){
				console.log("실패");
			}
		});
	}
	/* 초대취소 */
	function inviteCancel(proNo, memberNo){
		$.ajax({
			url: "/inviteProMemberCancel.do",
			type: "post",
			data: {
				memberNo: memberNo,
				proNo: proNo
			}, success: function(){
				$('#failedAlertMessage').text('초대를 취소하였습니다');
				$('#failedAlert').show('slow');
				setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);
			}
		});
	}

	function imm_open_pop(flag) {
		var proNoStr = $("#proNo").val();
	 	var proNo = proNoStr.substring(6);
	 	var memberNo= ${sessionScope.member.memberNo};
		$.ajax({
			url: "/checkLeader.do",
			data: {
				proNo : proNo
			},
			type: "post",
			success: function(data){
				if(data.memberNo==memberNo){
					$('#inviteMemberModal').show();
				} else {
					$('#failedAlertMessage').text('팀장만 멤버를 초대할 수 있습니다');
					$('#failedAlert').show('slow');
					setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);
				}
			}
		});
	};
	//팝업 Close 기능
	function imm_close_pop(flag) {
		$('#inviteMemberModal').hide();
		$('#nothingLabel').text('');
		$(".inviteMemberId").css('border-bottom','1px solid gray');
		$("#inviteMemberId").val('');
	};
	$(document).ready(function(){
		var proNoStr = $("#proNo").val();
	 	var proNo = proNoStr.substring(6);
	 	var memberNo= ${sessionScope.member.memberNo};
		$('#searchMemberText').keyup(function(){
			$.ajax({
				url: "/searchProMember.do",
				type: "post",
				data: {
					proNo: proNo,
					searchMemberText: $('#searchMemberText').val()
				}, success: function(data){
					var str="";
					for(var i=0; i<data.searchProMemberList.length; i++){
						if(data.searchProMemberList[i].leader=='Y'){
							leaderNo = data.searchProMemberList[i].memberNo;
						}
					}
					for(var i=0; i<data.searchProMemberList.length; i++){
	 					str+=
	 	 					"<div class='col-md-4' style='margin-top: 10px;'>"
	 	 					+"<img src='../resources/upload/member/"+data.searchProMemberList[i].memberPicture+"'"
	 						+"class='img-circle rounded-circle border partnerListPic'>"
	 						+"</div>"
	 						+"<div class='col-md-8' style='margin-top: 10px;'>"
	 						+"<div class='row'>"
	 						+"<div class='col-md-12'>"+data.searchProMemberList[i].memberName;
	 						if(data.searchProMemberList[i].leader=='Y'){
	 							leaderNo = data.searchProMemberList[i].memberNo;
	 							str+="<img src='../resources/images/project/crown.png'>";
	 						}
	 						if(data.searchProMemberList[i].memberNo==memberNo){
	 							str+="<label style='color: gray'>(me)</label>";
	 						}
	 						str+="</div>";
	 						if(data.searchProMemberList[i].inviteYN=='Y'){						
	 							str+="<div class='col-md-12'>"+data.searchProMemberList[i].memberId+"</div>";
	 						} else {
	 							str+="<div class='col-md-12'><span style='color: #339966; float: left;'>수락대기중...</span>";
	 							if(leaderNo==memberNo){
	 								str+="<a onclick='inviteCancel("
	 								+data.searchProMemberList[i].proNo+","+data.searchProMemberList[i].memberNo
	 								+");' style='color: gray; float: right;'>취소하기</a>";
	 							}
	 						}
	 						str+="</div></div>"
	 						+"</div>";
					}
					$('#proMemberListDiv').html(str);
				}
			});
		});
	});
</script>
<body>
<jsp:include page="/loading.do"></jsp:include>
<!-- header -->
		<div class="header">

			<!-- 팝업창 -->
			<div class="row">
				<div class="col-12" id="banner">
					모두다에 대해 더 알고싶다면 여기를 클릭해 주세요.
				</div>
			</div>

			<!-- 상단바 -->
			<div class="row" style="border-bottom: 1px solid #c8c8c8;">
				<div class="col-md-3 topbar">
					<img id="menu-img" src="../resources/images/layout-img/menu.png" onclick="mmm_open_pop();"/>
				</div>

				<div class="col-md-5 topbar" id="mainLogoDiv">
					<a href="/mainPage.do"><img id="logo-img"          
						src="../resources/images/layout-img/main_logo_rec.png"></a>
				</div>

				<div class="col-md-4 topbar" id="myInfoDiv">
					<div class="row" style="height: 100%;">
					<div class="dropdown topbar" id="myInfoDiv" style="width: 10%;">
					<!-- 회원 썸네일 -->
					<c:set var="memberPic" value="../resources/upload/member/${sessionScope.member.memberPicture }"/>
					<img src="${memberPic }" class="img-circle rounded-circle border myInfo dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="dropdown-menu dropdown-menu-right" id="myInfoDropDown">
						<div class="row" style="margin: 20px;">
							<div class="col-md-4" style="margin: 0;">
							<img src="${memberPic }" class="img-circle rounded-circle border myInfoPop">
							</div>
							<div class="col-md-8">
								<div class="row">
								<div class="col-md-12">${sessionScope.member.memberName }</div>
								<div class="col-md-12">${sessionScope.member.memberId }</div>
								</div>
							</div>
    						<a class="dropdown-item" href="/myInfo.do?menu=myInfo">내정보</a>
    						<a class="dropdown-item" href="/myInfo.do?menu=memberInfo">멤버 초대 및 탈퇴</a>
    						<a class="dropdown-item" href="/logout.do">로그아웃</a>
 						</div>
 						</div>
						</div>
						<div class="topbar" style="width: 10%;">
						<!-- 파트너추가 -->
					<img src="../resources/upload/member/add-friend.png" class="myInfo" onclick="imm_open_pop();">
						</div>
						<div class="topbar" style="width: 10%;">
						<!-- 파트너 목록 -->
						<a class="dropdown-toggle proMemberListDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="showMemberList();">멤버 목록</a>
						<div class="dropdown-menu dropdown-menu-right" id="proMemberList">
							<div class="row" style="margin: 20px;">
								<div class="col-md-12">
									<button class="btn btn-secondary btn-xl" id="inviteMemberBtn" onclick="imm_open_pop();">멤버 초대하기</button>
								</div>
								<div class="col-md-12">
									<input type="text" id="searchMemberText" placeholder="멤버 검색...">
								</div>
								<div class="col-md-12">
								<div class="row" id="proMemberListDiv">
								
								</div>
								</div>
							</div>
 						</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- header 끝 -->
		<div id="inviteMemberModal" class="modal">
			<!-- Modal 내용 -->
			<div class="modal-content" style="width: 30%; height: auto;">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-11"></div>
					<div class="col-1">
						<img src="../resources/images/post/close.png" id="modal-close"
							onclick="imm_close_pop();" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<h2
							style="float: left; margin-left: 40px; color: #339966; font-weight: bold;">멤버 초대하기</h2>
					</div>
					<div class="offset-md-1 col-md-10 inviteContext" style="margin-top: 5%;">
						<label id="nothingLabel" style="color: red;">&nbsp;</label>
						<input class="inviteMemberId" id="inviteMemberId" type="text" placeholder="이메일을 입력하세요">
					</div>
					<div class="col-md-4"></div>
					<div class="col-md-4" style="margin-top: 5%; margin-bottom: 10%;">
						<button onclick="inviteMemberFunc();" class="btn btn-secondary">초대하기</button>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<input type="hidden" id="proNo" value="${requestScope['javax.servlet.forward.query_string']}" />
		<!-- 팝업모달 끝 -->
<%-- 		<div id="mobileMenuModal" class="modal">
			<!-- Modal 내용 -->
			<div id="mobileMenuContent" class="modal-content" style="width: 80%; height: auto; min-height: 100%;">
			<div class="row" style="margin: 20px;">
				<div class="col-md-6"style="margin: 0;">
					<img src="${memberPic }"
						class="img-circle rounded-circle border myInfoPop">
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12"><strong>${sessionScope.member.memberName }</strong></div>
						<div class="col-md-12">${sessionScope.member.memberId }</div>
					</div>
				</div>
				<a class="dropdown-item" href="/myInfo.do?menu=myInfo">내정보</a> <a
					class="dropdown-item" href="/myInfo.do?menu=memberInfo">멤버 초대 및
					탈퇴</a> <a class="dropdown-item" href="/logout.do">로그아웃</a>
			</div>
		<div class="row leftbar">
         <ul style="margin-bottom:0;">
            <li class="list-title">전체 정보</li>
            <li class="list-group-item" id="newsfeed">
               <img src="../resources/images/layout-img/lightning.png" class="icon"> 뉴스피드</li>
            <li class="list-group-item" id="callpost">
               <img src="../resources/images/layout-img/arroba.png" class="icon"> 호출된 글</li>
            <li class="list-group-item" id="bookmark">
               <img src="../resources/images/layout-img/bookmark.png" class="icon"> 북마크</li>
            <li class="list-group-item" id="mypost">
               <img src="../resources/images/layout-img/file.png" class="icon"> 내가 쓴 글</li>
            <li class="list-group-item" id="calendarAll">
               <img src="../resources/images/layout-img/calendar.png" class="icon"> 전체 캘린더</li>
         </ul>

         <ul>
            <li class="list-title">프로젝트</li>

            <li class="list-group-item" id="createProject">
               <img src="../resources/images/layout-img/plus.png" class="icon"> 새 프로젝트 만들기</li>

            <!-- 프라이빗 공간 -->
            <li class="list-group-item openModal" id="privateMain">
               <img src="../resources/images/project/safe.png" class="icon"> 프라이빗 공간</li>
            
            <li class="privateSub">
            <a class="dropdown-item priPost" href="#" value="${privateProject.proNo}"> 
            <img src="../resources/images/project/post-it.png" class="subIcon" /> 프라이빗 글</a></li>
            
            <li class="privateSub">
            <a class="dropdown-item priHashTag" href="#" value="${privateProject.proNo}">
            <img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>
            

            <!-- 내가 포함된 프로젝트 -->
            <c:forEach items="${projectList}" var="projectList" end="5">
            

               <li class="list-group-item projectMain openModal" value="${projectList.proNo}">
               <img src="../resources/images/project/flag.png" class="proIcon" /> ${projectList.proTitle}</li>

               <!-- 하위메뉴 -->

               <li class="list-group-item" id="sub_${projectList.proNo}_post">
               <a class="dropdown-item proPost" href="#" value="${projectList.proNo}">
               <img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글</a></li>

               <li class="list-group-item" id="sub_${projectList.proNo}_hashTag">
               <a class="dropdown-item proHashTag" href="#" value="${projectList.proNo}">
               <img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>

               <li class="list-group-item" id="sub_${projectList.proNo}_progress">
               <a class="dropdown-item proProgress" href="#" value="${projectList.proNo}">
               <img src="../resources/images/project/diagram.png" class="subIcon" /> 프로젝트 이슈 진행 현황</a></li>

               <li class="list-group-item" id="sub_${projectList.proNo}_myPost">
               <a class="dropdown-item proMyPost" href="#" value="${projectList.proNo}"> 
               <img src="../resources/images/project/file.png" class="subIcon" /> 내가 쓴 글</a></li>

            
            </c:forEach>
            
            <li class="list-group-item" id="moreProject">
            <img src="../resources/images/project/more-symbol.png" class="icon"> 프로젝트 더보기</li>
           	
           	<!-- 더 보기 -->
           	<li class="list-group-item" id="projectPlus openModal" style="display:none;" >
            <img src="../resources/images/project/flag-marker.png" class="icon"><span></span></li>
            <!-- 하위메뉴 -->
               <li class="list-group-item" id="plus_post">
               <a class="dropdown-item proPost" href="#" value="">
               <img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글</a></li>
               <li class="list-group-item" id="plus_hashTag">
               <a class="dropdown-item proHashTag" href="#" value="">
               <img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>
               <li class="list-group-item" id="plus_progress">
               <a class="dropdown-item proProgress" href="#" value="">
               <img src="../resources/images/project/diagram.png" class="subIcon" /> 프로젝트 이슈 진행 현황</a></li>
               <li class="list-group-item" id="plus_myPost">
               <a class="dropdown-item proMyPost" href="#" value=""> 
               <img src="../resources/images/project/file.png" class="subIcon" /> 내가 쓴 글</a></li>
           
         </ul>
      </div>
		</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 팝업모달 끝 --> --%>
</body>
</html>