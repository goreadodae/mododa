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

</style>

<body>

<br>
<div class="row" >
	<!-- 본문 -->
	<div class="col-7" id="box">
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 의사결정 메뉴 -->
			<table width="100%">
				<tr>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success">받은 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success">요청한 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success">전체 의사결정</button></td>
					<td width="55%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 의사결정 메뉴 끝 -->
			
			<!-- 의사결정 내용 -->
			<div>
				<table width="100%" height="100px;" border="1">
					<tr>
						<td rowspan="2" width="7%">아이콘</td>
						<td width="70%" colspan="3">의사결정 제목</td>
					</tr>
				
					<tr>
						<td>프로젝트명</td>
						<td>작성자 -> 지목받은 사람</td>
						<td>진행상태</td>
					</tr>
				</table>
			</div>
			<div class="dropdown-divider"></div>
			<!-- 의사결정 내용 끝 -->
			
			
		</div>
	
	</div>
	
	<!-- right bar -->
	<div class="col-4" id="box">
	
	</div>
	
	<!-- 여백 -->
	<div class="col-1" id="box"></div>
</div>


</body>
</html>