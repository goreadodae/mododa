<%@page import="kr.pe.mododa.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	height:23px; 
	width:23px;
}

.list-title {
	color: #464646;
}

div {
	box-sizing: border-box;
}

/* 지은 스타일 추가 */
.proIcon {
	margin-right: 2%;
	height:23px; 
	width:23px;
}

.subIcon {
	height:18px; 
	width:18px;
	margin-right: 5%;
	margin-left: 15%;
}

.privateSub {
	display:none;
	overflow:hidden;  
  	position: relative;
  	margin-bottom: -1px;
  	border: 1px solid #ddd;
  	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}

.privateSub a {
	padding : 0;
}

li[id^="sub_"] {
	display:none;
	padding : 0;
	background-color: #F5F5F5;
}

li[id^="sub_"] a {
	padding : 0;
}

.list-group-item {
	padding-top: 1.5% !important;
	padding-bottom: 1.5% !important;
}
</style>

<script>
	//leftbar, rightbar 높이 설정
	$(document).ready(function() {
		resizeContent();
	});

	$(window).resize(function() {
		resizeContent();
	});
	
	function resizeContent() {
		var windowHeight = $(window).height();
		var topHeight = $('.header').height();
		
		$('#background').css({
			'height' : (windowHeight-topHeight) + 'px'
		});
	}
	
	//배너 닫기
	function bannerClose() {
		$("#banner").hide();
	}
	
	//contents 화면 전환
	jQuery(function($) {
		   $("#newsfeed").click(function() {
		      $("#content-frame").remove();
		      $("#contents").append("<div id='content-frame'></div>");
		      $("#content-frame").load("");
		   });

		   $("#callpost").click(function() {
			   $("#content-frame").remove();
			   $("#contents").append("<div id='content-frame'></div>");
			   $("#content-frame").load("/testareum.do");
		   });
		   
		   $("#bookmark").click(function() {
			   $("#content-frame").remove();
			   $("#contents").append("<div id='content-frame'></div>");
			   $("#content-frame").load("/bookmark.do");
		   });
		   
		   $("#project").click(function() {
			   $("#content-frame").remove();
			   $("#contents").append("<div id='content-frame'></div>");
			   $("#content-frame").load("");
		   });
		   
		   $("#library").click(function() {
			   $("#content-frame").remove();
			   $("#contents").append("<div id='content-frame'></div>");
			   $("#content-frame").load("/libraryMain.do");
		   });
		   
		   $("#calendarAll").click(function() {
			   $("#content-frame").remove();
			   $("#contents").append("<div id='content-frame'></div>");
			   $("#content-frame").load("/calendar.do");
		   });

	});
	
	function open_pop(flag) {
		$('#mailModal').show();
	};
	//팝업 Close 기능
	function close_pop(flag) {
		$('#mailModal').hide();
	};
	function sendEmail(){
		$('#mailModal').hide();
		$.ajax({
			url : '/confirmEmail.do',
			type : "post"
		});
	};
	var timerID;
	var time=30*60;
	var emailCertifyFlag = true;
	$(document).ready(function(){
 		<% if(((Member)(session.getAttribute("member"))).getMemberEmailCertify().equals("N")) {%>
 		if(emailCertifyFlag){
 			countTime();
 			open_pop();
 		}
		<%}%>
	});

	function countTime() {
		timerID = setInterval("decrementTime()", 1000);
		emailCertifyFlag = false;
	};
    function decrementTime(){
   	 if(time>0) {
   		 time--;
   	 }
   	 else{
   		emailCertifyFlag = true;
   		 clearInterval(timeID);
   	 }
    }
    function gotoMyInfo(){//내정보 페이지로 이동
    	$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    $("#content-frame").load("/myInfo.do");
    }
</script>


<!-- 지은이가 사용할 스크립트 -->
<script>

