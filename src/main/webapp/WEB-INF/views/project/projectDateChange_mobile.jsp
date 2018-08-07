<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>

<!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 기한 수정</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

</head>

<style>

/* 기본 구조 스타일 시작 */
body {
	overflow-x: hidden;
	overflow-y: hidden;
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
	width: 100%; /* Could be more or less, depending on screen size */
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
		location.href="/gotoMoreProject.do";
	};

	function periodOff() {
		document.getElementById('periodLabel').innerHTML = " ";
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
	
	function dateOn(startDate, endDate) {
		document.getElementById('periodLabel').innerHTML = "<input type='date' id='proStartDate' name='proStartDate' value='"+startDate+"'>"
															+ " ~ <input type='date' id='proEndDate' name='proEndDate' value='"+endDate+"'>";
	}
	
	function submitCheck() {

		var startDateStr = document.getElementById('proStartDate').value;
		var endDateStr = document.getElementById('proEndDate').value;
		var startDate = new Date(startDateStr);
		var endDate = new Date(endDateStr);
			
		if(startDateStr==endDateStr) {
			alert("시작하는 날짜와 끝나는 날짜가 같을 수 없습니다.");
			return false;
		} else if(endDate<startDate) {
			alert("끝나는 날짜가 시작하는 날짜보다 작을 수 없습니다.");
			return false;
		} else {
			return true;
		}
	}
	
	
</script>

<body>

    <!-- The Modal -->
    <div id="createProjectModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
      	<!-- 닫기 버튼 -->
      	<div class="modal-header" id="m_header"><img src="/resources/images/project/delete-button.png" onClick="close_pop();"></div>
      	<div class="modal-body">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">프로젝트 기한 수정</span></b></span></p>
                <form action="/updateProjectDate.do" method="get">
                <p style="text-align: center; line-height: 1.5;"><br />
  					프로젝트 이름 : ${project.proTitle} <br>
  					<c:choose>
  						<c:when test="${project.proStartDate==null && project.proEndDate==null}">
  						기한 : 없음 <input type="radio" name="period" onClick="periodOff();" checked> / 있음 <input type="radio" name="period" onClick="periodOn();">
						<br><label id="periodLabel"></label><br> 
  						</c:when>
  						<c:otherwise>
  						기한 : 없음 <input type="radio" name="period" onClick="periodOff();">
  						 / 있음 <input type="radio" name="period" onClick="dateOn('${project.proStartDate}','${project.proEndDate}');" checked>
						<br><label id="periodLabel">
						<input type='date' id='proStartDate' name='proStartDate' value="${project.proStartDate}">
						 ~ 
						 <input type='date' id='proEndDate' name='proEndDate' value="${project.proEndDate}">
						</label><br>
  						</c:otherwise>
  					</c:choose>
					
				</p>
                <!-- submit 버튼 -->
                <div class="divStyle">
                <input type="hidden" name="proNo" value="${project.proNo}">
                <button class="btnStyle" onClick="return submitCheck();"><span>수정</span></button>
                </div>
                </form>
      	</div>
      </div>
 
    </div>
    <!--End Modal-->


</body>
</html>