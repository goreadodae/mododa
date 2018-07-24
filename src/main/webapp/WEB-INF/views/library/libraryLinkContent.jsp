<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
	<!-- 본문 -->
	<div style="padding:10px;">
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 링크 메뉴 -->
			<table width="100%" >
				<tr>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">내 링크</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">전체 링크</button></td>
					<td></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 링크 메뉴 끝 -->
			
			<!-- 링크 내용 -->
			<table width="100%" height="100px" border="1" style="margin:0; padding:0;">
				<c:forEach items="${listLink }" var="l">
					<tr>
						<td rowspan="2" width="7%">아이콘</td>
						<td width="60%">${l.linkTitle }</td>
						<td width="23%">${l.memberNo }</td>
					</tr>
					<tr>
						<td colspan="2">${l.linkAddress }</td>
					</tr>
				</c:forEach>
				
			</table>
			<div class="dropdown-divider"></div>
			<!-- 링크 내용 끝 -->
			
		</div>
	</div>

</body>
</html>