<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="/resources/favicon.ico">
	<link rel="shortcut icon" href="/resources/favicon.ico">
	<title>협업툴 모두다 MODODA</title>
</head>
<body>
<table class="notice_read">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35$"/>
	</colgroup>
	<caption>공지사항 게시판</caption>
<tbody>
	<tr>
		<th scope="row">작성자</th>
		<td>관리자</td>
	</tr>
	<tr>
		<th scope="row">제목</th>
		<td colspan="3">${readPage.noticeTitle}</td>
	</tr>
	<tr>
		<td colspan="4">${readPage.noticeContents}</td>
	</tr>
</tbody>
</table>

<a href="#this" class="btn" id="noticeList">목록으로</a>
<a href="#this" class="btn" id="noticeUpdate">수정하기</a>


</body>
</html>