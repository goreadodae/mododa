<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="/resources/favicon.ico">
	<link rel="shortcut icon" href="/resources/favicon.ico">
	<title>협업툴 모두다 MODODA</title>tle>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<style>
/* 모바일  */
@media screen and (max-width: 768px) {
	.btn-usc>a{
		float: right;
		margin-right: 10px;
	}
	#inviteMemberModalContent{
		width: 100vmin !important;
	}
	#mobileInviteMemberBtn{
		float: right;
		margin-right: 25px;
	}
	#mobileMemberPic{
		float: left;
	}
	.paddingLeftDiv{
		padding-left: 24px !important;
	}
	#card-text-center{
		border-bottom: none !important;
	}
}
/* 모바일끝 */
body {
	overflow-x: hidden;
	height: 100%;
}
div {
	margin: 0px;
	padding: 0px;
}
.myInfoImg {
	width: 25vmin;
	height: 25vmin;
}

.card-body {
	display: none;
	height: 618px;
}

.card-body.active {
	display: inline-block;
}

.infoTitle {
	float: left;
	font-weight: bold;
}

.infoContext {
	width: 100%;
	background-color: transparent;
	border: 0px solid;
}

.context {
	margin-bottom: 10%;
	border-bottom: 1px solid gray;
}

.infoContext:focus {
	outline: none;
}

.btn-one, .btn-one:link, .btn-one:visited {
	font-weight: bold;
	color: #339966;
}

.btn-two, .btn-two:link, .btn-two:visited {
	font-weight: bold;
	color: gray;
}

.btn-save, .btn-cancel {
	display: none;
}

.btn-usc {
	height: 50px;
	width: auto;
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	margin: auto;
}
.btn-secondary {
	background-color: #339966;
	border-color: #339966
}

.btn-secondary:active, .btn-secondary:focus, .btn-secondary:hover {
	background-color: #CFF09E;
	border-color: #CFF09E
}

#changePicBtn{
	float: none;
	margin-top: 10px;
}
#inputFileMemberPic, #submit-btn{
 	display: none;
}

#inviteMemberBtn{
	margin-bottom: 15px;
	float: right;
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
#dropdownMenu2{
	margin-top: 53px;
}
</style>

<body>

<!-- header -->
<jsp:include page="/header.do"></jsp:include>
<!-- header 끝 -->

<div class="row">
	<!-- left bar -->
	<jsp:include page="/leftbar.do"></jsp:include>
	<!-- left bar 끝-->


	<!-- contents -->
	<div class="col-6" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		<div class="card text-center" id="card-text-center">
		<div class="card-header">
			<h4 style="display: inline-block;">설정</h4>
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item" id="nav-item1"><a class="nav-link" href="/myInfo.do?menu=myInfo">내 정보</a></li>
				<li class="nav-item" id="nav-item2"><a class="nav-link" href="/myInfo.do?menu=memberInfo">멤버초대 및 탈퇴</a></li>
