<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항-협업툴 모두다 MODODA</title>

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

  <style>
     .floating-label-form-group div {
      border-bottom: 1px solid #e9ecef;
   }
   @media screen and (max-width: 768px){
      #mainNav{
         min-width: 768px;
      }
   }
   @media (max-width: 768px){
      header.masthead, section.introduce
      , footer.footer, .copyright,.mfp-bg.mfp-ready{
          min-width: 786px;
       }
       .portfolio-modal-dialog{
          min-width: 786px !important;
          margin: none !important;
       }
       .nav-item{
         height: 100px;
         border-bottom: 1px solid white;
      }
      .nav-item>a:active{
         color: #339966;
          background: #CFF09E;
      }
      .nav-item>label{
         width: 100%;
      }
      .nav-item:last-child{
         border-bottom: none;
      }
      .nav-item>a, .nav-item>label{
         margin-top: 20px;
         margin-bottom: 20px;
      }
      #menuBtn{
         color: black !important;
      }
      #sendMessageButton{
         margin-left: 39%;
      }
   }
  </style>
  </head>

  <body id="page-top">
     <script>
     var boolEmail;
     var boolName;
     var boolPass;
     var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 정규표현식

     function login(){
        var loginResult = false;
        var memberId = $('#memberId').val();
        var memberPw = $('#memberPw').val();
        $('#pwDiv').css('border-bottom','');
        $('#emailDiv').css('border-bottom','');
        if($("input:checkbox[id='autoLogin']").is(":checked")){
           $('#autoLoginHidden').val("true");
        } else {
           $('#autoLoginHidden').val("false");
        }
        $.ajax({
           url : "/checkLogin.do",
           type : "post",
           async : false,
           data : {
              memberId : memberId,
              memberPw : memberPw
           },
           success : function(data) {
              if(data.result=='failedId'){
                 $('#idTitle').text('이메일을 확인해주세요.');
                 $('#idTitle').css('color','red');
                 $('#emailDiv').css('border-bottom','1px solid red');
                 $('#pwDiv').css('border-bottom','');
                 loginResult = false;
              } else if(data.result=='failedPw' || memberPw==''){
                 $('#pwTitle').text('비밀번호를 확인해주세요.');
                 $('#pwTitle').css('color','red');
                 $('#pwDiv').css('border-bottom','1px solid red');
                 $('#emailDiv').css('border-bottom','');
                 loginResult = false;
              } else {
                 loginResult = true;
              }
           },
           error : function(data) {
              console.log("실패");
           }
        });
        return loginResult;
     }

     $(document).ready(function(){
        $('input').keyup(function(){
           if($('input:focus').val()==''){
              $('input:focus').parents('div').css('border-bottom','');
           }
        });
        $('#memberId').keyup(function(){
           if ($('#memberId').val().match(regExp) == null && $('#memberId').val() != '') {
              $('#idTitle').text('이메일 형식이 아닙니다.');
              $('#idTitle').css('color','red');
              $('#emailDiv').css('border-bottom','1px solid red');
              $('#pwDiv').css('border-bottom','');
           } else {
              $('.floating-label-form-group').css('border-bottom','');
              $('#idTitle').text('  ');
           }
        });
     });


     $(document).ready(function(){
        var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;//비밀번호 정규식(6-16자리 영문, 숫자, 특수문자 조합)
        $('#joinEmail').keyup(function(){
           if ($('#joinEmail').val().match(regExp) != null) {
              $.ajax({
                 url : "/checkEmail.do",
                 type : "post",
                 data : {
                    memberId : $('#joinEmail').val()
                 },
                 success : function(data) {
                    if(data.result){
                       console.log($('#joinEmail').val());
                       $('#joinEmailTitle').text('이미 가입된 이메일입니다.');
                       $('#joinEmailTitle').css('color','red');
                       $('#emailDiv').css('border-bottom','1px solid red');
                       boolEmail = false;
                    } else {
                       $('.floating-label-form-group').css('border-bottom','');
                       $('#joinEmailTitle').text('사용 가능한 이메일 입니다.');
                       $('#joinEmailTitle').css('color','blue');
                       boolEmail = true;
                    }
                 },
                 error : function(data) {
                    console.log("실패");
                 }
              });
           } else if($('#joinEmail').val()==''){
              $('#emailDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
              $('#joinEmailTitle').text('이메일을 입력해주세요.');
              $('#joinEmailTitle').css('color','red');
              $('#emailDiv').css('border-bottom','1px solid red');
              boolEmail = false;
           } else {
              $('#joinEmailTitle').text('이메일 형식으로 작성해주세요.');
              $('#joinEmailTitle').css('color','red');
              $('#emailDiv').css('border-bottom','1px solid red');
              boolEmail = false;
           }
           
        });
        $('#joinPassword').keyup(function(){
           if ($('#joinPassword').val().match(regex) != null) {
              $('.floating-label-form-group').css('border-bottom','');
              $('#joinPwTitle').text('사용 가능한 비밀번호 입니다.');
              $('#joinPwTitle').css('color','blue');
              boolPass = true;
           } else if($('#joinPassword').val()==''){
              $('#pwDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
              $('#joinPwTitle').text('비밀번호를 입력해주세요.');
              $('#joinPwTitle').css('color','red');
              $('#pwDiv').css('border-bottom','1px solid red');
              boolPass = false;
           } else {
              $('#joinPwTitle').text('6-16자리 영문, 숫자, 특수문자 조합으로 작성해주세요.');
              $('#joinPwTitle').css('color','red');
              $('#pwDiv').css('border-bottom','1px solid red');
              boolPass = false;
           } 
        });
        $('#joinName').keyup(function(){
           if ($('#joinName').val() != '') {
              $('.floating-label-form-group').css('border-bottom','');
              $('#nameTitle').text('사용 가능한 이름 입니다.');
              $('#nameTitle').css('color','blue');
              boolName = true;
           } else if($('#joinName').val()==''){
              $('#nameDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
              $('#nameTitle').text('이름을 입력해주세요.');
              $('#nameTitle').css('color','red');
              $('#nameDiv').css('border-bottom','1px solid red');
              boolName = false;
           } else {
              $('#nameTitle').text('이름을 입력해주세요.');
              $('#nameTitle').css('color','red');
              $('#nameDiv').css('border-bottom','1px solid red');
              boolName = false;
           }
        });
     });
     function join(){
        var joinEmail = $("#joinEmail").val();
        var joinPassword = $("#joinPassword").val();
        var joinName = $("#joinName").val();
        $('.form-group').css('border-bottom','');
        if(joinEmail==''){
           $('#emailDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
           $('#joinEmailTitle').text('이메일을 입력해주세요.');
           $('#joinEmailTitle').css('color','red');
           $('#emailDiv').css('border-bottom','1px solid red');
        } else if(joinPassword==''){
           $('#pwDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
           $('#joinPwTitle').text('비밀번호를 입력해주세요.');
           $('#joinPwTitle').css('color','red');
           $('#pwDiv').css('border-bottom','1px solid red');
        } else if(joinName==''){
           $('#nameDiv').attr('class','form-group floating-label-form-group controls mb-0 pb-2 floating-label-form-group-with-value');
           $('#nameTitle').text('이름을 입력해주세요.');
           $('#nameTitle').css('color','red');
           $('#nameDiv').css('border-bottom','1px solid red');         
        } else {
           if(boolEmail && boolName && boolPass){
              return true;
           }
        }
        
        return false;
     }

     function findPassword(){
        var fpResult = false;
        var memberIdForFind = $("#memberIdForFind").val();
        $.ajax({
            url : "/checkEmail.do",
            type : "post",
            async : false,
            data : {
               memberId : memberIdForFind
            },
            success : function(data) {
               if(data.result){
                  fpResult = true;
               } else {
                  $('#fpTitle').text('가입되지 않은 이메일입니다.');
                  $('#fpDiv').css('border-bottom','1px solid red');
                  $('#fpTitle').css('color','red');
                  fpResult = false;
               }
            },
            error : function(data) {
               console.log("실패");
            }
         });
        return fpResult;
     }
     </script>
     <c:if test="${cookie.loginCookie.value!=null }">
        <script>//쿠키값이 있는지 확인
           location.href="/mainPage.do";
        </script>
     </c:if>
     <c:if test="${sessionScope.member!=null }">
        <script type="text/javascript">//세션이 있는지 확인
         location.href="/mainPage.do";
        </script>
     </c:if>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="/index.jsp">모두다 MODODA</a>
        <button id="menuBtn" class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        
        <!-- 채우기 -->
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/index.jsp#introduce">Introduce</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/noticeList.do?currentPage=1">Notice</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/qnaList.do?currentPage=1">1:1 QNA</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded portfolio-item d-block mx-auto" href="#join-modal">Join</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <label style="border: 3px dashed white; border-radius:15px;">
              <a class="nav-link py-3 px-0 px-lg-3 rounded portfolio-item d-block mx-auto" href="#login-modal">Login</a>
              </label>
            </li>
          </ul>
        </div>
      </div>
    </nav>




    <!-- Header -->
    <header class="masthead bg-primary text-white text-center" style="padding-bottom:1%;">
      <div class="container">
        <img class="img-fluid mb-5 d-block mx-auto" src="../resources/images/layout-img/main_logo_rec.png" alt="" id="mododaImg" width="40%">
        <h1 class="text-uppercase mb-0">Notice</h1>
        <hr class="star-light" style="max-width:45rem;">
      </div>
    </header>
    
    
    <div class="text-center">
   
   <!-- 여기 안쪽 부분 수정하면 됨 -->
   <div style="margin-left:15%; margin-right:15%; padding-top:3%; padding-bottom:3%;">
   
   
      <table class="table table-striped table-hover">
        <thead>
          <tr>
               <th scope="col">번호</th>
               <th scope="col">제목</th>
               <th scope="col">작성자</th>
               <th scope="col">작성일</th>
               <th scope="col">조회수</th>
          </tr>
       </thead>
        <tbody>
         <c:forEach items="${listNotice}" var="n">
   <tr>
      <td>${n.noticeNo}</td>
      <td><a href="/noticeDetail.do?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
      <td>관리자</td>
      <td>${n.noticeWriteDate}</td>
      <td>${n.noticeViewCount}</td>
   </tr>
	</c:forEach>
	
	<form action="/noticeSearch.do" method="get" style=display:inline;>
	<select name="searchOption">
	<option value="title" selected>제목</option>
	<option value="contents">내용</option>
	</select>
	<input type="text" name="search" placeholder="검색" id="search">
	<input type="submit" value="검색">
</form>
<form action="/writeReady.do">
		<input type="submit" value="글쓰기"> 
	</form>
	
        </tbody>
      </table>

   </div>
   
   
      <div class="btn-group mr-2" role="group" aria-label="첫번째 그룹">
       <button type="button" class="btn btn-secondary">${listCount}</button>
        </div>
   
   
      <div style="margin-left:15%; margin-right:15%; padding-top:3%; padding-bottom:3%;">
      <center>
      <div style="width:40%;">
      <form>
      <select class="form-control" style="width:20%; float:left;">
        <option>Default select</option>
      </select>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" style="width:60%; float:left;">
      <button type="submit" class="btn btn-primary" style="width:20%;">Submit</button>
      </form>
      </div>
      </center>
      </div>
   
   
    
    </div>



   
    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <div class="row">
         
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">TEAM</h4>
            <p class="lead mb-0">"THINKING THINKING"<br>
            </p>
          </div>

          <div class="col-md-4">
            <h4 class="text-uppercase mb-4">MEMBER</h4>
            <p class="lead mb-0" style="font-size:15px;">
            KIM YE JIN<br>
            KIM JOON SEOK<br>
            KIM JI EUN<br>
            RYU HOON HYEONG<br>
            "LEADER" LEE SEUNG JAE<br>
            HAN SO WON<br>
            HAN A REUM<br>
            HAN YEONG JIN
            </p>
          </div>
          
          <!-- 채우기 -->
          
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Around the Web</h4>
            <ul class="list-inline mb-0">
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" onClick="alert('서비스 준비 중입니다.');">
                  <i class="fa fa-fw fa-facebook" style="padding-top:8px;"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" onClick="alert('서비스 준비 중입니다.');">
                  <i class="fa fa-fw fa-google" style="padding-top:8px;"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" onClick="alert('서비스 준비 중입니다.');">
                  <i class="fa fa-fw fa-twitter" style="padding-top:8px;"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" onClick="alert('서비스 준비 중입니다.');">
                  <i class="fa fa-fw fa-linkedin" style="padding-top:8px;"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" onClick="alert('서비스 준비 중입니다.');">
                  <i class="fa fa-fw fa-dribbble" style="padding-top:8px;"></i>
                </a>
              </li>
            </ul>
          </div>
          
        </div>
      </div>
    </footer>

    <div class="copyright py-4 text-center text-white">
      <div class="container">
        <small>Copyright &copy;<br>KH정보교육원 Final Project 2018.08 <br>Team : 띵킹띵킹</small>
      </div>
    </div>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>

   
   
   
   <!-- 채우기 -->
   <!-- 로그인 회원가입 모달 -->
   <!-- 회원가입은 기본적인 입력만 일단 만들었음~!-->
   <!-- 기능이랑 잘 연동되는지는 나더 멀라~! -->
   <!-- 기존에 검증하던 코드들이 아마두 id들이 바뀌면서 에러~! -->
   
   
   
    <!-- Modals -->

    <!-- Join Modal -->
    <div class="portfolio-modal mfp-hide" id="join-modal">
      <div class="portfolio-modal-dialog bg-white" style="height: 500px; width: 50%; margin: 0 auto; min-width: 400px; min-height: 900px;">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row" style="margin-top: 5%;">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Join Us</h2>
              <hr class="star-dark mb-5">
              <form action="/join.do" method="post">
              <div class="control-group">
                <div id="emailDiv" class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label id="joinEmailTitle" style="margin-top: 50px;">Email Address</label>
                  <input class="form-control emailId" name="memberId" id="joinEmail" type="email" placeholder="Email Address (mododa@mododa.pe.kr)" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div id="pwDiv" class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label id="joinPwTitle" style="margin-top: 50px;">Password</label>
                  <input class="form-control" name="memberPw" id="joinPassword" type="password" placeholder="Password (6-16자리 영문, 숫자, 특수문자 조합)" required="required" data-validation-required-message="Please enter your password.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div id="nameDiv" class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label id="nameTitle" style="margin-top: 50px;">Name</label>
                  <input class="form-control" name="memberName" id="joinName" type="text" placeholder="Name (1~20자)" required="required" data-validation-required-message="Please enter your name." maxlength="20">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div id="success"></div>
              <div class="form-group">
                <input onclick="return join();" type="submit" class="btn btn-primary btn-xl" id="joinBtn" style="margin-top: 100px;" value="Join Us">
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Login Modal -->
    <div class="portfolio-modal mfp-hide" id="login-modal">
      <div class="portfolio-modal-dialog bg-white" style="height: 10px; width: 50%; margin: 0 auto; min-width: 400px; min-height: 900px;">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row" style="margin-top: 5%;">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Login</h2>
              <hr class="star-dark mb-5">
              <form id="loginForm" action="/login.do" method="post" onsubmit="return login();">
              <div class="control-group">
                <div id="emailDiv" class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label id="idTitle" style="margin-top: 50px;"></label>
                  <input class="form-control emailId" id="memberId" name="memberId" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div id="pwDiv" class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label id="pwTitle" style="margin-top: 50px;"></label>
                  <input class="form-control" id="memberPw" name="memberPw" type="password" placeholder="Password" required="required" data-validation-required-message="Please enter your password.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div id="success"></div>
              <div style="margin-top: 5%; margin-left: 60%;"><a class="portfolio-item" href="#FindPassword-modal" style="color: #FF5F2E;">비밀번호를 잊으셨나요?</a></div>
              <div class="checkbox checkbox-success" style="margin-top: 5%; margin-left: 70%;">
              <input class="styled" type="checkbox" id="autoLogin" style="height: 20px; width: 20px; font-size: 15px;" >
              &nbsp;&nbsp;<label for="autoLogin">자동로그인</label></div>
              <input type="hidden" id="autoLoginHidden" name="autoLogin" value="false"/>
              <div class="form-group">
                <input type="submit" class="btn btn-primary btn-xl" id="loginBtn" style="margin-top: 100px;" value="Login"/>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
   <!-- FindPassword Modal -->
    <div class="portfolio-modal mfp-hide" id="FindPassword-modal">
      <div class="portfolio-modal-dialog bg-white" style="height: 600px; width: 50%; margin: 0 auto; min-width: 400px; min-height: 200px;">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">비밀번호 찾기</h2>
              <hr class="star-dark mb-5">
              <form action="/findPassword.do" method="post" onsubmit="return findPassword();">
              <div class="control-group">
                <div id="fpDiv" class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label id="fpTitle" style="margin-top: 50px;"></label>
                  <input class="form-control emailId" id="memberIdForFind" name="memberId" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-primary btn-xl" style="margin-top: 100px;" value="비밀번호 변경 메일 발송"/>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Bootstrap core JavaScript -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Custom scripts for this template -->
       <script src="../resources/js/index.min.js"></script>

  </body>
</html>