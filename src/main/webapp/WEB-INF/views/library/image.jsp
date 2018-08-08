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
	overflow-y: hidden;
	height: 100vh;
}
div {
	margin: 0px;
	padding: 0px;
}
.modal-content {
	background-color: #fefefe;
	margin: 0%; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 60px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.6); /* Black w/ opacity */
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
					<td width="15%"><button type="button" style="width:99%" onclick="imageCategory(1);" class="btn btn-light btn-sm">전체 이미지</button></td>
					<td width="15%"><button type="button" style="width:99%" onclick="imageCategory(2);" class="btn btn-light btn-sm">내 이미지</button></td>
					<td width="70%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 이미지 메뉴 끝 -->
				
			<!-- 이미지 내용 -->
			<div id="imageContainer" style="overflow-y:auto; height:77vh;">
				<div id="imageDiv">
					
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
	
	
	
	
	
	<!-- 이미지 확대 모달 -->
	<c:forEach items="${listImage }" var="i">
	<div id="imageModal_${i.uploadNo }" class="modal">

		<!-- Modal 내용 -->
		<div class="modal-content" style="width:40%;">
			<!-- 닫기 버튼 -->
			<div align="right">
				<img src="../resources/images/post/close.png" onclick="imageCloseModal(${i.uploadNo});" /><br>
			</div>
			
			<h4>${i.fileName }</h4>
			<div class="dropdown-divider"></div><br>
			
			<div align="center">
				<img src='/resources/upload/write/${i.uploadPath}' style='max-width:500px;' />
			</div>
			
			<br>
			<div align='right'>${i.uploadDate }</div>
			<br>
			
			<div align="center">
			<c:choose>
 	 			<c:when test="${i.memberNo eq sessionScope.member.memberNo}">
				<button class='btn btn-outline-success' onclick='imageDownload(${i.uploadNo});' style='width:49%;'>다운로드</button>&nbsp;
				<button class='btn btn-outline-danger' onclick='deleteUpload(${i.uploadNo});' style='width:49%;'>삭제하기</button>
			</c:when>
 	 		</c:choose>
			</div>
		</div>
		<!-- Modal 내용 끝 -->
	</div>
	</c:forEach>
	<!-- 팝업모달 끝 -->
	
	
	
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
						"<div id='imgEach_"+data[i].uploadNo+"' onclick='imageOpenModal("+data[i].uploadNo+");' align='center' style='background-color:#F6F6F6; padding:2px; margin:2px; width:230px; height:170px; float:left;'>"+
						"<img src='/resources/upload/write/"+data[i].uploadPath+"' style='height:100%; max-width:100%; vertical-align: middle;' >"+
						"</div>";
						
						/* "<div class='card' style='width: 180px; margin:2px;'>"+
						  "<img class='card-img-top' src='/resources/upload/write/"+data[i].uploadPath+"' style='height:100%; max-width:80%; vertical-align: middle;' >"+
						  "<div class='card-body'>"+
						    "<div align='right'>"+
						    "<button class='btn btn-outline-success btn-sm' onclick='imageDownload("+data[i].uploadNo+")'>다운로드</button>&nbsp;"+
						    "<button class='btn btn-outline-danger btn-sm' onclick='deleteUpload("+data[i].uploadNo+");'>삭제</button>"+	
						  "</div></div>"+
						"</div></div>"; */
				}
				
				$("#imageDiv").append(str);
			}
			
		},
		error : function(data) {
			console.log("오류");
		}
	});
}

// 이미지 모달 열기
function imageOpenModal(id) {
	$("#imageModal_"+id).show();
}

// 이미지 모달 닫기
function imageCloseModal(id) {
	$("#imageModal_"+id).hide();
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
			$('#imgEach_'+id).remove();
			imageCloseModal(id);
			
			$('#successAlertMessage').text('이미지가 삭제되었습니다.');
			$('#successAlert').show('slow');
			setTimeout(function () { $('#successAlert').hide('slow');}, 1500); 
		},
		error : function(data) {
			$('#failedAlertMessage').text('이미지 삭제에 실패하였습니다.');
			$('#failedAlert').show('slow');
			setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);
		}
	});
}

function imageDownload(id) {
	location.href="fileDownload.do?uploadNo="+id;
}

</script>


</html>