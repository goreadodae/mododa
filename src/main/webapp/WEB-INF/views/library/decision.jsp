<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
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
				<h4 id="subject">할 일</h4>
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
						<td width="70%" colspan="3">${d.dcContent }</td>
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
							"<td width='70%' colspan='3'>"+ data[i].dcContent +"</td>" +
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
							"<td width='70%' colspan='3'>"+ data[i].dcContent +"</td>" +
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
</script>

</body>
</html>