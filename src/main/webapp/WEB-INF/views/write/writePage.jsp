<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>


<script src="/resources/js/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<head>
<!--   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript"></script> -->
<script src="http://cdn.embed.ly/jquery.embedly-3.0.5.min.js" type="text/javascript"></script>
<script src="http://cdn.embed.ly/jquery.preview-0.3.2.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://cdn.embed.ly/jquery.preview-0.3.2.css" />
</head>



<!-- 파일 업로드  -->
<!-- <script src="path/to/your/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
 -->



<script>
	$.noConflict
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
			$('#showBTop').css('border-top', "2px solid #F5F5F5");
			$('#showBTop').css('border-right', "2px solid #F5F5F5");
			$('#imageSpace').css('border-right', '2px solid #F5F5F5');
			$("#hideList")
					.append(
							'<img src="/resources/images/writeImages/left-arrow.png"/>');
			$("#forClear").append(
					'<img src="/resources/images/writeImages/tmpSave.png"/>');
			$('#imageSpace').addClass('border-right');

			flag = false;
		} else {
			$('#tempSaved').hide();
			$('.colorChange').css("background-color", "white");
			$('#test').css("background-color", "white");
			$('#showBTop').css('border', "none");
			$('#imageSpace').css('border', "none");
			$("#forEmptyImg img").remove();
			$('#imageSpace').removeClass('border-right');
			flag = true;
		}

	}

	function changeClick() {
		console.log($("#memberNo").val());

		$("#searchPj").attr('type', 'text');
		$("#changeType").css('display', 'none');

	}

	//프로젝트 검색창 hide&show 
	$(document).click(
			function(e) {
				if (e.target.className == "findPj"
						|| e.target.className == "changeType") {
					$("#searchPj").val("");
					$("#searchPj").focus();
					return false;
				} else {
					$("#searchPj").attr('type', 'hidden');
					$("#changeType").css('display', 'block');
				}
			});

	//자동완성 기능 ajax 사용해야 돼

	$(document).ready(function() {

		var projectNames = [ '프라이빗 공간', '띵킹띵킹', '굿뜨굿뜨', '띵킹스맨', ];
		var searchText = [];

		$("#searchPj").autocomplete({
			source : function(request, response) {
				$.ajax({
					type : "post",
					url : "/autoComplete.do",
					dataType : "json",
					data : {
						searchValues : request.term,
						memberNo : $("#memberNo").val()

					},
					success : function(data) {
						console.log("성공");
						console.log(data[0].proTitle);

						for (var i = 0; i < data.length; i++) {

							response($.map(data, function(item) {
								return {

									label : data[i].proTitle,
									value : data[i].proTitle
								}
							}));
						}
					},
					error : function(data) {
						console.log("에러");
					}

				})
			},
			minLength : 1
		});
	});

	//파일 이미지 업로드
	window.URL = window.URL || window.webkitURL;

	/* 	var fileSelect = document.getElementById("fileSelect");
	 var filesElem = document.getElementById("fileElem"); */
	var imgCount = 0;
	var filesLength = 0;
	var img;
	function readURL(files) {
		if (!files.length) {
			alert("No files selected!");
		} else {
			filesLength += files.length;

			console.log(filesLength);

			for (i = 0; i < files.length; i++) {

				img = document.createElement("img");
				img.src = window.URL.createObjectURL(files[i]);
				img.style.height = 100 + '%';
				img.style.width = 100 + '%';

				img.onload = function() {
					window.URL.revokeObjectURL(this.src);
				}
				$(
						'<div class="col-md-6" style="height:50%; padding-top:5%;"><div class="col-md-12" style="border: 1px solid #339966; height: 80px; padding:0%;">'
								+ img.outerHTML + '</div></div>').appendTo(
						$('#divEnter'));

				imgCount++;

			}

			if (files.length >= 4 || imgCount >= 4) {
				$('#moreViewText').css('display', 'block');

			}

		}

	}

	//더 보기
	var convertMoreView = true;
	$(document).ready(function() {
		$('#moreViewFn').click(function() {
			if (convertMoreView) {

				$('#moreViewDiv').removeClass('moreViewDiv');
				$('#moreViewFn').text("접어 두기");
				convertMoreView = false;
			} else {

				$('#moreViewDiv').addClass('moreViewDiv');
				$('#moreViewFn').text("더 보기");
				convertMoreView = true;
			}

		});

	});

	//modal 후  처리..!
	function closeBtn() {

		var result = window.confirm("정말 종료하시겠습니까??");
		if (result == true) {
			/* 			$('#toWrite').hide();
			 $('div').removeClass('modal-backdrop fade show'); */

			history.back();
		} else {
			return false;
		}

	}

	$(document).ready(function() {
		$('#closeRWrite').click(function() {
			console.log("클릭");
			$('#relationWrite').hide();

		});

	})

	/* 	$(document).ready(function(){
	 window.onload
	
	
	 }); */

	/*  	$(document).ready(function () {

	 $('#toWriteFn').click(function () {
	 $('#Modal').modal({
	 show: true
	 })
	 });

	 $('.modal').on('show.bs.modal', function (event) {
	 var idx = $('.modal:visible').length;
	 $(this).css('z-index', 1040 + (10 * idx));
	 });
	 $('.modal').on('shown.bs.modal', function (event) {
	 var idx = ($('.modal:visible').length) - 1; // raise backdrop after animation.
	 $('.modal-backdrop').not('.stacked').css('z-index', 1039 + (10 * idx));
	 $('.modal-backdrop').not('.stacked').addClass('stacked');
	 });


	 }); 
	 */