<!-- 				<li class="nav-item" id="nav-item3"><a class="nav-link" href="#">Disabled</a></li> -->
			</ul>
		</div>
		<div class="card-body">
			<div class="row">
			<div class="col-md-4">
				<c:set var="memberPic" value="../resources/upload/member/${sessionScope.member.memberPicture }"/>
				<img src="${memberPic }" class="img-circle rounded-circle border myInfoImg">
				<form action="/changeMemberPic.do" method="post" enctype="multipart/form-data" name="memberPic">
				<input type="file" name="inputFileMemberPic" id="inputFileMemberPic" accept="image/*" onchange="submitFile();" required/>
				<input type="submit" id="submit-btn"/>
				</form>
				<input type="button" class="btn btn-secondary btn-xl" id="changePicBtn" value="변경하기" onclick="callInputFile();"/>
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-8 context">
						<label class="label infoTitle">이메일</label><br>
						<input class="infoContext" type="text" readonly value="${sessionScope.member.memberId }">
					</div>
					<div class="col-md-4">
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">이름</label><br>
						<input class="infoContext name-con" type="text" placeholder="이름을 입력하세요(필수)" value="${sessionScope.member.memberName }">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update">수정</a>
					<a href="#" class="btn-one btn-save" onclick="saveMyInfo('name');">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">부서명</label><br>
						<input class="infoContext depart-con" type="text" placeholder="부서명을 입력하세요" value="${sessionScope.member.memberDepartName }">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update">수정</a>
					<a href="#" class="btn-one btn-save" onclick="saveMyInfo('depart');">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">주요업무</label><br>
						<input class="infoContext mainTask-con" type="text" placeholder="주요업무를 입력하세요" value="${sessionScope.member.memberMainTask }">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update">수정</a>
					<a href="#" class="btn-one btn-save" onclick="saveMyInfo('mainTask');">저장</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-8 context">
						<label class="label infoTitle">비밀번호 변경</label><br>
						<input id="changePassword" class="infoContext" type="password" placeholder="현재 비밀번호를 입력해주세요">
					</div>
					<div class="col-md-4">
					<p class="btn-usc">
					<a href="#" class="btn-one btn-update changepw">수정</a>
					<a href="#" class="btn-one btn-save" onclick="changePw();">확인</a>
					<a href="#" class="btn-two btn-cancel">취소</a>
					</p>
					</div>
					<div class="col-md-12">
						<input type="button" class="btn btn-secondary btn-xl" onclick="location.href='/logout.do'" value="로그아웃"/>
						<input type="button" class="btn btn-secondary btn-xl" onclick="leaveMododa();" value="탈퇴하기"/>
					</div>
				</div>
			</div>
			</div>
		</div>
				<div class="card-body">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div class="row">
								<div class="col-md-4">
									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenu2" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">프로젝트 이름
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
											<c:if test="${requestScope.projectList==null }">
												<button class="dropdown-item" type="button">
													리스트가 없습니다
												</button>
											</c:if>
											<c:set var="num" value="0"/>
											<c:forEach items="${requestScope.projectList }" var="list" varStatus="i">
											<c:if test="${list.proMemberNo==sessionScope.member.memberNo }">
												<c:set var="num" value="${num+1 }"/>
												<button class="dropdown-item" type="button" onclick="selectProject(${list.proNo})">
													${list.proTitle}
												</button>
											</c:if>
											</c:forEach>
											<c:if test="${num<1 }">
												<button class="dropdown-item" type="button">
													리스트가 없습니다
												</button>
											</c:if>
										</div>
									</div>
								</div>
								<div class="col-md-8"><!-- 멤버리스트 -->
									<div class="row paddingLeftDiv" id="proMemberListDiv">
										<label style="height: 40px; margin: auto; margin-top: 53px;">팀장으로 참여한 프로젝트만<br>초대 및 탈퇴를 할 수 있습니다</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
				<div class="card-body">
		</div>
	</div>
	</div>
	<!-- contents 끝 -->
				<div id="inviteMemberModal" class="modal">
			<!-- Modal 내용 -->
			<div class="modal-content" id="inviteMemberModalContent" style="width: 30%; height: auto;">
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
						<button onclick="inviteMemberFunc();" class="btn btn-secondary" id="mobileInviteMemberBtn">초대하기</button>
						<input type="hidden" value="" id="proNoHidden">
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
			<!-- Modal 내용 끝 -->
		</div>

	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>
