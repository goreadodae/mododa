<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<br>
	<div class="row">
		<div class="col-5" id="box">
			<div class="row">
				<div class="col-2" style="padding: 0px; margin: 0px">
					<h4 id="subject">할 일</h4>
				</div>
				<div class="col-10" style="padding: 0px; margin: 0px;">
					
					<div class="input-group" style="width:150px;">
  						<select class="custom-select" id="inputGroupSelect04" name="project" aria-label="Example select with button addon">
   							<option value="전체 프로젝트" selected>전체 프로젝트</option>
  						<option value="프라이빗 공간">프라이빗 공간</option>
  						<option value="프로젝트1">프로젝트1</option>
  						<option value="프로젝트2">프로젝트2</option>
 						</select>
 					</div>

				
					<!-- <div class="btn-group">
						<button class="btn btn-secondary btn-sm dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">전체 프로젝트</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">전체 프로젝트</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">프라이빗 공간</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">프로젝트1</a>
							<a class="dropdown-item" href="#">프로젝트2</a>
						</div>
					</div> -->
				</div>
			</div>
		</div>


		<div class="col-7" id="container">
			<div class="row">
				<div class="col-2" id="container">
					<button type="button" class="btn btn-outline-success" id="todo">할 일</button>
				</div>
				<div class="col-2" id="container">
				<button type="button" class="btn btn-outline-success" id="decision">의사결정</button>
				</div>
				<div class="col-2" id="container">
					<button type="button" class="btn btn-outline-success" id="image">이미지</button>
				</div>
				<div class="col-2" id="container">
					<button type="button" class="btn btn-outline-success" id="file">파일</button>
				</div>
				<div class="col-2" id="container">
					<button type="button" class="btn btn-outline-success" id="link">링크</button>
				</div>
				<div class="col-2" id="container">
					<a href="#"><img src="../resources/images/icon/delete.png"></img></a>
				</div>
			</div>
		</div>
	</div>

	<div class="dropdown-divider"></div>
	<!-- 자료실 헤더 끝 -->
	
	<!-- 자료실 메뉴에 따른 내용 -->
	<div id="frame">
		<div id="content"></div>
	</div>
	<!-- 자료실 메뉴에 따른 내용 끝-->
	
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