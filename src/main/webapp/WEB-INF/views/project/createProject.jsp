<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>

<!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 프로젝트 생성</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

</head>

<style>

/* 기본 구조 스타일 시작 */
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
/* 기본 구조 스타일 끝 */


/* 프로젝트 생성 관련 모달 */
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
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
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
	cursor: pointer;
	background-color: #CFF09E;
	text-align: center;
}

.btnStyle {
	background-color: #CFF09E;
	height: 100%;
	width: 100%;
	background: transparent;
	border: none;
	outline: 0;
	padding-top: 10px;
	padding-bottom: 10px;
}

span {
	font-size: 13pt;
}

#m_header {
	padding: 0px;
	text-align: right;
	display: inline-block;
}

#m_header img {
	height: 25px;
	width: 25px;
	cursor: pointer;
}

</style>

<script type="text/javascript">

	jQuery(document).ready(function() {
		$('#createProjectModal').show();
	});

	//팝업 Close 기능
	function close_pop(flag) {
		$('#createProjectModal').hide();
		location.href="/mainPage.do";
	};

	function periodOff() {
		document.getElementById('periodLabel').innerHTML = " ";
	}

	function periodOn() {
		document.getElementById('periodLabel').innerHTML = "<input type='date' id='proStartDate' name='proStartDate'> ~ <input type='date' id='proEndDate' name='proEndDate'>";
		document.getElementById('proStartDate').valueAsDate = new Date();
		document.getElementById('proEndDate').valueAsDate = new Date();
	}

	function submitCheck() {
		if (document.getElementById('proTitle').value == "") {
			alert("프로젝트명을 입력해주세요.");
			return false;
		} else {
			return true;
		}
	}
	
</script>

<body>

<!-- header -->
<jsp:include page="/header.do"></jsp:include>
<!-- header 끝 -->

<div class="row">

	<!-- left bar -->
	<jsp:include page="/leftbar.do"></jsp:include>
	<!-- left bar 끝-->

	<!-- contents -->
	<div class="col-6" id="contents" style="padding:0;">
	<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->

    <!-- The Modal -->
    <div id="createProjectModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
      	<!-- 닫기 버튼 -->
      	<div class="modal-header" id="m_header"><img src="/resources/images/project/delete-button.png" onClick="close_pop();"></div>
      	<div class="modal-body">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">새 프로젝트 생성</span></b></span></p>
                <form action="/createProject.do" method="get">
                <p style="text-align: center; line-height: 1.5;"><br />
  					프로젝트 이름 : <input type="text" name="proTitle" id="proTitle"> <br>
					기간 : 없음 <input type="radio" name="period" onClick="periodOff();" checked> / 있음 <input type="radio" name="period" onClick="periodOn();">
					<br><label id="periodLabel"></label><br>
				</p>
                <!-- submit 버튼 -->
                <div class="divStyle">
                <button class="btnStyle" onClick="return submitCheck();"><span>생성</span></button>
                </div>
                </form>
      	</div>
      </div>
 
    </div>
    <!--End Modal-->
	<img src = "/resources/images/layout-img/main_logo_square.png" style="margin-top:15%; margin-left:25%;"/>
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>

</body>
</html>