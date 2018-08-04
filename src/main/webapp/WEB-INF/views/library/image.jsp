<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>
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
	<table width="100%">
		<tr>
			<td width="20%">
				<h4 id="subject">이미지</h4>
			</td>
			<td width="35%">
				<select class="form-control" style="width:150px;">
  					<option value="전체 프로젝트" selected>전체 프로젝트</option>
  					<option value="${privateNo }">프라이빗 공간</option>
  					<c:forEach items="${listProject }" var="p">
  						<option value="${p.proNo }">${p.proTitle }</option>
  					</c:forEach>
				</select>
			</td>
			<td width="15%"></td>
			<td width="5%">
				<a href="/todo.do" id="todo">할 일</a>
			</td>
			<td width="5%">
				<a href="/decision.do" id="decision">의사결정</a>
			</td>
			<td width="5%">
				<a href="/image.do" id="image">이미지</a>
			</td>
			<td width="5%">
				<a href="/file.do" id="file">파일</a>
			</td>
			<td width="5%">
				<a href="/link.do" id="link">링크</a>
			</td>
			<td width="5%"></td>
		</tr>
	</table>
	
	<div class="dropdown-divider"></div>

	<!-- 자료실 헤더 끝 -->
	
	<!-- 본문 -->
	<div style="padding:10px;">
		<div style="height:100%; border:white 1px solid; box-shadow:1px 1px 1px #D5D5D5;">
			<!-- 이미지 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" onclick="listImageAll();" class="btn btn-outline-success btn-sm">전체 이미지</button></td>
					<td width="15%"><button type="button" style="width:99%" onclick="listImageMe();" class="btn btn-outline-success btn-sm">내 이미지</button></td>
					<td width="70%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 이미지 메뉴 끝 -->
				
			<!-- 이미지 내용 -->
			<div id="imageTableContainer">
				<c:forEach items="${listImage }" var="i">
					<div id="imgEach_${i.uploadNo }" style="float:left;">
					<div class="card" style="width: 15rem;">
						<img class="card-img-top" src="${i.uploadPath }" style="width:100%; height:15rem;alt="Card image cap">
						<div class="card-body">
						<h5 class="card-title">${i.fileName }</h5>
						<p class="card-text">${i.uploadDate }</p>
						<a href="#" class="btn btn-primary">다운로드</a>
						</div>
					</div>
					</div>
				</c:forEach>
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
/* listImageAll(); */

/* 전체 이미지 */
function listImageAll() {
	$.ajax({
		url:"/listImageAll.do",
		type:"POST",
		success : function(data) {
			if(data.length == 0) {
				$("#imageTableContainer").html("<div style='text-align:center;'>이미지가 없습니다.</div>");
			}
			else {
				$("#imageTable").remove();
				$("#imageTableContainer").append("<table id='imageTable' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#imageTable").append(
						"<tr>"+
							"<td colspan='3'>" +
								"<div style='margin:5px; width:250px; height:250px;float:left;display:table;'>"+
									"<div style='display:table-cell; vertical-align:middle;'>"+
										"<div class='card' style='width: 18rem;'>"+
											"<img class='card-img-top' src='"+data[i].uploadPath+"' style='width:100%;' alt='Card image cap' />"+
											"<div class='card-body'>"+
											"<h5 class='card-title'>Card title</h5>"+
											"<p class='card-text'>Some quick example text to build on the card title and make up the bulk of the card's content.</p>"+
											"<a href='#' class='btn btn-primary'>다운로드</a>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
							"</td>"+
						"</tr>"
					);
				}
			}
			
		},
		error : function(data) {
			console.log("오류");
		}
	});
}

/* 내 이미지 */
function listImageMe() {
	$.ajax({
		url:"/listImageMe.do",
		type:"POST",
		success : function(data) {
			if(data.length == 0) {
				$("#imageTableContainer").html("<div style='text-align:center;'>이미지가 없습니다.</div>");
			}
			else {
				$("#imageTable").remove();
				$("#imageTableContainer").append("<table id='imageTable' style='margin:0; padding:0;'></table>");
				for(i=0; i<data.length; i++) {
					$("#imageTable").append(
						"<tr>"+
							"<td colspan='3'>" +
								"<div style='margin:5px; width:250px; height:250px;float:left;display:table;'>"+
									"<div style='display:table-cell; vertical-align:middle;'>"+
										"<div class='card' style='width: 18rem;'>"+
											"<img class='card-img-top' src='"+data[i].uploadPath+"' style='width:100%;' alt='Card image cap' />"+
											"<div class='card-body'>"+
											"<h5 class='card-title'>Card title</h5>"+
											"<p class='card-text'>Some quick example text to build on the card title and make up the bulk of the card's content.</p>"+
											"<a href='#' class='btn btn-primary'>다운로드</a>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
							"</td>"+
						"</tr>"
					);
				}
			}
			
			
		},
		error : function(data) {
			console.log("오류");
		}
	});
}
</script>


</html>