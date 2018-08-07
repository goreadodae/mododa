<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 진행 현황</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</head>

<style>
/* 기본 구조 스타일 시작 */
body {
	overflow-x: hidden;
	overflow-y: hidden;
	height: 100%;
}
div {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}
#background {
	background-color: #F5F5F5;
	margin: 0px;
	padding: 0px;
}
/* 기본 구조 스타일 끝 */


.fullProgressBox {
	width: 100%;
	height: 100%;
	background-color: #F5F5F5;
}
 
 .progressTitle {
	width: 100%;
	height: 5%;
	float: left;
 }
 
 .progressTitle h5 {
  	margin-top: 8px;
 }
 
 
 .progressHeader {
 	color: #339966;
	width: 30%;
	height: 100%;
	
	float: left;
	text-align: center;
 }
 
 .progressBody {
	box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, .3);
	width: 30%;
	height: 88%;
	background-color: #FFF;
	float: left;
 }

.bodyEmpty {
	width: 5%;
	height: 88%;
	float: left;
}

.bodyEmpty{
	padding-top:22%;
}

.headEmpty {
	width: 5%;
	height: 100%;
	float: left;
}

.titleEmpty {
	border-top: 1px solid black;
	width: 100%;
	height: 2%;
	float: left;
}


.progressProject {
	border-bottom: 1px solid gray;
	float: left;
	padding: 1% 5%;
	width: 98%;
	margin: 1%;
}


.progressProject img {
	width: 10%;
	height: 10%;
	margin-right: 3%;
	
}

.progressProject img:hover {
	cursor: pointer;
}


input[type=checkbox] {
	transform: scale(1.5);
	margin-right: 4%;
	margin-left: 4%;
	margin-top: 3%;
}

</style>


