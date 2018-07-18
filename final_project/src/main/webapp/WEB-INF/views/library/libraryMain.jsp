<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[자료실] 할 일</title>
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
</head>
<style>
body{
	overflow-x:hidden; 
	height:100%;
}

div{
	margin:0px;
	padding:0px;
}

#background{
	
	background-color : #F5F5F5;
	margin:0px;
	padding:0px;
}
#container {
	margin:0px;
	padding:0px;
}
#box {
	padding-left: 35px;
}

a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none;}

</style>

<body>
<div>
	<!-- header -->
	<jsp:include page="/layout/header.jsp"></jsp:include>

	<div class="row">
		
		<!-- left bar -->
		<div class="col-3" id="background">
			<jsp:include page="/layout/leftbar.jsp"></jsp:include>
		</div>
		
		<!-- contents -->
		<div class="col-8">
			<!-- 자료실 헤더 -->
			<br>
			<div class="row">
				<div class="col-5" id="box">
					<div class="row">
						<div class="col-3" style="padding: 0px; margin: 0px">
							<h4>할 일</h4>
						</div>
						<div class="col-9" style="padding: 0px; margin: 0px">
							<div class="btn-group">
								<button class="btn btn-secondary btn-sm dropdown-toggle"
									type="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">전체 프로젝트</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">전체 프로젝트</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">프라이빗 공간</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">프로젝트1</a> <a
										class="dropdown-item" href="#">프로젝트2</a>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-7" id="container">
					<div class="row">
						<div class="col-2" id="container">
							<button id="todo">할 일</button>
						</div>
						<div class="col-2" id="container">
							<a href="#" id="decision">의사결정</a>
						</div>
						<div class="col-2" id="container">
							<a href="#" id="image">이미지</a>
						</div>
						<div class="col-2" id="container">
							<a href="#" id="file">파일</a>
						</div>
						<div class="col-2" id="container">
							<a href="#" id="link">링크</a>
						</div>
						<div class="col-2" id="container">
							<a href="#" id="todo"><img src="../resources/images/icon/delete.png"></img></a>
						</div>
					</div>
				</div>
			</div>

			<div class="dropdown-divider"></div>

			<div id="content">
				<jsp:include page="/libraryTodoContent.do"></jsp:include>
			</div>

		</div>
	</div>
</div>
</body>

<script>
	$(document).ready(function() {

		$("todo").click(function() {
			console.log("테스트");
			$('#content').html('<jsp:include page="/libraryTodoContent.do"></jsp:include>');
		});

		$("decision").click(function() {
			$.ajax({
				url : '/libraryTodoContent.do',
				type : 'post',
				dataType : 'html',
				success : function() {
					$('#content').html('<jsp:include page="/libraryTodoContent"></jsp:include>');
				}
			});
		});

		

	});
</script>

</html>