<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl 선언 -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 프로젝트 생성 관련 모달 입니다.</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
</head>


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
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        
        .divStyle {
        	cursor:pointer; 
        	background-color:#CFF09E; 
        	text-align:center; 
        }
        
        .btnStyle {
        	background-color:#CFF09E; 
        	height:100%; 
        	width:100%; 
        	background:transparent; 
        	border:none;
        	outline:0;
        	padding-top:10px;
        	padding-bottom:10px;
        }
        
        span {
        	font-size:13pt;
        }
        
        #m_header {
        	padding : 0px;
        	text-align: right;
        	display: inline-block;
        	
        }
        
        #m_header img {
        	height : 25px;
        	width : 25px;
        	cursor:pointer;
        }
        
 
</style>

<script type="text/javascript">
      
        jQuery(document).ready(function() {
                $('#createProjectModal').show();
        });
        
        //팝업 Close 기능
        function close_pop(flag) {
             $('#createProjectModal').hide();
        };

		function periodOff() {
			document.getElementById('periodLabel').innerHTML = " ";
		}

		function periodOn() {
			document.getElementById('periodLabel').innerHTML = "<input type='date' id='proStartDate' name='proStartDate'> ~ <input type='date' id='proEndDate' name='proEndDate'>";
			document.getElementById('proStartDate').valueAsDate = new Date();
			document.getElementById('proEndDate').valueAsDate = new Date();
		}

		function submitCheck() {
			if(document.getElementById('proTitle').value == "") {
				alert("프로젝트명을 입력해주세요.");
				return false;
			} else {
				return true;
			}
		}
		
</script>


<body>

    <!-- The Modal -->
    <div id="createProjectModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
      	<!-- 닫기 버튼 -->
      	<div class="modal-header" id="m_header"><img src="/resources/images/project/delete-button.png" onClick="close_pop();"></div>
      	<div class="modal-body">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">새 프로젝트 생성</span></b></span></p>
                <form action="/createProject.do" method="get">
                <p style="text-align: center; line-height: 1.5;"><br />
  					프로젝트 이름 : <input type="text" name="proTitle" id="proTitle"> <br>
					기간 : 없음 <input type="radio" name="period" onClick="periodOff();" checked> / 있음 <input type="radio" name="period" onClick="periodOn();">
					<br><label id="periodLabel"></label><br>
					<input type="hidden" name="proMemberNo" value="${sessionScope.member.memberNo}"> <!-- 세션 정보 -->
				</p>
                <!-- submit 버튼 -->
                <div class="divStyle">
                <button class="btnStyle" onClick="return submitCheck();"><span>생성</span></button>
                </div>
                </form>
      	</div>
      </div>
 
    </div>
    <!--End Modal-->

</body>

</html>