<script>

	function changeCheckBox(category) { // 이미지랑 체크박스 변화
    
	    // 체크한 것이 없을 경우 창 꺼짐
    	var hideValue = $(".checkBox:checked").length;
	    if(hideValue==0) {
        
	       $(".workImg").show();
	       $(".workCheckBox").hide();
	       $(".finImg").show();
	       $(".finCheckBox").hide();
	       $(".stopImg").show();
	       $(".stopCheckBox").hide();
       
	    }
    
	    switch(category) {
    
	    case 'work': 
	       $(".workImg").hide();
	       $(".workCheckBox").show();
	       $(".checkBox:checked").prop('checked',false); // 체크 해제
	       // value 초기화
	       $('#workToStop').val('workToStop');
	       $('#stopToWork').val('stopToWork');
	       $('#workToFin').val('workToFin');
	       $('#finToWork').val('finToWork');
       
	       $(".finImg").show();
	       $(".finCheckBox").hide();
	       $(".stopImg").show();
	       $(".stopCheckBox").hide();
       
	       break;
	    case 'stop': 
	       $(".stopImg").hide();
	       $(".stopCheckBox").show();
	       $(".checkBox:checked").prop('checked',false); // 체크 해제
	       // value 초기화
	       $('#workToStop').val('workToStop');
	       $('#stopToWork').val('stopToWork');
	       $('#workToFin').val('workToFin');
	       $('#finToWork').val('finToWork');
       
	       $(".workImg").show();
	       $(".workCheckBox").hide();
	       $(".finImg").show();
	       $(".finCheckBox").hide();
       
	       break;
	    case 'fin': 
 	      $(".finImg").hide();
	      $(".finCheckBox").show();
	      $(".checkBox:checked").prop('checked',false); // 체크 해제
	      // value 초기화
	      $('#workToStop').val('workToStop');
	      $('#stopToWork').val('stopToWork');
	      $('#workToFin').val('workToFin');
	      $('#finToWork').val('finToWork');
       
 	      $(".workImg").show();
	      $(".workCheckBox").hide();
	      $(".stopImg").show();
 	      $(".stopCheckBox").hide();
       
	       break;
    
	    }
   
 	}
	
	
	
	
	function check(category) { // 체크한 포스트를 함수 hidden의 value로 저장하기
		
		
		// 체크한 것이 없을 경우 창 꺼짐
		var hideValue = $(".checkBox:checked").length;
		if(hideValue==0) {
			 
			$(".workImg").show();
			$(".workCheckBox").hide();
			$(".finImg").show();
			$(".finCheckBox").hide();
			$(".stopImg").show();
			$(".stopCheckBox").hide();
			
		}
		
		
		var proNo = [];

		switch(category) {
			
			case 'work': 
				$("input[name='work_checkBox']:checked").each(function(i){
					proNo.push($(this).val());
				 });
				$('#workToStop').val(proNo);
				$('#workToFin').val(proNo);
				break;
			case 'stop': 
				$("input[name='stop_checkBox']:checked").each(function(i){
					proNo.push($(this).val());
				 });
				$('#stopToWork').val(proNo);
				break;
			case 'fin': 
				$("input[name='fin_checkBox']:checked").each(function(i){
					proNo.push($(this).val());
				 });
				$('#finToWork').val(proNo);
				break;
		}
		
		 console.log("check:" + proNo);

	}
	
	
	
	function updateProgress(category) { // ajax로 비즈니스 로직(hidden의 value사용)
		
		var proNoStr = "";
		var proProgress = "";
	
		switch(category) {

		case 'workToStop': 
			proNoStr = $('#workToStop').val();
			if(proNoStr=='workToStop') {
				alert("이동할 프로젝트를 선택해주세요.");
			} else {
				proProgress = 'stop';
			}
			break;
		case 'stopToWork': 
			proNoStr = $('#stopToWork').val();
			if(proNoStr=='stopToWork') {
				alert("이동할 프로젝트를 선택해주세요.");
			} else {
				proProgress = 'working';
			}
			break;
		case 'workToFin': 
			proNoStr = $('#workToFin').val();
			if(proNoStr=='workToFin') {
				alert("이동할 프로젝트를 선택해주세요.");
			} else {
				proProgress = 'finish';
			}
			break;
		case 'finToWork': 
			proNoStr = $('#finToWork').val();
			if(proNoStr=='finToWork') {
				alert("이동할 프로젝트를 선택해주세요.");
			} else {
				proProgress = 'working';
			}
			break;
		}
		
		console.log("total: "+proNoStr+"/progress: "+proProgress);
		
 		if(proNoStr!="" && proProgress!="") { // 비즈니스 로직
			
			// console.log("total: "+postNoStr+"/progress: "+postProgress);
		
		
			$.ajax({
				
				url : "/updateProjectProgress.do",
				type : "post",
				data : {
					proNoStr : proNoStr,
					proProgress : proProgress
				},
				success : function(projectList) {
					
					
					$('#successAlertMessage').text('프로젝트 진행 사항이 변경되었습니다.');
		            $('#successAlert').show('slow');
		            setTimeout(function () { $('#successAlert').hide('slow'); window.location.reload(); }, 1500);
					
					
					//location.href="/gotoMoreProject.do";
					
/* 					
					$(".progressBody").empty();
					
					var workingResult = "";
					var stopResult = "";
					var finishResult = "";
					
					var work = "'work'";
					var stop = "'stop'";
					var fin = "'fin'";
					
					
					for(var i=0 ; i<projectList.length ; i++) {
						

						if(projectList[i].proProgress=='working') {
							workingResult += '<div class="progressProject" draggable="true">'
								 			 + '<img src="../resources/images/post/play-buttonOn.png" class="workImg" onclick="changeCheckBox('+work+');"/>'
								 			 + '<span class="workCheckBox" style="display: none;">'
								 			 + '<input type="checkbox" class="checkBox" name="work_checkBox" value="'+projectList[i].proNo+'" onClick="check('+work+');">'
								 			 + '</span><a onClick="plusProject();">'+projectList[i].proTitle+'</a><br>';
							if(projectList[i].proStartDate!=null && projectList[i].proEndDate!=null) {
								var startDate = projectList[i].proStartDate.split(" ");
								var endDate = projectList[i].proEndDate.split(" ");
								workingResult += '기간 : '+startDate[2]+"-"+startDate[0].slice(0,-1)+"-"+startDate[1].slice(0,-1)
												 +' ~ '+endDate[2]+"-"+endDate[0].slice(0,-1)+"-"+endDate[1].slice(0,-1)+'</div>';
							} else {
								workingResult += '</div>';
							}

							
						} else if(projectList[i].proProgress=='stop') {
							stopResult += '<div class="progressProject" draggable="true">'
								 		  + '<img src="../resources/images/post/pauseOn.png" class="stopImg" onclick="changeCheckBox('+stop+');"/>'
								 		  + '<span class="stopCheckBox" style="display: none;">'
								 		  + '<input type="checkbox" class="checkBox" name="stop_checkBox" value="'+projectList[i].proNo+'" onClick="check('+stop+');">'
								 		  + '</span><a onClick="plusProject();">'+projectList[i].proTitle+'</a><br>';
							if(projectList[i].proStartDate!=null && projectList[i].proEndDate!=null) {		
								var startDate = projectList[i].proStartDate.split(" ");
								var endDate = projectList[i].proEndDate.split(" ");
								stopResult += '기간 : '+startDate[2]+"-"+startDate[0].slice(0,-1)+"-"+startDate[1].slice(0,-1)
												 +' ~ '+endDate[2]+"-"+endDate[0].slice(0,-1)+"-"+endDate[1].slice(0,-1)+'</div>';
							} else {
								stopResult += '</div>';
							}
							
						} else if(projectList[i].proProgress=='finish') {
							finishResult += '<div class="progressProject" draggable="true">'
								 			+ '<img src="../resources/images/post/checked.png" class="finImg" onclick="changeCheckBox('+fin+');"/>'
											+ '<span class="finCheckBox" style="display: none;">'
								 			+ '<input type="checkbox" class="checkBox" name="fin_checkBox" value="'+projectList[i].proNo+'" onClick="check('+fin+');">'
								 			+ '</span><a onClick="plusProject();">'+projectList[i].proTitle+'</a><br>';
							if(projectList[i].proStartDate!=null && projectList[i].proEndDate!=null) {		
								var startDate = projectList[i].proStartDate.split(" ");
								var endDate = projectList[i].proEndDate.split(" ");
								finishResult += '기간 : '+startDate[2]+"-"+startDate[0].slice(0,-1)+"-"+startDate[1].slice(0,-1)
												 +' ~ '+endDate[2]+"-"+endDate[0].slice(0,-1)+"-"+endDate[1].slice(0,-1)+'</div>';								
							} else {
								finishResult += '</div>';
							}
							
						}
						
					
					}
					
					$("#workingBody").append(workingResult);
					$("#stopBody").append(stopResult);
					$("#finishBody").append(finishResult);
*/
					
				},
				error : function() {
					console.log("업데이트 실패");
					
					$('#failedAlertMessage').text('프로젝트 변경이 실패하였습니다.');
			        $('#failedAlert').show('slow');
			        setTimeout(function () { $('#failedAlert').hide('slow'); window.location.reload(); }, 1500);
					
				}
				
				
				
			});
			
		}
		
	}
	
	
	
	
	var clickBefore = 0;
	function plusProject(proTitle,proNo) { // 더보기에 프로젝트 추가하기
		
		$("li[id^='sub_"+clickBefore+"_']").hide();
		$(".privateSub").hide();
		
		var proListArr = $.makeArray($('.projectMain').map(function() {
			return $(this).attr("value");
		})); // 출력되는 리스트의 proNo 값
		
		//console.log(proListArr);
		//console.log(proNo);
		clickBefore = proNo;
		
		var cnt = 0;
		for(var i=0; i<proListArr.length; i++) {
			if(proListArr[i] == proNo) {
				$("li[id^='sub_"+proNo+"_']").show();
				liClose(proNo);
				cnt++;
				$("#projectPlus").hide();
				$("li[id^='plus_']").hide();
			} 
		}
		
		if(cnt==0) {
			//console.log(proTitle+'/'+proNo);
			$("#projectPlus").show();
			$("#projectPlus span").text(proTitle);
			$("li[id^='plus_']").show();
			$("#plus_post a").attr('value',proNo);
			$("#plus_hashTag a").attr('value',proNo);
			$("#plus_progress a").attr('value',proNo);
			$("#plus_myPost a").attr('value',proNo);
			$("li[id^='plus_']").click(function() {
				liClose(proNo);
			});
			
		} 

	}
	
	function projectDel(proNo, proTitle) {
		
		if(window.confirm("[ "+proTitle+" ] 프로젝트 관련 모든 정보가 삭제됩니다. 삭제하시겠습니까?")) {
			if(window.confirm("삭제된 프로젝트는 복구할 수 없습니다. 그래도 삭제하시겠습니까?")) {

 				$.ajax({
					
					url : "/deleteProject.do",
					type : "post",
					data : {
						proNo : proNo
					},
					success : function(data) {
						
						
						$('#successAlertMessage').text("["+proTitle+"] 프로젝트가 삭제되었습니다.");
			            $('#successAlert').show('slow');
			            setTimeout(function () { $('#successAlert').hide('slow'); window.location.reload(); }, 1500);
						
					
						//location.href="/gotoMoreProject.do";
					},
					error : function() {
						console.log("프로젝트 삭제 ajax실패");
						
						$('#failedAlertMessage').text('프로젝트 삭제가 실패하였습니다.');
				        $('#failedAlert').show('slow');
				        setTimeout(function () { $('#failedAlert').hide('slow'); window.location.reload(); }, 1500);
					}
					
				});
				
			} else {
				alert("프로젝트 삭제가 취소되었습니다.");
			}
		} else {
			alert("프로젝트 삭제가 취소되었습니다.");
		}		
		
	}
	
	function changeProDate(proNo) {
		$("#dateChangeModal").load("/gotoProjectDateChange.do?proNo="+proNo);
	}
	

	
	
	

