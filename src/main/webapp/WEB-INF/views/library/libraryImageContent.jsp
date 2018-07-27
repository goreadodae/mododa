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
	<!-- 본문 -->
	<div style="padding:10px;">
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 이미지 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">전체 이미지</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm">내 이미지</button></td>
					<td width="70%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 이미지 메뉴 끝 -->
				
			<!-- 이미지 내용 -->
			<table style="margin:0; padding:0;">
				<tr>
					<td colspan="3">
						<c:forEach items="${listImage }" var="i">
						<div style="border:1px solid grey;margin:5px; width:250px; height:250px;float:left;display:table;">
							<div style="display:table-cell; vertical-align:middle;">
							<img src="${i.uploadPath }" style="width:100%;" />
							</div>
						</div>
						</c:forEach>
					</td>
				</tr>
			</table>
			<!-- 이미지 내용 끝 -->
		</div>
	</div>
	

	


</body>
</html>