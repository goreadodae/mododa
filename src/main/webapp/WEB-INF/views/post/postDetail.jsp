<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세보기 모달</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Myeongjo"
	rel="stylesheet">

<style>
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

/* Modal 내용 */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 60px;
}

#modal-schedule {
	background-color: #fefefe;
	margin: 17% auto; /* 15% from the top and centered */
	padding: 25px;
	border: 1px solid #888;
	width: 60px;
	border-radius: 5px;
	width: 550px;
	height: 290px;
}

#modal-decision {
	background-color: #fefefe;
	margin: 20% auto; /* 15% from the top and centered */
	padding: 25px;
	border: 1px solid #888;
	width: 60px;
	border-radius: 5px;
	width: 550px;
	height: 230px;
}

#modal-decide {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 25px;
	border: 1px solid #888;
	width: 60px;
	border-radius: 5px;
	width: 550px;
	height: 260px;
}

#modal-close {
	width: 20px;
	float: right;
	margin: 0px;
}


/* 마우스 포인터 설정 */
#viewProjectTitle,#postBookmarkImg,#like-count,.content-box,.scheduleDate{
	cursor : pointer;
}

#post-title {
	font-size: 30px;
}

/* 상단 부분 */
#postBookmarkImg {
	width: 20px;
	float: right;
}

#postMoreImg {
	width: 20px;
	margin-right: 20px;
	margin-left: 20px;
	float: right;
}

/* 댓글 */
#comment {
	background-color: #F5F5F5;
}


/* 좋아요 */
#like-count {
	float: right;
	font-size: 13px;
	color: #707070;
	padding-bottom : 10px;
}

#like-icon {
	height: 15px;
}

/* 프로젝트 이름 */
#viewProjectTitle {
	color: #339966;
}

/* 프로젝트 진행상황 */
#statusImg {
	height: 40px;
	width: 52px;
}

/* 게시물 작성자 프로필 */
#postWriterProfileImg {
	margin-bottom: 3px;
	height: 30px;
	height: 30px;
	border: 1px solid #969696;
	border-radius: 100px;
}

/* 게시물 작성자 */
#post-writer{
	color : #5a5a5a;
}

#post-date{
	color : #969696;
}

/* 할일 프로필 이미지 */
#profileImg {
	margin-bottom: 3px;
	height: 15px;
	border: 1px solid grey;
	border-radius: 100px;
}
/* 할일 */
img[class="btn btn-link dropdown-toggle"] {
	height: 30px;
	width: 43px;
}
/* 내용 제목 */
.contents-title {
	color: #282828;
	font-family: 'Jua', sans-serif;
	font-size: 20px;
}

.content-box {
	width: 120px;
	height: 80px;
	border: 1px solid #d2d2d2;
	background-color: #F5F5F5;
	text-align: center;
	margin-right: 10px;
	margin-left: 0px;
	margin-top: 10px;
	margin-bottom: 10px;
	display: inline-table;
}

#add-icon {
	height: 30px;
	position: relative;
	top: 25px;
}

/* 할일 등록 */
.appendInfo {
	font-size: 15px;
	padding: 5px;
	display: inline-block;
}

.statusImgforTodo {
	height: 20px;
}

/* 일정 등록 */
#scTitle, #updateScTitle {
	width: 95%;
	height: 50px;
	padding-left : 15px;
}

#scStartDate, #scEndDate, #updateScStartDate, #updateScEndDate {
	border: 1px solid #aaaaaa;
	height: 40px;
	font-size: 15px;
}

.scheduleDate {
	font-size: 15px;
	color: #464646;
}

#scheduleTitle {
	font-size: 30px;
}

.scheduleList {
	padding: 5px;
}

.insertButton {
	background-color: #339966;
	color: #F8FAFF;
	height: 25px;
	width: 100px;
	border: 0px;
	cursor: pointer;
	border-radius: 30px;
	font-size: 15px;
}

/* 의사결정 등록 */
.eachDecision{
	background-color : #F0FFF0;
	width : 100%;
	border-radius: 5px;
	padding : 15px;
	margin-bottom : 15px;
	border : 1px solid #C8FAC8;
	display: inline-block;
}

#decisionContent, #decisionComment {
	width: 100%;
	height: 50px;
}

.memberIdForDecision {
	font-weight: bold;
}

#decisionWait {
	background-color: #aaaaaa;
	color: white;
	width: 50px;
	text-align: center;
	border-radius: 20px;
	margin: 0px;
	display: inline-block;
}

#decisionApproval {
	background-color: #00837a;
	color: white;
	width: 50px;
	text-align: center;
	border-radius: 20px;
	margin: 0px;
	display: inline-block;
}

#decisionCancel {
	background-color: #B93232;
	color: white;
	width: 50px;
	text-align: center;
	border-radius: 20px;
	margin: 0px;
	display: inline-block;
}

#deleteForDecision {
	padding: 5px;
	border: 1px solid #d2d2d2;
	background-color: #dcdcdc;
	color: #505050;
	display: inline-block;
	float: right;
}

#decideForDecision {
	padding: 5px;
	border: 1px solid #d2d2d2;
	background-color: #CFF09E;
	color: #505050;
	display: inline-block;
	float: right;
}

