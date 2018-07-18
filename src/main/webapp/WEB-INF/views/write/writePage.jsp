<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
	integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
	crossorigin="anonymous"></script>
<script src="/resource/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>


<script>
	//전체화면 사이즈 구하는 jquery
	function divSize() {
		var size = $(window).height();
		$(".frameSize").css({
			"height" : size + "px"
		});
	}
	window.onload = divSize;
	window.onresize = divSize;

	var flag = true

	function hide() {
		if (flag == true) {
			$('#tempSaved').show();
			$('.colorChange').css("background-color", "#F5F5F5");
			$('.colorChange li').css("background-color", "#F5F5F5");
			$('#tempSaved').css("background-color", "#F5F5F5");
			$('#test').css('linear-gradient', '');
			$('#showBTop').css('border-top',"2px solid #F5F5F5");
			$('#showBTop').css('border-right',"2px solid #F5F5F5");
			$('#imageSpace').css('border-right','2px solid #F5F5F5');

			flag = false;
		} else {
			$('#tempSaved').hide();
			$('.colorChange').css("background-color", "white");
			$('#test').css("background-color", "white");
			$('#showBTop').css('border',"none");
			$('#imageSpace').css('border',"none");
			
			
			flag = true;
		}

	}
	
	function changeClick(){
		
		$("#searchPj").attr('type','text');
		$("#changeType").css('display','none');
	
	}
	
	
	//프로젝트 검색창 hide&show 
 	$(document).click(function(e){
		if(e.target.className == "findPj" || e.target.className == "changeType")
			{
				$("#searchPj").val("");
				$("#searchPj").focus();	
				return false;
			}
		else{
				$("#searchPj").attr('type','hidden');
				$("#changeType").css('display','block');
		}
	}); 	
 	

 	//자동완성 기능 ajax 사용해야 돼
 	$(document).ready(function(){
 		var projectNames = ['프라이빗 공간','띵킹띵킹','굿뜨굿뜨','띵킹스맨',];
 				$("#searchPj").autocomplete({
 					source:projectNames
 				});
 	});
	
	
</script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

.colorChange.list-group li {
	border-left: none;
	height: 93px;
	border-right:none;
}

div {
	overflow: hidden;
	height: auto;
}

#imageSpace {
	background-color: #F5F5F5;
}

#writeTitle {
	border: none;
}

#writeTitle:focus {
	outline: none;
}
div.tarea:focus{
	outline:none;
}
div.tarea {
  
  background-color: white;
  overflow-y:auto;
  border-bottom:4px solid #F5F5F5;
}
#searchPj{
	border:none;
}
#searchPj:focus{
	outline:none;
}
#hashTag{
	border:none;
}
#hashTag:focus{
	outline:none;
}




</style>



</head>
<body>
	<div class="frameSize col-md-12">

		<div class="container">


			<div class="row">

				<div class="col-md-2" id="test"
					style="padding-top: 40px; height: 949px">



					<div class="row">

						<div class="colorChange col-md-12" style="height: 60px;"
							onclick="hide();">
							<div class="col-md-12"
								style="text-align: center; padding-top: 15px; vertical-align: middle;">
								임시 저장 글<span>(4)</span>


							</div>


						</div>
					</div>


					<div class="row">
						<div class="col-md-12"
							style="padding: 0px; height: 849px; display: none" id="tempSaved">
							<ul class="colorChange list-group" style="text-align: center;">


								<li class="list-group-item"><span>안녕하세요</span><br> <span>2018.7.16</span><br>
									<span>프라이빗 공간</span><br></li>
								<li class="list-group-item"><span>안녕하세요</span><br> <span>2018.7.16</span><br>
									<span>프라이빗 공간</span><br></li>
								<li class="list-group-item"><span>안녕하세요</span><br> <span>2018.7.16</span><br>
									<span>프라이빗 공간</span><br></li>


							</ul>


						</div>

					</div>


				</div>
				<!-- 임시저장 공간  -->

				<div class="col-md-10">
					<div class=row style="padding-top: 40px">
						<div class="col-md-12" id="showBTop" style="height: 60px; padding-top:14px">
							<span class="changeType" style="color: #F6AD00;" id="changeType" 
							 onclick="changeClick();">프라이빗 공간</span>
							<input type="hidden" placeholder="프로젝트 검사" id="searchPj" 
							class="findPj"/>
						<div>
						</div>	
							
							
							
						</div>
					</div>
					<div class="frameSize row">


						<div class="col-md-9">
							<div class="row">
								<div class="col-md-12"
									style="height: 649px;">
									<div class="row">

										<div class="col-md-12" 
											style=" height:100%">
											<input type="text" id="writeTitle" placeholder="제목을 입력해 주세요"
												maxlength="150" style="height:50px;"/>
										</div>
									</div>
									
									<div class="frameSize row">
										<div class="col-md-12" style="border:1px solid black; height:60%">
											<div class="tarea col-md-12" contenteditable="true" 
												style="height:100%; padding-left:0px; border:1px solid black;">
											this looks like a textarea!
											
											</div>
											
											
											
											
										</div>
									
									
									</div>
								</div>
							</div>

							<div class="framSize row">
								<div class="col-md-12"
									style="height:40%;">
									<div class="row">
									<div class="col-md-12">
									<span id="hashName"></span>
									<input type="text" id="hashTag" placeholder="#해시태그로 글을 분류해 보세요"
									size="35px"/>
										
											
									
									</div>
									</div>
									
									
									
									</div>
							</div>

						</div>







						<div class="col-md-3" id="imageSpace">
							<div>파일/이미지 입력 공간</div>
							sfs
						</div>
					</div>



				</div>



			</div>

		</div>
	</div>


</body>
</html>