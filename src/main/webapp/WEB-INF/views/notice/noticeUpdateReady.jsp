<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/noticeUpdate.do" method="post">
		글번호 : ${noticeUpdateReady.noticeNo}<br>
		글쓴이 : 관리자<br>
		작성일 : ${noticeUpdateReady.noticeWriteDate}<br>
		글제목 : <input type="text" size=90 value="${noticeUpdateReady.noticeTitle}" name="noticeTitle"/><br>
		<input type="hidden" value="${noticeUpdateReady.noticeNo}" name="noticeNo"/><br>
		<textarea rows="20" cols="100" style="resize:none;" name="noticeContents"/>${noticeUpdateReady.noticeContents}</textarea>
		<br>
		<input type="submit" value="수정하기"/>
		</form>
</body>
</html>