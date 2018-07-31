<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항</h1>
<table border="1px solid black">
   <tr>
      <td>번호</td><td>제목</td><td>작성일</td><td>조회수</td>
   </tr>
 
<c:forEach items="${searchList}" var="s">
   <tr>
      <td>${s.noticeNo}</td>
      <td><a href="/noticeDetail.do?noticeNo=${s.noticeNo}">${s.noticeTitle}</a></td>
      <td>${s.noticeWriteDate}</td>
      <td>${s.noticeViewCount}</td>
   </tr>
</c:forEach>
<form action="/noticeSearch.do" method="get" style=display:inline;>
	<select name="searchOption">
	<option value="title" selected>제목</option>
	<option value="contents">내용</option>
	</select>
	<input type="text" name="search" placeholder="검색" id="search">
	<input type="submit" value="검색">
</form>
</table>
<div>${searchCount}</div>

</body>
</html>