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
	height: 100%;
}
div {
	margin: 0px;
	padding: 0px;
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
	<table width="100%">
		<tr>
			<td width="20%">
				<h4 id="subject">할 일</h4>
			</td>
			<td width="35%">
			</td>
			<td width="15%"></td>
			<td width="5%">
				<a href="/todo.do" id="todo">할 일</a>
			</td>
			<td width="5%">
				<a href="/decision.do" id="decision">의사결정</a>
			</td>
			<td width="5%">
				<a href="/image.do" id="image">이미지</a>
			</td>
			<td width="5%">
				<a href="/file.do" id="file">파일</a>
			</td>
			<td width="5%">
			</td>
			<td width="5%"></td>
		</tr>
	</table>
	
	<div class="dropdown-divider"></div>
	<!-- 자료실 헤더 끝 -->
	
	<!-- 본문 -->
	<div style="padding:10px; top:0;">
		<!-- 할 일 목록 -->
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 할 일 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="todoCategory(1);">전체 할 일</button></td>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="todoCategory(2);">내 할 일</button></td>
					<td width="12%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="todoCategory(3);">요청한 할 일</button></td>
					<td width="58%"></td>
					<td width="10%"><button type="button" style="width:99%;" class="btn btn-warning btn-sm" onclick="openModal();">할 일 작성</button></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 할 일 메뉴 끝 -->
			
			<!-- 할 일 내용 -->
			<div id="todoContainer">
				<div id="todoDiv">
					<%-- <div id='todoEach' onclick="">
						<div class='btn-group'>
						<c:choose>
							<c:when test="${t.todoProgress.equals('suggest')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }' src='../resources/images/icon/play-button.png' />
							</c:when>
							<c:when test="${t.todoProgress.equals('working')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }' src='../resources/images/post/play-buttonOn.png' />
							</c:when>
							<c:when test="${t.todoProgress.equals('stop')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }' src='../resources/images/post/pauseOn.png' />
							</c:when>
							<c:otherwise>
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }' src='../resources/images/post/checked.png' />
							</c:otherwise>
						</c:choose>
						<div class='dropdown-menu'>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'suggest');"><img src='../resources/images/icon/play-button.png' />&nbsp;&nbsp;&nbsp;할 일 할당</a>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'working');"><img src='../resources/images/post/play-buttonOn.png' />&nbsp;&nbsp;&nbsp;진행중</a>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'stop');"><img src='../resources/images/post/pauseOn.png' />&nbsp;&nbsp;&nbsp;일시중지</a>
						<a class='dropdown-item' onclick="changeProgressTodo(${t.todoMember},${t.todoNo},'finish');"><img src='../resources/images/post/checked.png' />&nbsp;&nbsp;&nbsp;완료</a>
						</div>
					</div>
					${t.todoTitle }
					<br>
					${t.todoProjectName }
					<br>
					${t.todoWriter } ▶  ${t.todoMember }
					</div> --%>
					
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
			
			<h3>할 일 작성</h3>
			
			<!-- 작성 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td>
						<select class="form-control" id="selectProject" name="todoProNo" style="width:150px;">
  							<option value="0">프로젝트 선택</option>
  							<option value="${privateNo }">프라이빗 공간</option>
  							<c:forEach items="${listProject }" var="p">
  								<option value="${p.proNo }">${p.proTitle }</option>
  							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
	
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td colspan="2">
						<input class="form-control" type="text" id="todoTitle" name="todoTitle" placeholder="새 할 일을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="form-control" aria-label="With textarea" rows="10" id="todoContent"
							style="width:100%; resize:none;" name="todoContent" placeholder="할 일 설명(선택)"></textarea>
						
					</td>
				</tr>
				<tr>
					<td width="90%">
						<select class="form-control" id="memberList" name="todoMember" style="width:150px;">
							<option value="0">멤버 선택</option>
						</select>
					</td>
					<td width="10%">
						<button type="submit" class="btn btn-light" onclick="return submitTodo();" style="width:100%">저장</button>
					</td>
				</tr>
			</table>
				
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
			<!-- 할 일 내용  -->
			
			<div>
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
			<div style="float:left; font-size:120%; font-bold:120%;">
				할 일 수정
			</div>
			</div>
			
			<div>
				<div style="float:left; width:100%">
					<input class="form-control" type="text" style="margin:2px;" id="todoTitle_${t.todoNo }" name="todoTitle" value="${t.todoTitle }" placeholder="새 할 일을 입력해주세요">
				</div>
				
				

				<textarea class="form-control" aria-label="With textarea" rows="10" id="todoContent_${t.todoNo }"
					style="width:100%; resize:none; margin:2px;" name="todoContent" placeholder="할 일 설명(선택)">${t.todoContent }</textarea>
				
				<div>
					<div style="float:left;">
						<select class="form-control" name="todoMember" style="width:150px; margin:2px;">
							<option value="0">${t.todoWriterName }</option>
						</select>
					</div>
					
					<div style="float:left;">
					▶
					</div>	
					
					<div style="float:left;">
						<select class="form-control" id="todoMember_${t.todoNo }" name="todoMember" style="width:150px; margin:2px;">
							<option value="0">${t.todoMemberName }</option>
						</select>
					</div>
					
				</div>
				
				<div align="right"><button type="submit" class="btn btn-light" onclick="updateTodo(${t.todoNo});">수정</button></div>
				
			</div>
				
		</div>
		<!-- Modal 내용 끝 -->
	</div>

