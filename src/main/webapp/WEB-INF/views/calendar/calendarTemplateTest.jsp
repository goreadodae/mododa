<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kr.pe.mododa.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<script type='text/javascript' src='/js/jquery/jquery.min.js'></script>
<script type='text/javascript' src='/js/jquery/moment.min.js'></script>

<script type='text/javascript' src='/js/fullcalendar/fullcalendar.js'></script>
<link rel='stylesheet' type='text/css' href='/js/fullcalendar/fullcalendar.css' />
<link rel='stylesheet' type='text/css' href='/js/fullcalendar/fullcalendar.print.min.css' media='print'/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery.min.js'></script>
<script src="http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery-ui.custom.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>

<script type='text/javascript'>

var scheduleNo = 0;

	$(document).ready(function() {
		
		createCal();
		
	});
	var calHeight = 1000;
	
	
	//캘린더 생성 기능
	function createCal(){
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth()+1;
		var y = date.getFullYear();
		
		var calendar = $('#calendar').fullCalendar({
			/* monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
			dayNamesShort: ["일","월","화","수","목","금","토"], 
	    	buttonText: {
	    	today : "오늘",
			month : "월별",
	    	week : "주별",
	    	list : "리스트",
	    	day : "일별",
	    	},*/ 
			header: {
				left: 'title',
				/* center: 'title', */
				right: 'prev,next today,month,listWeek'
				/* right: 'month,agendaWeek,agendaDay' */
			},
			selectable: true,
			selectHelper: true,
			contentHeight: 700,
			select: function(start, end, allDay) {
         
         modalProjectPrice();
         open_pop();

              /*title = document.getElementById("scheduleTitle").value;
               console.log(title);
                
				 if (title) {					
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay,
							color : '#339966'
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect'); */
               
			} ,
			editable: true,
			events :  	
				function(start, end, timezone, callback) {
				$.ajax({
			         url : "/calendarSchedule.do",
			         type : "post",
			         success : function(data) {
			        	 var events = [];
			        	 console.log(data[0].stStartDate);
			        	 console.log(data[0].stEndDate);
			        	 
			        	 for(var i=0;i<data.length;i++){			        	
			        		 events.push({
				        		 title : data[i].scTitle,
				        		 start : data[i].stStartDate,
				        		 end : data[i].stEndDate,
				        		 color : '#CFF09E',
				        		 url: data[i].scheduleNo
				        	 });			  
			        	 }
			        	 callback(events);
			         },
			         error : function(data) {
			            console.log("실패");
			            }
			         });
			},
			eventClick: function(event) {
				
				scheduleNo = event.url;
				
				    if (event.url) {
				    	updateModal(scheduleNo);
				        return false;
				      }
			 }		
		});
	}
	
	
	//팝업 Open 기능
    function open_pop(flag) {
         $('#myModal').show();
    };
	
	
	//팝업 Close 기능
    function close_pop(flag) {
         $('#myModal').hide();
    };
    
  //팝업 update Close 기능
    function close_up_pop(flag) {
         $('#myModalUpdate').hide();
    };
    
    //모듈 값 가져오기
    function saveSchedule(){
    	
    	var proSelect = document.getElementById("projectList").value;
    	var relationSelect = document.getElementById("linkPostList").value;
    	var title = document.getElementById("scheduleTitle").value;
    	var startDate = document.getElementById("startDate").value;
    	var endDate = document.getElementById("endDate").value;

    	 $.ajax({
            url : "/calendarInsertSchedule.do",
            type : "post",
            data :  {
            	proSelect : proSelect,
            	relationSelect : relationSelect,
            	title : title,
            	startDate : startDate,
            	endDate : endDate            	
            },
            success : function(data) {
               console.log("성공");
               
               window.location.reload(true);//새로고침코드
            },
            error : function(data) {
               console.log("실패");
            },
            complete : function(data) {
            	close_pop();
            }
		}); 
    }
    
    
    /* module 데이터값 가져오는 ajax */
    function modalProjectPrice(){
        	
    	 $.ajax({
             url : "/selectProject.do",
             type : "post",
             success : function(data) {
     
    			$('#projectList').find("option").remove();
             	
    				for(var i=0;i<data.length;i++){
    					$('#projectList').append("<option value='"+data[i].proNo+"'>"+data[i].proTitle+"</option>");
    				}			
             },
             error : function(data) {
                console.log("실패");
                }
             }); 
    }
    
    /* module 데이터값 가져오는 ajax 프로젝트선택시 */
    
    function changeproSelect() {
    	
    	var postProNo = document.getElementById("projectList").value;
	
    	   $.ajax({
           	url :"/selectLinkPost.do",
           	type :"post",
            data : {
            	postProNo : postProNo
             },
           	success :function(data) {
            
           		$('#linkPostList').find("option").remove();
             	
				for(var i=0;i<data.length;i++){
					$('#linkPostList').append("<option value='"+data[i].postNo+"'>"+data[i].postTitle+"</option>");
				}			
            },
           	error : function(data) {
            console.log("실패");
            }
           }); 
    }
    


    
    function updateModal (scheduleNo) {
    	
    	 $.ajax({
            	url :"/infoSchedule.do",
            	type :"post",
             data : {
            	 scheduleNo : scheduleNo
              },
            	success :function(data) {
            		
            		$('#scUpdatePro').find("label").remove();
            		$('#scUpdatePost').find("label").remove(); 					
           
 					$('#scUpdatePro').append("<label>"+data.pj.proTitle+"</label>");
 					$('#scUpdatePost').append("<label>"+data.p.postTitle+"</label>");
 					$('#scheduleTitleUpdate').attr('value',data.sc.scTitle);
 					$('#startDateUpdate').attr('value',data.sc.stStartDate);
 					$('#endDateUpdate').attr('value',data.sc.stEndDate);
            		
             },
            error : function(data) {
             console.log("실패");
             }
            });    	
    	
    	$('#myModalUpdate').show();
    }
    
    
   function saveUpdateSchedule(){
	   
	var title = document.getElementById("scheduleTitleUpdate").value;
   	var startDate = document.getElementById("startDateUpdate").value;
   	var endDate = document.getElementById("endDateUpdate").value;
   	
   	$.ajax({
        url : "/updateSchedule.do",
        type : "post",
        data :  {
        	title : title,
        	startDate : startDate,
        	endDate : endDate,    
        	scheduleNo : scheduleNo
        },
        success : function(data) {
           console.log("성공");
           
           window.location.reload(true);//새로고침코드
        },
        error : function(data) {
           console.log("실패");
        },
        complete : function(data) {
        	close_pop();
        }
	}); 
	   
   }
   
   function deleteSchedule () {
	   
		$.ajax({
	        url : "/deleteSchedule.do",
	        type : "post",
	        data :  {   
	        	scheduleNo : scheduleNo
	        },
	        success : function(data) {
	           
	        	var deleteCheck = confirm("정말로 삭제하시겠습니까?");
	        	if(deleteCheck){
	        		window.location.reload(true);
	        	}
	        },
	        error : function(data) {
	           console.log("실패");
	        },
	        complete : function(data) {
	        	close_pop();
	        }
		}); 
	   
   }
   
   /* 달력 시작,종료일 확인시 시작일보다 종료일의 날짜가 클때 */
   
   function dateCheck (){
	   
	   var startDate = $('#startDate').val();
       var endDate = $('#endDate').val();
      
       //-을 구분자로 연,월,일로 잘라내어 배열로 반환
       var startArray = startDate.split('-');
       var endArray = endDate.split('-');   
       //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
       var start_date = new Date(startArray[0], startArray[1], startArray[2]);
       var end_date = new Date(endArray[0], endArray[1], endArray[2]);
            //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.      
		
       if(start_date.getTime() > end_date.getTime()) {
           
          $('#endDate').attr('value',startDate);    
           
           alert("종료날짜보다 시작날짜가 작아야합니다.");
          /*  return false; */
  		 }
           
   }

   
   
