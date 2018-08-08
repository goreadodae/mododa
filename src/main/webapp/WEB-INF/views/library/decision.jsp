<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[자료실] 의사결정</title>
	<link rel="icon" href="/resources/favicon.ico">
	<link rel="shortcut icon" href="/resources/favicon.ico">
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

/* 프로필 이미지 */
#profileImg {
	margin-bottom: 3px;
	height: 20px;
	border: 1px solid white;
	border-radius: 100px;
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
	width : 100%;
	padding : 15px;
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/decision.do"><b>의사결정</b></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/todo.do">할 일</a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="/decision.do">의사결정<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/image.do">이미지</a>
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
		<div style="height:100%;">
			<!-- 의사결정 메뉴 -->
			<table width="100%" style="margin:0; padding:0;">
				<tr>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-light btn-sm" onclick="dcCategory(1);">전체 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-light btn-sm" onclick="dcCategory(2);">받은 의사결정</button></td>
					<td width="15%"><button type="button" style="width:99%" class="btn btn-light btn-sm" onclick="dcCategory(3);">요청한 의사결정</button></td>
					<td width="55%"></td>
				</tr>
			</table>
			<!-- 의사결정 메뉴 끝 -->
			
			<!-- 의사결정 내용 -->
			<div id="dcContainer" style="overflow-y:auto; height:77vh;">
			<div id="dcDiv">
				
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
				<br> <input type="text" id="decisionComment_${d.dcNo }" value="${d.dcComment }" style="width:100%; height:50px;" placeholder="의사결정 의견을 입력해 주세요." /><br>
				
				
				<c:choose>
					<c:when test="${d.dcYn eq 'N'.charAt(0) }">
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
					</c:when>
				</c:choose>
				
				
				<c:choose>
					<c:when test="${d.dcYn eq 'N'.charAt(0) }">
						<button class="insertButton2" id='decideBtn_${d.dcNo}' onclick="updateDecision(${d.dcNo});" style="float: right; margin-top: 10px;">결정</button>
					</c:when>
				</c:choose>
			</div>
		</div>
		<!-- Modal 내용 끝 -->
</c:forEach>


	
</div>

<script>
	var user = <%=((Member)session.getAttribute("member")).getMemberNo()%>;
	dcCategory(1);
	
	// 의사결정 분류
	function dcCategory(num) {
		$.ajax({
			url:"/dcCategory.do",
			type:"POST",
			data : {data : num},
			success : function(data) {
				$("#dcDiv").remove();
				$("#dcContainer").append("<div id='dcDiv'></div>");
				
				var str = "";
				
				str += "<table class='table table-hover' style='margin:0;padding:0;'><tbody>";
				
				if(data.length == 0) {
					str += "<tr><td>의사결정이 없습니다.</td></tr>";
				}
				else {
					for(i=0; i<data.length; i++) {
						str += "<tr id='dcEach_"+data[i].dcNo+"' onclick='open_decide("+data[i].dcNo+");'>";
						
						// 의사결정 안한 경우(대기)
						if(data[i].dcYn == 'N') {
							str +=
								"<td width='10%'>"+
								"<div id='changeDc_"+data[i].dcNo+"'><div id='decisionWait'>대기</div></div>"+
								"</td>"+
								"<td id='dcContent_"+data[i].dcNo+"' width='60%'>"+
								data[i].dcContent+"<div id='dcComment_"+data[i].dcNo+"'></div>"+
								"</td>"+
								"<td width='30%'>"+
								"<img id='profileImg' src='../resources/upload/member/" + data[i].dcWriterPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
								data[i].dcWriterName +" ▶ "+ 
								"<img id='profileImg' src='../resources/upload/member/" + data[i].dcMakerPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
								data[i].dcMakerName+
								"</td>";
						}
						else {
							// 반려인 경우
							if(data[i].dcDecision == 'N') {
								str +=
									"<td><div id='decisionCancel'>반려</div></td>"+
									"<td>"+data[i].dcContent+"<div class='dropdown-divider'></div>"+data[i].dcComment+"</td>"+
									"<td>"+
									"<img id='profileImg' src='../resources/upload/member/" + data[i].dcWriterPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
									data[i].dcWriterName +" ▶ "+ 
									"<img id='profileImg' src='../resources/upload/member/" + data[i].dcMakerPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
									data[i].dcMakerName;
									
							}
							// 승인인 경우
							else if(data[i].dcDecision == 'Y'){
								str +=
									"<td><div id='decisionApproval'>승인</div></td>"+
									"<td>"+data[i].dcContent+"<div class='dropdown-divider'></div>"+data[i].dcComment+"</td>"+
									"<td>"+
									"<img id='profileImg' src='../resources/upload/member/" + data[i].dcWriterPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
									data[i].dcWriterName +" ▶ "+ 
									"<img id='profileImg' src='../resources/upload/member/" + data[i].dcMakerPicture + "' onerror=\"this.src='../resources/upload/member/whale.png'\" />"+
									data[i].dcMakerName;
							}
						}
						str += "</tr>";
					}
					str += "</tbody></table>";
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
		var dcMaker = $('#dcMaker_'+id).val();
		if(user == dcMaker) {
			$('#decideModal_'+id).show();
		}
		else {
			$('#failedAlertMessage').text('의사결정 권한이 없습니다.');
			$('#failedAlert').show('slow');
			setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);
		}
		
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
					$('#decideBtn_'+id).remove();
					$('#decideYes_'+id).remove();
					$('#decideNo_'+id).remove();
					if(decideResult == 'N') {
						$('#changeDc_'+id).html("<div id='decisionCancel'>반려</div>");
						if(dcComment == "") {
							$('#dcComment_'+id).html("<div class='dropdown-divider'></div>반려합니다.");
							$('#decisionComment_'+id).val("반려합니다.");
						}
						else {
							$('#dcComment_'+id).html("<div class='dropdown-divider'></div>"+dcComment);
						}
					}
					else {
						$('#changeDc_'+id).html("<div id='decisionApproval'>승인</div>");
						if(dcComment == "") {
							$('#dcComment_'+id).html("<div class='dropdown-divider'></div>승인합니다.");
							$('#decisionComment_'+id).val("승인합니다.");
						}
						else {
							$('#dcComment_'+id).html("<div class='dropdown-divider'></div>"+dcComment);
						}
					}
					$('#decideDcBtn_'+id).remove();
					
					$('#successAlertMessage').text('의사결정이 완료되었습니다.');
					$('#successAlert').show('slow');
					setTimeout(function () { $('#successAlert').hide('slow');}, 1500);
				},
				error : function(data) {
					$('#failedAlertMessage').text('의사결정에 실패하였습니다.');
					$('#failedAlert').show('slow');
					setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);  
				}
			});
		}
		else {
			$('#failedAlertMessage').text('의사결정 권한이 없습니다.');
			$('#failedAlert').show('slow');
			setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);  
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
				
				$('#successAlertMessage').text('의사결정이 삭제되었습니다.');
				$('#successAlert').show('slow');
				setTimeout(function () { $('#successAlert').hide('slow');}, 1500); 
			},
			error : function(data) {
				$('#failedAlertMessage').text('의사결정에 실패하였습니다.');
				$('#failedAlert').show('slow');
				setTimeout(function () { $('#failedAlert').hide('slow');}, 1500);
			}
		});
	}
	
	
</script>

</body>
</html>