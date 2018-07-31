<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <tr>
      <td>${noticeDetail.noticeNo}</td>
      <td>${noticeDetail.noticeTitle}</td>
      <td>${noticeDetail.noticeContents}</td>
      <td>${noticeDetail.noticeWriteDate}</td>
      <td>${noticeDetail.noticeViewCount}</td>
   </tr>

<form action="/noticeDelete.do">
		<input type="submit" value="글삭제"> 
		<input type="hidden" value="${noticeDetail.noticeNo}" name="noticeNo">
	</form>
<form action="/noticeUpdateReady.do">
		<input type="submit" value="글수정"> 
		<input type="hidden" value="${noticeDetail.noticeNo}" name="noticeNo">
	</form>	

</body>
</html>