<script>
/* 		$(".nav-item").click(function(){
			var index = $(this).index();
			$(".card-body").attr('class','card-body');
			$(".nav-link").attr('class','nav-link');
			$(this).children('a').attr('class','nav-link active');
			$(".card-body:eq("+index+")").attr('class','card-body active');
		}); */
		$(".btn-update").click(function(){
			$(this).css('display','none');
			$(this).siblings().css('display','inline-block');
		});
		$(".btn-cancel").click(function(){
			$(this).siblings(".btn-update").css('display','inline-block');
			$(this).css('display','none');
			$(this).siblings('.btn-save').css('display','none');
		});
		$(".btn-save").click(function(){
			$(this).siblings(".btn-update").css('display','inline-block');
			$(this).css('display','none');
			$(this).siblings('.btn-cancel').css('display','none');
		});
		$(".infoContext").click(function(){
 			$(this).parent().next().find('.btn-update').css('display','none');
			$(this).parent().next().find('.btn-save').css('display','inline-block');
			$(this).parent().next().find('.btn-cancel').css('display','inline-block');
		});
		function saveMyInfo(category){
			var context = $('.'+category+'-con').val();
			if(category=='name' && context==''){
				$('.name-con').parent().css('border-bottom','1px solid red');
				alert('이름은 필수 입력사항입니다');
			} else {
				$.ajax({
					url: "/changeMyInfo.do",
					type: "post",
					data: {
						category: category,
						context: context
					},
					success: function(data){
						$('#successAlertMessage').text('변경하였습니다');
						$('#successAlert').show('slow');
						setTimeout(function () { $('#successAlert').hide('slow'); }, 1500);
						
						$('.name-con').parent().css('border-bottom','1px solid gray');
						$('#myInfoDiv').load(window.location.href+" #myInfoDiv");
					},
					error: function(data){
						console.log('실패');
					}
				});
			}
		};
		function changePw(){
			var memberPw = $('#changePassword').val();
			$.ajax({
	  			url : "/checkLogin.do",
	  			type : "post",
	  			data : {
	  				memberId : '${sessionScope.member.memberId }',
	  				memberPw : $('#changePassword').val()
	  			},
	  			success : function(data) {
	  				if(data.result=='failedPw' || memberPw==''){
						$('#failedAlertMessage').text('비밀번호가 틀렸습니다');
						$('#failedAlert').show('slow');
						setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);
	  					$('#changePassword').parent().css('border-bottom','1px solid red');
	  				} else {
	  					location.href="/changePwPage.do"
	  				}
	  			},
	  			error : function(data) {
	  				console.log("실패");
	  			}
	  		});
		}
		function callInputFile(){
			$('#inputFileMemberPic').trigger('click');
		}
		function submitFile(){
			$('#submit-btn').trigger('click');
		}
		function leaveMododa(){
			location.href="/leaveMododaPage.do";
		}
		$(document).ready(function(){
			switch('${param.menu}'){
			case 'myInfo':
				$(".card-body").attr('class','card-body');
				$(".nav-link").attr('class','nav-link');
				$('#nav-item1').children('a').attr('class','nav-link active');
				$(".card-body:eq(0)").attr('class','card-body active');
				break;
			case 'memberInfo':
				$(".card-body").attr('class','card-body');
				$(".nav-link").attr('class','nav-link');
				$('#nav-item2').children('a').attr('class','nav-link active');
				$(".card-body:eq(1)").attr('class','card-body active');
				break;
			}
		})
		function selectProject(proNo){
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
					var str="<div class='col-md-12'>"
					+"<button class='btn btn-secondary btn-xl' id='inviteMemberBtn' onclick='imm_open_pop();'>멤버 초대하기</button></div>";
					for(var i=0; i<data.memberList.length; i++){
						if(data.memberList[i].leader=='Y'){
							leaderNo = data.memberList[i].memberNo;
						}
					}
					for(var i=0; i<data.memberList.length; i++){
	 					str+="<div class='row' style='background-color: #F5F5F5; width: 100%;'>"
	 					+"<div class='col-md-4' style='margin-top: 10px;'>"
	 					+"<img src='../resources/upload/member/"+data.memberList[i].memberPicture+"'"
						+"class='img-circle rounded-circle border partnerListPic' id='mobileMemberPic'>"
						+"</div>"
						+"<div class='col-md-8' style='margin-top: 10px;>"
						+"<div class='row'>"
						+"<div class='col-md-12' style='text-align: left;'>"+data.memberList[i].memberName;
						if(data.memberList[i].leader=='Y'){
							leaderNo = data.memberList[i].memberNo;
							str+="<img src='../resources/images/project/crown.png'>";
						}
						if(leaderNo!=data.memberList[i].memberNo && data.memberList[i].inviteYN=='Y'){
							str+="<img src='../resources/images/icon/delete-can.png' onclick='deleteProMember("
								+data.memberList[i].proNo+","+data.memberList[i].memberNo+");' style='float: right; cursor: pointer;'/>"
						}
						str+="</div>";
						if(data.memberList[i].inviteYN=='Y'){						
							str+="<div class='col-md-12' style='text-align: left;'>"+data.memberList[i].memberId+"</div>";
						} else {
							str+="<div class='col-md-12'><span style='color: #339966; float: left;'>수락대기중...</span>";
							if(leaderNo==memberNo){
								str+="<a onclick='inviteProCancel("
								+data.memberList[i].proNo+","+data.memberList[i].memberNo
								+");' style='color: gray; float: right;'>취소하기</a>";
							}
						}
						str+="</div></div></div></div>";
					}
					$('#proMemberListDiv').html(str);
					$('#proNoHidden').val(proNo);
				},
				error: function(data){
					console.log("실패");
				}
				
			});
		}
		function inviteProCancel(proNo, memberNo){
			if(confirm("정말로 취소하시겠습니까?")){
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
						selectProject(proNo);
					}
				});
			}
			
		}
		function deleteProMember(proNo, memberNo){
			if(confirm('정말로 탈퇴시키겠습니까?')){
				$.ajax({
					url: "/inviteProMemberCancel.do",
					type: "post",
					data: {
						memberNo: memberNo,
						proNo: proNo
					}, success: function(){
						$('#failedAlertMessage').text('멤버를 탈퇴시켰습니다');
						$('#failedAlert').show('slow');
						setTimeout(function () { $('#failedAlert').hide('slow'); }, 1500);
						selectProject(proNo);
					}
				});			
			}
		}
		function inviteMemberFunc(){
			var proNo = $('#proNoHidden').val();
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
					selectProject(proNo);
				},
				error: function(data){
					console.log("실패");
				}
			});
		}
		function imm_open_pop(flag) {
			$('#inviteMemberModal').show();
		};
		//팝업 Close 기능
		function imm_close_pop(flag) {
			$('#inviteMemberModal').hide();
			$('#nothingLabel').text('');
			$(".inviteMemberId").css('border-bottom','1px solid gray');
			$("#inviteMemberId").val('');
		};
	</script>
</body>
</html>