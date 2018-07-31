<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
/* 	*{
		border: 1px solid black;
	} */
</style>
<link rel="stylesheet" type="text/css" href="/resources/css/member/loginPage.css">
</head>
<body>
<script>
	function login(){
		var memberId = $('#memberId').val();
		var memberPw = $('#memberPw').val();
		var autoLogin = $('#autoLogin').prop("checked");
		$('#idTitle').css('display','');
		$('#idFailMessage').css('display','none');
		$('#pwTitle').css('display','');
		$('#pwFailMessage').css('display','none');
		$('#memberId').css('border','');
		$('#memberPw').css('border','');
		$.ajax({
			url : "/login.do",
			type : "post",
			data : {
				memberId : memberId,
				memberPw : memberPw,
				autoLogin : autoLogin
			},
			success : function(data) {
				console.log(data);
				if(data.result=='failedId'){
					$('#idTitle').css('display','none');
					$('#idFailMessage').css('display','');
					$('#memberId').css('border','3px solid red');
				} else if(data.result=='failedPw'){
					$('#pwTitle').css('display','none');
					$('#pwFailMessage').css('display','');
					$('#memberPw').css('border','3px solid red');
				}
			},
			error : function(data) {
				console.log("실패");
			}
		});
	}
</script>
<div class="row" style="margin-top: 10%;">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<center><h1>로그인</h1></center>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
					<label id="idTitle" style="margin-top: 10%;">이메일 주소</label><label id="idFailMessage" style="display: none; color: red; font-weight: bold; margin-top: 10%;">아이디를 확인해 주세요</label>
					<input type="text" class="form-control" placeholder="example@mododa.pe.kr" id="memberId" aria-label="Username" aria-describedby="basic-addon1">
					<label id="pwTitle" style="margin-top: 6%;">비밀번호(숫자, 영문 조합 최소 6자 이상)</label><label id="pwFailMessage" style="display: none; color: red; font-weight: bold; margin-top: 6%;">비밀번호를 확인해 주세요</label>
					<input type="password" class="form-control" placeholder="숫자, 영문 조합 최소 6자 이상" id="memberPw" aria-label="Userpassword" aria-describedby="basic-addon1">
					<div class="offset-md-8 col-md-4" style="margin-top: 3%;">
					<div><input type="checkbox" id="autoLogin">&nbsp;&nbsp;자동로그인</div>
					</div>
					<div class="offset-md-9 col-md-3"><center><input type="button" onclick="login();" class="btn btn-primary mb-2" value="로그인" style="margin-top: 20%; height: 100%; width: 100%;"/></center></div>
				</div>
				<div class="offset-md-5 col-md-7"><center><a id="" href="#">비밀번호를 잊으셨나요?</a></center></div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<div class="col-md-4"></div>
</div>
</body>
</html>