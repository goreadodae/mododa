<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>협업툴 모두다 MODODA</title>

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

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">모두다 MODODA</a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        
        <!-- 채우기 -->
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#introduce">Introduce</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="">FAQ</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="">1:1 QNA</a>
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
    <header class="masthead bg-primary text-white text-center">
      <div class="container">
        <img class="img-fluid mb-5 d-block mx-auto" src="../resources/index_img/main_logo_square_2.png" alt="">
        <h1 class="text-uppercase mb-0">Collaboration Tool</h1>
        <hr class="star-light">
        <h2 class="font-weight-light mb-0">모두다 MODODA</h2>
      </div>
    </header>

    <!-- Introduce Grid Section -->
    <section class="introduce" id="introduce">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">Introduce</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-12 mx-auto">
              <img class="img-fluid" src="../resources/index_img/intro_img/intro_1.PNG" alt="" style="padding-bottom: 100px;">
          </div>
          <div class="col-lg-12 mx-auto">
              <img class="img-fluid" src="../resources/index_img/intro_img/intro_2.PNG" alt="" style="padding-bottom: 100px;">
          </div>
          <div class="col-lg-12 mx-auto">
              <img class="img-fluid" src="../resources/index_img/intro_img/intro_3.PNG" alt="" style="padding-bottom: 100px;">
          </div>
          <div class="col-lg-12 mx-auto">
              <img class="img-fluid" src="../resources/index_img/intro_img/intro_4.PNG" alt="" style="padding-bottom: 100px;">
          </div>
          <div class="col-lg-12 mx-auto">
              <img class="img-fluid" src="../resources/index_img/intro_img/intro_5.PNG" alt="" style="padding-bottom: 100px;">
          </div>
          <div class="col-lg-12 mx-auto">
              <img class="img-fluid" src="../resources/index_img/intro_img/intro_6.PNG" alt="" style="padding-bottom: 100px;">
          </div>
          <div class="col-lg-1 mx-auto">
             <a class="portfolio-item d-block mx-auto" href="#join-modal">
              <button class="btn btn-primary btn-xl" id="sendMessageButton" style="color:#339966; font-weight:1000;">JOIN US!!</button>
             </a>
          </div>
        </div>
      </div>
    </section>



    <!-- Contact Section -->
    <!-- 여기는 혹시 회원가입 디자인 참고할 수 있을 꺼 같아서 내비둠 -->
<!--  
    <section id="contact">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">Contact Me</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <form name="sentMessage" id="contactForm" novalidate="novalidate">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Name</label>
                  <input class="form-control" id="name" type="text" placeholder="Name" required="required" data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Email Address</label>
                  <input class="form-control" id="email" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Phone Number</label>
                  <input class="form-control" id="phone" type="tel" placeholder="Phone Number" required="required" data-validation-required-message="Please enter your phone number.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label>Message</label>
                  <textarea class="form-control" id="message" rows="5" placeholder="Message" required="required" data-validation-required-message="Please enter a message."></textarea>
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <br>
              <div id="success"></div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton">Send</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
-->

   
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
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="">
                  <i class="fa fa-fw fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="">
                  <i class="fa fa-fw fa-google-plus"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="">
                  <i class="fa fa-fw fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="">
                  <i class="fa fa-fw fa-linkedin"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="">
                  <i class="fa fa-fw fa-dribbble"></i>
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
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Join Us</h2>
              <hr class="star-dark mb-5">
              
              <form name="joinModal" id="joinForm" novalidate="novalidate" action="#" method="post">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label style="margin-top: 50px;">Email Address</label>
                  <input class="form-control" id="joinEmail" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label style="margin-top: 50px;">Password</label>
                  <input class="form-control" id="joinPassword" type="password" placeholder="Password" required="required" data-validation-required-message="Please enter your password.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label style="margin-top: 50px;">Name</label>
                  <input class="form-control" id="joinName" type="text" placeholder="Name" required="required" data-validation-required-message="Please enter your name.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div id="success"></div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-xl" id="joinBtn" style="margin-top: 100px;">Join Us</button>
              </div>
              </form>
              
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Login Modal -->
    <div class="portfolio-modal mfp-hide" id="login-modal">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Login</h2>
              <hr class="star-dark mb-5">
              
              <form name="loginModal" id="loginForm" novalidate="novalidate" action="#" method="post">
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label style="margin-top: 50px;">Email Address</label>
                  <input class="form-control" id="loginEmail" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                  <label style="margin-top: 50px;">Password</label>
                  <input class="form-control" id="loginPassword" type="password" placeholder="Password" required="required" data-validation-required-message="Please enter your password.">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div id="success"></div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-xl" id="loginBtn" style="margin-top: 100px;">Login</button>
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