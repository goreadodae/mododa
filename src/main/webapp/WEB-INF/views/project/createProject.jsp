<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script>

/* window.onload = function() {
	
} */

function periodOff() {
	document.getElementById('periodLabel').innerHTML = " ";
}

function periodOn() {
	document.getElementById('periodLabel').innerHTML = "<input type='date' id='proStartDate' name='proStartDate'> ~ <input type='date' id='proEndDate' name='proEndDate'>";
	document.getElementById('proStartDate').valueAsDate = new Date();
	document.getElementById('proEndDate').valueAsDate = new Date();
}

function submitCheck() {
	if(document.getElementById('proTitle').value == "") {
		alert("프로젝트명을 입력해주세요.");
		return false;
	} else {
		return true;
	}
}




</script>

</head>
<body>

createProject.jsp
<br>
새 프로젝트 생성(임시)
<br>
 
<form action="/createProject.do" method="get">
프로젝트 이름 : <input type="text" name="proTitle" id="proTitle"> <br>
기간 없음 <input type="radio" name="period" onClick="periodOff();" checked> <br>
기간 있음 <input type="radio" name="period" onClick="periodOn();">
<label id="periodLabel"></label><br>
<input type="submit" value="생성" onClick="return submitCheck();">
</form>



</body>
</html>