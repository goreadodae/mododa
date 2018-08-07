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
		background-color: #F5F5F5;
   		position: relative;
	}
	.topbar{
		border-bottom: none !important;
	}
	.background {
   background-color: #F5F5F5;
   position: relative;
   overflow-x: hidden;
	overflow-y: hidden;
	height: 100vmin;
}

ul {
   float: right;
   width: 80%;
}

li {
   list-style: none;
   padding: 5px 0px 5px 5px;
   margin-bottom: 5px;
   margin-right: 10px;
}

.icon {
   margin-right: 5%;
   height: 23px;
   width: 23px;
}

.list-title {
   color: #464646;
   margin-bottom: 0;
}

div {
   box-sizing: border-box;
}

/* 지은 스타일 추가 */
.proIcon {
   margin-right: 5%;
   height: 23px;
   width: 23px;
}

.subIcon {
   height: 18px;
   width: 18px;
   margin-right: 5%;
   margin-left: 15%;
}

.mobilePrivateSub {
   display: none;
   overflow: hidden;
   position: relative;
   margin-bottom: -1px;
   border: 1px solid #ddd;
   padding-top: 1.5% !important;
   padding-bottom: 1.5% !important;
}

.mobilePrivateSub a {
   padding: 0;
}

li[id^="mobileSub_"] {
   display: none;
   padding: 0;
   background-color: #F5F5F5;
}

li[id^="mobileSub_"] a {
   padding: 0;
}

.list-group-item {
   padding-top: 1.5% !important;
   padding-bottom: 1.5% !important;
}

.list-group-item:hover {
	cursor: pointer;
}

li[id^="MobilePlus_"] {
   display: none;
   padding: 0;
   background-color: #F5F5F5;
}

li[id^="MobilePlus_"] a {
   padding: 0;
}
}
@media screen and (max-width: 426px) {
	#menu-img{
		left: 40%;
	}
	.moblieTopbar{
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
	display: none;
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
.myInfo {
	height: 2.4rem;
	width: 2.4rem;
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
}

.myInfoPop {
	height: 100px;
	width: 100px;
}

#myInfoDropDown {
	height: auto;
	width: 400px;
}

.dropdown-item:active {
	background-color: #CFF09E !important;
}

#partnerList {
	height: auto;
	width: 21rem;
}

.partnerListPic {
	height: 4rem;
	width: 4rem;
}

.partnerListDropdown {
	height: 70%;
	width: auto;
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	margin-top: 10px;
}

#invitePartnerBtn, #searchPartnerText {
	width: 100%;
	margin-bottom: 15px;
}

.invietMemberId {
	width: 100%;
	background-color: transparent;
	border: 0px solid;
	margin-bottom: 10%;
	border-bottom: 1px solid gray;
}

.invietMemberId:focus {
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

.modal-content {
	margin: 15% auto;
}

#modal-close {
	width: 20px;
	margin-top: 20px;
	margin-right: 20px;
	float: right;
}

