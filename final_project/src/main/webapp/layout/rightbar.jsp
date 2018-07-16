<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: none;}
 	
</style>

<body>

<!-- 테이블을 이용한 경우 -->
<table>
	<!-- 자료실 메뉴 -->
	<tr style="float:right;">
		<td>
			<div class="btn-group">
			<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown" 
				aria-haspopup="true" aria-expanded="false">자료실</button>
				<div class="dropdown-menu">
				<a class="dropdown-item" href="#">할 일</a>
				<a class="dropdown-item" href="#">의사결정</a>
				<a class="dropdown-item" href="#">이미지</a>
				<a class="dropdown-item" href="#">파일</a>
				<a class="dropdown-item" href="#">링크</a>
				</div>
			</div>
		</td>
	</tr>
	
	<!-- 할 일 -->
	<tr>
		<td>
			<div class="dropdown-divider"></div>
		<h5>할 일</h5><br>
				
		<div class="btn-group">
  		<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" 
  			aria-haspopup="true" aria-expanded="false">
  			<img src="../resources/images/icon/checked-allot.png"></img>
  		</button>
  			<div class="dropdown-menu">
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-allot.png"></img> 할당된 할 일</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/play-button.png"></img> 진행중</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/pause.png"></img> 일시중지</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-complete.png"></img> 완료</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
   			</div>			
   		</div>
		<a href="#">할 일 제목1</a> <a href="#" style="font-size:80%">할 일 작성자</a><br>
		
		<div class="btn-group">
  		<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" 
  			aria-haspopup="true" aria-expanded="false">
  			<img src="../resources/images/icon/checked-allot.png"></img>
  		</button>
  			<div class="dropdown-menu">
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-allot.png"></img> 할당된 할 일</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/play-button.png"></img> 진행중</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/pause.png"></img> 일시중지</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-complete.png"></img> 완료</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
   			</div>			
   		</div>
		<a href="#">할 일 제목2</a> <a href="#" style="font-size:80%">할 일 작성자</a><br>
		
		</td>
	</tr>
	
	<!-- 할 일의 더보기 -->
	<tr style="float:right;">
		<td>
			<br>
			<a href="#">더보기 ></a>
		</td>
	</tr>
	
	<!-- 의사결정 -->
	<tr>
		<td>
			<div class="dropdown-divider"></div>
			<h5>의사결정</h5><br>
			<p>
			<a href="#"><img src="../resources/images/icon/decision.png"></img> 의사결정 제목1</a> <a href="#" style="font-size:80%">의사결정 지목된 사람</a> <br>
			</p>
			<p>
			<a href="#"><img src="../resources/images/icon/decision.png"></img> 의사결정 제목2</a> <a href="#" style="font-size:80%">의사결정 지목된 사람</a> <br>
			</p>
		</td>
	</tr>
	
	<!-- 의사결정의 더보기 -->
	<tr style="float:right;">
		<td>
			<br>
			<a href="#">더보기 ></a>
		</td>
	</tr>


</table>





<!-- div를 이용한 경우 -->

<!-- <div class="row">
	자료실 메뉴 버튼
	<div class="col-6 col-sm-4">
		<div style="float:right">
			<div class="btn-group">
			<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown" 
				aria-haspopup="true" aria-expanded="false">자료실</button>
				<div class="dropdown-menu">
				<a class="dropdown-item" href="#">할 일</a>
				<a class="dropdown-item" href="#">의사결정</a>
				<a class="dropdown-item" href="#">이미지</a>
				<a class="dropdown-item" href="#">파일</a>
				<a class="dropdown-item" href="#">링크</a>
				</div>
			</div>
		</div>
	</div>
	<div class="w-100 d-none d-md-block"></div>
	
	할 일
	<div class="col-6 col-sm-4">
		<div class="dropdown-divider"></div>
		<p><h5>할 일</h5></p>
				
		<div class="btn-group">
  		<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" 
  			aria-haspopup="true" aria-expanded="false">
  			<img src="../resources/images/icon/checked-allot.png"></img>
  		</button>
  			<div class="dropdown-menu">
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-allot.png"></img> 할당된 할 일</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/play-button.png"></img> 진행중</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/pause.png"></img> 일시중지</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-complete.png"></img> 완료</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
   			</div>			
   		</div>
		<a href="#">할 일 제목1</a> <a href="#" style="font-size:80%">할 일 작성자</a><br>
		
		<div class="btn-group">
  		<button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" 
  			aria-haspopup="true" aria-expanded="false">
  			<img src="../resources/images/icon/checked-allot.png"></img>
  		</button>
  			<div class="dropdown-menu">
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-allot.png"></img> 할당된 할 일</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/play-button.png"></img> 진행중</a>
    		<a class="dropdown-item" href="#"><img src="../resources/images/icon/pause.png"></img> 일시중지</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-complete.png"></img> 완료</a>
   			<a class="dropdown-item" href="#"><img src="../resources/images/icon/checked-request.png"></img> 확인요청</a>
   			</div>			
   		</div>
		<a href="#">할 일 제목2</a> <a href="#" style="font-size:80%">할 일 작성자</a><br>
		
		
		
	</div>
	<div class="w-100 d-none d-md-block"></div>
	
	할 일 더보기
	<div class="col-6 col-sm-4">
		<div style="float:right;">
			
		</div>
	</div>
	<div class="w-100 d-none d-md-block"></div>
	
	의사결정
	<div class="col-6 col-sm-4">
		<div class="dropdown-divider"></div>
			<p><h5>의사결정</h5></p>
			
			<a href="#"><img src="../resources/images/icon/decision.png"></img> 의사결정 제목1</a> <a href="#" style="font-size:80%">의사결정 지목된 사람</a> <br>
			<a href="#"><img src="../resources/images/icon/decision.png"></img> 의사결정 제목2</a> <a href="#" style="font-size:80%">의사결정 지목된 사람</a> <br>
			
	</div>
	<div class="w-100 d-none d-md-block"></div>
	
	의사결정 더보기
	<div class="col-6 col-sm-4">
		<div style="float:right;">
			<a href="#">더보기 ></a>
		</div>
	</div>
	<div class="w-100 d-none d-md-block"></div>
</div> -->


</body>
</html>