#decideYes {
	color: #00837a;
	font-size: 30px;
	font-weight: 550;
	display: inline-block;
}

#decideNo {
	color: #b80004;
	font-size: 30px;
	font-weight: 550;
	display: inline-block;
}

.decideIcon {
	height: 30px;
	padding-bottom: 7px;
}

/* 버튼 스타일 */
#greenButton {
	background-color: #339966;
	color: #F8FAFF;
	height: 40px;
	width: 150px;
	border: 0px;
	cursor: pointer;
}

.whiteButton{
	background-color: white;
	color: #339966;
	width: 80px;
	border: 1px solid #339966;
	cursor: pointer;
	padding: 5px;
	margin-right : 10px;
	border-radius: 30px;
}

.insertButton2 {
	background-color: #339966;
	color: #F8FAFF;
	width: 80px;
	border: 0px;
	cursor: pointer;
	padding: 5px;
	border-radius: 30px;
}
</style>


<script type="text/javascript">
	var postNo = 0;	//게시글 번호
	var postMemberNo = 0; //로그인한 계정
	var postBookmarkOnOff = 0;//북마크 상태
	var postLikeOnOff = 0; //좋아요 상태
	var postProNo = 0;	//프로젝트 번호
	var postScheduleNo = 0;	//수정할 일정 번호
	var postDecisionNo = 0; //의사결정 번호

	//게시글 불러옴
	function getPost(postNumber) {
		postNo = postNumber; //게시글 번호

		//count
		var countSchedule = 0;
		var countTodo = 0;
		var countDecision = 0;
		$.ajax({
					url : "/viewPost.do",
					type : "post",
					data : {
						postNo : postNo
					},
					success : function(data) {
						if (data.post != null) {
							//로그인한 계정 정보
							postMemberNo = data.memberNo;

							//북마크 설정
							if (data.bookmark != null) {
								$('#postBookmarkImg').attr("src", "../resources/images/post/bookmarkOn.png");
								postBookmarkOnOff = 1;
							}else{
								$('#postBookmarkImg').attr("src", "../resources/images/post/bookmark.png");
								postBookmarkOnOff = 0;
							}

							//프로젝트 이름과 게시글 제목,내용들
							$('#viewProjectTitle').html(data.project.proTitle);
							$('#post-title').html(data.post.postTitle);
							$('#post-content').html(data.post.postContent);
							$('#post-date').html("&nbsp;" + data.post.stPostData);
							$('#postWriterProfileImg').attr("src",data.post.postWriterPicture);
							$('#post-writer').html(data.post.postWriterName);
							postProNo = data.project.proNo;
							
							//좋아요 설정
							if(data.like!=null){	//좋아요를 눌렀다면
								$('#like-icon').attr("src","../resources/images/post/like-red.png");
								postLikeOnOff = 1;
							}else{
								$('#like-icon').attr("src","../resources/images/post/like.png");
								postLikeOnOff = 0;
							}
							$('#postLikeCount').html(data.likeCount);
							
							//프로젝트 진행상황 표시
							if (data.post.postProgress == "suggest") { //프로젝트 진행상황이 발의된 이슈일때,
								$('#statusImg').attr("src", "../resources/images/post/light-bulbOn.png");
							} else if (data.post.postProgress == "working") { //진행중일때,
								$('#statusImg').attr("src", "../resources/images/post/play-buttonOn.png");
							} else if (data.post.postProgress == "stop") { //일시중지일때,
								$('#statusImg').attr("src", "../resources/images/post/pauseOn.png");
							} else if (data.post.postProgress == "finish") { //진행중일때,
								$('#statusImg').attr("src", "../resources/images/post/checked.png");
							}

							//일정 목록 불러오기
							var strSchedule = "";
							$('#appendforSchedule').html(strSchedule);
							for (var i = 0; i < data.schedule.length; i++) {
								countSchedule++;

								strSchedule += "<div class='scheduleList'>"
										+ "<img src='../resources/images/post/calendar.png' />&nbsp;&nbsp;"
										+ "<span class='scheduleDate' onclick='open_updateScheduleModal(" + data.schedule[i].scNo +",\""+ data.schedule[i].startDate + "\",\"" + data.schedule[i].endDate + "\",\"" + data.schedule[i].scTitle + "\");' id='scheduleContent" + data.schedule[i].scNo + "'>"
										+ data.schedule[i].startDate + " ~ "
										+ data.schedule[i].endDate
										+ "&nbsp;&nbsp; : &nbsp;&nbsp;"
										+ data.schedule[i].scTitle + "</span>"
										+ "</div>";

								$('#appendforSchedule').html(strSchedule);
							}
							$('#countSchedule').html(countSchedule);

							//할일 불러오기
							var strTodo = "";
							$('#appendforTodo').html(strTodo);
							$('#newTodoContent').val("");
							for (var i = 0; i < data.todo.length; i++) {
								countTodo++;
								strTodo += "<div class='btn-group'>";

								switch (data.todo[i].todoProgress) {
								case "suggest":
									strTodo += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='" + data.todo[i].todoNo + "' src='../resources/images/icon/play-button.png' />";
									break;
								case "working":
									strTodo += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='" + data.todo[i].todoNo + "' src='../resources/images/post/play-buttonOn.png' />";
									break;
								case "stop":
									strTodo += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='" + data.todo[i].todoNo + "' src='../resources/images/post/pauseOn.png' />";
									break;
								case "finish":
									strTodo += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='" + data.todo[i].todoNo + "' src='../resources/images/post/checked.png' />";
									break;
								}

								strTodo += "<div class='dropdown-menu'>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data.todo[i].todoMember + "," + data.todo[i].todoNo + ",'suggest');\"><img src='../resources/images/icon/play-button.png' />&nbsp;&nbsp;&nbsp;할 일 할당</a>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data.todo[i].todoMember + "," + data.todo[i].todoNo + ",'working');\"><img src='../resources/images/post/play-buttonOn.png' />&nbsp;&nbsp;&nbsp;진행중</a>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data.todo[i].todoMember + "," + data.todo[i].todoNo + ",'stop'); \"><img src='../resources/images/post/pauseOn.png' />&nbsp;&nbsp;&nbsp;일시중지</a>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data.todo[i].todoMember + "," + data.todo[i].todoNo + ",'finish');\"><img src='../resources/images/post/checked.png' />&nbsp;&nbsp;&nbsp;완료</a>"
										+ "</div></div>";
								strTodo += "<div class='appendInfo'>"
										+ data.todo[i].todoContent + "&nbsp;&nbsp;▶&nbsp;&nbsp;<img id='profileImg' src=" + data.todo[i].todoMemberPicture + " onerror=\"this.src='../resources/images/post/user.png'\" /> " + data.todo[i].todoMemberName
										+ "</div><br>";
							}
							$('#appendforTodo').html(strTodo);
							$('#countTodo').html(countTodo);

							//의사결정 불러오기
							if (data.decision.length == 0) {	//등록된 의사결정이 없으면
								var strDecision = "<div class='content-box' onclick='open_decision();'>"
										+ "<img src='../resources/images/post/add.png' id='add-icon' /></div>";

								$('#countDecision').html(0);
							} else {
								var strDecision = "";
								for (var i = 0; i < data.decision.length; i++) {
									countDecision ++;
									strDecision += "<div class='eachDecision'><div id='postDecision" + data.decision[i].dcNo + "'><span class='memberIdForDecision'>"
										+ data.decision[i].dcWriterName
										+ "</span>님의 요청 : "
										+ data.decision[i].dcContent + "<br>";

								if (data.decision[i].dcYn == 'n'
										|| data.decision[i].dcYn == 'N') {//아직 의사결정 안됬을때(대기)
									strDecision += "<div id='decisionWait'>대기</div> <span class='memberIdForDecision'>"
											+ data.decision[i].dcMakerName
											+ "</span>님의 결정 기다리는 중&nbsp;&nbsp;&nbsp;<br>";
								} else if (data.decision[i].dcDecision == 'y'
										|| data.decision[i].dcDecision == 'Y') {//의사결정이 승인일때
									strDecision += "<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>"
											+ data.decision[i].dcMakerName
											+ "</span>님의 결정 : "
											+ data.decision[i].dcComment
											+ "&nbsp;&nbsp;&nbsp;<br>";
								} else {//의사결정이 반려일때
									strDecision += "<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>"
											+ data.decision[i].dcMakerName
											+ "</span>님의 결정 : "
											+ data.decision[i].dcComment
											+ "&nbsp;&nbsp;&nbsp;<br>";
								}
								
								strDecision += "</div>";

								if (data.memberNo == data.decision[i].dcWriter) {//로그인한 계정이 결정 요청자일 경우
									strDecision += " <div id='deleteForDecision' onclick='deleteDecision(" + data.decision[i].dcNo + ");'><img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</div>";
								}
								if (data.memberNo == data.decision[i].dcMaker) { //로그인한 계정이 결정자일경우
									strDecision += " <div id='decideForDecision' onclick='open_decide(" + data.decision[i].dcNo + ");'><img src='../resources/images/post/check.png' style='height:15px; margin-bottom:5px;'>결정하기</div>";
								}
								strDecision +="</div>";
								
							}
								$('#countDecision').html(countDecision);
							}
							
							$('#appendforDecision').html(strDecision);

							//게시글 프로젝트의 멤버들
							$('#selectMember').html("");
							$('#selectMemberForDecision').html("");
							for (var i = 0; i < data.member.length; i++) {
								var strMember = "<option value='" + data.member[i].memberNo + "'>"
										+ data.member[i].memberName
										+ "</option>";
								$('#selectMember').append(strMember);
								$('#selectMemberForDecision').append(strMember);
							}

							

						} else {
							$('#post-title').html('db에 글이 없음');
						}

						open_postDetail();
					},
					error : function(data) {
						console.log("실패");
					}
				});
		//준석 추가(댓글읽으려면 글번호 필요해서 다른 .do로 글번호 넘김.)
		$.ajax({
			url:"/comment.do",
			type:"post",
			data:{
				postNo : postNo
		},
		success:function(data)
		{
			$("#comment").html(data);
		},
		error:function(data)
		{
			console.log("error");
		}
		});
	};

	//팝업 open 기능
	function open_postDetail(flag) {
		$('#myModal').show();
	};

	//팝업 Close 기능
	function close_postDetail(flag) {
		$('#myModal').hide();
	};

	//일정 모달 open
	function open_scheduleModal(flag) {
		$('#scStartDate').valueAsDate = new Date();
		$('#scEndDate').valueAsDate = new Date();
		$('#scheduleModal').show();
	}

	//일정 모달 close
	function close_schedule(flag) {
		$('#scheduleModal').hide();
	};
	
	//일정수정 모달 open
	function open_updateScheduleModal(preScNo,preStartDate,preEndDate,preScTitle) {
		postScheduleNo = preScNo;
		$('#updateScStartDate').val(preStartDate);
		$('#updateScEndDate').val(preEndDate);
		$('#updateScTitle').val(preScTitle);

		$('#updateScheduleModal').show();
	}

	//일정수정 모달 close
	function close_updateScheduleModal(flag) {
		$('#updateScheduleModal').hide();
	};

	//의사결정 모달 open
	function open_decision(flag) {
		$('#decisionModal').show();
	}

	//의사결정 모달 close
	function close_decision(flag) {
		$('#decisionModal').hide();
	};

	//의사결정하기 모달 open
	function open_decide(dcNo) {
		postDecisionNo = dcNo;
		$('#decideModal').show();
	}

	//의사결정하기 모달 close
	function close_decide(flag) {
		$('#decideModal').hide();
	}

	//게시글 진행과정 변경
	function changeProgress(status) {
		$.ajax({
			url : "/postUpdatePostProgress.do",
			type : "post",
			data : {
				postNo : postNo,
				postProgress : status
			},
			success : function(data) {
				if (data.result < 0) {
					alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
				} else {
					if (status == 'suggest') {
						$('#statusImg').attr("src",
								"../resources/images/post/light-bulbOn.png");
					} else if (status == 'working') {
						$('#statusImg').attr("src",
								"../resources/images/post/play-buttonOn.png");
					} else if (status == 'stop') {
						$('#statusImg').attr("src",
								"../resources/images/post/pauseOn.png");
					} else if (status == 'finish') {
						$('#statusImg').attr("src",
								"../resources/images/post/checked.png");
					}

				}
			},
			error : function(data) {
				console.log("진행과정 변경 실패");
			},
			complete : function(data) {

			}
		});
	}

	//할일 추가
	function inputTodo() {
		var todoContent = $('#newTodoContent').val();
		var todoMember = $('#selectMember').val();
		if (todoContent == "") {
			alert("할 일 내용을 입력해주세요.");
		} else if (todoMember == null) {
			alert("담당자를 선택해주세요.");
		} else {
			$.ajax({
						url : "/postInsertTodo.do",
						type : "post",
						data : {
							postNo : postNo,
							todoContent : todoContent,
							todoMember : todoMember
						},
						success : function(data) {
							if (data.result < 0) { //로그인 세션이 null일때
								console.log("insert실패");
								alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
							} else {
								var str = "<div class='btn-group'>"
										+ "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='" + data.todoNo + "' src='../resources/images/icon/play-button.png' />"
										+ "<div class='dropdown-menu'>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + todoMember + "," + data.todoNo + ",'suggest');\"><img src='../resources/images/icon/play-button.png' />&nbsp;&nbsp;&nbsp;할 일 할당</a>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + todoMember + "," + data.todoNo + ",'working');\"><img src='../resources/images/post/play-buttonOn.png' />&nbsp;&nbsp;&nbsp;진행중</a>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + todoMember + "," + data.todoNo + ",'stop'); \"><img src='../resources/images/post/pauseOn.png' />&nbsp;&nbsp;&nbsp;일시중지</a>"
										+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + todoMember + "," + data.todoNo + ",'finish');\"><img src='../resources/images/post/checked.png' />&nbsp;&nbsp;&nbsp;완료</a>"
										+ "</div></div>"
										+ "<div class='appendInfo'>"
										+ todoContent
										+ "&nbsp;&nbsp;▶&nbsp;&nbsp;<img id='profileImg' src='" + data.todoMember.memberPicture + "' onerror=\"this.src='../resources/images/post/user.png'\" /> "
										+ data.todoMember.memberName
										+ "</div><br>";

								$('#appendforTodo').append(str);

								$('#countTodo').html(
										Number($('#countTodo').html()) + 1);
							}
						},
						error : function(data) {
							console.log("실패");
						},
						complete : function(data) {
							$('#newTodoContent').val("");
						}
					});
		}
	};

	//할일 진행과정 변경
	function changeProgressTodo(todoMember, todoNo, status) {
		if (todoMember == postMemberNo) { //로그인한 계정과 할일을 해야하는 사람과 같으면 진행과정 변경가능
			$
					.ajax({
						url : "/postUpdateTodoProgress.do",
						type : "post",
						data : {
							todoNo : todoNo,
							todoProgress : status
						},
						success : function(data) {
							if (data.result < 0) {
								alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
							} else {
								if (status == 'suggest') {
									$('#' + todoNo)
											.attr("src",
													"../resources/images/icon/play-button.png");
								} else {
									if (status == 'suggest') {
										$('#' + todoNo)
												.attr("src",
														"../resources/images/icon/play-button.png");
									} else if (status == 'working') {
										$('#' + todoNo)
												.attr("src",
														"../resources/images/post/play-buttonOn.png");
									} else if (status == 'stop') {
										$('#' + todoNo)
												.attr("src",
														"../resources/images/post/pauseOn.png");
									} else if (status == 'finish') {
										$('#' + todoNo)
												.attr("src",
														"../resources/images/post/checked.png");
									}
								}
							}
						},
						error : function(data) {
							console.log("할일 진행과정 변경 실패");
						},
						complete : function(data) {

						}
					});
		} else { //다르면 변경 권한 없음
			alert("진행상태의 수정 권한이 없습니다.");
		}
	}

	//일정 추가
	function inputSchedule() {
		var scTitle = $('#scTitle').val();
		var scStartDate = $('#scStartDate').val();
		var scEndDate = $('#scEndDate').val();

		$.ajax({
					url : "/postInsertSchedule.do",
					type : "post",
					data : {
						postNo : postNo,
						scTitle : scTitle,
						startDate : scStartDate,
						endDate : scEndDate
					},
					success : function(data) {
						if (data.result < 0) {
							alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
						} else {
							var str = "<div class='scheduleList'>"
									+ "<img src='../resources/images/post/calendar.png'/>&nbsp;&nbsp;"
									+ "<span class='scheduleDate' onclick='open_updateScheduleModal(" + data.newScNo +",\""+ scStartDate + "\",\"" + scEndDate + "\",\"" + scTitle + "\");' id='scheduleContent" + data.newScNo + "'>"
									+ scStartDate + " ~ " + scEndDate
									+ "&nbsp;&nbsp; : &nbsp;&nbsp;" + scTitle
									+ "</span>" + "</div>";
									
							$('#appendforSchedule').append(str);

							$('#countSchedule').html(Number($('#countSchedule').html()) + 1);
						}
					},
					error : function(data) {
						console.log("실패");
					},
					complete : function(data) {
						close_schedule();
					}
				});
	};
	
	//일정 수정
	function updateSchedule(){
		var scTitle = $('#updateScTitle').val();
		var scStartDate = $('#updateScStartDate').val();
		var scEndDate = $('#updateScEndDate').val();
		
		$.ajax({
			url:"/postUpdateSchedule.do",
			type:"post",
			data:{
				scheduleNo : postScheduleNo,
				startDate : scStartDate,
				endDate : scEndDate,
				scTitle : scTitle
			},
			success : function(data){
				var updatedSchedule = scStartDate + " ~ " + scEndDate
				+ "&nbsp;&nbsp; : &nbsp;&nbsp;"
				+ scTitle;
				$('#scheduleContent' + postScheduleNo).html(updatedSchedule);
				$('#scheduleContent' + postScheduleNo).attr("onclick","open_updateScheduleModal(" + postScheduleNo +",\""+ scStartDate + "\",\"" + scEndDate + "\",\"" + scTitle + "\");");
			},
			error : function(data){
				console.log("일정수정 실패");
			},
			complete : function(data) {
				close_updateScheduleModal();
			}
		});
	};
	
	//일정 삭제
	function deleteSchedule(){
		$.ajax({
			url : "/postDeleteSchedule.do",
			type : "post",
			data : {
				scNo : postScheduleNo
			},
			success : function(data){
				$('#scheduleContent' + postScheduleNo).parent().remove();
				$('#countSchedule').html(Number($('#countSchedule').html()) - 1);
			},
			error : function(data){
				console.log("일정삭제 실패");
			},
			complete : function(data) {
				close_updateScheduleModal();
			}
		});
	}

	// 이미지 추가
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#imgFile_Step_' + stepImgNum).attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}

	};

	//의사결정 추가
	function inputDecision() {
		var dcMaker = $('#selectMemberForDecision').val();
		var dcContent = $('#decisionContent').val();

		$.ajax({
					url : "/postInsertDecision.do",
					type : "post",
					data : {
						postNo : postNo,
						dcMaker : dcMaker,
						dcContent : dcContent
					},
					success : function(data) {
						if (data.result < 0) {
							alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
						} else {
							
							var str = "<div class='eachDecision'><div id='postDecision" + data.newDcNo + "'><span class='memberIdForDecision'>"
									+ data.writerMem.memberName
									+ "</span>님의 요청 : "
									+ dcContent
									+ "<br>"
									+ "<div id='decisionWait'>대기</div> <span class='memberIdForDecision'>"
									+ data.makerMem.memberName
									+ "</span>님의 결정 기다리는 중"
									+ "<br></div><div id='deleteForDecision' onclick='deleteDecision(" + data.newDcNo + ");'><img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</div>";
							if (postMemberNo == dcMaker) {
								str += " <div id='decideForDecision' onclick='open_decide(" + data.newDcNo + ");'><img src='../resources/images/post/check.png' style='height:15px; margin-bottom:5px;'>결정하기</div>";
							}
							str += "</div>"
							
							if(Number($('#countDecision').html())==0){
								$('#appendforDecision').html(str);
							}else{
								$('#appendforDecision').append(str);
							}

							$('#countDecision').html(Number($('#countDecision').html())+1);
						}
					},
					error : function(data) {
						console.log("실패");
					},
					complete : function(data) {
						$('#decisionContent').val("");
						close_decision();
					}
				});
	}

	//의사결정 삭제
	function deleteDecision(postDcNo) {
		$.ajax({
					url : "/postDeleteDecision.do",
					type : "post",
					data : {
						dcNo : postDcNo
					},
					success : function(data) {
						if (data.result < 0) {
							alert("의사결정 삭제실패");
						} else {
							var countDecision2 = Number($('#countDecision').html())-1;
							console.log(Number($('#countDecision').html()));
							if(countDecision2==0){
								var strDecision = "<div class='content-box' onclick='open_decision();'>"
									+ "<img src='../resources/images/post/add.png' id='add-icon' /></div>";
								$('#appendforDecision').html(strDecision);
							}
							else{
								$('#postDecision'+postDcNo).parent().remove();
							}
							$('#countDecision').html(countDecision2);

						}
					},
					error : function(data) {
						console.log("deleteDecision 실패");
					},
					complete : function(data) {
					}
				});
	}

	//의사결정 승인 선택시
	var decideResult = 'Y'; //의사결정 결과 전역변수
	function decideYes() {
		decideResult = 'Y';
		var strYes = "<img src='../resources/images/post/yes.png' class='decideIcon' /> 승인";
		$('#decideYes').html(strYes);
		$('#decideYes').css("color", "#00837a");
		var strNo = "<img src='../resources/images/post/nooff.png' class='decideIcon' /> 반려";
		$('#decideNo').html(strNo);
		$('#decideNo').css("color", "#888888");
	}

	//의사결정 반려 선택시
	function decideNo() {
		decideResult = 'N';
		var strYes = "<img src='../resources/images/post/yesoff.png' class='decideIcon' /> 승인";
		$('#decideYes').html(strYes);
		$('#decideYes').css("color", "#888888");
		var strNo = "<img src='../resources/images/post/no.png' class='decideIcon' /> 반려";
		$('#decideNo').html(strNo);
		$('#decideNo').css("color", "#b80004");
	}

	//의사결정 선택
	function updateDecision() {
		var dcComment = $('#decisionComment').val();
		$.ajax({
					url : "/postUpdateDecision.do",
					type : "post",
					data : {
						dcNo : postDecisionNo,
						dcDecision : decideResult,
						dcComment : dcComment
					},
					success : function(data) {
						if (data.result < 0) {
							alert("의사결정 실패");
						} else {
							var strDecision = "<span class='memberIdForDecision'>"
									+ data.decision.dcWriterName
									+ "</span>님의 요청 : "
									+ data.decision.dcContent + "<br>";
							if (decideResult == 'Y') {
								strDecision += "<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>"
										+ data.decision.dcMakerName
										+ "</span>님의 결정 : "
										+ data.decision.dcComment
										+ "&nbsp;&nbsp;&nbsp;<br>";
							} else {
								strDecision += "<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>"
										+ data.decision.dcMakerName
										+ "</span>님의 결정 : "
										+ data.decision.dcComment
										+ "&nbsp;&nbsp;&nbsp;<br>";
							}

							$('#postDecision'+postDecisionNo).html(strDecision);
						}
					},
					error : function(data) {
						console.log("updateDecision 실패");
					},
					complete : function(data) {
						$('#decisionComment').val("");
						decideYes();
						close_decide();
					}
				});
	}

	//북마크 설정
	function postBookmark() {
		if (postBookmarkOnOff == 0) {
			$.ajax({
				url : "/postBookmarkOn.do",
				type : "post",
				data : {
					postNo : postNo,
					memberNo : postMemberNo
				},
				success : function(data) {
					$('#postBookmarkImg').attr("src",
							"../resources/images/post/bookmarkOn.png");
					postBookmarkOnOff = 1;
				},
				error : function(data) {
					console.log("북마크 실패");
				}
			});
		} else {
			$.ajax({
				url : "/postBookmarkOff.do",
				type : "post",
				data : {
					postNo : postNo,
					memberNo : postMemberNo
				},
				success : function(data) {
					$('#postBookmarkImg').attr("src",
							"../resources/images/post/bookmark.png");
					postBookmarkOnOff = 0;
				},
				error : function(data) {
					console.log("북마크 실패");
				}
			});
		}

	}

	//좋아요 설정
	function postLike(){
		if (postLikeOnOff == 0) {
			$.ajax({
				url : "/postLikeOn.do",
				type : "post",
				data : {
					postNo : postNo,
					memberNo : postMemberNo
				},
				success : function(data) {
					$('#like-icon').attr("src","../resources/images/post/like-red.png");
					postLikeOnOff = 1;
					var likeCount = Number($('#postLikeCount').html()) + 1;
					console.log("count : " + likeCount);
					$('#postLikeCount').html(likeCount);
				},
				error : function(data) {
					console.log("좋아요 설정 실패");
				}
			});
		} else {
			$.ajax({
				url : "/postLikeOff.do",
				type : "post",
				data : {
					postNo : postNo,
					memberNo : postMemberNo
				},
				success : function(data) {
					$('#like-icon').attr("src", "../resources/images/post/like.png");
					postLikeOnOff = 0;
					var likeCount = Number($('#postLikeCount').html()) - 1;
					console.log("count : " + likeCount);
					$('#postLikeCount').html(likeCount);
				},
				error : function(data) {
					console.log("좋아요 설정 실패");
				}
			});
		}
	}
	
	//프로젝트 글 목록으로 이동
	function postChangePage(){
		close_postDetail();
		location.href="/projectPost.do?proNo="+postProNo;
	}
	
	

	//댓글추가(준석)
	function insertComment(postNo)
	{
		var insertCom = $(".comment-input").val();
		
		if(insertCom=="")
			{
			alert("댓글입력후 누르세요~~");
			}
		else{
			$.ajax({
				url:"/insertComment.do",
				type:"post",
				data:{postNo:postNo,
					"insertCom":insertCom},
				success:function(data){
					$('#comment').empty();
					$("#comment").html(data);
				}
				
			});
		}
	}
	
	//댓글 삭제(준석)
	function deleteComment(commentNo,postNo)
	{
		$.ajax({
			url:"/deleteComment.do",
			type:"post",
			data:{commentNo:commentNo,
				postNo:postNo},
			success:function(data)
			{
				$('#comment').empty();
				$("#comment").html(data);
			},
			error:function(data)
			{
				console.log("삭제 실패");
			}
		});
	}
	function cmLike(commentNo,postNo)//댓글 좋아요
	{
		/* if(cmlike==)
		$.ajax({
			url:"/
		}) */
	}
