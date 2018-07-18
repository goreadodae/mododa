<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왼쪽 바입니다.</title>
<style>
.leftbar {
	background-color: #F5F5F5;
	position: relative;
	height: 100vh;
}

ul{
	float : right;
	width : 80%;
}

li{
	list-style:none;
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
	margin-right: 10px;
}

.icon{
	margin-right : 5%;
}

.list-title{
	color : #464646;
}

div {
	box-sizing: border-box;
}
</style>

</head>

<body>
	<div class="leftbar">
	<br>
		<ul>
			<li class="list-title">전체 정보</li>
			<li class="list-group-item"><img src="../resources/images/layout-img/lightning.png" class="icon"> 뉴스피드</li>
			<li class="list-group-item"><img src="../resources/images/layout-img/arroba.png"  class="icon"> 호출된 글</li>
			<li class="list-group-item"><img src="../resources/images/layout-img/bookmark.png"  class="icon"> 북마크</li>
			<li class="list-group-item"><img src="../resources/images/layout-img/file.png"  class="icon"> 내가 쓴글</li>
			<li class="list-group-item"><img src="../resources/images/layout-img/calendar.png"  class="icon"> 전체 캘린더</li>
		</ul>

		<br>
		
		
		<ul>
			<li class="list-title">프로젝트</li>
			<li class="list-group-item"><img src="../resources/images/layout-img/plus.png"  class="icon"> 새 프로젝트 만들기</li>
		</ul>

	</div>


</body>
</html>