<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.comment-box {
	height: 99%;
	width: 100%;
	box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, .3);
}

.comment-header {
	width: 100%;
	height: 30px;
	border-bottom: 1px solid gray;
}

.comment-no {
	color: gray;
	margin-left: 15px;
	margin-top: 5px;
}

.comment-area {
	height: 75%;
	width: 100%;
	overflow-y: auto;
	overflow-x: hidden;
}

#input-box {
	margin: 5px;
	border: 2px solid gray;
	border-radius: 5px;
}

.comment-input {
	width: 100%;
	height: 100%;
	resize: none;
	border-bottom: 1px solid gray;
}

.comment-list {
	padding: 0;
	margin: 0;
	list-style: none;
	float: left;
}

.comment-footer {
	border-bottom: 5;
}

#comment-wr {
	float: right;
}

.comment.btn {
	margin-top: 1;
}

.comment-item {
	font-size: 12px;
}

</style>
<script>
//댓글 출력.
if (data.comment != null) {
	$('#commentNum').html(data.comment.length);
	/* $('.coment-list').empty();
	var outComment="";
	for(var i=0;i<data.comment.length;i++){
		outComment+="<li class='comment-item'>"+
		"<div id='writeInfo'><img id='wPicture' src='"+data.comment[i].writePicture+"'/>&nbsp;&nbsp;&nbsp;<span id='writer'>"+data.comment[i].writeNick+"</span>"+
		"&nbsp;&nbsp;&nbsp;<span id='wDate'>"+data.comment[i].writetime+"</span>"+
		
	} */

}
</script>
</head>
<body>

<div class="comment-box col-md-12">
							<div class="comment-header ">
								<!-- 댓글 갯수 출력.-->
								<span class="comment-no">댓글 <span
									class="badge badge-pill badge-success" id="commentNum"></span></span>
							</div>
							<div class="comment-area">
								<!-- 댓글 내용 출력.-->
								<ul class="comment-list">
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해라
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해
									</li>
									<li class="comment-item">
										<div id="commentK" class="col-md-12">
											<div id="comment1" class="col-md-3">
												<img id="wPicture"
													src="../resources/images/post/add-event.png"
													style="height: 20px; width: 20px; border-radius: 50%;" />&nbsp;&nbsp;&nbsp;
											</div>
											<div id="writeInfo" class="col-md-9">
												<span id="writer">aaaa</span>&nbsp;&nbsp;&nbsp; <span
													id="wDate">17/07/06 오후14:45</span>
											</div>
											<div id="comment2" class="col-md-12" style="">
												<span id="comment3"> 김기태 빨리도망가라 제발 좀 개색갸 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ </span>
											</div>
										</div> 이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해
									</li>
									<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀
										제대로 해
									</li>
								</ul>
							</div>
							<div class="comment-footer">
								<div id="input-box">
									<textarea class="comment-input" placeholder="댓글 입력!!!"></textarea>
									<div class="comment-fun"
										style="background-color: white; width: 100%; height: 30px;">
										<!-- 글감첨부, 댓글버튼 -->
										<button class="btn btn-outline-primary btn-sm">글감첨부</button>
										<span class="badge badge-pill badge-warning">10</span>
										<button id="comment-wr" class="btn btn-outline-success btn-sm">댓글
											작성!</button>

									</div>
								</div>
							</div>
						</div>


</body>
</html>