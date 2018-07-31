<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>

</head>

<style>
body {
	overflow-x: hidden;
	height: 100%;
}
div {
	margin: 0px;
	padding: 0px;
}

/* 의사결정 등록 */
#decisionContent,#decisionComment{
	width : 100%;
	height : 50px;
}

.memberIdForDecision{
	font-weight:bold;
}

#decisionWait{
	background-color : #aaaaaa;
	color : white;
	width : 50px;
	text-align : center;
	border-radius: 20px;
	margin : 0px;
	display : inline-block;
}

#decisionApproval{
	background-color : #00837a;
	color : white;
	width : 50px;
	text-align : center;
	border-radius: 20px;
	margin : 0px;
	display : inline-block;
}

#decisionCancel{
	background-color : #B93232;
	color : white;
	width : 50px;
	text-align : center;
	border-radius: 20px;
	margin : 0px;
	display : inline-block;
}

#deleteForDecision{
	padding : 5px;
	border : 1px solid #d2d2d2;
	background-color : #dcdcdc;
	color : #505050;
	display : inline-block;
	float : right;
}

#decideForDecision{
	padding : 5px;
	border : 1px solid #d2d2d2;
	background-color : #CFF09E;
	color : #505050;
	display : inline-block;
	float : right;
}

#decideYes{
	color : #00837a;
	font-size : 30px;
	font-weight : 550;
	display : inline-block;
}

#decideNo{
	color : #b80004;
	font-size : 30px;
	font-weight : 550;
	display : inline-block;
}

.decideIcon{
	height : 30px;
	padding-bottom : 7px;
}
</style>

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
		<!-- 자료실 헤더 -->
	<table width="100%">
		<tr>
			<td width="20%">
				<h4 id="subject">의사결정</h4>
			</td>
			<td width="35%">
				<select class="form-control" style="width:150px;">
  					<option value="전체 프로젝트" selected>전체 프로젝트</option>
  					<option value="${privateNo }">프라이빗 공간</option>
  					<c:forEach items="${listProject }" var="p">
  						<option value="${p.proNo }">${p.proTitle }</option>
  					</c:forEach>
				</select>
			</td>
			<td width="15%"></td>
			<td width="5%">
				<a href="/todo.do" id="todo">할 일</a>
			</td>
			<td width="5%">
				<a href="/decision.do" id="decision">의사결정</a>
			</td>
			<td width="5%">
				<a href="/image.do" id="image">이미지</a>
			</td>
			<td width="5%">
				<a href="/file.do" id="file">파일</a>
			</td>
			<td width="5%">
				<a href="/link.do" id="link">링크</a>
			</td>
			<td width="5%"></td>
		</tr>
	</table>
	
	<div class="dropdown-divider"></div>

	<!-- 자료실 헤더 끝 -->
	
	<!-- 본문 -->
	<div style="padding:10px;">
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 의사결정 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="listDcAll();">전체 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="listDcMe();">받은 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="listDcRequest();">요청한 의사결정</button></td>
					<td width="55%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 의사결정 메뉴 끝 -->
			
			<!-- 의사결정 내용 -->
			<div id="dcTableContainer">
				<table id="dcTable" width="100%" height="100px;" border="1" style="margin:0; padding:0;">
					<c:forEach items="${listDecision }" var="d">
					<tr>
						<td rowspan="2" width="7%">아이콘</td>
						<td width="70%" colspan="3"><a href="#" onclick="openContentModal(${d.dcNo});">${d.dcContent }</a></td>
					</tr>
					<tr>
						<td>${d.dcPostTitle }</td>
						<td>${d.dcWriterName } -> ${d.dcMakerName }</td>
						<td>${d.dcDecision }</td>
					</tr>
					</c:forEach>
					
				</table>
			</div>
			<div class="dropdown-divider"></div>
			<!-- 의사결정 내용 끝 -->
			
			
		</div>
	</div>
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
	
	
	
<c:forEach items="${listDecision }" var="d">
	<!-- 의사결정 내용보기 모달 -->
	<div id="dcContentModal_${d.dcNo }" class="modal">

		<!-- Modal 내용 -->
		<div class="modal-content" style="width:40%;">
			<!-- 닫기 버튼 -->
			<div align="right">
				<img src="../resources/images/post/close.png" onclick="closeContentModal(${d.dcNo});" /><br>
			</div>
			
			<table border="1">
				<tr>
					<td>
						<p>${d.dcContent }</p>
					</td>
				</tr>
				<tr>
					<td>
						<div id="decideYes" onclick="decideYes();"><img src="../resources/images/post/yes.png" class="decideIcon" /> 승인</div>&nbsp;&nbsp;&nbsp;&nbsp; <div id="decideNo" onclick="decideNo();" style="color : #888888"><img src="../resources/images/post/nooff.png" class="decideIcon" /> 반려</div>
					</td>
				</tr>
				<tr>
					<td>
						<button class="insertButton2" onclick="updateDecision();" style="float:right; margin-top:10px;">결정</button>
					</td>
				</tr>
				
			</table>
			
			
				
		</div>
		<!-- Modal 내용 끝 -->
	</div>
	<!-- 내용보기 모달 끝 -->
