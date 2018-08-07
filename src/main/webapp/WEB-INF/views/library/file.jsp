<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[자료실] 파일</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<style>
body {
	overflow-x: hidden;
	height: 100%;
}
div {
	margin: 0px;
	padding: 0px;
}
</style>

<body>

<!-- header -->
<jsp:include page="/header.do"></jsp:include>
<!-- header 끝 -->

<div class="row">
	<!-- left bar -->
	<jsp:include page="/leftbar.do"></jsp:include>
	<!-- left bar 끝-->


	<!-- contents -->
	<div class="col-6" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
	<!-- 자료실 헤더 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/file.do"><b>파일</b></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="/todo.do">할 일 </a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/decision.do">의사결정</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/image.do">이미지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="/file.do">파일<span class="sr-only">(current)</span></a>
				</li>
			</ul>
			</div>
		</nav>

	<!-- 자료실 헤더 끝 -->
	
	<div style="padding:10px;">
		<div style="height:100%;">
			<!-- 파일 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" onclick="fileCategory(1);" class="btn btn-outline-success btn-sm">전체 파일</button></td>
					<td width="15%"><button type="button" style="width:99%" onclick="fileCategory(2);" class="btn btn-outline-success btn-sm">내 파일</button></td>
					<td width="70%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 파일 메뉴 끝 -->
			
			<!-- 파일 내용 -->
			<div id="fileContainer">
				<div id="fileDiv">
					<%-- <c:forEach items="${listFile }" var="f">
					<div id="fileEach_${f.uploadNo }">
					<div class="card" style="width: 18rem;">
	  				<div class="card-body">
	    			<h5 class="card-title">${f.fileName }</h5>
	    			<h6 class="card-subtitle mb-2 text-muted">${f.postTitle }</h6>
	    			<p class="card-text">${f.uploadDate }</p>
	    			<a href="/fileDownload.do?uploadPath=${f.uploadPath }&fileName=${f.fileName}" class="card-link">다운로드</a>
	  				</div>
					</div>				
					</div>
					</c:forEach> --%>
				</div>
				
			</div>	
			
			<!-- 파일 내용 끝 -->
			
			
			
		</div>
	</div>
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
</div>

</body>

<script>
fileCategory(1);

// 파일 분류
function fileCategory(num) {
	$.ajax({
		url:"/fileCategory.do",
		type:"POST",
		data : {data : num},
		success : function(data) {
			if(data.length == 0) {
				$("#fileContainer").html("<div style='text-align:center;height:100px;'>파일이 없습니다.</div>");
			}
			else {
				$("#fileDiv").remove();
				$("#fileContainer").append("<div id='fileDiv'></div>");
				
				var str = "";
				
				for(var i=0; i<data.length; i++) {
					str +=
						"<div id='fileEach_"+data[i].uploadNo+"' style='float:left;'>"+
						"<div class='card' style='width: 270px; margin:2px;'>"+
		  				"<div class='card-body'>"+
		    			"<div><b>"+data[i].fileName+"</b></div>"+
		    			"<div font-size='50%' font-color='grey'>"+data[i].postTitle+"</div>"+
		    			"<div font-size='50%'>"+data[i].uploadDate+"</div>"+
		    			"<div align='right'>"+
		    			"<a href='/fileDownload.do?uploadNo="+data[i].uploadNo+"' class='card-link'>다운로드</a>&nbsp;&nbsp;"+
		    			"<a src='#' onclick='deleteUpload("+data[i].uploadNo+")'>삭제</a>"+
		    			"</div></div>"+
						"</div>"+		
						"</div>";
					
				}
				$("#fileDiv").append(str);
			}
			
		},
		error : function(data) {
			console.log("오류");
		}
	});
}

// 파일 삭제
function deleteUpload(id) {
	$.ajax({
		url:"/deleteUpload.do",
		type:"POST",
		data : {uploadNo : id},
		success : function(data) {
			alert("파일 삭제 완료");
			$('#fileEach_'+id).remove();
		},
		error : function(data) {
			console.log("오류");
		}
	});
}





</script>



</html>