<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.modal-schedule {
	background-color: #fefefe;
	margin: 17% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 60px;
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

/* 내용 제목 */
.contents-title {
	color: #282828;
}

.content-box {
	width: 120px;
	height: 80px;
	border: 1px solid #d2d2d2;
	background-color: #F5F5F5;
	text-align: center;
	margin-right : 0px;
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

/* 일정 등록 */
#sheduleTitle {
	width: 100%;
	height: 50px;
	align: center;
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
</style>


<script type="text/javascript">
	//게시글 불러옴
	function getPost(postNo) {
		$.ajax({
			url : "/viewPost.do",
			type : "post",
			data : {
				postNo : postNo
			},
			success : function(data) {
				if (data.post != null) {
					$('#post-title').html(data.post.postTitle);
					$('#post-content').html(data.post.postContent);
					$('#post-date').html(data.post.postDate);
					
					
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

	//일정 추가
	function inputSchedule() {
		var scTitle = $('#scTitle').val();
		var scStartDate = $('#scStartDate').val();
		var scEndDate = $('#scEndDate').val();

		$.ajax({
			url : "/insertSchedule.do",
			type : "post",
			data : {
				scTitle : scTitle,
				startDate : scStartDate,
				endDate : scEndDate
			},
			success : function(data) {
				console.log("성공");
				$('#appendforSchedule').append("<div class='content-box'><span id='scheduleStartDate'>scStartDate</span></div>");
			},
			error : function(data) {
				console.log("실패");
			},
			complete : function(data) {
				close_schedule();
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



</script>
</head>

<body>
	<div>
		<!-- contents -->
		<div class="col-6">
			★ 내용은 여기다가~!!!★
			<button onclick="getPost(4);">여기 누르면 모달 팝업 뜸</button>
		</div>

		<!-- 팝업모달 -->
		<div id="myModal" class="modal">

			<!-- Modal 내용 -->
			<div class="modal-content" style="width: 60%; height: 80%;">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-11"></div>
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

						<span id="post-title">글제목</span><br>
						<hr>
						<span id="post-content">글내용</span> <br> <span id="post-date">작성날짜</span>
						<span id="like-count"><img
							src="../resources/images/post/like.png" id="like-icon" /> 좋아요 3개</span>

						<hr>
						<span class="contents-title">할 일 0</span> <br><br>
						<input type="text" placeholder="새 할 일을 입력해 주세요." style="width:250px;" /> ▶ 
						

						<hr>
						<div id="appendforSchedule">
							<span class="contents-title">일정</span><br>
							<div class="content-box" onclick="open_scheduleModal();">
								<img src="../resources/images/post/add.png" id="add-icon" />
							</div>
							
							<div class="content-box">
								<span id="scheduleStartDate">시작날짜</span>
								<span>끝날짜</span>
								<span >일정제목</span>
							</div>
						</div>
						<br>

						<hr>
						<span class="contents-title">파일/이미지 0</span><br>
						<div class="content-box" onclick="document.all.imgFile.click();">
							<input id="imgFile" name="imgFile" multiple="multiple" type="file" style="display: none" onchange="readURL(this);" /> 
							<img src="../resources/images/post/add.png" id="add-icon"/>
						</div>
						


						<br>

						<hr>
						<span class="contents-title">의사결정 0</span>
						<div class="content-box">
							<img src="../resources/images/post/add.png" id="add-icon" />
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
			<div class="modal-schedule" style="width: 25%; height: 30%;">
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
			<div class="modal-schedule" style="width: 25%; height: 30%;">
			
			</div>
		</div>
		<!-- 이미지 팝업모달 끝 -->

	</div>
</body>
</html>