</c:forEach>	
<!-- 할 일 내용보기 모달 끝 -->	
	
	
	
	
	
	
</div>

</body>

<script>
	var user = <%=((Member)session.getAttribute("member")).getMemberNo()%>;
	todoCategory(1);
	
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
	function todoCategory(num) {
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
						"<div id='todoEach_"+data[i].todoNo+"'><div style='float:left; padding:10px;'><div class='btn-group'>";
					
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
							"<button type='button' class='btn btn-outline-primary btn-sm' style='margin:1px;' onclick='openContentModal("+data[i].todoNo+")'>수정</button>"+
							"<button type='button' class='btn btn-outline-danger btn-sm' style='margin:1px;' onclick='deleteTodo("+data[i].todoNo+")'>삭제</button>"
					}
					
					str +=
						"</div><div style='padding:15px;'>"+
						data[i].todoContent+
						"</div>"+
						"<div style='padding:15px;float:left;font-size:80%;'>"+data[i].todoProjectName+"</div>"+
						"<div style='text-align:right;padding:15px;font-size:80%;'>"+
						data[i].todoWriterName +" ▶ "+ data[i].todoMemberName + "<br></div><div class='dropdown-divider'></div></div>";
				}
				$("#todoDiv").append(str);
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	
	
	/* 할 일 작성 시 주의사항(?) */
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
				alert("할일 작성 완료");
				closeModal();
				todoAll();
				$('#selectProject').append("<option value='0'>프로젝트 선택</option>");
				$('#memberList').append("<option value='0'>멤버 선택</option>");
				$('#todoTitle').val("");
				$('#todoContent').val("");
			},
			error : function(data) {
				console.log("오류");
			}
		});
		
		return true;
		
	}
	
	
	/* 할 일 내용보기 모달 열기 */
	function openContentModal(id) {
		$("#todoContentModal_"+id).show();
		
		var todoPostNo = $("#todoPostMember_"+id).val();
		var todoProNo = $("#todoProjectMember_"+id).val();
		
		console.log(todoPostNo);
		console.log(todoProNo);
		
		// 프로젝트 번호에 따라 할일을 하는 사람 불러오기
		if(todoPostNo != 0 && todoProNo == 0) {
			console.log("test1");
			$.ajax({
				url : "/todoContentMemberPost.do",
				type : "post",
				data : {
					todoPostNo : todoPostNo
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
		else if(todoProNo != 0 && todoPostNo == 0) {
			console.log("test2");
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
					if (data.result < 0) {
						alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
					} else {
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
					}
				},
				error : function(data) {
					console.log("할일 진행과정 변경 실패");
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
				alert("할 일 수정 성공");
				todoAll();
			},
			error : function(data) {
				console.log("할일 수정 실패");
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
				alert("할 일 삭제 성공");
				$("#todoEach_"+id).remove();
			},
			error : function(data) {
				console.log("할일 수정 실패");
			},
			complete : function(data) {
					
			}
		});
	}
	
	
</script>


</html>