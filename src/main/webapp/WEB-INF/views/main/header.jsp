<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
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
#partnerList{
	height: auto; width: 20rem;
}
.partnerListPic{
	height: 4rem; width: 4rem;
}
.partnerListDropdown{
	height: 70%; width: auto; position:absolute; top:0; bottom:0; margin:auto; margin-top: 10px;
}
#invitePartnerBtn, #searchPartnerText{
	width: 100%; margin-bottom: 15px;
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
	 					"<div class='col-md-4' style='margin-top: 10px;'>"
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
					+"<div class='col-md-12'>"+data.partnerList[i].parName+"</div>";
					if(data.partnerList[i].parYN=='Y'){						
						str+="<div class='col-md-12'>"+data.partnerList[i].parId+"</div>";
					} else {
						str+="<div class='col-md-12'><span style='color: #339966; float: left;'>수락대기중...</span>"
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
				case "success": alert("초대에 성공하였습니다.");
				$('#invietMemberId').val('');
					$(".invietMemberId").css('border-bottom','1px solid gray');
					$('#nothingLabel').text('');
					break;
				case "failed": alert("초대에 실패하였습니다.");break;
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
			}
		});
	}
	function acceptPartner(memberNo, parNo){
		$.ajax({
			url: "/acceptPartner.do",
			type: "post",
			data: {
				memberNo: memberNo,
				parNo: parNo
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
			$.ajax({
				url: "/searchPartner.do",
				type: "post",
				data: {
					memberNo: ${sessionScope.member.memberNo},
					searchPartnerText: $('#searchPartnerText').val()
				}, success: function(data){
					var str="";
					for(var i=0; i<data.searchPartnerList.length; i++){
	 					str+=
	 					"<div class='col-md-4' style='margin-top: 10px;'>"
	 					+"<img src='../resources/upload/member/"+data.searchPartnerList[i].parPicture+"'"
	 					+"class='img-circle rounded-circle border partnerListPic'>"
						+"</div>"
						+"<div class='col-md-8' style='margin-top: 10px;'>"
						+"<div class='row'>"
						+"<div class='col-md-12'>"+data.searchPartnerList[i].parName+"</div>";
						if(data.searchPartnerList[i].parYN=='Y'){						
							str+="<div class='col-md-12'>"+data.searchPartnerList[i].parId+"</div>";
						} else {
							str+="<div class='col-md-12'><span style='color: #339966; float: left;'>수락대기중...</span>"
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

<!-- header -->
		<div class="header">

			<!-- 팝업창 -->
			<div class="row">
				<div class="col-12" id="banner">
					모두다에 대해 더 알고싶다면 여기를 클릭해 주세요. <img id="cancel-img"
						onclick="bannerClose();"
						src="../resources/images/layout-img/cancel.png" />
				</div>
			</div>

			<!-- 상단바 -->
			<div class="row">
				<div class="col-md-3 topbar">
					<img id="menu-img" src="../resources/images/layout-img/menu.png" />
				</div>

				<div class="col-md-5 topbar">
					<a href="/mainPage.do"><img id="logo-img"          
						src="../resources/images/layout-img/main_logo_rec.png"></a>
				</div>

				<div class="col-md-4 topbar">
					<div class="row" style="height: 100%;">
					<div class="col-md-4 topbar"></div>
					<div class="col-md-1 dropdown topbar" id="myInfoDiv">
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
    						<a class="dropdown-item" href="/myInfo.do">내정보</a>
    						<a class="dropdown-item" href="#">멤버 초대 및 탈퇴</a>
    						<a class="dropdown-item" href="/logout.do">로그아웃</a>
 						</div>
 						</div>
						</div>
						<div class="col-md-1 topbar">
						<!-- 파트너추가 -->
					<img src="../resources/upload/member/add-friend.png" class="myInfo" onclick="ipm_open_pop();">
						</div>
						<div class="col-md-3 topbar">
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
						<div class="col-md-1 topbar">
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
</body>
</html>