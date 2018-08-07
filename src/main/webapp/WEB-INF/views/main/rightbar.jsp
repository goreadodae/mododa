<%@page import="kr.pe.mododa.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
/* rightbar */
a:link {
   color: black;
   text-decoration: none;
}

a:visited {
   color: black;
   text-decoration: none;
}

a:hover {
   color: black;
   text-decoration: none;
}

table {
   padding: 20px;
   margin: 20px;
}

.background {
	background-color: #F5F5F5;
	margin: 0px;
	padding: 0px;
  
#background {
   background-color: #F5F5F5;
   margin: 0px;
   padding: 0px;
}
</style>

<body>

<!-- right bar -->
<div class="col-3 background" id="rightBarBody">
	<table width="300px">
	<!-- 자료실 메뉴 -->
		<tr style="float: right;">
			<td>
				<div class="btn-group">
					<button type="button" onclick="library();" class="btn btn-success">자료실</button>
  					<button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    				<span class="sr-only">Toggle Dropdown</span>
  					</button>
  					<div class="dropdown-menu">
    				<a class="dropdown-item" href="/todo.do">할 일</a>
    				<a class="dropdown-item" href="/decision.do">의사결정</a>
    				<a class="dropdown-item" href="/image.do">이미지</a>
    				<a class="dropdown-item" href="/file.do">파일</a>
  					</div>
				</div>
							
						
							
			</td>
		</tr>

		<!-- 할 일 -->
		<tr>
			<td>
				<div class="dropdown-divider"></div>
				<h5>할 일</h5>
				<br>
				<c:forEach items="${todoList }" var="t">
					<div class='btn-group'>
						<c:choose>
							<c:when test="${t.todoProgress.equals('suggest')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_r' src='../resources/images/icon/play-button.png' />
							</c:when>
							<c:when test="${t.todoProgress.equals('working')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_r' src='../resources/images/post/play-buttonOn.png' />
							</c:when>
							<c:when test="${t.todoProgress.equals('stop')}">
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_r' src='../resources/images/post/pauseOn.png' />
							</c:when>
							<c:otherwise>
								<img class='btn btn-link dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' id='${t.todoNo }_r' src='../resources/images/post/checked.png' />
							</c:otherwise>
						</c:choose>
						<div class='dropdown-menu'>
						<a class='dropdown-item' onclick="changeProgressTodo_right(${t.todoMember},${t.todoNo},'suggest');"><img src='../resources/images/icon/play-button.png' />&nbsp;&nbsp;&nbsp;할 일 할당</a>
						<a class='dropdown-item' onclick="changeProgressTodo_right(${t.todoMember},${t.todoNo},'working');"><img src='../resources/images/post/play-buttonOn.png' />&nbsp;&nbsp;&nbsp;진행중</a>
						<a class='dropdown-item' onclick="changeProgressTodo_right(${t.todoMember},${t.todoNo},'stop');"><img src='../resources/images/post/pauseOn.png' />&nbsp;&nbsp;&nbsp;일시중지</a>
						<a class='dropdown-item' onclick="changeProgressTodo_right(${t.todoMember},${t.todoNo},'finish');"><img src='../resources/images/post/checked.png' />&nbsp;&nbsp;&nbsp;완료</a>
						</div>
					</div>
					<a href="/todo.do">${t.todoTitle }</a> <a href="/todo.do" style="font-size: 80%">${t.todoMemberName }</a><br>
				</c:forEach>
				
				<c:choose>
					<c:when test="${empty todoList}">
						<p>할 일이 없습니다.</p>
					</c:when>
				</c:choose>
			</td>
		</tr>

		<!-- 할 일의 더보기 -->
		<tr style="float: right;">
			<td><br> <a href="/todo.do" style="font-size: 80%">더보기 ></a></td>
		</tr>

		<!-- 의사결정 -->
		<tr>
			<td>
				<div class="dropdown-divider"></div>
				<h5>의사결정</h5>
				<br>
				<c:forEach items="${decisionList }" var="d" begin="0" end="3">
					<p>
					<a href="/decision.do"><img src="../resources/images/icon/decision.png"></img>
						${d.dcContent}</a> <a href="/decision.do" style="font-size: 80%">${d.dcMakerName }</a><br>
					</p>
				</c:forEach>
				<c:choose>
					<c:when test="${empty decisionList}">
						<p>의사결정이 없습니다.</p>
					</c:when>
				</c:choose>
				
			</td>
		</tr>

		<!-- 의사결정의 더보기 -->
		<tr style="float: right;">
			<td><br> <a href="/decision.do" style="font-size: 80%">더보기 ></a></td>
		</tr>


	</table>
	<div class="alert alert-success collapse" role="alert" id="successAlert" style="width: 320px; position: absolute; right:40px; bottom:0px;">
		<img src="../resources/images/icon/checked.png"/><span style="margin: 10px;" id="successAlertMessage"></span>
	</div>
	<div class="alert alert-secondary collapse" role="alert" id="failedAlert" style="width: 320px; position: absolute; right:40px; bottom:0px; background-color: #4A4A4A; color: white;">
		<img src="../resources/images/icon/warning.png"/><span style="margin: 10px;" id="failedAlertMessage"></span>
	</div>
