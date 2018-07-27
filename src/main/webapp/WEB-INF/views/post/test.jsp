<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script src="https://code.jquery.com/jquery-latest.js"></script>
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Myeongjo" rel="stylesheet">

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

.modal-input {
	background-color: #fefefe;
	margin: 17% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 60px;
}

#modal-decision{
	background-color: #fefefe;
	margin: 17% auto; /* 15% from the top and centered */
	padding: 25px;
	border: 1px solid #888;
	width: 60px;
	border-radius: 5px;
	width: 550px;
	height:230px;
}

#modal-close {
	width: 20px;
	float: right;
}

#post-title {
	font-size: 30px;
}

/* 댓글 */
#comment {
	background-color: #F5F5F5;
}

#like-count {
	float: right;
	font-size: 13px;
	color: #707070;
}

#like-icon {
	height: 15px;
}

/* 프로젝트 이름 */
#viewProjectTitle{
	color : #339966;
}

/* 내용 제목 */
.contents-title {
	color: #282828;
	font-family: 'Jua', sans-serif;
	font-size : 20px;
}

.content-box {
	width: 120px;
	height: 80px;
	border: 1px solid #d2d2d2;
	background-color: #F5F5F5;
	text-align: center;
	margin-right : 10px;
	margin-left : 0px;
	margin-top: 10px;
	margin-bottom: 10px;
	display: inline-table;
	
}

#add-icon {
	height: 30px;
	position: relative;
	top: 25px;
}


/* 일정 */
.scheduleDate{
	font-size : 15px;
	color : #464646;
}

#scheduleTitle{
	font-size : 30px;
}

.scheduleList{
	
	padding : 5px;
}

.insertButton{
	background-color: #339966;
	color: #F8FAFF;
	height: 25px;
	width: 100px;
	border: 0px;
	cursor: pointer;
	border-radius: 30px;
	font-size : 15px;
}

/* 일정 등록 */
#sheduleTitle {
	width: 100%;
	height: 50px;
	align: center;
}

/* 의사결정 등록 */
#decisionContent{
	width : 100%;
	height : 50px;
}

.memberIdForDecision{
	font-weight:bold;
}

#decisionWait{
	background-color : #aaaaaa;
	color : white;
	width : 50px;
	text-align : center;
	border-radius: 20px;
	margin : 0px;
	display : inline-block;
}

#decisionApproval{
	background-color : #64CD3C;
	color : white;
	width : 50px;
	text-align : center;
	border-radius: 20px;
	margin : 0px;
	display : inline-block;
}

#decisionCancel{
	background-color : #64CD3C;
	color : white;
	width : 50px;
	text-align : center;
	border-radius: 20px;
	margin : 0px;
	display : inline-block;
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

.insertButton2 {
	background-color: #339966;
	color: #F8FAFF;
	width: 80px;
	border: 0px;
	cursor: pointer;
	padding : 5px;
	border-radius: 30px;
}
</style>


