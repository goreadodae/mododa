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

/* 의사결정 등록 */
#modal-decide {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 25px;
	border: 1px solid #888;
	width: 60px;
	border-radius: 5px;
	width: 550px;
	height: 260px;
}
#decisionContent, #decisionComment {
	width: 100%;
	height: 50px;
}

.memberIdForDecision {
	font-weight: bold;
}

#decisionWait {
	background-color: #aaaaaa;
	color: white;
	width: 50px;
	text-align: center;
	border-radius: 20px;
	margin: 0px;
	display: inline-block;
}

#decisionApproval {
	background-color: #00837a;
	color: white;
	width: 50px;
	text-align: center;
	border-radius: 20px;
	margin: 0px;
	display: inline-block;
}

#decisionCancel {
	background-color: #B93232;
	color: white;
	width: 50px;
	text-align: center;
	border-radius: 20px;
	margin: 0px;
	display: inline-block;
}

#deleteForDecision {
	padding: 5px;
	border: 1px solid #d2d2d2;
	background-color: #dcdcdc;
	color: #505050;
	display: inline-block;
	float: right;
}

#decideForDecision {
	padding: 5px;
	border: 1px solid #d2d2d2;
	background-color: #CFF09E;
	color: #505050;
	display: inline-block;
	float: right;
}

#decideYes {
	color: #00837a;
	font-size: 30px;
	font-weight: 550;
	display: inline-block;
}

#decideNo {
	color: #b80004;
	font-size: 30px;
	font-weight: 550;
	display: inline-block;
}

.decideIcon {
	height: 30px;
	padding-bottom: 7px;
}
.insertButton2 {
	background-color: #339966;
	color: #F8FAFF;
	width: 80px;
	border: 0px;
	cursor: pointer;
	padding: 5px;
	border-radius: 30px;
}