</div>
<!-- right bar 끝 -->

</body>

<script>
	var user = <%=((Member)session.getAttribute("member")).getMemberNo()%>;

	function library() {
		location.href="/todo.do";
	}
	
	// 할일 진행과정 변경
	function changeProgressTodo_right(todoMember, todoNo, status) {
		var writerNo = $("#writerNo_"+todoNo).val();
		var memberNo = $("#memberNo_"+todoNo).val();
		
		console.log("user : " + user);
		console.log("writerNo : " + writerNo);
		console.log("memberNo : " + memberNo);
		
		if((user == writerNo || user == memberNo) || (user==writerNo && user == memberNo)) {
			$.ajax({
				url : "/postUpdateTodoProgress.do",
				type : "post",
				data : {
					todoNo : todoNo,
					todoProgress : status
				},
				success : function(data) {
					if (data.result < 0) {
						alert("로그인 후 이용가능합니다. \n로그인을 해주세요.");
					} else {
						if (status == 'suggest') {
							$('#'+todoNo).attr("src","../resources/images/icon/play-button.png");
							$('#'+todoNo+"_m").attr("src","../resources/images/icon/play-button.png");
							$('#'+todoNo+"_r").attr("src","../resources/images/icon/play-button.png");
						} else {
							if (status == 'suggest') {
								$('#' + todoNo).attr("src","../resources/images/icon/play-button.png");
								$('#' + todoNo+"_m").attr("src","../resources/images/icon/play-button.png");
								$('#' + todoNo+"_r").attr("src","../resources/images/icon/play-button.png");
							} else if (status == 'working') {
								$('#' + todoNo).attr("src","../resources/images/post/play-buttonOn.png");
								$('#' + todoNo+"_m").attr("src","../resources/images/post/play-buttonOn.png");
								$('#' + todoNo+"_r").attr("src","../resources/images/post/play-buttonOn.png");
							} else if (status == 'stop') {
								$('#' + todoNo).attr("src","../resources/images/post/pauseOn.png");
								$('#' + todoNo+"_m").attr("src","../resources/images/post/pauseOn.png");
								$('#' + todoNo+"_r").attr("src","../resources/images/post/pauseOn.png");
							} else if (status == 'finish') {
								$('#' + todoNo).attr("src","../resources/images/post/checked.png");
								$('#' + todoNo+"_m").attr("src","../resources/images/post/checked.png");
								$('#' + todoNo+"_r").attr("src","../resources/images/post/checked.png");
							}
						}
					}
				},
				error : function(data) {
					console.log("할일 진행과정 변경 실패");
				},
				complete : function(data) {
						
				}
			});
		}
		else {
			alert("할일 진행과정 변경권한이 없습니다.");
		}
			
	}

</script>

</html>