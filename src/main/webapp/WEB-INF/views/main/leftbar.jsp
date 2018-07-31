<%@page import="kr.pe.mododa.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Leftbar</title>
</head>

<style>

/* leftbar */
.leftbar {
	background-color: #F5F5F5;
	position: relative;
	height: auto;
}

ul {
	float: right;
	width: 80%;
}

li {
	list-style: none;
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
	margin-right: 10px;
}

.icon {
	margin-right: 5%;
	height: 23px;
	width: 23px;
}

.list-title {
	color: #464646;
}

div {
	box-sizing: border-box;
}

/* 지은 스타일 추가 */
.proIcon {
	margin-right: 5%;
	height: 23px;
	width: 23px;
}

.subIcon {
	height: 18px;
	width: 18px;
	margin-right: 5%;
	margin-left: 15%;
}

.privateSub {
	display: none;
	overflow: hidden;
	position: relative;
	margin-bottom: -1px;
	border: 1px solid #ddd;
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}

.privateSub a {
	padding: 0;
}

li[id^="sub_"] {
	display: none;
	padding: 0;
	background-color: #F5F5F5;
}


/* 예진 캘린더 부분 */
li[id^="subC_"] {
	display: none;
	padding: 0;
	background-color: #F5F5F5;
}

/* 예진 캘린더 부분 끝 */

li[id^="sub_"] a {
	padding: 0;
}

.list-group-item {
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}
</style>

<script>

/* 해당하는 컨트롤러주소(.do)를 적어주시면 됩니다~ */
	jQuery(function($) {
		
		$("#newsfeed").click(function() {
			location.href="";
		});

		$("#callpost").click(function() {
			location.href="";
		});

		$("#bookmark").click(function() {
			location.href="";
		});

		$("#project").click(function() {
			location.href="";
		});

		$("#library").click(function() {
			location.href="";
		});
		
		/* 예진 사용 시작  */

		$("#calendarAll").click(function() {
			location.href="/calendar.do";
		/* });
		
		$(".projectMain").click(function() { */
			var proNo = $(this).attr('value');
			var displayValue = $('li[id^="sub_' + proNo + '"]').css('display');
			if (displayValue == 'none') {
				$(".privateSub").hide();/* 열렸던 창 닫기 */
				$('li[id^="sub_' + beforeShow + '"]').hide();/* 열렸던 창 닫기 */
				$('li[id^="sub_' + proNo + '"]').show();
				beforeShow = proNo;/* 열렸던 창 닫기 */ 
			} else {
				$('li[id^="sub_' + proNo + '"]').hide();
			}
		});
		
		/* 예진 사용 끝  */
		
		/* 지은 사용 시작 */
		// 프로젝트 생성
		$("#createProject").click(function() {
			location.href="/gotoCreateProject.do";
		});

		var beforeShow = 0; /* 열렸던 창을 닫기 위한 변수 */
		
		// 프라이빗 공간
		$("#privateMain").click(function() {
			var displayValue = $(".privateSub").css('display');
			if (displayValue == 'none') {
				$('li[id^="sub_' + beforeShow + '"]').hide();/* 열렸던 창 닫기 */
				$(".privateSub").show();
			} else {
				$('li[id^="sub_' + beforeShow + '"]').hide();/* 열렸던 창 닫기 */
				$(".privateSub").hide();
			}
		});

		// 프라이빗 하위 메뉴 
		$(".priPost").click(function() {
			var proNo = $(this).attr('value');
			location.href="/privatePost.do?proNo=" + proNo;
		});

		$(".priHashTag").click(function() {
			var proNo = $(this).attr('value');
			location.href="/privateHashTag.do?proNo=" + proNo;
		});

		// 프로젝트 목록
		$(".projectMain").click(function() {
			var proNo = $(this).attr('value');
			var displayValue = $('li[id^="sub_' + proNo + '"]').css('display');
			if (displayValue == 'none') {
				$(".privateSub").hide();/* 열렸던 창 닫기 */
				$('li[id^="sub_' + beforeShow + '"]').hide();/* 열렸던 창 닫기 */
				$('li[id^="sub_' + proNo + '"]').show();
				beforeShow = proNo;/* 열렸던 창 닫기 */
			} else {
				$('li[id^="sub_' + proNo + '"]').hide();
			}
		});

		// 프로젝트 하위 메뉴
		$(".proPost").click(function() {
			var proNo = $(this).attr('value');
			location.href="/projectPost.do?proNo=" + proNo;
		});

		$(".proHashTag").click(function() {
			var proNo = $(this).attr('value');
			location.href="/projectHashTag.do?proNo=" + proNo;
		});

		$(".proProgress").click(function() {
			var proNo = $(this).attr('value');
			location.href="";
		});

		$(".proMyPost").click(function() {
			var proNo = $(this).attr('value');
			location.href="/projectMyPost.do?proNo=" + proNo;
		});

		$(".proCalendar").click(function() {
			location.href="";
		});
		/* 지은 사용 끝 */

	});