a:hover {
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
.dropdown-divider{
	width: 100%;
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
	/* 파트너 리스트를 보여주는 함수 */
	function showPartnerList(){
		$.ajax({
			url: "/selectPartnerList.do",
			type: "post",
			data: {
				memberNo: ${sessionScope.member.memberNo}
			},
			success: function(data){
				var str="";
				if(data.partnerList.length==0){
					str += "<div class='col-md-12' style='color: gray; text-align: center;'>파트너가 없습니다.</div>";
				}
				for(var i=0; i<data.invitingPartnerList.length; i++){
					str+=
	 					"<div class='col-md-3' style='margin-top: 10px;'>"
	 					+"<img src='../resources/upload/member/"+data.invitingPartnerList[i].parPicture+"'"
						+"class='img-circle rounded-circle border partnerListPic'>"
						+"</div>"
						+"<div class='col-md-8' style='margin-top: 10px;'>"
						+"<div class='row'>"
						+"<div class='col-md-12'>"+data.invitingPartnerList[i].parName+"</div>"			
						+"<div class='col-md-12'>"+data.invitingPartnerList[i].parId+"</div>"
						+"<div class='col-md-12'><a style='color: #339966; float: left;' onclick='acceptPartner("
						+data.invitingPartnerList[i].parNo+","+data.invitingPartnerList[i].memberNo
						+");'>수락하기</a>"
						+"<a onclick='inviteCancel("
						+data.invitingPartnerList[i].memberNo+","+data.invitingPartnerList[i].parNo
						+");' style='color: gray; float: right;'>거절하기</a></div>"
						+"</div>"
						+"</div>";
				}
				for(var i=0; i<data.partnerList.length; i++){
 					str+=
 					"<div class='col-md-4' style='margin-top: 10px;'>"
 					+"<img src='../resources/upload/member/"+data.partnerList[i].parPicture+"'"
					+"class='img-circle rounded-circle border partnerListPic'>"
					+"</div>"
					+"<div class='col-md-8' style='margin-top: 10px;'>"
					+"<div class='row'>"
					+"<div class='col-md-12'>"+data.partnerList[i].parName;
					if(data.partnerList[i].parYN=='Y'){			
						str+="<img src='../resources/images/icon/delete-can.png' onclick='deletePartner("
						+data.partnerList[i].memberNo+","+data.partnerList[i].parNo+");' style='float: right; cursor: pointer;'/></div>"
						+"<div class='col-md-12'>"+data.partnerList[i].parId+"</div>";
					} else {
						str+="</div><div class='col-md-12'><span style='color: #339966; float: left;'>수락대기중...</span>"
						+"<a onclick='inviteCancel("
						+data.partnerList[i].memberNo+","+data.partnerList[i].parNo
						+");' style='color: gray; float: right;'>취소하기</a></div>";
					}
					str+="</div>"
					+"</div>";
				}
				$('#partnerListDiv').html(str);
			},
			error: function(data){
				console.log("실패");
			}
			
		});
	}
	/*  */
	function invitePartnerFunc(){
		$.ajax({
			url: "/invitePartner.do",
			type: "post",
			data:{
				parId : $('#invietMemberId').val(),
				memberNo : ${sessionScope.member.memberNo}
			},
			success: function(data){
				switch(data.result){
				case "success": 
					$('#successAlertMessage').text('초대에 성공하였습니다');
					$('#successAlert').show('slow');
					setTimeout(function () { $('#successAlert').hide('slow'); }, 1500);
					$('#invietMemberId').val('');
					$(".invietMemberId").css('border-bottom','1px solid gray');
					$('#nothingLabel').text('');
					break;
				case "failed": 				
					$('#failedAlertMessage').text('초대를 실패했습니다');
					$('#failedAlert').show('slow');
					setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);break;
				case "nothing": 
					$('#nothingLabel').text('없는 아이디입니다');
					$(".invietMemberId").css('border-bottom','1px solid red');
					break;
				case "having":
					$('#nothingLabel').text('초대중이거나 이미 파트너인 아이디입니다');
					$(".invietMemberId").css('border-bottom','1px solid red');
					break;
				}
			},
			error: function(data){
				console.log("실패");
			}
		});
	}
	/* 초대취소 */
	function inviteCancel(memberNo, parNo){
		$.ajax({
			url: "/inviteCancel.do",
			type: "post",
			data: {
				memberNo: memberNo,
				parNo: parNo
			}, success: function(){
				$('#failedAlertMessage').text('초대를 취소하였습니다');
				$('#failedAlert').show('slow');
				setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);
			}
		});
	}
	function deletePartner(memberNo, parNo){
		if(confirm("정말로 삭제하시겠습니까?")){
			$.ajax({
				url: "/deletePartner.do",
				type: "post",
				data: {
					memberNo: memberNo,
					parNo: parNo
				}, success: function(){
					$('#failedAlertMessage').text('삭제되었습니다');
					$('#failedAlert').show('slow');
					setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);
				}
			});
		}
	}
	function acceptPartner(memberNo, parNo){
		$.ajax({
			url: "/acceptPartner.do",
			type: "post",
			data: {
				memberNo: memberNo,
				parNo: parNo
			}, success: function(){
				$('#successAlertMessage').text('수락하였습니다');
				$('#successAlert').show('slow');
				setTimeout(function () { $('#successAlert').hide('slow'); }, 1500);
			}
		});
	}
	function ipm_open_pop(flag) {
		$('#invitePartnerModal').show();
	};
	//팝업 Close 기능
	function ipm_close_pop(flag) {
		$('#invitePartnerModal').hide();
		$('#nothingLabel').text('');
		$(".invietMemberId").css('border-bottom','1px solid gray');
		$("#invietMemberId").val('');
	};
	$(document).ready(function(){
		$('#searchPartnerText').keyup(function(){
			if($('#searchPartnerText').val()==''){
				showPartnerList();
			}
			$.ajax({
				url: "/searchPartner.do",
				type: "get",
				data: {
					memberNo: ${sessionScope.member.memberNo},
					searchPartnerText: $('#searchPartnerText').val()
				},
				success: function(data){
					var str="";
					for(var i=0; i<data.searchPartnerList.length; i++){
	 					str+=
	 					"<div class='col-md-4' style='margin-top: 10px;'>"
	 					+"<img src='../resources/upload/member/"+data.searchPartnerList[i].parPicture+"'"
	 					+"class='img-circle rounded-circle border partnerListPic'>"
						+"</div>"
						+"<div class='col-md-8' style='margin-top: 10px;'>"
						+"<div class='row'>"
						+"<div class='col-md-12'>"+data.searchPartnerList[i].parName;
						if(data.searchPartnerList[i].parYN=='Y'){		
							str+="<img src='../resources/images/icon/delete-can.png' onclick='deletePartner("
								+data.partnerList[i].memberNo+","+data.partnerList[i].parNo+");' style='float: right; cursor: pointer;'/></div>"
								+"<div class='col-md-12'>"+data.searchPartnerList[i].parId+"</div>";
						} else {
							str+="</div><div class='col-md-12'><span style='color: #339966; float: left;'>수락대기중...</span>"
							+"<a onclick='inviteCancel("
							+data.searchPartnerList[i].memberNo+","+data.searchPartnerList[i].parNo
							+");' style='color: gray; float: right;'>취소하기</a></div>";
						}
						str+="</div>"
						+"</div>";
					}
					$('#partnerListDiv').html(str);
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
			<div class="row">
				<div class="col-md-3 topbar">
				<img id="menu-img" src="../resources/images/layout-img/menu.png" onclick="mmm_open_pop();"/>
				</div>

				<div class="col-md-5 topbar" id="mainLogoDiv">
					<a href="/mainPage.do"><img id="logo-img"          
						src="../resources/images/layout-img/main_logo_rec.png"></a>
				</div>

				<div class="col-md-4 topbar">
					<div class="row" style="height: 100%;">
					<div class="dropdown topbar moblieTopbar" id="myInfoDiv" style="width: 10%;">
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
    						<div class="dropdown-divider"></div>
    						<a class="dropdown-item" href="/noticeList.do?currentPage=1">공지사항</a>
    						<a class="dropdown-item" href="/qnaList.do?currentPage=1">1:1 Q&A</a>
 						</div>
 						</div>
						</div>
						<div class="topbar moblieTopbar" style="width: 10%;">
						<!-- 파트너추가 -->
					<img src="../resources/upload/member/add-friend.png" class="myInfo" onclick="ipm_open_pop();">
						</div>
						<div class="topbar moblieTopbar" style="width: 10%;">
						<!-- 파트너 목록 -->
						<a class="dropdown-toggle partnerListDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="showPartnerList();">파트너 목록</a>
						<div class="dropdown-menu dropdown-menu-right" id="partnerList">
							<div class="row" style="margin: 20px;">
								<div class="col-md-12">
									<button class="btn btn-secondary btn-xl" id="invitePartnerBtn" onclick="ipm_open_pop();">파트너 초대하기</button>
								</div>
								<div class="col-md-12">
									<input type="text" id="searchPartnerText" placeholder="파트너 검색...">
								</div>
								<div class="col-md-12">
								<div class="row" id="partnerListDiv">
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
		<div id="invitePartnerModal" class="modal">
			<!-- Modal 내용 -->
			<div class="modal-content" style="width: 30%; height: auto;">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-11"></div>
					<div class="col-1">
						<img src="../resources/images/post/close.png" id="modal-close"
							onclick="ipm_close_pop();" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<h2
							style="float: left; margin-left: 40px; color: #339966; font-weight: bold;">파트너초대하기</h2>
					</div>
					<div class="offset-md-1 col-md-10 inviteContext" style="margin-top: 5%;">
						<label id="nothingLabel" style="color: red;">&nbsp;</label>
						<input class="invietMemberId" id="invietMemberId" type="text" placeholder="이메일을 입력하세요">
					</div>
					<div class="col-md-4"></div>
					<div class="col-md-4" style="margin-top: 5%; margin-bottom: 10%;">
						<button onclick="invitePartnerFunc();" class="btn btn-secondary">초대하기</button>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 팝업모달 끝 -->
		
		
 		<div id="mobileMenuModal" class="modal">
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
					    	<div class="dropdown-divider"></div>
    						<a class="dropdown-item" href="/noticeList.do?currentPage=1">공지사항</a>
    						<a class="dropdown-item" href="/qnaList.do?currentPage=1">1:1 Q&A</a>
					
			</div>
		<div class="row leftbar">
         <ul style="margin-bottom:0;">
            <li class="list-title">전체 정보</li>
            <li class="list-group-item" id="mobileNewsfeed">
               <img src="../resources/images/layout-img/lightning.png" class="icon"> 뉴스피드</li>
            <li class="list-group-item" id="mobileCallpost">
               <img src="../resources/images/layout-img/arroba.png" class="icon"> 호출된 글</li>
            <li class="list-group-item" id="mobileBookmark">
               <img src="../resources/images/layout-img/bookmark.png" class="icon"> 북마크</li>
            <li class="list-group-item" id="mobileMypost">
               <img src="../resources/images/layout-img/file.png" class="icon"> 내가 쓴 글</li>
            <li class="list-group-item" id="mobileCalendarAll">
               <img src="../resources/images/layout-img/calendar.png" class="icon"> 전체 캘린더</li>
         </ul>

         <ul>
            <li class="list-title">프로젝트</li>

            <li class="list-group-item" id="mobileCreateProject">
               <img src="../resources/images/layout-img/plus.png" class="icon"> 새 프로젝트 만들기</li>

            <!-- 프라이빗 공간 -->
            <li class="list-group-item openModal" id="mobilePrivateMain">
               <img src="../resources/images/project/safe.png" class="icon"> 프라이빗 공간</li>
            
            <li class="mobilePrivateSub">
            <a class="dropdown-item mobilePriPost" href="#" value="${privateProject.proNo}"> 
            <img src="../resources/images/project/post-it.png" class="subIcon" /> 프라이빗 글</a></li>
            
            <li class="mobilePrivateSub">
            <a class="dropdown-item mobilePriHashTag" href="#" value="${privateProject.proNo}">
            <img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>
            

            <!-- 내가 포함된 프로젝트 -->
            <c:forEach items="${projectList}" var="projectList" end="5">
            

               <li class="list-group-item MobileProjectMain openModal" value="${projectList.proNo}">
               <img src="../resources/images/project/flag.png" class="proIcon" /> ${projectList.proTitle}</li>

               <!-- 하위메뉴 -->

               <li class="list-group-item" id="mobileSub_${projectList.proNo}_post">
               <a class="dropdown-item mobileProPost" href="#" value="${projectList.proNo}">
               <img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글</a></li>

               <li class="list-group-item" id="mobileSub_${projectList.proNo}_hashTag">
               <a class="dropdown-item mobileProHashTag" href="#" value="${projectList.proNo}">
               <img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>

               <li class="list-group-item" id="mobileSub_${projectList.proNo}_progress">
               <a class="dropdown-item mobileProProgress" href="#" value="${projectList.proNo}">
               <img src="../resources/images/project/diagram.png" class="subIcon" /> 프로젝트 이슈 진행 현황</a></li>

               <li class="list-group-item" id="mobileSub_${projectList.proNo}_myPost">
               <a class="dropdown-item mobileProMyPost" href="#" value="${projectList.proNo}"> 
               <img src="../resources/images/project/file.png" class="subIcon" /> 내가 쓴 글</a></li>

            
            </c:forEach>
            
            <li class="list-group-item" id="mobileMoreProject">
            <img src="../resources/images/project/more-symbol.png" class="icon"> 프로젝트 더보기</li>
           	
           	<!-- 더 보기 -->
           	<li class="list-group-item" id="MobileProjectPlus openModal" style="display:none;" >
            <img src="../resources/images/project/flag-marker.png" class="icon"><span></span></li>
            <!-- 하위메뉴 -->
               <li class="list-group-item" id="MobilePlus_post">
               <a class="dropdown-item mobileProPost" href="#" value="">
               <img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글</a></li>
               <li class="list-group-item" id="MobilePlus_hashTag">
               <a class="dropdown-item mobileProHashTag" href="#" value="">
               <img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>
               <li class="list-group-item" id="MobilePlus_progress">
               <a class="dropdown-item mobileProProgress" href="#" value="">
               <img src="../resources/images/project/diagram.png" class="subIcon" /> 프로젝트 이슈 진행 현황</a></li>
               <li class="list-group-item" id="MobilePlus_myPost">
               <a class="dropdown-item mobileProMyPost" href="#" value=""> 
               <img src="../resources/images/project/file.png" class="subIcon" /> 내가 쓴 글</a></li>
           
         </ul>
      </div>
		</div>
			<!-- Modal 내용 끝 -->
		</div>
	<div class="alert alert-success collapse" role="alert" id="successAlert" style="width: 320px; position: absolute; right:40px; top:40px; z-index: 1060;">
		<img src="../resources/images/icon/checked.png"/><span style="margin: 10px;" id="successAlertMessage"></span>
	</div>
	<div class="alert alert-secondary collapse" role="alert" id="failedAlert" style="width: 320px; position: absolute; right:40px; top:40px; background-color: #4A4A4A; color: white; z-index: 1060;">
		<img src="../resources/images/icon/warning.png"/><span style="margin: 10px;" id="failedAlertMessage"></span>
	</div>
		<!-- 팝업모달 끝 -->
		
		<script>

	var beforeShow = 0; /* 열렸던 창을 닫기 위한 변수 */

	function liClose(proNo) {
		

 		var proListArr = $.makeArray($('.MobileProjectMain').map(function() {
			return $(this).attr("value");
		}));
 		
 		var cnt = 0;
		for(var i=0; i<proListArr.length; i++) {
			if(proListArr[i] == proNo) {
				cnt++;
			} 
		}
		
		if(cnt==0) {
			
			
			$.ajax({
				url : "/searchMoreProTitle.do",
				type : "post",
				data : {
					proNo : proNo
				},
				success : function(data) {
					//console.log(data.proTitle);
					$("#MobileProjectPlus span").text(data.proTitle);
				},
				error : function() {
					console.log("이름찾기 실패");
				}
			});
			
			
			//alert("더보기로 들어옴");
			$("#MobileProjectPlus").show();
			$("li[id^='MobilePlus_']").show();
			$("#MobilePlus_post a").attr('value',proNo);
			$("#MobilePlus_hashTag a").attr('value',proNo);
			$("#MobilePlus_progress a").attr('value',proNo);
			$("#MobilePlus_myPost a").attr('value',proNo);
		}
		
		beforeShow = proNo;

	}

/* 해당하는 컨트롤러주소(.do)를 적어주시면 됩니다~ */
   jQuery(function($) {
      
      $("#mobileNewsfeed").click(function() {
         location.href="/newsfeed.do";
      });

      $("#mobileCallpost").click(function() {
         location.href="/callpost.do";
      });

      $("#mobileBookmark").click(function() {
         location.href="/bookmark.do";
      });
      $("#mobileMypost").click(function() {
         location.href="/mypost.do";
      });

      $("#mobileProject").click(function() {
         location.href="";
      }); /* 삭제하기 */

      $("#mobileLibrary").click(function() {
         location.href="";
      });
      
      $("#mobileCalendarAll").click(function() {
         location.href="/calendar.do";
      });
      
      
      
      /* 지은 사용 시작 */
      // 프로젝트 생성
      $("#mobileCreateProject").click(function() {
         location.href="/gotoCreateProject.do";
      });


      // 프라이빗 공간
      $("#mobilePrivateMain").click(function() {
         var displayValue = $(".mobilePrivateSub").css('display');
         if (displayValue == 'none') {
            $('li[id^="mobileSub_' + beforeShow + '_"]').hide();/* 열렸던 창 닫기 */
            $(".mobilePrivateSub").show();
            $("#MobileProjectPlus").hide();
            $("li[id^='MobilePlus_']").hide();
         } else {
            $('li[id^="mobileSub_' + beforeShow + '_"]').hide();/* 열렸던 창 닫기 */
            $("#MobileProjectPlus").hide();
            $("li[id^='MobilePlus_']").hide();
            $(".mobilePrivateSub").hide();
         }
      });

      // 프라이빗 하위 메뉴 
      $(".mobilePriPost").click(function() {
         var proNo = $(this).attr('value');
         location.href="/privatePost.do?proNo=" + proNo;
      });

      $(".mobilePriHashTag").click(function() {
         var proNo = $(this).attr('value');
         location.href="/privateHashTag.do?proNo=" + proNo;
      });

      // 프로젝트 목록
      $(".MobileProjectMain").click(function() {
         var proNo = $(this).attr('value');
         var displayValue = $('li[id^="mobileSub_' + proNo + '_"]').css('display');
         if (displayValue == 'none') {
            $(".mobilePrivateSub").hide();/* 열렸던 창 닫기 */
            $('li[id^="mobileSub_' + beforeShow + '_"]').hide();/* 열렸던 창 닫기 */
            $("li[id^='MobilePlus_']").hide();
            $("#MobileProjectPlus").hide();
            $('li[id^="mobileSub_' + proNo + '_"]').show();
            beforeShow = proNo;/* 열렸던 창 닫기 */
         } else {
            $('li[id^="mobileSub_' + proNo + '_"]').hide();
         }
      });

      // 프로젝트 하위 메뉴
      $(".mobileProPost").click(function() {
         var proNo = $(this).attr('value');
         location.href="/projectPost.do?proNo=" + proNo;
      });

      $(".mobileProHashTag").click(function() {
         var proNo = $(this).attr('value');
         location.href="/projectHashTag.do?proNo=" + proNo;
      });

      $(".mobileProProgress").click(function() {
         var proNo = $(this).attr('value');
         location.href="/mobileProjectProgress.do?proNo=" + proNo;
      });

      $(".mobileProMyPost").click(function() {
         var proNo = $(this).attr('value');
         location.href="/projectMyPost.do?proNo=" + proNo;
      });

      /* 지은 사용 끝 */
      
      /* 프로젝트 더보기 */
      $("#mobileMoreProject").click(function() {
    	  location.href="/gotoMoreProject.do";
      });

   });
</script>

</body>
</html>