</script>


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

#background {
	background-color: #F5F5F5;
	margin: 0px;
	padding: 0px;
}

#calendar {
		margin-top: 40px;
		/* text-align: center; */
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		margin: 0 auto;
		width : 1000px;
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
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
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
	<div class="col-9" id="contents" style="padding:0;">
		<!-- 여기에 본문 내용 추가해주시면 됩니당~~!! -->
		<div class="row"><div class="col-md-12">　</div></div>
		<div class="row"><div class="col-md-12">　</div></div>
		<div class="row"><div class="col-md-12">　</div></div>
		<div class="col-md" id="calendar"></div>
	</div>
	<!-- contents 끝 -->

</div>



<div id="myModal" class="modal">     
       <!--   Modal 내용 -->
         <div class="modal-content" style="width:30%;">
            <!-- <div class="modal-content ng-scope"> -->
            <div class="modal-header"><h3>일정 선택</h3></div>
            <div class="modal-body">
            <div class="row"><div class="col-md-6">
    		<select class="form-control" id="projectList" onchange="changeproSelect();">
    		<option value="">프로젝트선택</option>
    		</select></div><div class="col-md-6">
    		<select class="form-control" id="linkPostList">
    		<option value="">관련글선택</option>
    		</select>
    		</div></div></div>
            <div class="modal-body"> <div class="row"><div class="col-md-12">
            <input type="text" class="form-control" placeholder="일정 제목을 입력해주세요." name="scheduleTitle" id="scheduleTitle" required="required" size="10" style="width=100%">
            </div></div>
            <div class="row"><div class="col-md-12">　</div></div>
            <div class="row"><div class="col-md-12">
            <input type="date" id="startDate" onchange="dateCheck();"> ~ <input type="date" id="endDate" onchange="dateCheck();">
            </div></div></div>
            <div class="modal-footer">
             <button type="button" class="btn btn-primary" onClick="saveSchedule();">저장</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal"  onClick="close_pop();">닫기</button></div>
            <!-- </div> -->
         </div>
     <!--     Modal 내용 끝 -->
      </div>
<!--팝업모달 끝 -->


<div id="myModalUpdate" class="modal">     
       <!--   Modal 내용 -->
         <div class="modal-content" style="width:30%;">
            <!-- <div class="modal-content ng-scope"> -->
            <div class="modal-header"><h3>일정 수정</h3></div>
            <div class="modal-body">
            <div class="row"><div class="col-md-6" id="scUpdatePro">	
    		</div><div class="col-md-6" id="scUpdatePost">
    		</div></div></div>
            <div class="modal-body"> <div class="row"><div class="col-md-12">
            <input type="text" class="form-control" placeholder="일정 제목을 입력해주세요." name="scheduleTitleUpdate" id="scheduleTitleUpdate" required="required" size="10" style="width=100%">
            </div></div>
            <div class="row"><div class="col-md-12">　</div></div>
            <div class="row"><div class="col-md-12">
            <input type="date" id="startDateUpdate" > ~ <input type="date" id="endDateUpdate">
            </div></div></div>
            <div class="modal-footer">
             <button type="button" class="btn btn-primary" onClick="saveUpdateSchedule();">수정</button>
             <button type="button" class="btn btn-primary" onClick="deleteSchedule();">삭제</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal"  onClick="close_up_pop();">닫기</button></div>
            <!-- </div> -->
         </div>
     <!--     Modal 내용 끝 -->
      </div>
<!--팝업모달 끝 -->



</body>
</html>