</script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
/* div {
	margin: 0px;
	padding: 0px;
	-webkit-box-sizing: border-box !important;
	-mox-box-sizing: border-box !important;
	box-sizing: border-box !important;
} */
.colorChange.list-group li {
	border-left: none;
	height: 93px;
	border-right: none;
}

div {
	height: auto;
}

#imageSpace {
	background-color: #F5F5F5;
	overflow-y: auto;
}

#writeTitle {
	border: none;
	font-size: 20px;
}

#writeTitle:focus {
	outline: none;
}

div.tarea:focus {
	outline: none;
}

div.tarea {
	background-color: white;
	overflow-y: auto;
	border-bottom: 4px solid #F5F5F5;
}

#searchPj {
	border: none;
}

#searchPj:focus {
	outline: none;
}

#hashTag {
	border: none;
}

#hashTag:focus {
	outline: none;
}

img {
	margin-left: auto;
	margin-right: auto;
	vertical-align: middle;
	display: block;
}

#addImg {
	cursor: pointer;
}

#toAddImg img {
	width: 100%;
	height: 100%;
}

#partnerImg div {
	border: 1px solid white;
	width: 24px;
	height: 24px;
	-webkit-border-radius: 100px;
	-moz-border-radius: 100px;
}

#defaultPartnerPic {
	background-image: url("/resources/images/writeImages/user.png");
	background-size: cover;
}

#addPartnerPic {
	background-image: url("/resources/images/writeImages/add-button.png");
	background-size: cover;
}

#partnerImg div img {
	width: 100%;
	height: 100%;
}

#addPartnerPic {
	cursor: pointer;
}

#closeFrame {
	background-image: url("/resources/images/writeImages/close.png");
	background-size: cover;
}

#relationSearch:focus {
	outline: none;
}

#closeBtn:focus {
	outline: none;
}

.dropdown-item:hover {
	background-color: #CFF09E !important;
}

.dropdown-item:focus {
	cursor: pointer !important;
}

.moreViewDiv {
	height: 40%;
	overflow: hidden;
	text-overflow: ellipsis;
}

#relationList li {
	height: 100px;
	padding-top: 0;
}

/* #modalBody {
	overflow-y: scroll;
} */
</style>



