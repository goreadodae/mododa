<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
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
				<select class="form-control" style="width:150px;">
  					<option value="전체 프로젝트" selected>전체 프로젝트</option>
  					<option value="프라이빗 공간">프라이빗 공간</option>
  					<c:forEach items="${listProject }" var="p">
  						<option value="${p.proNo }">${p.proTitle }</option>
  					</c:forEach>
				</select>
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
				<a href="/link.do" id="link">링크</a>
			</td>
			<td width="5%"></td>
		</tr>
	</table>
	
	<div class="dropdown-divider"></div>
	<!-- 자료실 헤더 끝 -->
	
	<!-- 본문 -->
	<div style="padding:10px; top:0;">
		<!-- 할 일 작성 -->
		<div style="width:100%; height:150px; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<form action="/insertTodo.do" method="post">
			<table width="100%" height="100%" style="margin:0; padding:0;">
				<tr>
					<td>
						<select class="form-control" id="selectProject" name="todoProNo" style="width:150px;">
  							<option value="">프로젝트 선택</option>
  							<option value="0">프라이빗 공간</option>
  							<c:forEach items="${listProject }" var="p">
  								<option value="${p.proNo }">${p.proTitle }</option>
  							</c:forEach>
						</select>
					</td>
					<td>
						<button type="button" onclick="openModal();" class="btn btn-light" style="width:100%">확장 모드</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="form-control" type="text" name="todoTitle" placeholder="새 할 일을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td width="90%">
						<select class="form-control" id="memberList" name="todoMember" style="width:150px;">
						</select>
					</td>
					<td width="10%">
						<button type="submit" class="btn btn-light" style="width:100%">저장</button>
					</td>
				</tr>
			</table>
			</form>
		</div>
		<br>
		<!-- 할 일 작성 끝 -->
		
		<!-- 할 일 목록 -->
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 할 일 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="todoAll();">전체 할 일</button></td>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="todoMe();">내 할 일</button></td>
					<td width="12%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="todoRequest();">요청한 할 일</button></td>
					<td width="68%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 할 일 메뉴 끝 -->
			
			<!-- 할 일 내용 -->
			<div id="todoTableContainer">
				<table border="1" id="todoTable" width="100%" height="100px;" style="margin:0; padding:0;">
					<c:forEach items="${listTodo }" var="t">
					<tr>
						<td width="7%">아이콘</td>
						<td width="15%">${t.todoProjectName }</td>
						<td width="53%">${t.todoTitle }</td>
						<td width="25%">${t.todoWriterName } -> ${t.todoMemberName }</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="dropdown-divider"></div>
			<!-- 할 일 내용 끝 -->
			
			
			
		</div>
		<!-- 할 일 목록 끝 -->
	</div>
	
	
	
	
	
	<!-- 할 일 작성 모달 -->
	<div id="todoModal" class="modal">

		<!-- Modal 내용 -->
		<div class="modal-content" style="width:40%;">
			<!-- 닫기 버튼 -->
			<div align="right">
				<img src="../resources/images/post/close.png" onclick="closeModal();" /><br>
			</div>
			
			<!-- 작성 -->
			<form action="/insertTodo" method="post">
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td>
						<select class="form-control" name="todoProNo" style="width:150px;">
  							<option value="0">프라이빗 공간</option>
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
						<input class="form-control" type="text" name="todoTitle" placeholder="새 할 일을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="form-control" aria-label="With textarea" rows="10"
							style="width:100%; resize:none;" name="todoContent" placeholder="할 일 설명(선택)"></textarea>
						
					</td>
				</tr>
				<tr>
					<td width="90%">
						<select class="form-control" id="memberList" name="todoMember" style="width:150px;">
						</select>
					</td>
					<td width="10%">
						<button type="submit" class="btn btn-light" style="width:100%">저장</button>
					</td>
				</tr>
			</table>
			</form>
				
		</div>
		<!-- Modal 내용 끝 -->
	</div>
	<!-- 팝업모달 끝 -->
	
	
	
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>

</body>

<script type="text/javascript">
	/* 프로젝트 선택에 따라 팀원 변경 */
	$("#selectProject").change(function() {
		var proNo = $("#selectProject option:selected").val();
		console.log(proNo);
		
		if(proNo >= 1) {
			$.ajax({
				url : "/selectMemberList.do",
				type : "post",
				data : {proNo : proNo},
				success : function(data) {
					$('#memberList').find("option").remove();
					$('#memberList').append("<option value=''>할 사람 선택</option>");
					for(var i=0;i<data.length;i++){
						$('#memberList').append("<option value='"+data[i].memberNo+"'>"+data[i].memberName+"</option>");
					}
				},
				error : function(data) { console.log("회원 리스트 불러오기 실패"); }
			});
		}
		else {
			$('#memberList').find("option").remove();
			$('#memberList').append("<option value='" + <%=((Member)session.getAttribute("member")).getMemberNo()%> + "'>나</option>");
		}
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
	
	/* 전체 할 일 눌렀을 때 */
	function todoAll() {
		$.ajax({
			url:"/listTodoAll.do",
			type:"POST",
			success : function(data) {
				$("#todoTable").remove();
				$("#todoTableContainer").append("<table border='1' id='todoTable' width='100%' height='100px' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#todoTable").append(
							"<tr>" + 
							"<td width='7%'>아이콘</td>" +
							"<td width='15%'>"+data[i].todoProjectName+"</td>" +
							"<td width='15%'>"+data[i].todoTitle+"</td>" +
							"<td width='15%'>"+data[i].todoWriterName+"->"+data[i].todoMemberName+"</td>"
					);
				}
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	/* 내 할 일 눌렀을 때 */
	function todoMe() {
		$.ajax({
			url:"/listTodoMe.do",
			type:"POST",
			success : function(data) {
				$("#todoTable").remove();
				$("#todoTableContainer").append("<table border='1' id='todoTable' width='100%' height='100px' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#todoTable").append(
							"<tr>" + 
							"<td width='7%'>아이콘</td>" +
							"<td width='15%'>"+data[i].todoProjectName+"</td>" +
							"<td width='15%'>"+data[i].todoTitle+"</td>" +
							"<td width='15%'>"+data[i].todoWriterName+"->"+data[i].todoMemberName+"</td>"
					);
				}
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	/* 요청한 할 일 눌렀을 때 */
	function todoRequest() {
		$.ajax({
			url:"/listTodoRequest.do",
			type:"POST",
			success : function(data) {
				$("#todoTable").remove();
				$("#todoTableContainer").append("<table border='1' id='todoTable' width='100%' height='100px' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#todoTable").append(
							"<tr>" + 
							"<td width='7%'>아이콘</td>" +
							"<td width='15%'>"+data[i].todoProjectName+"</td>" +
							"<td width='15%'>"+data[i].todoTitle+"</td>" +
							"<td width='15%'>"+data[i].todoWriterName+"->"+data[i].todoMemberName+"</td>"
					);
				}
			},
			error : function(data) {
				console.log("오류");
			}
		});
		
	}
	
</script>


</html>