</script>
</head>

<body>
	<div>
		<!-- 게시글 모달 -->
		<div id="myModal" class="modal">

			<!-- Modal 내용 -->
			<div class="modal-content" style="width: 65%; height: 80%;">
				<div class="row" style="margin-left: 10px; margin-bottom: 20px;">
					<div class="col-5" id="viewProjectTitle" onclick="postChangePage();">게시글의 프로젝트 명</div>
					<div class="col-2">
						<img src="../resources/images/post/more.png" id="postMoreImg" />
						<img src="../resources/images/post/bookmark.png"
							id="postBookmarkImg" onclick="postBookmark();" />

					</div>
					<div class="col-5">
						<img src="../resources/images/post/close.png" id="modal-close" onclick="close_postDetail();" />
					</div>
				</div>

				<div class="row">
					<!-- left side (post내용) -->
					<div class="col-7" style="overflow-y: scroll; padding-left: 30px;">
						<br>
						<div class="btn-group" style="margin-bottom: 15px;">
							<img id="statusImg" class="btn btn-link dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"
								src="../resources/images/post/lightbulb.png" />
							<div class="dropdown-menu">
								<a class="dropdown-item" onclick="changeProgress('suggest');"><img
									src="../resources/images/post/lightbulb.png" /> 발의된 이슈</a> <a
									class="dropdown-item" onclick="changeProgress('working');"><img
									src="../resources/images/icon/play-button.png" /> 진행 중</a> <a
									class="dropdown-item" onclick="changeProgress('stop');"><img
									src="../resources/images/icon/pause.png" /> 일시중지</a> <a
									class="dropdown-item" onclick="changeProgress('finish');"><img
									src="../resources/images/icon/checked-allot.png" /> 완료</a>
							</div>
						</div>

						<span id="post-title">글 제목</span><br>
						<span id="like-count" onclick="postLike();"><img src="../resources/images/post/like.png" id="like-icon" /> 좋아요 <span id="postLikeCount">0</span></span>
						<br><hr style="margin-top : 0px;">
						<div style="margin-left: 15px; margin-right: 10px;">
							<span id="post-content">글내용</span> <br><br><br>
							<div style="text-align : right;">
							<img src="" id="postWriterProfileImg" onerror="this.src='../resources/upload/member/whale.png'" /> <span id="post-writer">작성자</span>&nbsp;&nbsp;<span id="post-date">작성날짜</span></div>
						</div>

						<hr style="margin-top : 5px; margin-bottom:25px;">
						<span class="contents-title">&nbsp;할 일 &nbsp;<span id="countTodo">0</span></span>
						<br>

						<div style="margin: 5px; font-size: 13px;">
							<div
								style="border-bottom: 1px solid #CFF09E; border-top: 1px solid #CFF09E; margin-bottom: 10px; padding: 10px; padding-right: 0px;">
								<input type="text" id="newTodoContent" placeholder="새 할 일을 입력해 주세요." style="width: 220px; border: 0px;" /> ▶ 담당자 선택 <select id="selectMember" name="담당자 선택"></select>
								<button class="insertButton" onclick="inputTodo();"
									style="float: right;">+ 할일추가</button>
							</div>

							<div id="appendforTodo"></div>
						</div>

						<br><hr>
						<div>
							<span class="contents-title">&nbsp;일정 &nbsp;<span id="countSchedule">0</span></span> &nbsp;&nbsp;&nbsp;
							<button class="insertButton" onclick="open_scheduleModal();" style="float: right;">+ 일정추가</button>
							<div id="appendforSchedule"></div>
							<br>
						</div>


						<br><hr>
						<span class="contents-title">&nbsp;파일/이미지 0</span><br>
						<div class="content-box" onclick="document.all.imgFile.click();">
							<input id="imgFile" name="imgFile" multiple="multiple"
								type="file" style="display: none" onchange="readURL(this);" />
							<img src="../resources/images/post/add.png" id="add-icon" />
						</div>



						<br>

						<br><hr>
						<span class="contents-title">&nbsp;의사결정 &nbsp;<span id="countDecision">0</span></span>&nbsp;&nbsp;&nbsp;
						<button class="insertButton" onclick="open_decision();" style="float: right;">+ 의사결정</button>
						<br><br>
						<div id="appendforDecision">
							<div class="content-box" onclick="open_decision();">
								<img src="../resources/images/post/add.png" id="add-icon" />
							</div>
							<br>

						</div>

						<br>
					</div>

					<!-- right side (댓글 부분) -->

					<div class="col-5" id="comment">
				<!-- <jsp:include page="/comment.do"></jsp:include>  준석추가 -->
					</div>
				</div>

			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 게시글 모달 끝 -->



		<!-- 일정 팝업모달 -->
		<div id="scheduleModal" class="modal">
			<!-- Modal 내용 -->
			<div id="modal-schedule">
				<img src="../resources/images/post/add-event.png"
					style="margin-bottom: 5px;" /><span style="color: #339966;">&nbsp;&nbsp;일정
					추가하기</span> <img src="../resources/images/post/close.png"
					onclick="close_schedule();" style="float: right; height: 20px;" /><br>
				<br>
				<center>
					<input type="text" id="scTitle" placeholder="일정 제목을 입력해주세요." /><br>
					<br> <span style="font-size: 18px; color: #aaaaaa;">일정기간
						&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="date" id='scStartDate' />&nbsp;&nbsp;&nbsp;<span style="font-size: 30px; color: #aaaaaa;">~</span>&nbsp;&nbsp;&nbsp;
						<input type="date" id='scEndDate' /><br>
					<br>
				</center>
				<button class="insertButton2" onclick="inputSchedule();"
					style="float: right; margin-top: 10px;">저장</button>
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 일정 팝업모달 끝 -->
		
		<!-- 일정수정 팝업모달 -->
		<div id="updateScheduleModal" class="modal">
			<!-- Modal 내용 -->
			<div id="modal-schedule">
				<img src="../resources/images/post/add-event.png"
					style="margin-bottom: 5px;" /><span style="color: #339966;">&nbsp;&nbsp;일정 수정하기</span> <img src="../resources/images/post/close.png"
					onclick="close_updateScheduleModal();" style="float: right; height: 20px;" /><br>
				<br>
				<center>
					<input type="text" id="updateScTitle" placeholder="일정 제목을 입력해주세요." /><br>
					<br> <span style="font-size: 18px; color: #aaaaaa;">일정기간
						&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input
						type="date" id='updateScStartDate' />&nbsp;&nbsp;&nbsp;<span
						style="font-size: 30px; color: #aaaaaa;">~</span>&nbsp;&nbsp;&nbsp;<input
						type="date" id='updateScEndDate' /><br>
					<br>
				</center>
				<button class="insertButton2" onclick="updateSchedule();" style="float: right; margin-top: 10px;">수정</button>
				<button class="whiteButton" onclick="deleteSchedule();" style="float: right; margin-top: 10px;">삭제</button>
				
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 일정수정 팝업모달 끝 -->


		<!-- 이미지 팝업모달 -->
		<div id="scheduleModal" class="modal">
			<!-- Modal 내용 -->
			<div class="modal-input" style="width: 25%; height: 30%;"></div>
		</div>
		<!-- 이미지 팝업모달 끝 -->

		<!-- 의사결정 팝업모달 시작 -->
		<div id="decisionModal" class="modal">
			<!-- Modal 내용 -->
			<div id="modal-decision">
				<img src="../resources/images/post/select.png" /><span
					style="color: #339966;">&nbsp;&nbsp;의사결정 요청</span> <img
					src="../resources/images/post/close.png"
					onclick="close_decision();" style="float: right; height: 20px;" /><br>
				<br> <input type="text" id="decisionContent"
					placeholder="결정을 요청할 내용을 입력해 주세요." /><br>
				<br> 결정자 선택&nbsp;&nbsp;<select id="selectMemberForDecision"></select><br>
				<button class="insertButton2" onclick="inputDecision();"
					style="float: right;">요청</button>

			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 의사결정 팝업모달 끝 -->

		<!-- 의사결정/변경하기 팝업모달 시작 -->
		<div id="decideModal" class="modal">
			<!-- Modal 내용 -->
			<div id="modal-decide">
				<img src="../resources/images/post/select.png" /><span
					style="color: #339966;">&nbsp;&nbsp;의사 결정하기</span> <img
					src="../resources/images/post/close.png" onclick="close_decide();"
					style="float: right; height: 20px;" /><br>
				<br> <input type="text" id="decisionComment"
					placeholder="의사결정 의견을 입력해 주세요." /><br>
				<br>
				<div id="decideYes" onclick="decideYes();">
					<img src="../resources/images/post/yes.png" class="decideIcon" />
					승인
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="decideNo" onclick="decideNo();" style="color: #888888">
					<img src="../resources/images/post/nooff.png" class="decideIcon" />
					반려
				</div>
				<br>
				<button class="insertButton2" onclick="updateDecision();"
					style="float: right; margin-top: 10px;">결정</button>

			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 의사결정/변경하기 팝업모달 끝 -->
	</div>
</body>
</html>