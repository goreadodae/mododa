<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[자료실] 할 일</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<style>
body {
	overflow-x: hidden;
	overflow-y: hidden;
	height: 100vh;
}
div {
	margin: 0px;
	padding: 0px;
}

/* 프로필 이미지 */
#profileImg {
	margin-bottom: 3px;
	height: 20px;
	border: 1px solid white;
	border-radius: 100px;
}

/* Modal 내용 */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 60px;
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
		<!-- 자료실 헤더 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/todo.do"><b>할 일</b></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active">
					<a class="nav-link" href="/todo.do">할 일 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/decision.do">의사결정</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/image.do">이미지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/file.do">파일</a>
				</li>
			</ul>
			</div>
		</nav>
		<!-- 자료실 헤더 끝 -->
	
	<!-- 본문 -->
	<div style="padding:10px; top:0;">
		<!-- 할 일 목록 -->
		<div style="height:100%; ">
			<!-- 할 일 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-light btn-sm" onclick="todoCategory(1);">전체 할 일</button></td>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-light btn-sm" onclick="todoCategory(2);">내 할 일</button></td>
					<td width="12%"><button type="button" style="width:99%" class="btn btn-light btn-sm" onclick="todoCategory(3);">요청한 할 일</button></td>
					<td width="58%"></td>
					<td width="10%"><button type="button" style="width:99%;" class="btn btn-outline-secondary btn-sm" onclick="openModal();">할 일 작성</button></td>
				</tr>
			</table>
			<br>
			<!-- 할 일 메뉴 끝 -->
			
			<!-- 할 일 내용 -->
			<div id="todoContainer" style="overflow-y:auto; height:77vh;">
				<div id="todoDiv">
					<table class="table table-hover" style="margin:0;padding:0;">
						<tbody>
						<tr onclick="수정();">
							<td>진행과정</td>
							<td>할일내용</td>
							<td>작성자>할일할자</td>
							<td>프로젝트명</td>
							<td></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 할 일 내용 끝 -->	
			
		</div>
		<!-- 할 일 목록 끝 -->
	</div>
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
	
	
	
	<!-- 할 일 작성 모달 -->
	<div id="todoModal" class="modal">

		<!-- Modal 내용 -->
		<div class="modal-content" style="width:40%;">
			<!-- 닫기 버튼 -->
			<div align="right">
				<img src="../resources/images/post/close.png" onclick="closeModal();" /><br>
			</div>
			
			<h4>할 일 작성</h4>
			<div class="dropdown-divider"></div><br>
			
			<!-- 작성 -->
			<div class="form-group row">
    			<label for="staticEmail" class="col-sm-2 col-form-label">프로젝트</label>
    			<div class="col-sm-10">
      				<select class="form-control" id="selectProject" name="todoProNo" style="width:150px;">
  						<option value="0">프로젝트 선택</option>
  						<option value="${privateNo }">프라이빗 공간</option>
  						<c:forEach items="${listProject }" var="p">
  							<option value="${p.proNo }">${p.proTitle }</option>
  						</c:forEach>
					</select>
    			</div>
  			</div>
  			<div class="form-group row">
    			<label for="inputPassword" class="col-sm-2 col-form-label">할 일</label>
    		<div class="col-sm-10">
      			<input class="form-control" type="text" id="todoTitle" name="todoTitle" placeholder="새 할 일을 입력해주세요">
    		</div>
 	 		</div>
 	 		<div class="form-group row">
    			<label for="inputPassword" class="col-sm-2 col-form-label">할 일 설명</label>
    		<div class="col-sm-10">
      			<textarea class="form-control" aria-label="With textarea" rows="10" id="todoContent"
							style="width:100%; resize:none;" name="todoContent" placeholder="할 일 설명(선택)"></textarea>
    		</div>
 	 		</div>
 	 		<div class="form-group row">
    			<label for="inputPassword" class="col-sm-2 col-form-label">멤버</label>
    		<div class="col-sm-10">
      			<select class="form-control" id="memberList" name="todoMember" style="width:150px;">
					<option value="0">멤버 선택</option>
				</select>
    		</div>
 	 		</div>
 	 		
 	 		<button type="button" class="btn btn-outline-success" onclick="submitTodo();" style="width:100%">저장</button>
				
		</div>
		<!-- Modal 내용 끝 -->
	</div>
	<!-- 팝업모달 끝 -->
	

