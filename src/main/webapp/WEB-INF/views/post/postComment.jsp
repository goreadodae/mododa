<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>


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
	width:100%;
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
	margin:0;
}
#commentInfo{
	padding:0;
}
#commentPrint{
	padding-left:20px;
}


</style>
<script>
</script>
</head>
<body>

<div class="comment-box col-md-12">
							<div class="comment-header ">
								<!-- 댓글 갯수 출력.-->
								<span class="comment-no">댓글 <span
									class="badge badge-pill badge-success" id="commentNum">${comment.size() }</span></span>
							</div>
							<div class="comment-area">
								<!-- 댓글 내용 출력.-->
								<ul class="comment-list">
								<c:forEach var="cm" items="${comment }">
								<li class="comment-item">
										<div id="commentInfo" class="col-md-12">
											<div id="comment1" class="col-md-12">
												<img id="wPicture"
													src="../resources/upload/member/${cm.writePicture }"
													style="height: 20px; width: 20px; border-radius: 50%;" />
												<span id="writer">${cm.writeNick }</span>&nbsp;&nbsp;&nbsp; <span
													id="wDate">${cm.writeTime }</span>
											</div>
											<div id="comment2" class="col-md-12">
												<div id="commentPrint" >
												<span id="comment3">${cm.content }</span>
												</div>
												<div id="commentFun" >
												<span id="cmlike-count" onclick="cmLike(${cm.commentNo}
												);"><img src="../resources/images/post/like.png" id="cmLike-icon" style="height:10px;" /> 좋아요 <span id="cmLikeCount">12</span></span>
												<c:if test='${sessionScope.member.memberNo eq cm.writerNo }'>
													<span class="btn btn-link btn-sm" onclick="deleteComment(${cm.commentNo },${cmPostNo });" style="float:right; font-size:10px;">삭제</span>
												</c:if>
												</div>
											</div>
										</div>
									</li>
									<hr>
								</c:forEach>
								
								</ul>
							</div>
							<div class="comment-footer">
								<div id="input-box">
									<textarea class="comment-input" placeholder="댓글 입력!!!"></textarea>
									<div class="comment-fun"
										style="background-color: white; width: 100%; height: 30px;">
										<!--댓글버튼 -->
										<button id="comment-wr" class="btn btn-outline-success btn-sm" onclick="insertComment(${cmPostNo});">댓글
											작성!</button>

									</div>
								</div>
							</div>
						</div>


</body>
</html>