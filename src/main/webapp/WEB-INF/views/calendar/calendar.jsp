<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link rel='stylesheet' type='text/css' href='/js/fullcalendar/fullcalendar.css' />
<link rel='stylesheet' type='text/css' href='/js/fullcalendar/fullcalendar.print.min.css' media='print'/>

<script type='text/javascript' src='/js/jquery/jquery-ui.min.js'></script>
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




<script type='text/javascript'>

var title ="";

	$(document).ready(function() {
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		var calendar = $('#calendar').fullCalendar({
			
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				
               /* module 데이터값 가져오는 ajax */
               
          $.ajax({
         url : "/calendarSchedule.do",
         type : "post",
         data : ,
         success : function(data) {
         
            if(data.post!=null){
               $('#project-title').html(data.post.postTitle);
              
            } else {
               $('#post-title').html('글 제목 실패');
            }
            
            open_pop();
         },
         error : function(data) {
            console.log("실패");
         }

                
				if (title) {					
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
				
			},
			editable: true,
			/* events: [
				{
					title: '01 All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: '02 Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: '03 Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: '04 Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: '05 Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: '06 Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: '07 Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false // 주간의 나타남, true 나타나지않음
				},
				{
					title: '08 Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			] */
		});
		
		
	});
	
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

   		title = document.getElementById("scheduleTitle").value
        	
    	 $('#myModal').hide();
    }
    
</script>

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

	/* div {
	border: 1px solid black;
	} */
	
</style>


<title>캘린더</title>
</head>
<body>


<div id="calendar"></div>

<div id="myModal" class="modal">
      
       <!--   Modal 내용 -->
         <div class="modal-content" style="width:30%;">
            <!-- <div class="modal-content ng-scope"> -->
            <div class="modal-header">
            <div class="row"><div class="col-md-6">
    		<select class="form-control">
    		<option value="">프로젝트선택</option>
    		<c:forEach items="${list}" var="l">
    		<option>${l.proTitle}</option>
    		</c:forEach>
    		</select></div>
    		<div class="col-md-6">
    		<select class="form-control">
    		<option value="">관련글선택</option>
    		<c:forEach items="${list}" var="l">
    		<option>${l.proTitle}</option>
    		</c:forEach>
    		</select>
    		</div>
            </div>
            </div>
            <div class="modal-body"><input type="text" class="form-control" placeholder="일정 제목을 입력해주세요." name="recipeTitle" id="scheduleTitle" required="required" size="10" style="width=100%"></div>
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