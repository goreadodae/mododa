<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

</style>

<body>

</body>
<div>
	<!-- header -->
	<jsp:include page="/layout/header.jsp"></jsp:include>

	<div class="row">
		
		<!-- left bar -->
		<div class="col-3" id="background">
			<jsp:include page="/layout/leftbar.jsp"></jsp:include>
		</div>
		
		<!-- contents -->
		<div class="col-6">
			<jsp:include page="/WEB-INF/views/personal/personalCall.jsp"></jsp:include>
		</div>
		
		<!-- right bar -->
		<div class="col-3" id="background">
			<jsp:include page="/layout/rightbar.jsp"></jsp:include>
		</div>
		
		
	</div>
</div>
</html>