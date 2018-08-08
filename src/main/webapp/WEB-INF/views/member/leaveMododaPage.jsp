<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="/resources/favicon.ico">
	<link rel="shortcut icon" href="/resources/favicon.ico">
	<title>협업툴 모두다 MODODA</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- Bootstrap core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<!-- Plugin CSS -->
<link href="../resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="../resources/css/index.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
</head>
<style>
</style>
<body>
	<script>
	var pwBool = false;
	var rePwBool = false;
	$(document).ready(function(){
		var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
		$('#password').keyup(function(){
  			if ($('#password').val().match(regex) != null) {
  				$('.floating-label-form-group').css('border-bottom','');
  				$('#pwTitle').text('사용가능한 비밀번호 입니다');
  				$('#pwTitle').css('color','blue');
  				pwBool = true;
  			} else if($('#password').val()==''){
  				$('#pwDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
  				$('#pwTitle').text('비밀번호를 입력해주세요');
  				$('#pwTitle').css('color','red');
  				$('#pwDiv').css('border-bottom','1px solid red');
  				pwBool = false;
  			} else {
  				$('#pwDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
  				$('#pwTitle').text('6-16자리 영문, 숫자, 특수문자 조합으로 작성해주세요');
  				$('#pwTitle').css('color','red');
  				$('#pwDiv').css('border-bottom','1px solid red');
  				pwBool = false;
  			} 
  		});
		$('#rePassword').keyup(function(){
  			if ($('#password').val() == $('#rePassword').val()) {
  				$('.floating-label-form-group').css('border-bottom','');
  				$('#rePwTitle').text('비밀번호가 일치합니다');
  				$('#rePwTitle').css('color','blue');
  				rePwBool = true;
  			} else if($('#password').val()==''){
  				$('#rePwDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
  				$('#rePwTitle').text('비밀번호를 입력해주세요');
  				$('#rePwTitle').css('color','red');
  				$('#rePwDiv').css('border-bottom','1px solid red');
  				rePwBool = false;
  			} else {
  				$('#rePwDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
  				$('#rePwTitle').text('비밀번호를 확인해주세요');
  				$('#rePwTitle').css('color','red');
  				$('#rePwDiv').css('border-bottom','1px solid red');
  				rePwBool = false;
  			}
  			console.log(pwBool);
			console.log(rePwBool);
		});
		$('#changeBtn2').click(function (){
			if(pwBool && rePwBool){
				if(confirm("정말로 탈퇴하시겠습니까?")){
					$('#changeBtn').trigger('click');
				}
			}
		})
	});
	</script>
	<center>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" id="topbar">
			<img id="logo-img"
				src="../resources/images/layout-img/main_logo_rec.png"
				style="" />
			</div>
			<div class="col-md-3" id="topbar"></div>
		</div>
		<div class="row" style="padding: 10%; padding-top: 3%;">
			<div class="offset-md-3 col-md-6 shadow p-3 mb-5 bg-white rounded">
				<form action="/leaveMododa.do" method="post"
					style="padding: 5%;">
					<div class="control-group">
						<div>
							<h4 class="title ng-scope">탈퇴하기</h4>
						</div>
					</div>
					<div class="control-group">
						<div id="pwDiv"
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label id="pwTitle" style="margin-top: 50px;">Password</label>
							<input class="form-control" name="memberPw" id="password"
								type="password" placeholder="Password (6-16자리 영문, 숫자, 특수문자 조합)"
								required="required"
								data-validation-required-message="Please enter your password.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div id="rePwDiv"
							class="form-group floating-label-form-group controls mb-0 pb-2">
							<label id="rePwTitle" style="margin-top: 50px;">Password</label>
							<input class="form-control" name="memberRePw" id="rePassword"
								type="password" placeholder="비밀번호를 다시 입력해주세요"
								required="required"
								data-validation-required-message="Please enter your password.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div id="success"></div>
					<div class="form-group">
						<input type="hidden" name="memberId" value="${sessionScope.member.memberId }"/>
						<input type="submit"
							class="btn btn-primary btn-xl" id="changeBtn"
							style="display: none;" value="변경하기">
					</div>
				</form>
				<button class="btn btn-primary btn-xl" id="changeBtn2"
							style="margin-top: 50px; margin-bottom: 50px;">탈퇴하기</button>
			</div>
		</div>
	</center>
</body>
</html>