</head>
<body>
	<div class="frameSize col-md-12">
		<%-- 		<div class="row" style="height: 15%;">
			<div class="col-md-12" style="height: 100%;">
				<jsp:include page="/layout/header.jsp"></jsp:include>
			</div>
		</div> --%>


		<!-- <div class="row" style="height: 100%; padding:0px" > -->


		<div class="container" style="height: 100%; padding: 0px">

			<!-- 			<div class="row" style="height: 10%">
				<div class="col-md-12" style="padding: 0px">
				</div>
			</div> -->

			<div class="row" style="height: 100%; padding: 0px;">

				<div class="col-md-3" id="test" style="padding-top: 40px; height: 100%;">


					<div class="row" style="height: 10%">

						<div class="colorChange col-md-12" style="height: 100%;" onclick="hide();">
							<div class="col-md-12" style="text-align: center; padding-top: 10px; vertical-align: middle; height: 100%">
								<div class="row" id="forEmptyImg" style="padding-top: 5px">
									<span id="hideList"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;임시 저장 글 <span>(4)</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div id="forClear"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="height: 90%">

						<div class="col-md-12 border-right" style="padding: 0px; height: 100%; display: none" id="tempSaved">
							<ul class="colorChange list-group" style="text-align: left;">

								<li class="list-group-item"><span>안녕하세요</span> <br> <span style="color: #B8B8B8">2018.7.16</span> <br> <span style="color: #339966">프라이빗 공간</span> <br></li>
								<li class="list-group-item"><span>안녕하세요</span> <br> <span style="color: #B8B8B8">2018.7.16</span> <br> <span style="color: #339966">프라이빗 공간</span> <br></li>
								<li class="list-group-item"><span>안녕하세요</span> <br> <span style="color: #B8B8B8">2018.7.16</span> <br> <span style="color: #339966">프라이빗 공간</span> <br></li>

							</ul>


						</div>

					</div>


				</div>
				<!-- 임시저장 공간  -->

				<div class="col-md-9" style="height: 100%">

					<div class="row" style="padding-top: 40px; height: 15%;">
						<div class="col-md-12" id="showBTop" style="height: 100%; padding-top: 14px;">
							<div class="row" style="padding-left: 15px; height: 100%;">
								<div class="col-md-2" style="height: 100%; padding: 0px">
									<span class="changeType" style="color: #F6AD00;" id="changeType" onclick="changeClick();">프라이빗 공간</span> <input type="hidden" placeholder="프로젝트 검사" id="searchPj" class="findPj" /> <input
										type="hidden" id="memberNo" value="${sessionScope.member.memberNo}" />
								</div>
								<div class="col-md-10">
									<div class="row" style="height: 100%">
										<div class="offset-md-5 col-md-2">
											<!-- 파트너 아이콘 불러오기 -->
											<div class="row" id="partnerImg" style="height: 100%; float: right">

												<div style="position: relative;" id="defaultPartnerPic"></div>



												<!-- 파트너 불러오기 !! ajax로 하기!  -->
												<div class="dropup" style="height: 100%">

													<div data-toggle="dropdown" id="addPartnerPic" role="button"></div>
													<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
														<button class="dropdown-item" type="button">Action</button>
														<button class="dropdown-item" type="button">Action</button>
														<button class="dropdown-item" type="button">Action</button>
													</ul>

												</div>




											</div>

										</div>

										<div class="offset-md-1 col-md-4">

											<!-- 페이지 닫기  -->
											<div class="col-md-1" style="height: 32px; float: right;">
												<button onclick="closeBtn()" id="closeBtn" type="button" class="close" aria-label="Close" style="height: 100%">
													<span aria-hidden="true" style="height: 100%;">&times;</span>
												</button>
											</div>


										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="height: 85%">
						<div class="col-md-8" style="height: 100%">
							<div class="row" style="height: 85%">
								<div class="col-md-12" style="height: 100%;">
									<div class="row" style="height: 10%">
										<div class="col-md-12" style="height: 100%;">
											<input type="text" id="writeTitle" placeholder="제목을 입력해 주세요" maxlength="30" size="30" style="height: 100%;" />
										</div>
									</div>
									<div class="row" style="height: 90%">
										<div class="col-md-12" style="height: 100%">
											<div class="tarea col-md-12" contenteditable="true" style="height: 100%; padding-left: 0px;">this looks like a textarea!</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row" style="height: 15%">
								<div class="col-md-12" style="height: 100%;">
									<div class="row">
										<div class="col-md-12">
											<span id="hashName"></span> <input type="text" id="hashTag" placeholder="#해시태그로 글을 분류해 보세요" size="35px" />


										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4 imageSpace" id="imageSpace" style="height: 100%">
							<div class="row moreViewDiv" id="moreViewDiv">
								<div class="col-md-12" style="height: 10%;">
									<b>파일/이미지</b>
								</div>
								<div class="col-md-12" style="height: 90%;">
									<div class="row" id="divEnter" style="height: 100%;">
										<div class="col-md-6" style="padding-top: 5%; cursor: pointer">
											<!-- <br -->
											<div class="col-md-12" style="border: 1px solid #339966; height: 80px;" onclick="document.all.fileElem.click();" id="fileSelect">

												<br>
												<!-- div 버튼 클릭시 아래 버튼 동작! -->
												<img src="/resources/images/writeImages/plus.png" />
												<!-- 파일업로드 버튼 숨겨져있음!  -->
												<input id="fileElem" name="filesUpload" multiple type="file" style="display: none" onchange="readURL(this.files);" />
											</div>




										</div>

									</div>

								</div>
							</div>

							<div class="row" style="display: none; boder: 1px solid black;" id="moreViewText">

								<div class="offset-md-4 col-md-8">
									<span style="text-align: center; cursor: pointer;" id="moreViewFn">더 보기</span>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									링크 <span>0</span>
								</div>
								<div class="row"></div>
							</div>
							<br>
							<!-- 일정 창  -->
							<div class="row">
								<div class="col-md-12">
									일정 <span>0</span>
								</div>

								<div class="col-md-6" style="padding-top: 5%; cursor: pointer;">
									<!-- <br -->
									<div class="col-md-12" style="border: 1px solid #339966; height: 80px;">

										<br> <img src="/resources/images/writeImages/plus.png" />
									</div>




								</div>




							</div>
							<br>


							<!--  관련 글  -->
							<div class="row">
								<div class="col-md-12">
									관련 글 <span>0</span>
								</div>
								<!-- 모달 버튼 시작  -->
								<div class="col-md-6" data-toggle="modal" data-target="#relationWrite" style="padding-top: 5%; cursor: pointer;">
									<!-- <br -->
									<div class="col-md-12" style="border: 1px solid #339966; height: 80px;">

										<br> <img src="/resources/images/writeImages/plus.png" />
									</div>




								</div>
								<!-- 모달 버튼 끝 -->

								<!-- 모달 시작 -->
								<div class="modal fade" tabindex="-1" role="dialog" id="relationWrite" aria-hidden="true">
									<!-- <div class="container" style="height:80%"> -->
									<div class="modal-dialog" role="document" style="background-color: white; height: 90%">
										<div class="modal-content" style="height: 100%; z-index: 1070;">

											<!-- 관련 글 헤더  -->
											<div class="modal-header" style="height: 10%; border: none !important;">
												<h5 class="modal-title" id="exampleModalLongTitle">관련 글 추가</h5>
												&nbsp;&nbsp; <span class="changeType" style="color: #F6AD00;" id="changeType" onclick="changeClick();">프라이빗 공간</span> <input type="hidden" placeholder="프로젝트 검사" id="searchPj"
													class="findPj" />

												<button type="button" class="close" id="closeRWrite" data-dismiss="modal" aria-label="Close" style="cursor: pointer;">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<!-- 검색창 -->
											<div class="modal-header" style="height: 10%;">


												<div class="col-md-12" style="height: 100%; padding: 0px">
													<input type="text" id="relationSearch" placeholder="관련 글 제목/작성자 검색" style="height: 100%; width: 100%; border: none;" />
												</div>

											</div>


											<div class="modal-body" style="height: 70%; padding: 0px">
												<div class="col-md-12" id="modalBody" style="overflow-y: auto; height: 100%; padding: 0px">
													<ul class="list-group" id="relationList">
														<li class="list-group-item" style="padding-top: 10px;">

															<div class="row" style="border: 1px solid black; height: 50%">
																<div class="col-md-12" style="height: 100%">
																	<input type="checkbox" style="height: 100% !important; vertical-align: middle"><span>모두다 기획의도</span>
																</div>
															</div>
															<div class="row" style="height: 50%">

																<div class="col-md-12" style="border: 1px solid black; height: 100%">

																	<h6 style="display: inline">
																		<span>고래두대</span>
																	</h6>
																	&nbsp;&nbsp;
																	<h6 style="display: inline">
																		<span>2018.7.8</span>
																	</h6>
																</div>


															</div>
														</li>
														<li class="list-group-item">Dapibus ac facilisis in</li>
														<li class="list-group-item">Morbi leo risus</li>
														<li class="list-group-item">Porta ac consectetur ac</li>
														<li class="list-group-item">Vestibulum at eros</li>
														<li class="list-group-item">Cras justo odio</li>
														<li class="list-group-item">Dapibus ac facilisis in</li>
														<li class="list-group-item">Morbi leo risus</li>
														<li class="list-group-item">Porta ac consectetur ac</li>
														<li class="list-group-item">Vestibulum at eros</li>
														<li class="list-group-item">Cras justo odio</li>
														<li class="list-group-item">Dapibus ac facilisis in</li>
														<li class="list-group-item">Morbi leo risus</li>
														<li class="list-group-item">Porta ac consectetur ac</li>
														<li class="list-group-item">Vestibulum at eros</li>
														<li class="list-group-item">Cras justo odio</li>
														<li class="list-group-item">Dapibus ac facilisis in</li>
														<li class="list-group-item">Morbi leo risus</li>
														<li class="list-group-item">Porta ac consectetur ac</li>
														<li class="list-group-item">Vestibulum at eros</li>


													</ul>



												</div>

											</div>
											<div class="modal-footer">

												<button type="button" class="btn btn-primary">Save changes</button>


											</div>



										</div>


									</div>

								</div>

								<!-- 모달 끝 -->

							</div>

							<!-- 							<br>
							<br>
							
							
							
							<form action="/update" method="get">

								
									<input type="text" id="url" name="url" placeholder="ex)www.naver.com" />
								
									<div class=" col-md-12 selector-wrapper">
									
									</div>






							</form> -->



						</div>
					</div>
				</div>

			</div>

			<!-- </div> -->
		</div>
	</div>


</body>
</html>