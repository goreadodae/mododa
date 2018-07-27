<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나중에 메인페이지 복사하고 색만 바꾸기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

</head>

<!-- 화면 구성 스타일 -->
<style>
body {
	overflow-x: hidden;
	height: 100%;
}

div {
	margin: 0px;
	padding: 0px;
}

#background {
	background-color: #F5F5F5;
	margin: 0px;
	padding: 0px;
}

/* header */
.header {
	margin: 0px;
	padding: 0px;
}

#banner {
	background-color: #CFF09E;
	color: white;
	height: 30px;
	margin: 0px;
	padding: 0px;
	text-align: center;
	line-height: 25px;
	font-size: 15px;
}

#topbar {
	height: 50px;
	border-bottom: 1px solid #c8c8c8;
	padding: 0px;
}

#logo-img {
	height: 40px;
	vertical-align: middle;
	top: 10%;
	left: 50%;
	position: absolute;
}

#menu-img {
	height: 25px;
	top: 25%;
	left: 20%;
	position: absolute;
}

#cancel-img {
	height: 50%;
	vertical-align: middle;
	top: 22%;
	right: 3%;
	position: absolute;
	cursor: pointer;
}

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

/* contents */
#contents{
	padding : 0px;
}

#content-frame{
	height:100%;
	width : 100%;
	padding : 0px;
	frameborder : 0px;
	border : 0px;
}

</style>


<!-- 지은 스타일 -->
<style>

.proIcon {
	margin-right: 2%;
	height:23px; 
	width:23px;
}

.subIcon {
	height:18px; 
	width:18px;
}



.proBtn {
	height:100%; 
	width:100%;
}

.proBtn>button {
	height:100%; 
	width:100%;
	text-align: left;
	padding-left: 6.5%;
	padding-top: 1%;
	padding-bottom: 1%;
	background-color: rgba( 255, 255, 255, 0.5 );
	border:0px solid;
}



</style>


<!-- 모달 스타일 -->
<style>
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
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        
        .divStyle {
        	cursor:pointer; 
        	background-color:#CFF09E; 
        	text-align:center; 
        }
        
        .btnStyle {
        	background-color:#CFF09E; 
        	height:100%; 
        	width:100%; 
        	background:transparent; 
        	border:none;
        	outline:0;
        	padding-top:10px;
        	padding-bottom:10px;
        }
        
        span {
        	font-size:13pt;
        }
        
        #m_header {
        	padding : 0px;
        	text-align: right;
        	display: inline-block;
        	
        }
        
        #m_header img {
        	height : 25px;
        	width : 25px;
        	cursor:pointer;
        }
</style>


<!-- 화면 구성, 기능 스크립트 -->
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
	
	
 	//contents 화면 전환 -> 준석이 코드 추가하기
 	jQuery(function($) {
	

	}); 
	
	
	/* 지은 프로젝트부분 contents 화면 전환 함수 */
 	jQuery(function($) {
		   
 		// 새 프로젝트 생성
		$("#project").click(function() {
			$("#content-frame").remove();
			$("#contents").append("<div id='content-frame'></div>");
			$("#content-frame").load("/gotoCreateProject.do");
		 });
 		
	});
	
</script>


<!-- 모달 스크립트 -->
<script type="text/javascript">
      
    jQuery(document).ready(function() {
        $('#inviteMemberModal').show();
    });
    
     //팝업 Close 기능
    function close_pop(flag) {
        $('#inviteMemberModal').hide();
        location.href="/mainPage.do";
        /* 메인페이지로 보낼 지? 프로젝트를 볼 때는 색을 바꾸고 싶은데... */
    };
     
	function submitCheck() {
		if(document.getElementById('memberId').value == "") {
			alert("초대 멤버 이메일을 입력해주세요.");
			return false;
		} else {
			return true;
		}
	}
        
</script>



<body>

