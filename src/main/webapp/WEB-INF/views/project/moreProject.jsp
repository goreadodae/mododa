<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSTL 선언 -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 더보기 관련 모달 입니다.</title>
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
            padding: 20px;
            border: 1px solid #888;
            width: 20%; /* Could be more or less, depending on screen size */
            height: 80%;
            position: fixed;
            margin-top: 5%;
            margin-left: 15%;                   
        }
        
        .divStyle {
        	cursor:pointer; 
        	background-color:#CFF09E; 
        	text-align:center; 
        	height:100%; 
        	width:100%; 
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
        
        .moreProjectLi {
			margin: 1 0;
		}
		
		#moreProjectUl {
			padding: 0;
			margin: 10%;
		}
 
</style>

<script type="text/javascript">
      
        jQuery(document).ready(function() {
             $('#createProjectModal').show();
             
 			// 프로젝트 목록
 		   	$(".moreProjectLi").click(function() {
 		   		var proNo = $(this).attr('value');
				alert(proNo);
 		    });
        });
        
        //팝업 Close 기능
        function close_pop(flag) {
             $('#createProjectModal').hide();
             $("#banner").css('background-color','#339966');
        };

		
</script>


<body>

    <!-- The Modal -->
    <div id="createProjectModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
      	<!-- 닫기 버튼 -->
      	<div class="modal-header" id="m_header"><img src="/resources/images/project/delete-button.png" onClick="close_pop();"></div>
      	<div class="modal-body">
               <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">프로젝트 더보기</span></b></span></p>
                
                
  					<ul id="moreProjectUl">
  						<c:forEach items="${projectList}" var="projectList" begin="6">
  						<li class="list-group-item moreProjectLi" value="${projectList.proNo}">
							<img src="../resources/images/project/flag.png" class="proIcon" /> ${projectList.proTitle}
						</li>
  						</c:forEach>
  					</ul>
				
                
      	</div>
      </div>
 
    </div>
    <!--End Modal-->

</body>

</html>