</script>


<body>

	<!-- left bar -->
	<div class="col-3" id="background">
		<div class="leftbar">
			<br>
			<ul>
				<li class="list-title">전체 정보</li>
				<li class="list-group-item" id="newsfeed">
					<img src="../resources/images/layout-img/lightning.png" class="icon"> 뉴스피드</li>
				<li class="list-group-item" id="callpost">
					<img src="../resources/images/layout-img/arroba.png" class="icon"> 호출된 글</li>
				<li class="list-group-item" id="bookmark">
					<img src="../resources/images/layout-img/bookmark.png" class="icon"> 북마크</li>
				<li class="list-group-item" id="mypost">
					<img src="../resources/images/layout-img/file.png" class="icon"> 내가 쓴 글</li>
				<li class="list-group-item" id="calendarAll">
					<img src="../resources/images/layout-img/calendar.png" class="icon"> 전체 캘린더</li>
				<c:forEach items="${projectList}" var="projectList" end="5">
					<li class="list-group-item projectMain" value="${projectList.proNo}" id="sub_${projectList.proNo}">
					<img src="../resources/images/project/flag.png" class="proIcon" /> ${projectList.proTitle}</li>
				</c:forEach>
			</ul>

			<br>

			<ul>
				<li class="list-title">프로젝트</li>

				<li class="list-group-item" id="createProject">
					<img src="../resources/images/layout-img/plus.png" class="icon"> 새 프로젝트 만들기</li>

				<!-- 프라이빗 공간 -->
				<li class="list-group-item" id="privateMain">
					<img src="../resources/images/project/safe.png" class="icon"> 프라이빗 공간</li>
				
				<li class="privateSub">
				<a class="dropdown-item priPost" href="#" value="${privateProject.proNo}"> 
				<img src="../resources/images/project/post-it.png" class="subIcon" /> 프라이빗 글</a></li>
				
				<li class="privateSub">
				<a class="dropdown-item priHashTag" href="#" value="${privateProject.proNo}">
				<img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>

				<!-- 내가 포함된 프로젝트 -->
				<c:forEach items="${projectList}" var="projectList" end="5">

					<li class="list-group-item projectMain" value="${projectList.proNo}">
					<img src="../resources/images/project/flag.png" class="proIcon" /> ${projectList.proTitle}</li>

					<!-- 하위메뉴 -->

					<li class="list-group-item" id="sub_${projectList.proNo}_post">
					<a class="dropdown-item proPost" href="#" value="${projectList.proNo}">
					<img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글</a></li>

					<li class="list-group-item" id="sub_${projectList.proNo}_hashTag">
					<a class="dropdown-item proHashTag" href="#" value="${projectList.proNo}">
					<img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a></li>

					<li class="list-group-item" id="sub_${projectList.proNo}_progress">
					<a class="dropdown-item proProgress" href="#" value="${projectList.proNo}">
					<img src="../resources/images/project/diagram.png" class="subIcon" /> 진행 현황</a></li>

					<li class="list-group-item" id="sub_${projectList.proNo}_myPost">
					<a class="dropdown-item proMyPost" href="#" value="${projectList.proNo}"> 
					<img src="../resources/images/project/file.png" class="subIcon" /> 내가 쓴 글</a></li>

					<li class="list-group-item" id="sub_${projectList.proNo}_calendar">
					<a class="dropdown-item proCalendar" href="#" value="${projectList.proNo}">
					<img src="../resources/images/project/calendar.png" class="subIcon" /> 캘린더</a></li>

				</c:forEach>

				<li class="list-group-item">
				<img src="../resources/images/project/more-symbol.png" class="icon"> 프로젝트 더보기</li>
				<!-- 모달로 전체 목록 띄우기 -->
				
			</ul>

		</div>
	</div>
	<!-- left bar 끝-->
</body>
</html>