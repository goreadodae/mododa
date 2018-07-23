<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<!-- CDN방식으로 부트스트랩 링크 추가 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.comment-box {
	height: 600px;
	width: 460px;
	box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, .3);
}

.comment-header {
	width: 100%;
	height: 30px;
}

.comment-no {
	color: gray;
	margin-left: 15px;
	margin-top: 5px;
}

.comment-area {
	background-color: pink;
	height: 75%;
	width: 100%;
	bottom: 151.2px;
	overflow-y: auto;
	overflow-x: hidden;
}

#input-box {
	margin: 10px;
	border: 1px solid gray;
}

.comment-input {
	width: 100%;
	height: 90%;
}

.comment-list {
	padding: 5;
	margin: 0;
	list-style: none;
}

.comment-footer {
	fixed: bottom;
	bottom: 10px;
}

#comment-wr {
	float: right;
	margin-right: 5px;
}

.comment.btn {
	margin-top: 1;
}
</style>

</head>
<body>
	<div class="comment-box">
		<div class="comment-header">
			<!-- 댓글 갯수 출력.-->
			<span class="comment-no">댓글 <span
				class="badge badge-pill badge-success">10</span></span>
		</div>
		<div class="comment-area">
			<!-- 댓글 내용 출력.-->
			<ul class="comment-list">

				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
				<li class="comment-item">이런젠장 크흠<br> 2018.07.22 야구좀 제대로 해라
					
				</li>
			</ul>
		</div>

		<div class="comment-footer">
			<div id="input-box">
				<textarea class="comment-input" placeholder="댓글 입력!!!"></textarea>
				<div class="comment-fun"
					style="background-color: white; width: 100%; height: 31px;">
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