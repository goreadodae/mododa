<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link rel='stylesheet' type='text/css' href='/js/fullcalendar/fullcalendar.css' />
<link rel='stylesheet' type='text/css' href='/js/fullcalendar/fullcalendar.print.min.css' media='print'/>

<!-- <script type='text/javascript' src='/js/jquery/jquery-ui.min.js'></script> -->
<script type='text/javascript' src='/js/jquery/jquery.min.js'></script>
<script type='text/javascript' src='/js/jquery/moment.min.js'></script>

<script type='text/javascript' src='/js/fullcalendar/fullcalendar.js'></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery.min.js'></script>
<script src="http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery-ui.custom.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>



<script type='text/javascript'>


	$(document).ready(function() {
		
		createCal();
		
	});
	
	//캘린더 생성 기능
	function createCal(){
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
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
	    	day : "일별",
	    	},  */
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			
			selectable: true,
			selectHelper: true,
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
				        		 color : '#CFF09E'
				        	 });			  
			        	 }
			        	 callback(events);
			         },
			         error : function(data) {
			            console.log("실패");
			            }
			         });
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
    
    //모듈 값 가져오기
    function saveSchedule(){
    	
    	var proSelect = document.getElementById("projectList").value;
    	var relationSelect = document.getElementById("linkPostList").value;
    	var title = document.getElementById("scheduleTitle").value;
    	var startDate = document.getElementById("startDate").value;
    	var endDate = document.getElementById("endDate").value;
   	    	
    	console.log(proSelect);
    	console.log(relationSelect);
    	console.log(title);
    	console.log(startDate);
    	console.log(endDate);
    	
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
    

   
    
</script>
 
    <style>
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






<style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

	
</style>


<title>캘린더</title>
</head>
<body>


<div id="calendar"></div>

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
            <input type="date" id="startDate" > ~ <input type="date" id="endDate">
            </div></div></div>
            <div class="modal-footer">
             <button type="button" class="btn btn-primary" onClick="saveSchedule();">저장</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal"  onClick="close_pop();">닫기</button></div>
            <!-- </div> -->

         </div>
     <!--     Modal 내용 끝 -->
      </div>
<!--팝업모달 끝 -->



 


</body>
</html>