</script>


<body>

	<!-- 알림창 -->
   <div class="alert alert-success collapse" role="alert" id="successAlert" style="width: 20%; position: absolute; right:40px; bottom:0px;">
      <img src="../resources/images/icon/checked.png"/><span style="margin: 10px;" id="successAlertMessage"></span>
   </div>
   <div class="alert alert-secondary collapse" role="alert" id="failedAlert" style="width: 20%; position: absolute; right:40px; bottom:0px; background-color: #4A4A4A; color: white;">
      <img src="../resources/images/icon/warning.png"/><span style="margin: 10px;" id="failedAlertMessage"></span>
   </div>



<!-- header -->
<jsp:include page="/projectHeader.do"></jsp:include>
<!-- header 끝 -->

<div class="row" style="background-color: #F5F5F5;">
	<!-- left bar -->
	<jsp:include page="/leftbar.do"></jsp:include>
	<!-- left bar 끝-->


	<div id="dateChangeModal"></div> <!-- 프로젝트 날짜 변경 -->

	<!-- contents -->
	<div class="col-6" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		
		<div class="fullProgressBox">
		
			<div class="progressTitle">
				<h5><b>프로젝트 더보기</b>
				<img src="../resources/images/project/help-round-button.png"/>
				<span style="font-size:small;">프로젝트를 한 눈에 볼 수 있습니다. 해당 프로젝트의 진행 상태를 변경할 수 있습니다.</span></h5>
				<%-- <input type="hidden" id="proNo" value="${requestScope['javax.servlet.forward.query_string']}" /> --%>
			</div>
			<div class="titleEmpty"></div>
			
			<div class="progressTitle">
			<div class="progressHeader"><h5><b>"일시중지"</b></h5></div>
			<div class="headEmpty"></div>
			<div class="progressHeader"><h5><b>"진행 중"</b></h5></div>
			<div class="headEmpty"></div>
			<div class="progressHeader"><h5><b>"완료"</b></h5></div>
			</div>
			
			
			
			
			
			<div class="progressBody" id="stopBody" style="overflow:auto; height:84%;">
			
				<c:forEach items="${projectList}" var="projectList">
				<c:if test="${projectList.proProgress=='stop'}">
					<div class="progressProject">
						<img src="../resources/images/post/pauseOn.png" class="stopImg" onclick="changeCheckBox('stop');"/>
						
						<span class="stopCheckBox" style="display: none;">
						<input type="checkbox" class="checkBox" name="stop_checkBox" value="${projectList.proNo}" onClick="check('stop');">
						</span>
						
						<a onClick="plusProject('${projectList.proTitle}','${projectList.proNo}');">${projectList.proTitle}</a>
						<c:forEach items="${leaderProNo}" var="leaderProNo">
							<c:if test="${projectList.proNo == leaderProNo}">
							<br>
							<img src="../resources/images/project/pencil.png" style="margin-left:70%;" onClick="changeProDate('${projectList.proNo}');"/> <!-- 수정 버튼 -->
							<img src="../resources/images/project/garbage.png" onClick="projectDel('${projectList.proNo}','${projectList.proTitle}');"/> <!-- 삭제 버튼 -->
							</c:if>
						</c:forEach>
						<br>
						<c:choose>
							<c:when test="${projectList.proStartDate != null && projectList.proEndDate != null}">
							${projectList.proStartDate} ~ ${projectList.proEndDate}
							</c:when>
							<c:otherwise>
							프로젝트 기한 없음
							</c:otherwise>
						</c:choose>
						
					</div>
				</c:if>
				</c:forEach>
			
			</div>
			
			
			
			
			<div class="bodyEmpty" align="center">
				<img src="../resources/images/project/next-arrow.png" onClick="updateProgress('stopToWork');" />
				<input type="hidden" id="stopToWork" value="stopToWork" />
				<br><br><br><br>
				<img src="../resources/images/project/pre-arrow.png" onClick="updateProgress('workToStop');" />
				<input type="hidden" id="workToStop" value="workToStop" />
			</div>
			
			
			
			
			
			<div class="progressBody" id="workingBody" style="overflow:auto; height:84%;">

				<c:forEach items="${projectList}" var="projectList">
				<c:if test="${projectList.proProgress=='working'}">
					<div class="progressProject">
						
						<img src="../resources/images/post/play-buttonOn.png" class="workImg" onclick="changeCheckBox('work');"/>
						<span class="workCheckBox" style="display: none;">
						<input type="checkbox" class="checkBox" name="work_checkBox" value="${projectList.proNo}" onClick="check('work');">
						</span>
						<a onClick="plusProject('${projectList.proTitle}','${projectList.proNo}');">${projectList.proTitle}</a>
						<c:forEach items="${leaderProNo}" var="leaderProNo">
							<c:if test="${projectList.proNo == leaderProNo}">
							<br>
							<img src="../resources/images/project/pencil.png" style="margin-left:70%;" onClick="changeProDate('${projectList.proNo}');"/> <!-- 수정 버튼 -->
							<img src="../resources/images/project/garbage.png" onClick="projectDel('${projectList.proNo}','${projectList.proTitle}');"/> <!-- 삭제 버튼 -->
							</c:if>
						</c:forEach>
						<br>
						<c:choose>
							<c:when test="${projectList.proStartDate != null && projectList.proEndDate != null}">
							${projectList.proStartDate} ~ ${projectList.proEndDate}
							</c:when>
							<c:otherwise>
							프로젝트 기한 없음
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
				</c:forEach>
				
			
			</div>
			
			
			
			<div class="bodyEmpty" align="center">
				<img src="../resources/images/project/next-arrow.png" onClick="updateProgress('workToFin');" />
				<input type="hidden" id="workToFin" value="workToFin" />
				<br><br><br><br>
				<img src="../resources/images/project/pre-arrow.png" onClick="updateProgress('finToWork');" />
				<input type="hidden" id="finToWork" value="finToWork" />
			</div>			

	
	
	
	
			<div class="progressBody" id="finishBody" style="overflow:auto; height:84%;">
			
				<c:forEach items="${projectList}" var="projectList">
				<c:if test="${projectList.proProgress=='finish'}">
					<div class="progressProject">
					
						
						<img src="../resources/images/post/checked.png" class="finImg" onclick="changeCheckBox('fin');"/>
						<span class="finCheckBox" style="display: none;">
						<input type="checkbox" class="checkBox" name="fin_checkBox" value="${projectList.proNo}" onClick="check('fin');">
						</span>
						<a onClick="plusProject('${projectList.proTitle}','${projectList.proNo}');">${projectList.proTitle}</a>
						<c:forEach items="${leaderProNo}" var="leaderProNo">
							<c:if test="${projectList.proNo == leaderProNo}">
							<br>
							<img src="../resources/images/project/pencil.png" style="margin-left:70%;" onClick="changeProDate('${projectList.proNo}');"/> <!-- 수정 버튼 -->
							<img src="../resources/images/project/garbage.png" onClick="projectDel('${projectList.proNo}','${projectList.proTitle}');"/> <!-- 삭제 버튼 -->
							</c:if>
						</c:forEach>
						<br>
						<c:choose>
							<c:when test="${projectList.proStartDate != null && projectList.proEndDate != null}">
							${projectList.proStartDate} ~ ${projectList.proEndDate}
							</c:when>
							<c:otherwise>
							프로젝트 기한 없음
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
				</c:forEach>
			
			</div>


		</div>
	
	</div>
	<!-- contents 끝 -->

	<!-- right bar -->
	<jsp:include page="/rightbar.do"></jsp:include>
	<!-- right bar 끝 -->


</div>

</body>
</html>