.eachDecision{
	background-color : #F0FFF0;
	width : 100%;
	border-radius: 5px;
	padding : 15px;
	margin-bottom : 15px;
	border : 1px solid #C8FAC8;
	display: inline-block;
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
				<h4 id="subject">의사결정</h4>
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
			<!-- 의사결정 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="listDcAll();">전체 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="listDcMe();">받은 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-outline-success btn-sm" onclick="listDcRequest();">요청한 의사결정</button></td>
					<td width="55%"></td>
				</tr>
			</table>
			<div class="dropdown-divider"></div>
			<!-- 의사결정 메뉴 끝 -->
			
			<!-- 의사결정 내용 -->
			<div id="dcContainer">
			<div id="dcDiv">
				<%-- <c:forEach items="${listDecision }" var="d">
				<c:choose>
					<c:when test="${d.dcYn eq 'N'.charAt(0) }">
						<div class='eachDecision'>
							<div id='postDecision_${d.dcNo }'>
								<span class='memberIdForDecision'>${d.dcWriterName }</span>님의 요청 : ${d.dcContent }<br>
								<div id='decisionWait'>대기</div> <span class='memberIdForDecision'>${d.dcMakerName }</span>님의 결정 기다리는 중 <br>
							</div>
							<div id='decideForDecision' onclick='open_decide(${d.dcNo});'><img src='../resources/images/post/check.png' style='height:15px; margin-bottom:5px;'>결정하기</div>
							<div id='deleteForDecision' onclick='deleteDecision(${d.dcNo});'>
								<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
						<c:when test="${d.dcDecision eq 'N'.charAt(0) }">
							<div class='eachDecision'>
								<div id='postDecision_${d.dcNo }'>
									<span class='memberIdForDecision'>${d.dcWriterName }</span>님의 요청 : ${d.dcContent }<br>
									<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>${d.dcMakerName }</span>님의 결정 : ${d.dcComment } <br>
								</div>
								<div id='deleteForDecision' onclick='deleteDecision(${d.dcNo});'>
									<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기
								</div>
							</div>
						</c:when>
						<c:when test="${d.dcDecision eq 'Y'.charAt(0) }">
							<div class='eachDecision'>
								<div id='postDecision_${d.dcNo }'>
									<span class='memberIdForDecision'>${d.dcWriterName }</span>님의 요청 : ${d.dcContent }<br>
									<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>${d.dcMakerName }</span>님의 결정 : ${d.dcComment } <br>
								</div>
								<c:choose>
									<c:when test="${d.dcMaker == sessionScope.memberNo}">
										<div id='deleteForDecision' onclick='deleteDecision(${d.dcNo});'>
											<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기
										</div>
									</c:when>
								</c:choose>
								<div id='decideForDecision' onclick='open_decide(${d.dcNo});'>
									<img src='../resources/images/post/check.png' style='height:15px; margin-bottom:5px;'>결정하기
								</div>
							</div>
						</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
				</c:forEach> --%>
			</div>
			</div>
			<!-- 의사결정 내용 끝 -->
			
			
		
			
			
			
		</div>
	</div>
	
	</div>
	<!-- contents 끝 -->


	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->
	
	
<!-- 의사결정/변경하기 팝업모달 시작 -->
<c:forEach items="${listDecision }" var="d">
		<!-- Modal 내용 -->
		<input type="hidden" id="dcMaker_${d.dcNo }" value="${d.dcMaker }" />
		<div id="decideModal_${d.dcNo }" class="modal">
			<div id="modal-decide">
				<img src="../resources/images/post/select.png" /><span
					style="color: #339966;">&nbsp;&nbsp;의사 결정하기</span> <img
					src="../resources/images/post/close.png" onclick="close_decide(${d.dcNo});"
					style="float: right; height: 20px;" /><br>
				<br> <input type="text" id="decisionComment_${d.dcNo }" style="width:100%; height:50px;" placeholder="의사결정 의견을 입력해 주세요." /><br>
				<br>
				<div id="decideYes_${d.dcNo }" onclick="decideYes(${d.dcNo});" style="color: #00837a; font-size: 30px; font-weight: 550; display: inline-block;">
					<img src="../resources/images/post/yes.png" class="decideIcon" />
					승인
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="decideNo_${d.dcNo }" onclick="decideNo(${d.dcNo});" style="color: #888888;font-size: 30px; font-weight: 550; display: inline-block;">
					<img src="../resources/images/post/nooff.png" class="decideIcon" />
					반려
				</div>
				<br>
				<button class="insertButton2" onclick="updateDecision(${d.dcNo});"
					style="float: right; margin-top: 10px;">결정</button>
			</div>
		</div>
		<!-- Modal 내용 끝 -->
</c:forEach>



	
	
	
	
</div>

<script>
	listDcAll();

	var user = <%=((Member)session.getAttribute("member")).getMemberNo()%>;
	/* 전체 의사결정 */
	function listDcAll() {
		
		$.ajax({
			url:"/listDcAll.do",
			type:"POST",
			success : function(data) {
				$("#dcDiv").remove();
				$("#dcContainer").append("<div id='dcDiv'></div>");
				
				var str = "";
				
				if(data.length == 0) {
					str += "<div style='text-align:center;'>의사결정이 없습니다.</div>";
				}
				
				for(i=0; i<data.length; i++) {
					if(data[i].dcYn == 'N') {
						str += 
							"<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
							"<div id='postDecision_"+data[i].dcNo+"'><input type='hidden' id='dcMakerName_"+data[i].dcNo+"' value='"+data[i].dcMakerName+"' />"+
							"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
							"<div id='changeDc_"+data[i].dcNo+"'><div id='decisionWait'>대기</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 기다리는 중</div> <br>"+
							"</div>";
						
							if(user == data[i].dcMaker) {
								str += 
									"<div id='decideDcBtn_"+data[i].dcNo+"'><button type='button' class='btn btn-primary btn-sm' id='decideForDecision' onclick='open_decide("+data[i].dcNo+");'>"+
									"<img src='../resources/images/post/check.png' style='height:15px; margin-bottom:5px;'>결정하기</button></div>";
									
							}
							
							if((user == data[i].dcWriter || user == data[i].dcMaker) || (user == data[i].dcWriter && user == data[i].dcMaker)) {
								str +=
									"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
									"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>"+
									"</div>";
							}
							
						str += "</div>";	
								
					}
					else {
						if(data[i].dcDecision == 'N') {
							str += 
								"<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
								"<div id='postDecision_"+data[i].dcNo+"'>"+
								"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
								"<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 : "+data[i].dcComment +" <br>"+
								"</div>";
								
								if(user == data[i].dcMaker) {
									str += 
										"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
										"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>";
										
								}
							
								
								str += "</div></div></div>";
							
						}
						else if(data[i].dcDecision == 'Y') {
							str += "<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
								"<div id='postDecision_"+data[i].dcNo+"'>"+
								"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
								"<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 : "+data[i].dcComment +" <br>"+
								"</div>";
								
								if(user == data[i].dcMaker) {
									str += 
										"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
										"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>";
								}
								
								str += "</div></div></div>";
							
						}
					}
					
					
				}
				$("#dcDiv").append(str);
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	/* 받은 의사결정 */
	function listDcMe() {
		
		$.ajax({
			url:"/listDcMe.do",
			type:"POST",
			success : function(data) {
				$("#dcDiv").remove();
				$("#dcContainer").append("<div id='dcDiv'></div>");
				
				var str = "";
				
				if(data.length == 0) {
					str += "<div style='text-align:center;'>의사결정이 없습니다.</div>";
				}
				
				for(i=0; i<data.length; i++) {
					if(data[i].dcYn == 'N') {
						str += 
							"<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
							"<div id='postDecision_"+data[i].dcNo+"'><input type='hidden' id='dcMakerName_"+data[i].dcNo+"' value='"+data[i].dcMakerName+"' />"+
							"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
							"<div id='changeDc_"+data[i].dcNo+"'><div id='decisionWait'>대기</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 기다리는 중</div> <br>"+
							"</div>";
						
							if(user == data[i].dcMaker) {
								str += 
									"<div id='decideDcBtn_"+data[i].dcNo+"'><button type='button' class='btn btn-primary btn-sm' id='decideForDecision' onclick='open_decide("+data[i].dcNo+");'>"+
									"<img src='../resources/images/post/check.png' style='height:15px; margin-bottom:5px;'>결정하기</button></div>";
									
							}
							
							if((user == data[i].dcWriter || user == data[i].dcMaker) || (user == data[i].dcWriter && user == data[i].dcMaker)) {
								str +=
									"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
									"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>"+
									"</div>";
							}
							
						str += "</div>";	
								
					}
					else {
						if(data[i].dcDecision == 'N') {
							str += 
								"<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
								"<div id='postDecision_"+data[i].dcNo+"'>"+
								"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
								"<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 : "+data[i].dcComment +" <br>"+
								"</div>";
								
								if(user == data[i].dcMaker) {
									str += 
										"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
										"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>";
										
								}
							
								
								str += "</div></div></div>";
							
						}
						else if(data[i].dcDecision == 'Y') {
							str += "<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
								"<div id='postDecision_"+data[i].dcNo+"'>"+
								"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
								"<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 : "+data[i].dcComment +" <br>"+
								"</div>";
								
								if(user == data[i].dcMaker) {
									str += 
										"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
										"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>";
								}
								
								str += "</div></div></div>";
							
						}
					}
					
					
				}
				$("#dcDiv").append(str);
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	/* 요청한 의사결정 */
	function listDcRequest() {
		$.ajax({
			url:"/listDcRequest.do",
			type:"POST",
			success : function(data) {
				$("#dcDiv").remove();
				$("#dcContainer").append("<div id='dcDiv'></div>");
				
				var str = "";
				
				if(data.length == 0) {
					str += "<div style='text-align:center;'>의사결정이 없습니다.</div>";
				}
				
				for(i=0; i<data.length; i++) {
					if(data[i].dcYn == 'N') {
						str += 
							"<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
							"<div id='postDecision_"+data[i].dcNo+"'><input type='hidden' id='dcMakerName_"+data[i].dcNo+"' value='"+data[i].dcMakerName+"' />"+
							"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
							"<div id='changeDc_"+data[i].dcNo+"'><div id='decisionWait'>대기</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 기다리는 중</div> <br>"+
							"</div>";
						
							if(user == data[i].dcMaker) {
								str += 
									"<div id='decideDcBtn_"+data[i].dcNo+"'><button type='button' class='btn btn-primary btn-sm' id='decideForDecision' onclick='open_decide("+data[i].dcNo+");'>"+
									"<img src='../resources/images/post/check.png' style='height:15px; margin-bottom:5px;'>결정하기</button></div>";
									
							}
							
							if((user == data[i].dcWriter || user == data[i].dcMaker) || (user == data[i].dcWriter && user == data[i].dcMaker)) {
								str +=
									"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
									"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>"+
									"</div>";
							}
							
						str += "</div>";	
								
					}
					else {
						if(data[i].dcDecision == 'N') {
							str += 
								"<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
								"<div id='postDecision_"+data[i].dcNo+"'>"+
								"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
								"<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 : "+data[i].dcComment +" <br>"+
								"</div>";
								
								if(user == data[i].dcMaker) {
									str += 
										"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
										"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>";
										
								}
							
								
								str += "</div></div></div>";
							
						}
						else if(data[i].dcDecision == 'Y') {
							str += "<div id='dcEach_"+data[i].dcNo+"'><div class='eachDecision'>"+
								"<div id='postDecision_"+data[i].dcNo+"'>"+
								"<span class='memberIdForDecision'>"+data[i].dcWriterName +"</span>님의 요청 : "+data[i].dcContent +"<br>"+
								"<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>"+data[i].dcMakerName +"</span>님의 결정 : "+data[i].dcComment +" <br>"+
								"</div>";
								
								if(user == data[i].dcMaker) {
									str += 
										"<button type='button' class='btn btn-primary btn-sm' id='deleteForDecision' onclick='deleteDecision("+data[i].dcNo+");'>"+
										"<img src='../resources/images/post/delete.png' style='height:15px; margin-bottom:5px;'>삭제하기</button>";
								}
								
								str += "</div></div></div>";
							
						}
					}
					
					
				}
				$("#dcDiv").append(str);
			},
			error : function(data) {
				console.log("오류");
			}
		});
	}
	
	
	//의사결정하기 모달 open
	function open_decide(id) {
		$('#decideModal_'+id).show();
	}

	//의사결정하기 모달 close
	function close_decide(id) {
		$('#decideModal_'+id).hide();
	}
	
	//의사결정 승인 선택시
	var decideResult = 'Y'; //의사결정 결과 전역변수
	function decideYes(id) {
		decideResult = 'Y';
		console.log(decideResult);
		var strYes = "<img src='../resources/images/post/yes.png' class='decideIcon' /> 승인";
		$('#decideYes_'+id).html(strYes);
		$('#decideYes_'+id).css("color", "#00837a");
		var strNo = "<img src='../resources/images/post/nooff.png' class='decideIcon' /> 반려";
		$('#decideNo_'+id).html(strNo);
		$('#decideNo_'+id).css("color", "#888888");
	}

	//의사결정 반려 선택시
	function decideNo(id) {
		decideResult = 'N';
		console.log(decideResult);
		var strYes = "<img src='../resources/images/post/yesoff.png' class='decideIcon' /> 승인";
		$('#decideYes_'+id).html(strYes);
		$('#decideYes_'+id).css("color", "#888888");
		var strNo = "<img src='../resources/images/post/no.png' class='decideIcon' /> 반려";
		$('#decideNo_'+id).html(strNo);
		$('#decideNo_'+id).css("color", "#b80004");
	}
	
	//의사결정 선택시
	function updateDecision(id) {
		var user = <%=((Member)session.getAttribute("member")).getMemberNo()%>;
		var dcMaker = $("#dcMaker_"+id).val();
		var dcComment = $('#decisionComment_'+id).val();
		var dcMakerName = $("#dcMakerName_"+id).val();
		
		console.log(user);
		console.log(dcMaker);
		console.log(dcComment);
		
		if(user == dcMaker) {
			$.ajax({
				url : "/updateDecision.do",
				type : "post",
				data : {
					dcNo : id,
					dcDecision : decideResult,
					dcComment : dcComment
				},
				success : function(data) {
					close_decide(id);
					$('#changeDc_'+id).find().remove();
					if(decideResult == 'N') {
						if(dcComment == "") {
							$('#changeDc_'+id).html("<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>"+dcMakerName +"</span>님의 결정 : 반려합니다. <br>");
						}
						else {
							$('#changeDc_'+id).html("<div id='decisionCancel'>반려</div> <span class='memberIdForDecision'>"+dcMakerName +"</span>님의 결정 : "+dcComment+" <br>");
						}
						
					}
					else {
						if(dcComment == "") {
							$('#changeDc_'+id).html("<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>"+dcMakerName +"</span>님의 결정 : 승인합니다. <br>");
						}
						else {
							$('#changeDc_'+id).html("<div id='decisionApproval'>승인</div> <span class='memberIdForDecision'>"+dcMakerName +"</span>님의 결정 : "+dcComment+" <br>");
						}
						
					}
					$('#decideDcBtn_'+id).remove();
					
					alert("의사결정 완료");
				},
				error : function(data) {
					console.log("updateDecision 실패");
				}
			});
		}
		else {
			alert("의사결정 권한이 없습니다.");
		}
		
		
	}
	
	function deleteDecision(id) {
		$.ajax({
			url : "/deleteDecision.do",
			type : "post",
			data : {
				dcNo : id
			},
			success : function(data) {
				$('#dcEach_'+id).remove();
				alert("의사결정 삭제 완료");
			},
			error : function(data) {
				console.log("deleteDecision 실패");
			}
		});
	}
	
	
</script>

</body>
</html>