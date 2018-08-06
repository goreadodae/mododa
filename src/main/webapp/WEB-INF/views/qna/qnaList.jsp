<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<script>
	$(".contents").hide();
	$(".answerContents").hide();
	$(document).ready(function() {
		$(".showContents").click(function() {
			var result = $(this).next().children('.contents');
			result.toggle();
		});
		$(".showAContents").click(function() {
			var result = $(this).next().children('.answerContents');
			result.toggle();
		});
	});
</script>

</head>


<body>
	<div>
		<table class="table table-sm">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>

			<tbody>

				<c:forEach items="${qnaList}" var="q">
					<tr class="showContents">
						<th scope="row">${q.queNo}</th>
						<td>${q.queTitle}</td>
						<td>${q.memberName}</td>
						<td>${q.queTime}</td>
					</tr>

					<tr>
						<td class="contents" colspan="4" style="display: none;">${q.queContents}</td>
					</tr>


					<c:choose>
						<c:when test="${q.ansContents!=null}">
							<tr class="showAContents">
								<th scope="row"></th>
								<td colspan="3"><img src="../resources/images/qna/replay.JPG" style="width:40px; height:40px;">답변드립니다.</td>
							</tr>
							<tr>
								<td class="answerContents" colspan="4" style="display: none;">${q.ansContents}</td>
							</tr>
						</c:when>
					</c:choose>
					

				</c:forEach>
			</tbody>
		</table>
	</div>

	<form action="/qnaWriteReady.do">
		<input type="submit" value="글쓰기">
	</form>

	<div>${qnaListCount}</div>


</body>
</html>