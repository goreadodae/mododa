<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	function openModal() {
		$('#todoModal').show();
	}
	
	function closeModal() {
		$('#todoModal').hide();
	}
	
</script>

<body>

<br>

	<!-- 본문 -->
	<div style="padding:10px;">
		<!-- 할 일 작성 -->
		<div style="width:100%; height:150px; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<table width="100%" height="100%" style="margin:0; padding:0;">
				<tr>
					<td>
						<select class="form-control" style="width:150px;">
  							<option value="프라이빗 공간">프라이빗 공간</option>
  							<option value="프로젝트1">프로젝트1</option>
  							<option value="프로젝트2">프로젝트2</option>
						</select>
					</td>
					<td>
						<button type="button" onclick="openModal();" class="btn btn-light" style="width:100%">확장 모드</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="form-control" type="text" placeholder="새 할 일을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td width="90%">
						<select class="form-control" style="width:150px;">
							<option value="" selected>작성자</option>
  							<option value="팀원1">팀원1</option>
  							<option value="팀원2">팀원2</option>
  							<option value="팀원3">팀원3</option>
  							<option value="팀원">팀원4</option>
						</select>
					</td>
					<td width="10%">
						<button type="button" class="btn btn-light" style="width:100%">저장</button>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<!-- 할 일 작성 끝 -->
		
		<!-- 할 일 목록 -->
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 할 일 메뉴 -->
			<table width="100%">
				<tr>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">내 할 일</button></td>
					<td width="12%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">요청한 할 일</button></td>
					<td width="10%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">전체 할 일</button></td>
					<td width="68%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 할 일 메뉴 끝 -->
			
			<!-- 할 일 내용 -->
			<div>
				<table border="1" width="100%" height="100px;" style="margin:0; padding:0;">
					<tr>
						<td width="7%">아이콘</td>
						<td width="15%">프로젝트명</td>
						<td width="53%">할 일 제목</td>
						<td width="25%">작성자->지목된사람</td>
					</tr>
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
		<div class="modal-content" style="width: 60%; ">
			<!-- 닫기 버튼 -->
			<div align="right">
				<img src="../resources/images/post/close.png" onclick="closeModal();" /><br>
			</div>
			
			<!-- 작성 -->
			<table width="100%">
				<tr>
					<td>
						<select class="form-control" style="width:150px;">
  							<option value="프라이빗 공간">프라이빗 공간</option>
  							<option value="프로젝트1">프로젝트1</option>
  							<option value="프로젝트2">프로젝트2</option>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="form-control" type="text" placeholder="새 할 일을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="form-control" aria-label="With textarea" rows="10"
							style="width:100%; resize:none;" placeholder="할 일 설명(선택)"></textarea>
						
					</td>
				</tr>
				<tr>
					<td width="90%">
						<select class="form-control" style="width:150px;">
							<option value="" selected>작성자</option>
  							<option value="팀원1">팀원1</option>
  							<option value="팀원2">팀원2</option>
  							<option value="팀원3">팀원3</option>
  							<option value="팀원">팀원4</option>
						</select>
					</td>
					<td width="10%">
						<button type="button" class="btn btn-light" style="width:100%">저장</button>
					</td>
				</tr>
			</table>
				
		</div>
		<!-- Modal 내용 끝 -->
	</div>
	<!-- 팝업모달 끝 -->
	
	
	
</div>


</body>
</html>