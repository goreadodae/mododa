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
		<!-- 할 일 작성 -->
		<div>
			할 일 작성
		</div>
	
		<!-- 할 일 목록 -->
		<div>
			할 일 목록
		</div>
	
	</div>
	
	<!-- right bar -->
	<div class="col-4" id="box">
		<table width="300px">
			<!-- 마감이 임박한 내 할 일 -->
			<tr>
				<td>
					<h5>마감이 임박한 내 할 일</h5><br>
					<p>
					<img src="../resources/images/icon/checked-allot.png"></img>
					<a href="#">할 일 제목1</a> <a href="#" style="font-size: 80%">할 일 작성자</a><br>
					</p>
					<p>
					<img src="../resources/images/icon/checked-allot.png"></img>
					<a href="#">할 일 제목2</a> <a href="#" style="font-size: 80%">할 일 작성자</a><br>
					</p>
					</td>
			</tr>

			<!-- 마감이 임박한 내 할 일의 더보기 -->
			<tr style="float: right;">
				<td><br> <a href="#" style="font-size: 80%">더보기 ></a></td>
			</tr>

			<!-- 오래된 요청한 할 일 -->
			<tr>
				<td>
					<div class="dropdown-divider"></div>
					<h5>오래된 요청한 할 일</h5>
					<br>
					<p>
					<a href="#"><img src="../resources/images/icon/checked-allot.png"></img>
					할 일 제목3</a> <a href="#" style="font-size: 80%">할 일 작성자</a><br>
					</p>
					<p>
					<a href="#"><img src="../resources/images/icon/checked-allot.png"></img>
					할 일 제목4</a> <a href="#" style="font-size: 80%">할 일 작성자</a><br>
					</p>
				</td>
			</tr>

			<!-- 오래된 요청한 할 일의 더보기 -->
			<tr style="float: right;">
				<td><br> <a href="#" style="font-size: 80%">더보기 ></a></td>
			</tr>


		</table>
	</div>
	
	<!-- 여백 -->
	<div class="col-1" id="box"></div>
</div>


</body>
</html>