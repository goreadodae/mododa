<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
	integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
	crossorigin="anonymous"></script>
<script
  src="http://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/library/libraryMain.css">

<body>
<div>
	<!-- 자료실 헤더 -->
	<table width="100%">
		<tr>
			<td width="20%">
				<h4 id="subject">할 일</h4>
			</td>
			<td width="35%">
				<select class="form-control" style="width:150px;">
  					<option value="전체 프로젝트" selected>전체 프로젝트</option>
  					<option value="프라이빗 공간">프라이빗 공간</option>
  					<c:forEach items="${listProject }" var="p">
  						<option value="${p.proNo }">${p.proTitle }</option>
  					</c:forEach>
				</select>
			</td>
			<td width="15%"></td>
			<td width="5%">
				<button type="button" class="btn btn-outline-success" id="todo">할 일</button>
			</td>
			<td width="5%">
				<button type="button" class="btn btn-outline-success" id="decision">의사결정</button>
			</td>
			<td width="5%">
				<button type="button" class="btn btn-outline-success" id="image">이미지</button>
			</td>
			<td width="5%">
				<button type="button" class="btn btn-outline-success" id="file">파일</button>
			</td>
			<td width="5%">
				<button type="button" class="btn btn-outline-success" id="link">링크</button>
			</td>
			<td width="5%"></td>
		</tr>
	</table>
	
	<div class="dropdown-divider"></div>

	<!-- 자료실 헤더 끝 -->
	
	<!-- 자료실 내용 -->
	<div id="frame">
		<div id="content"></div>
	</div>
	<!-- 자료실 내용 끝-->
	
</div>

<script>

jQuery(function($) {
	$("#content").load("/libraryTodoContent.do");
	
	$("#todo").click(function() {
		$("#subject").html("할 일");
		$("#content").remove();
		$("#frame").append("<div id='content'></div>");
		$("#content").load("/libraryTodoContent.do");
			
	});

	$("#decision").click(function() {
		$("#subject").html("의사결정");
		$("#content").remove();
		$("#frame").append("<div id='content'></div>");
		$("#content").load("/libraryDecisionContent.do");
		
	});

	$("#image").click(function() {
		$("#subject").html("이미지");
		$("#content").remove();
		$("#frame").append("<div id='content'></div>");
		$("#content").load("/libraryImageContent.do");
	});

	$("#file").click(function() {
		$("#subject").html("파일");
		$("#content").remove();
		$("#frame").append("<div id='content'></div>");
		$("#content").load("/libraryFileContent.do");
	});

	$("#link").click(function() {
		$("#subject").html("링크");
		$("#content").remove();
		$("#frame").append("<div id='content'></div>");
		$("#content").load("/libraryLinkContent.do");
	});

});


		
		
		
		
		
		
		

		
	
</script>

</body>
</html>