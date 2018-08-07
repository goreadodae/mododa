<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[자료실] 이미지</title>
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
			<a class="navbar-brand" href="/image.do"><b>이미지</b></a>
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
					<a class="nav-link active" href="/image.do">이미지<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/file.do">파일</a>
				</li>
			</ul>
			</div>
		</nav>
	<!-- 자료실 헤더 끝 -->
	
	<!-- 본문 -->
	<div style="padding:10px;">
		<div style="height:100%; ">
			<!-- 이미지 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" onclick="imageCategory(1);" class="btn btn-outline-success btn-sm">전체 이미지</button></td>
					<td width="15%"><button type="button" style="width:99%" onclick="imageCategory(2);" class="btn btn-outline-success btn-sm">내 이미지</button></td>
					<td width="70%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 이미지 메뉴 끝 -->
				
			<!-- 이미지 내용 -->
			<div id="imageContainer">
				<div id="imageDiv">
					<%-- <c:forEach items="${listImage }" var="i">
					<div class="card" style="width: 15rem; height:15rem; float:left;">
						<img class="card-img-top" src="${i.uploadPath }" style="width:100%; height:15rem;alt="Card image cap">
						<div class="card-body">
						<h5 class="card-title">${i.fileName }</h5>
						<p class="card-text">${i.uploadDate }</p>
						<a href="/fileDownload.do?uploadPath=${i.uploadPath }&fileName=${i.fileName}" class="btn btn-primary">다운로드</a>
						</div>
					</div>
					</c:forEach> --%>
				</div>
			</div>
			<!-- 이미지 내용 끝 -->
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
imageCategory(1);

// 이미지 분류
function imageCategory(num) {
	$.ajax({
		url:"/imageCategory.do",
		type:"POST",
		data : {data : num},
		success : function(data) {
			if(data.length == 0) {
				$("#imageContainer").html("<div style='text-align:center;height:100px;'>이미지가 없습니다.</div>");
			}
			else {
				$("#imageDiv").remove();
				$("#imageContainer").append("<div id='imageDiv'></div>");
				
				var str = "";
				
				for(i=0; i<data.length; i++) {
					str += 
						"<div id='imgEach_"+data[i].uploadNo+"' style='float:left;'>"+
						"<div class='card' style='width: 200px; margin:2px;'>"+
						  "<img class='card-img-top' src='"+data[i].uploadPath+"' width='200px' height='200px' >"+
						  "<div class='card-body'>"+
						    "<div align='right'>"+
						    "<a href='/fileDownload.do?uploadNo="+data[i].uploadNo+"'>다운로드</a>&nbsp;&nbsp;"+
						    "<a href='#' onclick='deleteUpload("+data[i].uploadNo+");'>삭제</a>"+	
						  "</div></div>"+
						"</div></div>";
				}
				
				$("#imageDiv").append(str);
			}
			
		},
		error : function(data) {
			console.log("오류");
		}
	});
}

// 이미지 다운로드
function download(id, path, name) {
	location.href="/fileDownload.do?uploadPath="+path+"&fileName="+name;
}

// 이미지 삭제
function deleteUpload(id) {
	$.ajax({
		url:"/deleteUpload.do",
		type:"POST",
		data : {uploadNo : id},
		success : function(data) {
			alert("이미지 삭제 완료");
			$('#imgEach_'+id).remove();
		},
		error : function(data) {
			console.log("오류");
		}
	});
}

</script>


</html>