<script type="text/javascript">
	var postNo=0;
	
	//게시글 불러옴
	function getPost(postNumber) {
		postNo = postNumber; //게시글 번호
		
		//count
		var countSchedule = 0;
		var countTodo = 0;
		$.ajax({
			url : "/viewPost.do",
			type : "post",
			data : {
				postNo : postNo
			},
			success : function(data) {
				if (data.post != null) {
					//프로젝트 이름과 게시글 제목,내용들
					$('#viewProjectTitle').html(data.project.proTitle);
					$('#post-title').html(data.post.postTitle);
					$('#post-content').html(data.post.postContent);
					$('#post-date').html(data.post.postDate);
					
					
					//일정 목록 불러오기
					var strSchedule="";
					$('#appendforSchedule').html(strSchedule);
					for(var i=0; i<data.schedule.length; i++){
						countSchedule++;
						
						strSchedule += "<div class='scheduleList'>" + 
						"<img src='../resources/images/post/calendar.png' />"+
						"<span class='scheduleDate'>&nbsp;&nbsp;" + data.schedule[i].startDate + " ~ " + data.schedule[i].endDate + "&nbsp;&nbsp; : &nbsp;&nbsp;" + data.schedule[i].scTitle +"</span>" +
						"</div>";
			
						$('#appendforSchedule').html(strSchedule);
					}
					$('#countSchedule').html(countSchedule);
					
					//할일 불러오기
					var strTodo="";
					$('#appendforTodo').html(strTodo);
					for(var i=0; i<data.todo.length; i++){
						countTodo++;
						strTodo += "" + data.todo[i].todoContent + "&nbsp;&nbsp;▶&nbsp;&nbsp;<img src=" + data.todo[i].todoMemberPicture + " /> " + data.todo[i].todoMember + "<br>";
					}
					$('#appendforTodo').html(strTodo);
					$('#countTodo').html(countTodo);
					
					//게시글 프로젝트의 멤버들
					$('#selectMember').html("");
					$('#selectMemberForDecision').html("");
					for(var i=0; i<data.member.length; i++){
						var strMember = "<option value='" + data.member[i].memberNo + "'>" + data.member[i].memberName + "</option>";
						$('#selectMember').append(strMember);
						$('#selectMemberForDecision').append(strMember);
					}
					
					//의사결정 불렁오기
					
					
				} else {
					$('#post-title').html('db에 글이 없음');
				}

				open_pop();
			},
			error : function(data) {
				console.log("실패");
			}
		});
	};

	//팝업 open 기능
	function open_pop(flag) {
		$('#myModal').show();
	};

	//팝업 Close 기능
	function close_pop(flag) {
		$('#myModal').hide();
	};

	//일정 모달 open
	function open_scheduleModal(flag) {
		document.getElementById('scStartDate').valueAsDate = new Date();
		document.getElementById('scEndDate').valueAsDate = new Date();
		$('#scheduleModal').show();
	}

	//일정 모달 close
	function close_schedule(flag) {
		$('#scheduleModal').hide();
	};
	
	//의사결정 모달 open
	function open_decision(flag){
		$('#decisionModal').show();
	}
	
	//의사결정 모달 close
	function close_decision(flag) {
		$('#decisionModal').hide();
	};
	
	//할일 추가
	function inputTodo(){
		var todoContent = $('#newTodoContent').val();
		var todoMember = $('#selectMember').val();
		if(todoContent==""){
			alert("할 일 내용을 입력해주세요.");
		}
		else if(todoMember==null){
			alert("담당자를 선택해주세요.");
		}
		else{
		$.ajax({
			url : "/postInsertTodo.do",
			type : "post",
			data : {
				postNo : postNo,
				todoContent : todoContent,
				todoMember : todoMember
			},
			success : function(data) {
				if(data.result<0){ //로그인 세션이 null일때
					console.log("insert실패");
					alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
				}
				else{
					var str = "" + todoContent + "&nbsp;&nbsp;▶&nbsp;&nbsp;<img src=" + data.todoMember.memberPicture + " /> " + data.todoMember.memberName +"<br>";
					
					$('#appendforTodo').append(str);
					
					$('#countTodo').html(Number($('#countTodo').html())+1);
				}
			},
			error : function(data) {
				console.log("실패");
			},
			complete : function(data) {
				$('#newTodoContent').val("");
				close_schedule();
			}
		});
		}
	};

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
				if(data.result<0){
					alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
				}
				else{
					var str = "<div class='scheduleList'>" + 
					"<img src='../resources/images/post/calendar.png'/>"+
					"<span class='scheduleDate'>&nbsp;&nbsp;" + scStartDate + " ~ " + scEndDate + "&nbsp;&nbsp; : &nbsp;&nbsp;" + scTitle +"</span>" +
					"</div>";
		
					$('#appendforSchedule').append(str);
					
					$('#countSchedule').html(Number($('#countSchedule').html())+1);
				}
			},
			error : function(data) {
				console.log("실패");
			},
			complete : function(data) {
				close_decision();
			}
		});
	};
	
	
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
	function inputDecision(){
		var dcMaker = $('#selectMemberForDecision').val();
		var dcContent = $('#decisionContent').val();

		$.ajax({
			url : "/postInsertDecision.do",
			type : "post",
			data : {
				postNo :postNo,
				dcMaker : dcMaker,
				dcContent : dcContent
			},
			success : function(data) {
				if(data.result<0){
					alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
				}
				else{
					var str = "<span class='memberIdForDecision'>" + data.writerMem.memberName + "</span>님의 요청 : " + dcContent + "<br>" +
							"<div id='decisionWait'>대기</div> <span class='memberIdForDecision'>" + data.makerMem.memberName + "</span>님의 결정 기다리는 중";
		
					$('#appendforDecision').html(str);
					$('#countDecision').html(1);
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



</script>
</head>

<body>
	<div>
		<!-- 팝업모달 -->
		<div id="myModal" class="modal">

			<!-- Modal 내용 -->
			<div class="modal-content" style="width: 60%; height: 80%;">
				<div class="row" style="margin-left: 10px; margin-bottom: 20px;">
					<div class="col-11" id="viewProjectTitle">게시글의 프로젝트 명</div>
					<div class="col-1">
						<img src="../resources/images/post/close.png" id="modal-close"
							onclick="close_pop();" />
					</div>
				</div>

				<div class="row">
					<!-- left side -->
					<div class="col-7" style="overflow-y: scroll; padding-left: 30px;">
						<div class="btn-group">
							<button type="button" class="btn btn-link dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<img src="../resources/images/post/lightbulb.png" />
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#"><img
									src="../resources/images/post/lightbulb.png" /> 발의된 이슈</a> <a
									class="dropdown-item" href="#"><img
									src="../resources/images/icon/play-button.png" /> 진행중</a> <a
									class="dropdown-item" href="#"><img
									src="../resources/images/icon/pause.png" /> 일시중지</a> <a
									class="dropdown-item" href="#"><img
									src="../resources/images/icon/checked-allot.png" /> 완료</a>
							</div>
						</div>

						<span id="post-title">글 제목</span><br>
						<hr>
						<div style="margin-left : 15px; margin-right : 10px;">
						<span id="post-content">글내용</span> <br><br>
						<span id="post-date">작성날짜</span>
						<span id="like-count"><img src="../resources/images/post/like.png" id="like-icon" /> 좋아요 3개</span><br>
						</div>

						<hr>
						<span class="contents-title">할 일 &nbsp;<span id="countTodo">0</span></span> <br>
						
						<div style="margin : 5px; font-size : 13px;">
						<div style="border: 1px solid #CFF09E; margin-bottom:10px; padding:10px; border-radius: 20px;">
						<input type="text" id="newTodoContent" placeholder="새 할 일을 입력해 주세요." style="width:220px; border: 0px;" /> ▶  
						담당자 선택 <select id="selectMember" name="담당자 선택"></select>
						<button class="insertButton" onclick="inputTodo();" style="float:right;">+ 할일추가</button>
						</div>
						
						<div id="appendforTodo"></div>
						</div><br>

						<hr>
						<div>
							<span class="contents-title">일정 &nbsp;<span id="countSchedule">0</span></span>
							&nbsp;&nbsp;&nbsp;<button class="insertButton" onclick="open_scheduleModal();" style="float:right;">+ 일정추가</button>
							<div id="appendforSchedule"></div><br>
						</div>
						

						<hr>
						<span class="contents-title">파일/이미지 0</span><br>
						<div class="content-box" onclick="document.all.imgFile.click();">
							<input id="imgFile" name="imgFile" multiple="multiple" type="file" style="display: none" onchange="readURL(this);" /> 
							<img src="../resources/images/post/add.png" id="add-icon"/>
						</div>
						


						<br>

						<hr>
						<span class="contents-title">의사결정 &nbsp;<span id="countDecision">0</span></span><br>
						<div id="appendforDecision">
						<div class="content-box" onclick="open_decision();">
							<img src="../resources/images/post/add.png" id="add-icon" />
						</div>
						<br>
						
						</div>
						
						<br>
					</div>

					<!-- right side -->
					<div class="col-5" id="comment">댓글창</div>
				</div>
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 팝업모달 끝 -->

		

		<!-- 일정 팝업모달 -->
		<div id="scheduleModal" class="modal">
			<!-- Modal 내용 -->
			<div class="modal-input" style="width: 25%; height: 30%;">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-11"></div>
					<div class="col-1">
						<img src="../resources/images/post/close.png" id="modal-close"
							onclick="close_schedule();" />
					</div>
				</div>

				<div class="row" id="scheduleInfo">
					<div class="col-1"></div>
					<div class="col-10">
						<input type="text" id="scTitle" placeholder="일정 제목을 입력해주세요." /><br>
						<br> <input type="date" id='scStartDate' /> ~ <input
							type="date" id='scEndDate' /><br>
						<br>
						<br>
						<center>
							<button id="greenButton" onclick="inputSchedule();">저장</button>
						</center>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 일정 팝업모달 끝 -->
		
		
		<!-- 이미지 팝업모달 -->
		<div id="scheduleModal" class="modal">
			<!-- Modal 내용 -->
			<div class="modal-input" style="width: 25%; height: 30%;">
			
			</div>
		</div>
		<!-- 이미지 팝업모달 끝 -->
		
		<!-- 의사결정 팝업모달 시작 -->
		<div id="decisionModal" class="modal">
			<!-- Modal 내용 -->
			<div id="modal-decision">
			<img src="../resources/images/post/select.png" /><span style="color :#339966; ">&nbsp;&nbsp;의사결정 요청</span>
			<img src="../resources/images/post/close.png" onclick="close_decision();" style="float:right; height : 20px;"/><br><br>
				<input type="text" id="decisionContent" placeholder="결정을 요청할 내용을 입력해 주세요."/><br><br>
				
				결정자 선택&nbsp;&nbsp;<select id="selectMemberForDecision"></select><br>
				<button class="insertButton2" onclick="inputDecision();" style="float:right;">요청</button>
			
			</div>
			<!-- Modal 내용 끝 -->
		</div>
		<!-- 의사결정 팝업모달 끝 -->
	</div>
</body>
</html>