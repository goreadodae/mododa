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
				<h4 id="subject">파일</h4>
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
	
	<div style="padding:10px;">
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 파일 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" onclick="listFileAll();" class="btn btn-outline-success btn-sm">전체 파일</button></td>
					<td width="15%"><button type="button" style="width:99%" onclick="listFileMe();" class="btn btn-outline-success btn-sm">내 파일</button></td>
					<td width="70%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 파일 메뉴 끝 -->
			
			<!-- 파일 내용 -->
			<div id="fileTableContainer">
				<table id="fileTable" width="100%" height="100px" border="1" style="margin:0; padding:0;">
				<c:forEach items="${listFile }" var="f">
					<tr>
						<td rowspan="2" width="7%">아이콘</td>
						<td width="70%" colspan="2">${f.fileName}</td>
						<td width="23%">${f.uploadDate }</td>
					</tr>
					<tr>
						<td colspan="3">${f.postTitle }</td>
					</tr>
				</c:forEach>
				</table>
			</div>	
			
			<!-- 파일 내용 끝 -->
			
			
			
		</div>
	</div>
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>

</body>

<script>
/* 전체 파일 */
function listFileAll() {
	$.ajax({
		url:"/listFileAll.do",
		type:"POST",
		success : function(data) {
			$("#fileTable").remove();
			$("#fileTableContainer").append("<table id='fileTable' width='100%' height='100px' border='1' style='margin:0; padding:0;' ></table>");
			for(var i=0; i<data.length; i++) {
				$("#fileTable").append(
						"<tr>" +
							"<td rowspan='2' width='7%''>아이콘</td>" + 
							"<td width='70%' colspan='2'>"+data[i].fileName+"</td>" +
							"<td width='23%'>"+data[i].uploadDate+"</td>" +
						"</tr>" +
						"<tr>" +
							"<td colspan='3'>"+data[i].postTitle+"</td>" +
						"</tr>"
				);
			}
		},
		error : function(data) {
			console.log("오류");
		}
	});
}

/* 내 파일 */
function listFileMe() {
	$.ajax({
		url:"/listFileMe.do",
		type:"POST",
		success : function(data) {
			$("#fileTable").remove();
			$("#fileTableContainer").append("<table id='fileTable' width='100%' height='100px' border='1' style='margin:0; padding:0;' ></table>");
			for(var i=0; i<data.length; i++) {
				$("#fileTable").append(
						"<tr>" +
							"<td rowspan='2' width='7%''>아이콘</td>" + 
							"<td width='70%' colspan='2'>"+data[i].fileName+"</td>" +
							"<td width='23%'>"+data[i].uploadDate+"</td>" +
						"</tr>" +
						"<tr>" +
							"<td colspan='3'>"+data[i].postTitle+"</td>" +
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



</html>