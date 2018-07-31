<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 진행 현황</title>




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


.progressBox {
	border: 1px solid black;
	width: 100%;
	height: 100%;
	background-color: #FFF;
}


.progressBody {
	border: 1px solid black;
	width: 25%;
	height: 95%;
	background-color: #FFF;
	float: left;
}

.progressHead {
	border: 1px solid black;
	width: 100%;
	height: 5%;
	background-color: #FFF;
	float: left;
}

/* 기본 구조 스타일 끝 */
</style>

<body>

<!-- header -->
<jsp:include page="/header.do"></jsp:include>
<!-- header 끝 -->

<div class="row" style="background-color: #F5F5F5;">
	<!-- left bar -->
	<jsp:include page="/leftbar.do"></jsp:include>
	<!-- left bar 끝-->


	<!-- contents -->
	<div class="col-8" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		
		<div class="progressBox">
		
			<div class="progressHead progressBox""><h5><b>프로젝트 진행 현황</b></h5></div>
			<div class="progressBody progressBox">
				<div class="progressHead progressBox"><h5><b>발의</b></h5></div>
			</div>
			<div class="progressBody progressBox">
				<div class="progressHead progressBox"><h5><b>진행</b></h5></div>
			</div>
			<div class="progressBody progressBox">
				<div class="progressHead progressBox"><h5><b>완료</b></h5></div>
			</div>
			<div class="progressBody progressBox">
				<div class="progressHead progressBox"><h5><b>중지</b></h5></div>
			</div>
		
		
		</div>
	
	</div>
	<!-- contents 끝 -->



</div>

</body>
</html>