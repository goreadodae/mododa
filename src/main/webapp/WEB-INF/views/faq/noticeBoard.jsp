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
테스트 페이지
<h1>공지사항</h1>
<table border="1px solid black">
   <tr>
      <td>번호</td><td>제목</td><td>작성일</td><td>조회수</td>
   </tr>
<c:forEach items="${nlist}" var="n">
   <tr>
      <td>${n.noticeNo}</td>
      <td>${n.noticeTitle}</td>
      <td>${n.noticeWriteDate}</td>
      <td>${n.noticeViewCount}</td>
   </tr>
</c:forEach>
</table>
</body>
</html>