<!-- 할 일 내용보기 모달 -->
<c:forEach items="${listTodo }" var="t">
	<input type="hidden" id="writerNo_${t.todoNo }" value="${t.todoWriter }" />
	<input type="hidden" id="memberNo_${t.todoNo }" value="${t.todoMember }" />
	<input type="hidden" id="todoProjectMember_${t.todoNo }" value="${t.todoProNo }" />
	<input type="hidden" id="todoPostMember_${t.todoNo }" value="${t.todoPostNo }" />
	
	<div id="todoContentModal_${t.todoNo }" class="modal">

		<!-- Modal 내용 -->
		<div class="modal-content" style="width:40%;">
			<!-- 닫기 버튼 -->
			<div align="right">
				<img src="../resources/images/post/close.png" onclick="closeContentModal(${t.todoNo});" /><br>
			</div>
			
			<h4>할 일 수정</h4>
			<div class="dropdown-divider"></div><br>
			
			<div class="form-group row">
    			<label for="staticEmail" class="col-sm-2 col-form-label">진행사항</label>
    			<div class="col-sm-10">
	      			<div class='btn-group' style="float:left;">
						<c:choose>
							<c:when test="${t.todoProgress.equals('suggest')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_m' src='../resources/images/icon/play-button.png' />
							</c:when>
							<c:when test="${t.todoProgress.equals('working')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_m' src='../resources/images/post/play-buttonOn.png' />
							</c:when>
							<c:when test="${t.todoProgress.equals('stop')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_m' src='../resources/images/post/pauseOn.png' />
							</c:when>
							<c:otherwise>
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_m' src='../resources/images/post/checked.png' />
							</c:otherwise>
						</c:choose>
						<div class='dropdown-menu'>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'suggest');"><img src='../resources/images/icon/play-button.png' />&nbsp;&nbsp;&nbsp;할 일 할당</a>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'working');"><img src='../resources/images/post/play-buttonOn.png' />&nbsp;&nbsp;&nbsp;진행중</a>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'stop');"><img src='../resources/images/post/pauseOn.png' />&nbsp;&nbsp;&nbsp;일시중지</a>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'finish');"><img src='../resources/images/post/checked.png' />&nbsp;&nbsp;&nbsp;완료</a>
						</div>
					</div>
    			</div>
  			</div>

  			<div class="form-group row">
    			<label for="inputPassword" class="col-sm-2 col-form-label">할 일</label>
    		<div class="col-sm-10">
      			<input class="form-control" type="text" style="margin:2px;" id="todoTitle_${t.todoNo }" value="${t.todoTitle }" placeholder="새 할 일을 입력해주세요">
    		</div>
 	 		</div>
 	 		<div class="form-group row">
    			<label for="inputPassword" class="col-sm-2 col-form-label">할 일 설명</label>
    		<div class="col-sm-10">
      			<textarea class="form-control" aria-label="With textarea" rows="10" id="todoContent_${t.todoNo }"
					style="width:100%; resize:none; margin:2px;" placeholder="할 일 설명(선택)">${t.todoContent }</textarea>
    		</div>
 	 		</div>
 	 		<div class="form-group row">
    			<label for="inputPassword" class="col-sm-2 col-form-label">멤버</label>
    		<div class="col-sm-10">
      			<div style="float:left;">
					<select class="form-control" style="width:150px; margin:2px;">
						<option value="0">${t.todoWriterName }</option>
					</select>
				</div>
					
				<div style="float:left;">
				▶
				</div>	
					
				<div style="float:left;">
					<select class="form-control" id="todoMember_${t.todoNo }" style="width:150px; margin:2px;">
						<option value="0">${t.todoMemberName }</option>
					</select>
				</div>
    		</div>
 	 		</div>
 	 		
 	 		<button type="button" class="btn btn-outline-success" onclick="updateTodo(${t.todoNo});">수정</button>
		</div>
	</div>

