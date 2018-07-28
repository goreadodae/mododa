<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 별 프로젝트 글 보기</title>

</head>


<body>


<h3>프로젝트 글</h3>
<table border=1>

<tr>
	<th>글제목</th>
	<th>작성일</th>
	<th>글쓴이사진</th>
	<th>글쓴이</th>
	<th>프로젝트이름</th>
</tr>
<c:forEach items="${postList}" var="postList">
<tr>
	<td>${postList.postTitle}</td>
	<td>${postList.postDate}</td>
	<c:forEach items="${postWriterMemberList}" var="postWMList">
		<c:if test="${postList.postWriter==postWMList.memberNo}">
		<td>이미지주소넣기${postWMList.memberPicture}</td>
		<td>${postWMList.memberName}</td>
		</c:if>
	</c:forEach>
	<td>${proTitle}</td>
</tr>
</c:forEach>
</table>


</body>
</html>