</c:forEach>	
	
	
	
	
</div>

<script>
	/* 전체 의사결정 */
	function listDcAll() {
		$.ajax({
			url:"/listDcAll.do",
			type:"POST",
			success : function(data) {
				$("#dcTable").remove();
				$("#dcTableContainer").append("<table border='1' id='dcTable' width='100%' height='100px' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#dcTable").append(
							"<tr>" + 
							"<td rowspan='2' width='7%'>아이콘</td>" +
							"<td width='70%' colspan='3'>"+ data[i].dcContent +"</td>" +
							"</tr>" +
							"<tr>" +
							"<td><a href='#' onclick='openContentModal("+data[i].dcNo+");'>"+data[i].dcPostTitle +"</a></td>" +
							"<td>"+data[i].dcWriterName +" -> "+ data[i].dcMakerName +"</td>" +
							"<td>"+data[i].dcDecision +"</td>" +
							"</tr>" 
					);
				}
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	/* 받은 의사결정 */
	function listDcMe() {
		$.ajax({
			url:"/listDcMe.do",
			type:"POST",
			success : function(data) {
				$("#dcTable").remove();
				$("#dcTableContainer").append("<table border='1' id='dcTable' width='100%' height='100px' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#dcTable").append(
							"<tr>" + 
							"<td rowspan='2' width='7%'>아이콘</td>" +
							"<td width='70%' colspan='3'><a href='#' onclick='openContentModal("+data[i].dcNo+");'>"+ data[i].dcContent +"</a></td>" +
							"</tr>" +
							"<tr>" +
							"<td><a href='#' onclick='openContentModal("+data[i].dcNo+");'>"+data[i].dcPostTitle +"</td>" +
							"<td>"+data[i].dcWriterName +" -> "+ data[i].dcMakerName +"</td>" +
							"<td>"+data[i].dcDecision +"</td>" +
							"</tr>" 
					);
				}
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	/* 요청한 의사결정 */
	function listDcRequest() {
		$.ajax({
			url:"/listDcRequest.do",
			type:"POST",
			success : function(data) {
				$("#dcTable").remove();
				$("#dcTableContainer").append("<table border='1' id='dcTable' width='100%' height='100px' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#dcTable").append(
							"<tr>" + 
							"<td rowspan='2' width='7%'>아이콘</td>" +
							"<td width='70%' colspan='3'><a href='#' onclick='openContentModal("+data[i].dcNo+");'>"+ data[i].dcContent +"</a></td>" +
							"</tr>" +
							"<tr>" +
							"<td>"+data[i].dcPostTitle +"</td>" +
							"<td>"+data[i].dcWriterName +" -> "+ data[i].dcMakerName +"</td>" +
							"<td>"+data[i].dcDecision +"</td>" +
							"</tr>" 
					);
				}
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	/* 의사결정 내용보기 모달 열기 */
	function openContentModal(id) {
		$("#dcContentModal_"+id).show();
	}
	
	/* 할 일 내용보기 모달 닫기 */
	function closeContentModal(id) {
		$("#dcContentModal_"+id).hide();
	}
	
	//의사결정 승인 선택시
	var decideResult = 'Y'; //의사결정 결과 전역변수
	function decideYes(){
		decideResult = 'Y';
		var strYes = "<img src='../resources/images/post/yes.png' class='decideIcon' /> 승인";
		$('#decideYes').html(strYes);
		$('#decideYes').css("color","#00837a");
		var strNo = "<img src='../resources/images/post/nooff.png' class='decideIcon' /> 반려";
		$('#decideNo').html(strNo);
		$('#decideNo').css("color","#888888");
	}
	
	//의사결정 반려 선택시
	function decideNo(){
		decideResult = 'N';
		var strYes = "<img src='../resources/images/post/yesoff.png' class='decideIcon' /> 승인";
		$('#decideYes').html(strYes);
		$('#decideYes').css("color","#888888");
		var strNo = "<img src='../resources/images/post/no.png' class='decideIcon' /> 반려";
		$('#decideNo').html(strNo);
		$('#decideNo').css("color","#b80004");
	}
	
	
</script>

</body>
</html>