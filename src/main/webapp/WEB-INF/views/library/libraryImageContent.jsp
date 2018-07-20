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

<body>

<br>
<div class="row" >
	<!-- 본문 -->
	<div class="col-7" id="box">
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 이미지 메뉴 -->
			<table width="100%">
				<tr>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success">내 이미지</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success">전체 이미지</button></td>
					<td width="70%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 이미지 메뉴 끝 -->
				
			<!-- 이미지 내용 -->
			<table border="1">
				<tr>
					<td colspan="3" align="center">
						<img src="/resources/images/test.jpg" style="width:31%;" alt="테스트" class="img-thumbnail">
						<img src="/resources/images/test.jpg" style="width:31%;" alt="테스트" class="img-thumbnail">
						<img src="/resources/images/test.jpg" style="width:31%;" alt="테스트" class="img-thumbnail">
						<img src="/resources/images/test.jpg" style="width:31%;" alt="테스트" class="img-thumbnail">
						<img src="/resources/images/test.jpg" style="width:31%;" alt="테스트" class="img-thumbnail">
						<img src="/resources/images/test.jpg" style="width:31%;" alt="테스트" class="img-thumbnail">
					</td>
				</tr>
			</table>
			<!-- 이미지 내용 끝 -->
		</div>
	</div>
	
	<!-- right bar -->
	<div class="col-4" id="box">
		<table width="300px">
			<!-- 최근에 올린 이미지 -->
			<tr>
				<td>
					<h5>최근에 올린 이미지</h5><br>
					<p>
					<img src="../resources/images/icon/checked-allot.png"></img>
					<a href="#">이미지 제목1</a> <a href="#" style="font-size: 80%">등록일자</a><br>
					</p>
					<p>
					<img src="../resources/images/icon/checked-allot.png"></img>
					<a href="#">이미지 제목2</a> <a href="#" style="font-size: 80%">등록일자</a><br>
					</p>
				</td>
			</tr>
			<!-- 최근에 올린 이미지 끝 -->

			<!-- 최근에 올린 이미지의 더보기 -->
			<tr style="float: right;">
				<td><br> <a href="#" style="font-size: 80%">더보기 ></a></td>
			</tr>
			<!-- 최근에 올린 이미지의 더보기 끝 -->
		</table>
	</div>
	
	<!-- 여백 -->
	<div class="col-1" id="box"></div>
</div>


</body>
</html>