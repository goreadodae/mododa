<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form action="/noticeWrite.do">
			글제목:<input type="text" size=90 name="title" /><br>
			<textarea rows="20" cols="100" name="contents"
				style="resize: none;"></textarea>
			<br> <input type="submit" value="작성하기">
		</form>
		<button type="button" onclick="back();">목록</button>

	</div>

	
</body>
</html>