</c:forEach>	
<!-- 할 일 내용보기 모달 끝 -->	
	
	
	
	
	
	
</div>

</body>

<script>
	var user = <%=((Member)session.getAttribute("member")).getMemberNo()%>;
	//todoCategory(1);
	
	
	/* 프로젝트 선택에 따라 팀원 변경 */
	$("#selectProject").change(function() {
		var proNo = $("#selectProject option:selected").val();
		console.log(proNo);
		
		$.ajax({
			url : "/selectMemberList.do",
			type : "post",
			data : {proNo : proNo},
			success : function(data) {
				$('#memberList').find("option").remove();
				$('#memberList').append("<option value='0'>멤버 선택</option>");
				if(data.length != 0) {
					for(var i=0;i<data.length;i++){
						$('#memberList').append("<option value='"+data[i].memberNo+"'>"+data[i].memberName+"</option>");
					}
				}
				else {
					$('#memberList').append("<option value='"+<%=((Member)session.getAttribute("member")).getMemberNo()%>+"'>나</option>");
				}
				
			},
			error : function(data) { console.log("회원 리스트 불러오기 실패"); }
		});
	});

	$("#memberList").change(function() {
		var memNo = $("#memberList option:selected").val();
		console.log(memNo);
	});

	/* 할 일 작성 모달 열기 */
	function openModal() {
		$('#todoModal').show();
	}

	/* 할 일 작성 모달 닫기 */
	function closeModal() {
		$('#todoModal').hide();
	}

	/* 할 일 분류 */
	/* function todoCategory(num) {
		$.ajax({
			url:"/todoCategory.do",
			type:"POST",
			data:{data : num},
			success : function(data) {
				$("#todoDiv").remove();
				$("#todoContainer").append("<div id='todoDiv'></div>");
				
				var str ="";
				
				if(data.length == 0) {
					str += "<div style='text-align:center;height:100px;'>할 일이 없습니다.</div>";
				}
				
				for(i=0; i<data.length; i++) {
					str += 
						"<div id='todoEach_"+data[i].todoNo+"'><div style='float:left;'><div class='btn-group'>";
					
					if(data[i].todoProgress == 'suggest') {
						str += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='"+data[i].todoNo+"' src='../resources/images/icon/play-button.png' />"; 
					}
					else if(data[i].todoProgress == 'working') {
						str += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='"+data[i].todoNo+"' src='../resources/images/post/play-buttonOn.png' />";
					}
					else if(data[i].todoProgress == 'stop') {
						str += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='"+data[i].todoNo+"' src='../resources/images/post/pauseOn.png' />";
					}
					else {
						str += "<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='"+data[i].todoNo+"' src='../resources/images/post/checked.png' />";
					}
						
					str += 
						"<div class='dropdown-menu'>"
						+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data[i].todoMember + "," + data[i].todoNo + ",'suggest');\"><img src='../resources/images/icon/play-button.png' />&nbsp;&nbsp;&nbsp;할 일 할당</a>"
						+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data[i].todoMember + "," + data[i].todoNo + ",'working');\"><img src='../resources/images/post/play-buttonOn.png' />&nbsp;&nbsp;&nbsp;진행중</a>"
						+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data[i].todoMember + "," + data[i].todoNo + ",'stop'); \"><img src='../resources/images/post/pauseOn.png' />&nbsp;&nbsp;&nbsp;일시중지</a>"
						+ "<a class='dropdown-item' onclick=\"changeProgressTodo(" + data[i].todoMember + "," + data[i].todoNo + ",'finish');\"><img src='../resources/images/post/checked.png' />&nbsp;&nbsp;&nbsp;완료</a>"
						+"</div>"+
						"</div>"+
						data[i].todoTitle +"</div><div align='right' style='padding:10px;'>";
					
					if((user == data[i].todoMember || user == data[i].todoWriter) || (user == data[i].todoMember && user == data[i].todoWriter)) {
						str +=
							"<button type='button' class='btn btn-outline-primary btn-sm' style='margin:1px;' onclick='openContentModal("+data[i].todoNo+")'>자세히 보기</button>"+
							"<button type='button' class='btn btn-outline-danger btn-sm' style='margin:1px;' onclick='deleteTodo("+data[i].todoNo+")'>삭제</button>"
					}
					
					str +=
						"</div>";
						
					if(data[i].todoContent == null) {
						str += "할 일 설명이 없습니다.";	
					}
					else {
						str += data[i].todoContent;
					}
						
					str +=
						"<div style='padding:15px;float:left;font-size:80%;'>"+data[i].todoProjectName+"</div>"+
						"<div style='text-align:right;padding:15px;font-size:80%;'>"+
						"<img id='profileImg' src='../resources/upload/member/" + data[i].todoWriterPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
						data[i].todoWriterName +" ▶ "+ 
						"<img id='profileImg' src='../resources/upload/member/" + data[i].todoMemberPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
						data[i].todoMemberName + "<br></div><div class='dropdown-divider'></div></div>";
				}
				$("#todoDiv").append(str);
			},
			error : function(data) {
				console.log("오류");
			}
		});
	} */
	
	
	
	/* 할 일 작성 */
	function submitTodo() {
		var selectProject = $('#selectProject option:selected').val();
		var memberList = $('#memberList option:selected').val();
		var todoTitle = $('#todoTitle').val();
		var todoContent = $('#todoContent').val();
		
		console.log(selectProject);
		console.log(memberList);
		console.log(todoTitle);
		console.log(todoContent);
		
		if(selectProject == 0) {
			alert("프로젝트를 선택해주세요.");
			return false;
		}
		
		if(memberList == 0) {
			alert("멤버를 선택해주세요.");
			return false;
		}
		
		if(todoTitle == null) {
			alert("내용을 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url:"/insertTodo.do",
			type:"POST",
			data : {
				todoProNo : selectProject,
				todoTitle : todoTitle,
				todoMember : memberList,
				todoContent : todoContent
			},
			success : function(data) {
				$('#successAlertMessage').text('할 일이 추가되었습니다.');
				$('#successAlert').show('slow');
				setTimeout(function () { $('#successAlert').hide('slow');}, 1500);
				
				location.reload();
			},
			error : function(data) {
				$('#failedAlertMessage').text('할 일 추가에 실패하였습니다.');
				$('#failedAlert').show('slow');
				setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);  
			}
		});
		
		return true;
		
	}
	
	
	/* 할 일 수정 모달 열기 */
	function openContentModal(id) {
		$("#todoContentModal_"+id).show();
		
		var todoProNo = $("#todoProjectMember_"+id).val();
		
		console.log(todoProNo);
		
		// 프로젝트 번호에 따라 할일을 하는 사람 불러오기
		if(todoProNo != 0) {
			$.ajax({
				url : "/todoContentMemberPro.do",
				type : "post",
				data : {
					todoProNo : todoProNo
				},
				success : function(data) {
					$('#todoMember_'+id).find("option").remove();
					
					for(var i=0;i<data.length;i++){
						$('#todoMember_'+id).append("<option value='"+data[i].memberNo+"'>"+data[i].memberName+"</option>");
					}
				},
				error : function(data) {
					console.log("회원 불러오기 실패");
				},
				complete : function(data) {
						
				}
			});
		}
		
	}
	
	/* 할 일 내용보기 모달 닫기 */
	function closeContentModal(id) {
		$("#todoContentModal_"+id).hide();
	}
	
	// 할일 진행과정 변경
	function changeProgressTodo(todoMember, todoNo, status) {
		var writerNo = $("#writerNo_"+todoNo).val();
		var memberNo = $("#memberNo_"+todoNo).val();
		
		console.log("user : " + user);
		console.log("writerNo : " + writerNo);
		console.log("memberNo : " + memberNo);
		
		if((user == writerNo || user == memberNo) || (user==writerNo && user == memberNo)) {
			$.ajax({
				url : "/postUpdateTodoProgress.do",
				type : "post",
				data : {
					todoNo : todoNo,
					todoProgress : status
				},
				success : function(data) {
					$('#successAlertMessage').text('할 일 진행과정 변경이 완료되었습니다.');
					$('#successAlert').show('slow');
					setTimeout(function () { $('#successAlert').hide('slow');}, 1500); 
					
					if (status == 'suggest') {
						$('#'+todoNo).attr("src","../resources/images/icon/play-button.png");
						$('#'+todoNo+"_m").attr("src","../resources/images/icon/play-button.png");
					} else {
						if (status == 'suggest') {
							$('#' + todoNo).attr("src","../resources/images/icon/play-button.png");
							$('#' + todoNo+"_m").attr("src","../resources/images/icon/play-button.png");
						} else if (status == 'working') {
							$('#' + todoNo).attr("src","../resources/images/post/play-buttonOn.png");
							$('#' + todoNo+"_m").attr("src","../resources/images/post/play-buttonOn.png");
						} else if (status == 'stop') {
							$('#' + todoNo).attr("src","../resources/images/post/pauseOn.png");
							$('#' + todoNo+"_m").attr("src","../resources/images/post/pauseOn.png");
						} else if (status == 'finish') {
							$('#' + todoNo).attr("src","../resources/images/post/checked.png");
							$('#' + todoNo+"_m").attr("src","../resources/images/post/checked.png");
						}
					}
				},
				error : function(data) {
					$('#failedAlertMessage').text('할 일 진행과정 변경이 실패하였습니다.');
					$('#failedAlert').show('slow');
					setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);   

				},
				complete : function(data) {
					
				}
			});
		}
		else {
			alert("할일 진행과정 변경권한이 없습니다.");
		}
			
	}
	
	// 할 일 수정
	function updateTodo(id) {
		var todoWriter = $("#todoWriter_"+id).val();
		var todoTitle = $("#todoTitle_"+id).val();
		var todoContent = $("#todoContent_"+id).val();
		var todoMember = $("#todoMember_"+id).val();
		
		$.ajax({
			url : "/updateTodo.do",
			type : "post",
			data : {
				todoNo : id,
				todoTitle : todoTitle,
				todoContent : todoContent,
				todoMember : todoMember
			},
			success : function(data) {
				closeContentModal(id);
				todoCategory(1);
				
				$('#successAlertMessage').text('할 일이 수정되었습니다.');
				$('#successAlert').show('slow');
				setTimeout(function () { $('#successAlert').hide('slow');}, 1500);
			},
			error : function(data) {
				$('#failedAlertMessage').text('할 일 수정에 실패하였습니다.');
				$('#failedAlert').show('slow');
				setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);
			},
			complete : function(data) {
					
			}
		});
	}
	
	// 할 일 삭제
	function deleteTodo(id) {
		$.ajax({
			url : "/deleteTodo.do",
			type : "post",
			data : {
				todoNo : id
			},
			success : function(data) {
				$("#todoEach_"+id).remove();
				
				$('#successAlertMessage').text('할 일이 삭제되었습니다.');
				$('#successAlert').show('slow');
				setTimeout(function () { $('#successAlert').hide('slow');}, 1500);
			},
			error : function(data) {
				$('#failedAlertMessage').text('할 일 삭제에 실패하였습니다.');
				$('#failedAlert').show('slow');
				setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);   
			},
			complete : function(data) {
					
			}
		});
	}
	
	
</script>


</html>