/* 지은 프로젝트부분 contents 화면 전환 함수 */
jQuery(function($) {
	
	// 프로젝트 생성
   	$("#createProject").click(function() {
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    $("#content-frame").load("/gotoCreateProject.do");
    });
	
   	var beforeShow = 0; /* 열렸던 창을 닫기 위한 변수 */
	// 프라이빗 공간
   	$("#privateMain").click(function() {
   		var displayValue = $(".privateSub").css('display');
   		if(displayValue=='none') {
   			$('li[id^="sub_'+beforeShow+'"]').hide();/* 열렸던 창 닫기 */
   			$(".privateSub").show();
   		} else {
   			$('li[id^="sub_'+beforeShow+'"]').hide();/* 열렸던 창 닫기 */
   			$(".privateSub").hide();
   		}
    });
   	
   	// 프라이빗 하위 메뉴 
   	$(".priPost").click(function() {
		var proNo = $(this).attr('value');
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    $("#content-frame").load("/priPost.do?proNo="+proNo);
	});
	
	$(".priHashTag").click(function() {
		var proNo = $(this).attr('value');
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    //$("#content-frame").load("#");
	});
   	
	
	// 프로젝트 목록
   	$(".projectMain").click(function() {
   		var proNo = $(this).attr('value');
		var displayValue = $('li[id^="sub_'+proNo+'"]').css('display');
   		if(displayValue=='none') {
   			$(".privateSub").hide();/* 열렸던 창 닫기 */
   			$('li[id^="sub_'+beforeShow+'"]').hide();/* 열렸던 창 닫기 */
   			$('li[id^="sub_'+proNo+'"]').show();
   			beforeShow = proNo;/* 열렸던 창 닫기 */
   		} else {
   			$('li[id^="sub_'+proNo+'"]').hide();
   		}
    });

	// 프로젝트 하위 메뉴
	$(".proPost").click(function() {
		var proNo = $(this).attr('value');
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    $("#content-frame").load("/proPost.do?proNo="+proNo);
	});
	
	$(".proHashTag").click(function() {
		var proNo = $(this).attr('value');
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    //$("#content-frame").load("#");
	});
	
	$(".proProgress").click(function() {
		var proNo = $(this).attr('value');
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    //$("#content-frame").load("#");
	});
	
	$(".proMyPost").click(function() {
		var proNo = $(this).attr('value');
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    //$("#content-frame").load("#");
	});
	
	$(".proCalendar").click(function() {
		var proNo = $(this).attr('value');
		$("#content-frame").remove();
	   	$("#contents").append("<div id='content-frame'></div>");
	    //$("#content-frame").load("#");
	});

});
</script>

<body>
			<!-- left bar -->
			<div class="col-3" id="background">
				<div class="leftbar">
					<br>
					<ul>
						<li class="list-title">전체 정보</li>
						<li class="list-group-item" id="newsfeed"><img src="../resources/images/layout-img/lightning.png" class="icon"> 뉴스피드</li>
						<li class="list-group-item" id="callpost"><img src="../resources/images/layout-img/arroba.png" class="icon"> 호출된 글</li>
						<li class="list-group-item" id="bookmark"><img src="../resources/images/layout-img/bookmark.png" class="icon"> 북마크</li>
						<li class="list-group-item" id="mypost"><img src="../resources/images/layout-img/file.png" class="icon"> 내가 쓴 글</li>
						<li class="list-group-item" id="calendarAll"><img src="../resources/images/layout-img/calendar.png" class="icon"> 전체 캘린더</li>
					</ul>

					<br>


					<ul>
						<li class="list-title">프로젝트</li>
						
						<li class="list-group-item" id="createProject"><img src="../resources/images/layout-img/plus.png" class="icon"> 새 프로젝트 만들기</li>
						
						<!-- 프라이빗 공간 -->
						<li class="list-group-item" id="privateMain"><img src="../resources/images/project/safe.png" class="icon"> 프라이빗 공간</li>
						<li class="privateSub">
						<a class="dropdown-item priPost" href="#" value="${privateProject.proNo}">
							<img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글
						</a>
						</li>
						<li class="privateSub">
						<a class="dropdown-item priHashTag" href="#" value="${privateProject.proNo}">
							<img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그
						</a>
						</li>
						
						<!-- 내가 포함된 프로젝트 -->
						<c:forEach items="${projectList}" var="projectList" end="5">
						<li class="list-group-item projectMain" value="${projectList.proNo}">
							<img src="../resources/images/project/flag.png" class="proIcon" /> ${projectList.proTitle}							
						</li>
						<!-- 번호 전송 여기까지 -->
						
						<!-- 하위메뉴 -->
						
						<li class="list-group-item" id="sub_${projectList.proNo}_post">
						<a class="dropdown-item proPost" href="#" value="${projectList.proNo}">
							<img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글
						</a>
						</li>
						
						<li class="list-group-item" id="sub_${projectList.proNo}_hashTag">
						<a class="dropdown-item proHashTag" href="#" value="${projectList.proNo}">
							<img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그
						</a>
						</li>
						
						<li class="list-group-item" id="sub_${projectList.proNo}_progress">
						<a class="dropdown-item proProgress" href="#" value="${projectList.proNo}">
							<img src="../resources/images/project/diagram.png" class="subIcon" /> 진행 현황
						</a>
						</li>
						
						<li class="list-group-item" id="sub_${projectList.proNo}_myPost">
						<a class="dropdown-item proMyPost" href="#" value="${projectList.proNo}">
							<img src="../resources/images/project/file.png" class="subIcon" /> 내가 쓴 글
						</a>
						</li>
						
						<li class="list-group-item" id="sub_${projectList.proNo}_calendar">
						<a class="dropdown-item proCalendar" href="#" value="${projectList.proNo}">
							<img src="../resources/images/project/calendar.png" class="subIcon" /> 캘린더
						</a>
						</li>
						
						</c:forEach>
						
						<li class="list-group-item"><img src="../resources/images/project/more-symbol.png" class="icon"> 프로젝트 더보기</li>
						<!-- 모달로 전체 목록 띄우기 -->
					</ul>

				</div>
			</div>
			<!-- left bar 끝-->

</body>
</html>