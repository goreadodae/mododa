<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>


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
<input type="hidden" name="proMNo" value=999> <!-- 세션정보의 m_no값을 value에 넣기 -->
<input type="submit" value="생성" onClick="return submitCheck();">
</form>


<br><br><br><hr>

<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/>
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>



</body>


</html>