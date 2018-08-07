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
	height: auto;
	min-height: 99%;
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
	border: 1.5px solid gray;
	border-radius: 5px;
}

.comment-input {
	width: 100%;
	height: 150%;
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
	border-bottom: 3px;
	bottom: 0px;
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

#comment-wr:hover{
	color:#339966;
}

#commentPrint
{
color:#888;
}


</style>
<script>
var objDiv = document.getElementById("mydiv"); 
objDiv.scrollTop = objDiv.scrollHeight;
</script>
</head>
<body>

<div class="comment-box col-md-12">
							<div class="comment-header ">
								<!-- 댓글 갯수 출력.-->
								<span class="comment-no">댓글 <span
									class="badge badge-pill badge-success" id="commentNum">${comment.size() }</span></span>
							</div>
							<div class="comment-area" id="mydiv">
								<!-- 댓글 내용 출력.-->
								<ul class="comment-list">
								<c:forEach var="cm" items="${comment }">
								<li class="comment-item">
										<div id="commentInfo" class="col-md-12">
											<div id="comment1" class="col-md-12">
												<%-- 
													<center>
														<img src="../resources/images/layout-img/main_logo_square.png" style="width:50%;height:30%;"/><br>
														<span font-size="12px;">제일먼저 댓글을 남겨보면 어떨까요??</span>
														</div></div></li>
													</center> --%>
												
												<img id="wPicture"
													src="../resources/upload/member/${cm.writePicture }"
													style="height: 20px; width: 20px; border-radius: 50%;" />
												<span id="writer">${cm.writeNick }</span>&nbsp;&nbsp;&nbsp; <span
													id="wDate">${cm.writeTime }</span>
											</div>
											<div id="comment2" class="col-md-12">
												<div id="commentPrint" >
												<span>${cm.content }</span>
												<c:if test='${sessionScope.member.memberNo eq cm.writerNo }'>
													<a class="btn btn-link btn-sm" onclick="deleteComment(${cm.commentNo },${cmPostNo });" style="float:right; font-size:10px;">삭제</a>
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
									<textarea class="comment-input" placeholder="댓글 입력하세요" style="font-size:12px;"></textarea>
									<div class="comment-fun"
										style="background-color: white; width: 100%; height: 30px;">
										<!--댓글버튼 -->
										<a id="comment-wr" class="btn-link btn-sm" onclick="insertComment(${cmPostNo});">댓글
											작성!</a>
									</div>
								</div>
							</div>
						</div>


</body>
</html>