<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>협업툴 모두다 MODODA</title>
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
		});
		function changePw(){
			if(pwBool && rePwBool){
				return true;
			} else {
				return false;
			}
		}
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
				<form action="/findChangPw.do" method="post"
					style="padding: 5%;">
					<div class="control-group">
						<div>
							<h4 class="title ng-scope">비밀번호찾기</h4>
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
						<input type="hidden" name="key" value="${param.key }"/>
						<input onclick="return changePw();" type="submit"
							class="btn btn-primary btn-xl" id="changeBtn"
							style="margin-top: 100px;" value="변경하기">
					</div>
				</form>
			</div>
		</div>
	</center>
</body>
</html>