<!-- 프로젝트 초대 모달 -->

    <!-- The Modal -->
    <div id="inviteMemberModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
      	<!-- 닫기 버튼 -->
      	<div class="modal-header" id="m_header"><img src="/resources/images/project/delete-button.png" onClick="close_pop();"></div>
      	<div class="modal-body">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">프로젝트 멤버 초대</span></b></span></p>
                <form action="/inviteMember.do" method="get">
                <p style="text-align: center; line-height: 1.5;"><br />
  					초대 멤버 이메일 입력 : <input type="text" name="memberId" id="memberId"> <br>
					<!-- 프로젝트 번호, 회원 번호 필요 -->
				</p>
                <!-- submit 버튼 -->
                <div class="divStyle">
                <button class="btnStyle" onClick="return submitCheck();"><span>초대</span></button>
                </div>
                </form>
      	</div>
      </div>
 
    </div>
    <!--End Modal-->



<!-- 화면 구성 -->
	<div>
		<!-- header -->
		<div class="header">

			<!-- 팝업창 -->
			<div class="row"> 
				<div class="col-12" id="banner">
					프로젝트 화면입니다.
				</div>
			</div>

			<!-- 상단바 -->
			<div class="row">
				<div class="col-3" id="topbar">
					<img id="menu-img" src="../resources/images/layout-img/menu.png" />
				</div>

				<div class="col-5" id="topbar">
					<img id="logo-img"          
						src="../resources/images/layout-img/main_logo_rec.png" />
				</div>

				<div class="col-4" id="topbar">
					<!-- 회원 썸네일 -->
				</div>
			</div>
		</div>
		<!-- header 끝 -->
		<div class="row">

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
						<li class="list-group-item" id="calendar"><img src="../resources/images/layout-img/calendar.png" class="icon"> 전체 캘린더</li>
					</ul>

					<br>

					<!-- 지은 작업 중 -->
					<ul>
						<li class="list-title">프로젝트</li>
						<li class="list-group-item" id="project"><img src="../resources/images/layout-img/plus.png" class="icon"> 새 프로젝트 만들기</li>
						
						<!-- 로그인이랑 연동되면 해당아이디 프로젝트 목록을 읽어와서 이 곳에 출력해준다. -->
						<c:forEach items="${projectList}" var="projectList">
						<li class="list-group-item" style="padding:5px;">
						<div class="btn-group dropright proBtn">
  							<button data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  							<img src="../resources/images/project/flag.png" class="proIcon" /> ${projectList.proTitle}
  							</button>
  							<div class="dropdown-menu">
    						<a class="dropdown-item" href="/testProNo.do?proNo=${projectList.proNo}"><img src="../resources/images/project/post-it.png" class="subIcon" /> 프로젝트 글</a>
    						<a class="dropdown-item" href="#"><img src="../resources/images/project/hashtag.png" class="subIcon" /> 해시태그</a>
    						<a class="dropdown-item" href="#"><img src="../resources/images/project/diagram.png" class="subIcon" /> 진행 현황</a>
   							<a class="dropdown-item" href="#"><img src="../resources/images/project/file.png" class="subIcon" /> 내가 쓴 글</a>
   							<a class="dropdown-item" href="#"><img src="../resources/images/project/calendar.png" class="subIcon" /> 캘린더</a>
   							</div>			
   						</div>
						</li>
						</c:forEach>
					</ul>

				</div>
			</div>
			<!-- left bar 끝-->


			<!-- contents -->
			<div class="col-6" id="contents">
				<div id="content-frame">
				
				
<table border="1">
	<tr>
		<th>아이디</th><th>이름</th><th>전화번호</th>
	</tr>
	<c:forEach items="${projectList}" var="projectList">
	<tr>
		<td>${projectList.proNo}</td>
		<td>${projectList.proTitle}</td>
		<td>${projectList.proProgress}</td>
	</tr>
	</c:forEach>
</table>
				
				
				</div>
			</div>
			<!-- contents 끝 -->


			<!-- right bar -->
			<div class="col-3" id="background">
				<!-- 테이블을 이용한 경우 -->
				<table width="300px">
					<!-- 자료실 메뉴 -->
					<tr style="float: right;">
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-dark dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">자료실</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">할 일</a> <a
										class="dropdown-item" href="#">의사결정</a> <a
										class="dropdown-item" href="#">이미지</a> <a
										class="dropdown-item" href="#">파일</a> <a class="dropdown-item"
										href="#">링크</a>
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
		</div>
	</div>
	
	

</body>
</html>