<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
/* rightbar */
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

table {
	padding: 20px;
	margin: 20px;
}
#background {
	background-color: #F5F5F5;
	margin: 0px;
	padding: 0px;
}
</style>

<body>

<!-- right bar -->
<div class="col-3" id="background">
	<table width="300px">
	<!-- 자료실 메뉴 -->
		<tr style="float: right;">
			<td>
				<div class="btn-group">
					<button type="button" onclick="library();" class="btn btn-success">자료실</button>
  					<button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    				<span class="sr-only">Toggle Dropdown</span>
  					</button>
  					<div class="dropdown-menu">
    				<a class="dropdown-item" href="/todo.do">할 일</a>
    				<a class="dropdown-item" href="/decision.do">의사결정</a>
    				<a class="dropdown-item" href="/image.do">이미지</a>
    				<a class="dropdown-item" href="/file.do">파일</a>
    				<a class="dropdown-item" href="/link.do">링크</a>
  					</div>
				</div>
							
						
							
			</td>
		</tr>

		<!-- 할 일 -->
		<tr>
			<td>
				<div class="dropdown-divider"></div>
				<h5>할 일</h5>
				<br>

				<div class="btn-group">
					<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="../resources/images/icon/checked-allot.png"></img>
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/checked-allot.png"></img> 할당된 할 일</a> 
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/play-button.png"></img> 진행중</a>
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/pause.png"></img> 일시중지</a> 
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/checked-complete.png"></img> 완료</a>
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
					</div>
				</div> <a href="#">할 일 제목1</a> <a href="#" style="font-size: 80%">할 일 작성자</a><br>

				<div class="btn-group">
					<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="../resources/images/icon/checked-allot.png"></img>
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/checked-allot.png"></img> 할당된 할 일</a> 
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/play-button.png"></img> 진행중</a>
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/pause.png"></img> 일시중지</a> 
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/checked-complete.png"></img> 완료</a>
						<a class="dropdown-item" href="#">
						<img src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
					</div>
				</div> <a href="#">할 일 제목1</a> <a href="#" style="font-size: 80%">할 일 작성자</a><br>
			</td>
		</tr>

		<!-- 할 일의 더보기 -->
		<tr style="float: right;">
			<td><br> <a href="#" style="font-size: 80%">더보기 ></a></td>
		</tr>

		<!-- 의사결정 -->
		<tr>
			<td>
				<div class="dropdown-divider"></div>
				<h5>의사결정</h5>
				<br>
				<p>
					<a href="#"><img src="../resources/images/icon/decision.png"></img>
						의사결정 제목1</a> <a href="#" style="font-size: 80%">의사결정 지목된 사람</a><br>
				</p>
				<p>
					<a href="#"><img src="../resources/images/icon/decision.png"></img>
						의사결정 제목2</a> <a href="#" style="font-size: 80%">의사결정 지목된 사람</a><br>
				</p>
			</td>
		</tr>

		<!-- 의사결정의 더보기 -->
		<tr style="float: right;">
			<td><br> <a href="#" style="font-size: 80%">더보기 ></a></td>
		</tr>


	</table>
	<div class="alert alert-success collapse" role="alert" id="successAlert" style="width: 320px; position: absolute; right:40px; bottom:0px;">
		<img src="../resources/images/icon/checked.png"/><span style="margin: 10px;" id="successAlertMessage"></span>
	</div>
	<div class="alert alert-secondary collapse" role="alert" id="failedAlert" style="width: 320px; position: absolute; right:40px; bottom:0px; background-color: #4A4A4A; color: white;">
		<img src="../resources/images/icon/warning.png"/><span style="margin: 10px;" id="failedAlertMessage"></span>
	</div>
</div>
<!-- right bar 끝 -->

</body>

<script>
	function library() {
		location.href="/todo.do";
	}
</script>

</html>