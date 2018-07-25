<%@page import="kr.pe.mododa.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>

<style>

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
						$('#memberList').append("<option value='"+data[i].memberNo+"'>"+data[i].memberNo+"</option>");
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

	function openModal() {
		$('#todoModal').show();
	}

	function closeModal() {
		$('#todoModal').hide();
	}
</script>

<body>
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
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">전체 할 일</button></td>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">내 할 일</button></td>
					<td width="12%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">요청한 할 일</button></td>
					<td width="68%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 할 일 메뉴 끝 -->
			
			<!-- 할 일 내용 -->
			<div>
				<table border="1" width="100%" height="100px;" style="margin:0; padding:0;">
					<c:forEach items="${listTodo }" var="t">
					<tr>
						<td width="7%">아이콘</td>
						<td width="15%">${t.todoProNo }</td>
						<td width="53%">${t.todoTitle }</td>
						<td width="25%">${t.todoWriter } -> ${t.todoMember }</td>
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
					<td width="36%">
						<select class="form-control" name="todoProNo" style="width:150px;">
  							<option value="0">프라이빗 공간</option>
  							<c:forEach items="${listProject }" var="p">
  								<option value="${p.proNo }">${p.proTitle }</option>
  							</c:forEach>
						</select>
					</td>
					<td width="64%">
						<input type="date" name="todoStartDate"/> ~ <input type="date" name="todoEndDate" />
						
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


</body>
</html>