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
				<!-- 테이블을 이용한 경우 -->
				<table width="300px">
					<!-- 자료실 메뉴 -->
					<tr style="float: right;">
						<td>
							<button type="button" id="library" class="btn btn-success">자료실</button>
						</td>
					</tr>

					<!-- 할 일 -->
					<tr>
						<td>
							<div class="dropdown-divider"></div>
							<h5>할 일</h5>
							<br>

							<div class="btn-group">
								<button type="button" class="btn btn-link dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<img src="../resources/images/icon/checked-allot.png"></img>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-allot.png"></img> 할당된 할
										일</a> <a class="dropdown-item" href="#"><img
										src="../resources/images/icon/play-button.png"></img> 진행중</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/pause.png"></img> 일시중지</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-complete.png"></img> 완료</a>
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
								</div>
							</div> <a href="#">할 일 제목1</a> <a href="#" style="font-size: 80%">할
								일 작성자</a><br>

							<div class="btn-group">
								<button type="button" class="btn btn-link dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<img src="../resources/images/icon/checked-allot.png"></img>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-allot.png"></img> 할당된 할
										일</a> <a class="dropdown-item" href="#"><img
										src="../resources/images/icon/play-button.png"></img> 진행중</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/pause.png"></img> 일시중지</a> <a
										class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-complete.png"></img> 완료</a>
									<a class="dropdown-item" href="#"><img
										src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
								</div>
							</div> <a href="#">할 일 제목2</a> <a href="#" style="font-size: 80%">할
								일 작성자</a><br>
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
			</div>
			<!-- right bar 끝 -->

</body>
</html>