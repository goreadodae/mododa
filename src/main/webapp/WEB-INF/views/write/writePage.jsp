<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><c:out value="${currentProName}" /> - 모두다</title>
<script src="/resources/js/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


<!-- 파일 업로드  -->
<!-- <script src="path/to/your/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
 -->


<script>

	$.noConflict
	//전체화면 사이즈 구하는 jquery
	function divSize() {
		var size = $(window).height();

		$(".frameSize").css({
			"height" : size + "px"
		});
	}
	window.onload = divSize;
	window.onresize = divSize;

	var flag = true

	function hide() {
		if (flag == true) {
			$('#tempSaved').show();
			$('.colorChange').css("background-color", "#F5F5F5");
			$('.colorChange li').css("background-color", "#F5F5F5");
			$('#tempSaved').css("background-color", "#F5F5F5");
			$('#test').css('linear-gradient', '');
			$('#showBTop').css('border-top', "2px solid #F5F5F5");
			$('#showBTop').css('border-right', "2px solid #F5F5F5");
			$('#imageSpace').css('border-right', '2px solid #F5F5F5');
			$("#hideList")
					.append(
							'<img src="/resources/images/writeImages/left-arrow.png"/>');
			$("#forClear").append(
					'<img src="/resources/images/writeImages/tmpSave.png"/>');
			$('#imageSpace').addClass('border-right');

			flag = false;
		} else {
			$('#tempSaved').hide();
			$('.colorChange').css("background-color", "white");
			$('#test').css("background-color", "white");
			$('#showBTop').css('border', "none");
			$('#imageSpace').css('border', "none");
			$("#forEmptyImg img").remove();
			$('#imageSpace').removeClass('border-right');
			flag = true;
		}

	}

	function changeClick() {
		console.log($("#memberNo").val()+"검색창으로 전환!");

		$("#searchPj").attr('type', 'text');
		$("#changeType").css('display', 'none');

	}

	//프로젝트 검색창 hide&show 
	$(document).click(
			function(e) {
				if (e.target.className == "findPj"
						|| e.target.className == "changeType") {
					$("#searchPj").val("");
					$("#searchPj").focus();
					return false;
				} else {
					$("#searchPj").attr('type', 'hidden');
					$("#changeType").css('display', 'block');
				}
			});

	//자동완성

	/* 	$(document).ready(function() {


	 $("#searchPj").autocomplete({
	 matchContains:true,
	 delay:100,
	 source : function(request, response) {
	 $.ajax({
	 type : "post",
	 url : "/autoComplete.do",
	 dataType : "json",
	 data : {
	 searchValues : request.term,
	 memberNo : $("#memberNo").val()

	 },
	 success : function(data) {
	 console.log("성공");
	
	 response($.map(data, function(item) {
	
	
	 return {

	 label : item.proTitle,
	 value : item.proTitle
	 }
	 }));
	
	 },
	 error : function(data) {
	
	 console.log("에러");
	 }

	 })
	 },
	 minLength :2,
	 autoFocus:false,
	 select:function(event,ui){
	 console.log(ui.item.label);
	 $('#changeType').text(ui.item.vale);
	 $('#changeType').css('color','#0093BF');
	 },focus:function(event,ui){
	 return false;
	 }
	 });
	 });
	 */
	//파일 이미지 업로드
	window.URL = window.URL || window.webkitURL;

	/* 	var fileSelect = document.getElementById("fileSelect");
	 var filesElem = document.getElementById("fileElem"); */
	var imgCount = 0;
	var filesLength = 0;
	var img;
	function readURL(files) {
		var str
		console.log($('#fileElem').val());
		var height = $('.height').height('100px');

		if (!files.length) {
			alert("No files selected!");
		} else {
			filesLength += files.length;

			console.log(filesLength);

			for (i = 0; i < files.length; i++) {

			 	img = document.createElement("img");
				img.src = window.URL.createObjectURL(files[i]);
				img.style.height = 100 + '%';
				img.style.width = 100 + '%';

				img.onload = function() {
					window.URL.revokeObjectURL(this.src);
				} 
				$(
						'<div class="col-md-6 imgHeight" style="height:100px; padding-top:5%;"><div class="col-md-12" style="border: 1px solid #E6E6E6; height: 80px; padding:0%;">'
								+ img.outerHTML + '</div></div>').appendTo(
						$('#divEnter'));
	/* 			str ="<p><input type='file' id='file_"+imgCount+"' name='file_"+imgCount+"'</p>";
					  $('#divEnter').append(str);
					  str=""; */
				imgCount++;

			}
			var str ="<p>" +
					"input type='file' id=''"

			if ($('#moreViewDiv').height() >= 200 && filesLength > 3) {
				$('#moreViewDiv').addClass('moreViewDiv');
				$('#moreViewText').css('display', 'block');

			}

		}

	}

	//더 보기
	var convertMoreView = true;
	$(document).ready(function() {
		$('#moreViewFn').click(function() {
			if (convertMoreView) {

				$('#moreViewDiv').removeClass('moreViewDiv');
				$('#moreViewFn').text("접어 두기");
				convertMoreView = false;
			} else {

				$('#moreViewDiv').addClass('moreViewDiv');
				$('#moreViewFn').text("더 보기");
				convertMoreView = true;
			}

		});

	});

	//modal 후  처리..!
	function closeBtn() {

		var result = window.confirm("정말 종료하시겠습니까??");
		if (result == true) {
			
			/* location.href="/index.jsp" */
		} else {
			return false;
		}

	}

	$(document).ready(function() {
		$('#closeRWrite').click(function() {
			console.log("클릭");
			$('#relationWrite').hide();

		});

	})

	/* 	$(document).ready(function(){
	 window.onload
	
	
	 }); */

	/*  	$(document).ready(function () {

	 $('#toWriteFn').click(function () {
	 $('#Modal').modal({
	 show: true
	 })
	 });

	 $('.modal').on('show.bs.modal', function (event) {
	 var idx = $('.modal:visible').length;
	 $(this).css('z-index', 1040 + (10 * idx));
	 });
	 $('.modal').on('shown.bs.modal', function (event) {
	 var idx = ($('.modal:visible').length) - 1; // raise backdrop after animation.
	 $('.modal-backdrop').not('.stacked').css('z-index', 1039 + (10 * idx));
	 $('.modal-backdrop').not('.stacked').addClass('stacked');
	 });


	 }); 
	 */

	/* $(document).ready(
			function() {
				$('#searchPj').focus(
						function() {

							$.ajax({
								url : "/projectNameList.do",
								type : "post",
								data : {
									memberNo : $('#memberNo').val()

								},
								success : function(data) {
									$('#addPjList').find("button").remove();

									for (var i = 0; i < data.length; i++) {

										console.log(data[i].proTitle);
										$('#addPjList').append(
												'<button id="pjName'+data[i].proNo+'" class="dropdown-item" type="button">'
														+ data[i].proTitle   
														+ '</button>');
									}

								},
								error : function(data) {
									console.log("실패");
								}
							})

						});

			}); */

	//일정추가 
	var scheCnt = 1;
	var scheduleCnt = 0;

	function saveScheduleToView() {

		var title = $('#scheduleTitle').val();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		console.log("title");



			$(
					'<div id="schdules_'
							+ scheCnt
							+ '" class="col-md-6" style="height:100px; padding-top:5%;">'
							+ '<div class="col-md-12" style="border: 1px solid #E6E6E6; height: 80px; padding:0;">'
							+ '<div class="col-md-12" style="padding:5px;color:#A1A1A1;"><img src="/resources/images/writeImages/calendar.png" style="padding:0;"/>&nbsp;&nbsp;'
							+ startDate + '</div><div class="col-md-12">'
							+ title + '</div></div></div>'
							+ '<input type="hidden" name="startDate" value="'+startDate+'"/>'
							+ '<input type="hidden" name="endDate" value="'+endDate+'"/>'
							+ '<input type="hidden" name="scheTitle" value="'+title+'"/>').appendTo($('#addSchedules'));
			//일정개수
			scheduleCnt++;
			$('#scheduleCnt').text(scheduleCnt);

		//초기화
		$('#scheduleTitle').val("");
		$('#startDate').val("");
		$('#endDate').val("");

	}

	//관련 글 불러오기

	 var preventStack = true;
	function bringRelativeWrite() {
		var currentProNo = $("#currentProNo").val()
		var str="";

		$
				.ajax({
					url : "/relationWritingList.do",
					type : "get",
					data : {

						currentProNo : currentProNo

					},

					success : function(data) {
						$("#relationList").empty();
						
						console.log(currentProNo);
						var flag = 0;
							for (var i = 0; i < data.length; i++) {
								
								for(var j=0;j<checkedInfoList.length;j++){
									
									if(data[i].postNo==checkedInfoList[j]){
										flag=1;
										break;
									}
								}
								if(flag==1){
									flag=0;
									continue;
								}
								str +=	'<li id="checkedResult_'+data[i].postNo+'" class="list-group-item" style="padding-top: 10px;">';
								str += '<div class="row" style="height: 50%">';
								str += '<div class="col-md-12" style="height: 100%">';
								str += '<input type="checkbox" id="checked_'+data[i].postNo+'" name="checkedWriting" style="height: 100% !important; vertical-align: middle;"'
								str += 'value="'+data[i].postTitle+','+data[i].memberName+','+data[i].postNo+'">';
								str += '<span id="pTitle_'+data[i].postNo+'" style="font-size:23px; padding-left:15px">';
								str += data[i].postTitle;
								str += '</span>';
								str += '</div>';
								str += '</div>';
								str += '<div class="row" style="height: 50%; padding-left:25px;"><div class="col-md-12">';
								str += '<h6 style="display: inline">';		
								str += '<span style="padding-right:5px;"><img src="/resources/upload/member/'+ data[i].memberPicture +'" class="rounded-circle border memPic" /></span>';		
								str += '<span id="pMName_'+data[i].postNo+'">'+data[i].memberName+'</span>&nbsp;&nbsp;';
								str += '</span>&nbsp;&nbsp;';
								str += '<span>'+data[i].postDate+'</span>';
								str += '</h6>&nbsp;&nbsp;';
								str += '</div>';
								str += '</div>';
								str += '</li>';
								
								$('#relationList').append(str);
								
									str ="";
							/* console.log($('"#checked_'+data[i].postNo+'"').val()); */
							}
							
							
						

					},
					error : function(data) {
						console.log("실패");
					}

				})

	} 
	
	$(document).ready(function(){
		$('#relationSearch').keypress(function(){
			
			var searchKeyword = $("#relationSearch").val();
			var currentProNo = $("#currentProNo").val();
			var str="";
			var failed ="";
			console.log(checkedInfoList.length+"검색");
			
			
			 if(event.which == 13) {	
				 
			$.ajax({
			url : "/searchWriting.do",
			type : "get",
			data : {
					searchKeyword : searchKeyword,
					currentProNo : currentProNo
			},
			success : function(data) {
				$("#relationList").empty();
				if(data.length == 0)
				{	
					console.log("이프");
					console.log(data);
					failed += '<li class="list-group-item" style="padding-top: 10px; height:600px !important;" >'
					failed += '<div class="row">';
					failed += '<div class="col-md-12">';
					failed += '<img id="searchImg" src="/resources/images/writeImages/search.png" />';
					failed += '</div>';
					failed += '</div><br><br>';
					failed += '<div class="row">';
					failed += '<div class="offset-md-4">';
					failed += '<h5 style="color:#A1A1A1; font-weight:bold;">검색 결과가 없습니다.</h5>';
					failed += '</div></div></li>';	
					$('#relationList').append(failed);
					failed = "";
					
				}
				else{
					console.log("엘스");
					var flag = 0;
	
								for(var i=0; i<data.length; i++)
									{
										for(var z=0;z<checkedInfoList.length;z++){
										if(data[i].postNo==checkedInfoList[z])
										{
											flag=1;
											break;
										}
									}
										if(flag==1)
										{
											flag=0;
											continue;
										}
										str +=	'<li id="checkedResult_'+data[i].postNo+'" class="list-group-item" style="padding-top: 10px;">';
										str += '<div class="row" style="height: 50%">';
										str += '<div class="col-md-12" style="height: 100%">';
										str += '<input type="checkbox" id="checked_'+data[i].postNo+'" name="checkedWriting" style="height: 100% !important; vertical-align: middle;"';
										str += 'value="'+data[i].postTitle+','+data[i].memberName+','+data[i].postNo+'">';										
										str += '<span id="pTitle_'+data[i].postNo+'" style="font-size:23px; padding-left:15px">';
										str += data[i].postTitle;
										str += '</span>';
										str += '</div>';
										str += '</div>';
										str += '<div class="row" style="height: 50%; padding-left:25px;"><div class="col-md-12">';
										str += '<h6 style="display: inline">';	
										str += '<span style="padding-right:5px;"><img src="/resources/upload/member/'+ data[i].memberPicture +'" class="rounded-circle border memPic" /></span>';
										str += '<span id="pMName_'+data[i].postNo+'">'+data[i].memberName+'</span>&nbsp;&nbsp;';
										str += '</span>&nbsp;&nbsp;';
										str += '<span>'+data[i].postDate+'</span>';
										str += '</h6>&nbsp;&nbsp;';
										str += '</div>';
										str += '</div>';
										str += '</li>';
									}
								
								$('#relationList').append(str);
								str="";		
						}
			},
			error : function(data) {
				console.log("검색 실패");
			
				
				
			}
			 
			})
		}			
		})

	})
	
	function loadByProName(no){
		var proNo = $('#proNo_'+no).val();
		var str ="";
		
		$.ajax({
			url : "/loadByProName.do",
			type : "post",
			data : {
				proNo :proNo
			},
			success : function(data){
				console.log("성공");
				console.log(proNo+"를 불러왔어요");
				$("#relationList").empty();
				 
				 var flag = 0;
				for (var i = 0; i < data.length; i++) {
					
					for(var z=0; z<data.length; z++)
					{
						if(data[i].postNo==checkedInfoList[z]){
							flag=1;
							break;
						}
						
					}
						if(flag==1){
						flag=0;
						continue;
					}
					console.log(data[i].postNo+"불러온 포스트 번호는");
					str +=	'<li id="checkedResult_'+data[i].postNo+'" class="list-group-item" style="padding-top: 10px;">';
					str += '<div class="row" style="height: 50%">';
					str += '<div class="col-md-12" style="height: 100%">';
					str += '<input type="checkbox" id="checked_'+data[i].postNo+'" name="checkedWriting" style="height: 100% !important; vertical-align: middle;"'
					str += 'value="'+data[i].postTitle+','+data[i].memberName+','+data[i].postNo+'">';
					str += '<span id="pTitle_'+data[i].postNo+'" style="font-size:23px; padding-left:15px">';
					str += data[i].postTitle;
					str += '</span>';
					str += '</div>';
					str += '</div>';
					str += '<div class="row" style="height: 50%; padding-left:25px;"><div class="col-md-12">';
					str += '<h6 style="display: inline">';
					str += '<span style="padding-right:5px;"><img src="/resources/upload/member/'+data[i].memberPicture+'" class="rounded-circle border memPic" /></span>';
					str += '<span id="pMName_'+data[i].postNo+'">'+data[i].memberName+'</span>&nbsp;&nbsp;';
					str += '</span>&nbsp;&nbsp;';
					str += '<span>'+data[i].postDate+'</span>';
					str += '</h6>&nbsp;&nbsp;';
					str += '</div>';
					str += '</div>';
					str += '</li>';
					
					$('#relationList').append(str);
					
						str ="";
					
				}
				console.log(data[0].proTitle);
				$('#currentReProName').text(data[0].proTitle);
				
				
				
				
			},
			error : function(data){
				console.log("실패");
			}
		});
		
		
		
		
		
		
	}
			
	var checkedInfoList = [];  
	$(document).ready(function(){
		$('#saveRelationWriting').click(function(){
			var str ="";
			var postInfo ="";

			$('input:checkbox[name=checkedWriting]:checked').each(function(index, item){
					 str = $(this).val();
					 postInfo = str.split(',');	
					 
				checkedInfoList.push(postInfo[2]);
					 
				$(
						  '<div class="col-md-6" style="height:100px; padding-top:5%;">'
						+ '<div class="col-md-12" style="border:1px solid #E6E6E6; padding:0px; height: 80px;">'
						+ '<div class="col-md-12" style="padding:5px; color:#A1A1A1;"><img src="/resources/images/writeImages/invention.png" style="padding:0;"/>&nbsp;&nbsp;'
						+ postInfo[1] + '</div><div class="col-md-12" style="color:#A1A1A1; font-size:11px; text-overflow:ellipsis">'
						+ postInfo[0] + '</div></div></div>').appendTo($('#addRelationWriting'));
				console.log(postInfo[2]);
				
				 
				$('#writingCnt').text(checkedInfoList.length);
				console.log(checkedInfoList);
				console.log($('#checkedResult_'+postInfo[2]).val()+"지울때");
				$('#checkedResult_'+postInfo[2]).remove();
				
				str="";
			
	
				
			});
		});	
	})
	
	//해시태그
	$(document).ready(function(){
 
    $("#hashTag").on('keyup',function(e){

        var special =  /[`~!@#$%^&<>()*|\\\'\"\;:\/?]/gi;
        var children = $("#after_tag").children('span').length;
        var check = $(this).val();
        
        if(special.test(check) == true){
        
            alert('특수문자는 사용할 수 없습니다.');
            $("#hashTag").val("");
            return false;
        }
        
        if(e.which == 32 || e.which == 188){
        
            var tag = $("#hashTag").val();
            tag = tag.trim();
            
            if(tag != "" && tag != ',' ){
        
                if(tag.match(',')){
                    tag = tag.substring(0 , tag.length-1);
                }
                
            var resister_tag = "<span class='before_tag' style='color:#C3C3C3; font-size:13px;' id='tag_"+children+"'>"+" #"+tag+"<a class='removeLink' href='javascript:delTag("+children+")' style='margin-left:7px;' >&times;</a></span>";
           		resister_tag += "<input type='hidden' name='hashResults' value='#"+tag+"'/>" 
            
            $("#after_tag").prepend(resister_tag);
            
          
           		
            
            //초기화
            $("#hashTag").val("");
        
            }else{
            
                if(tag == ""){
                    alert("첫단어 공백은 불가합니다.");
                    $("#hashTag").val("");
                    return false;
                }else{
                    alert("첫단어 쉼표는 불가합니다.");
                    $("#hashTag").val("");
                    return false;}
            }
        }
    });
});

	

	
	function delTag(n){
		var id="#tag_" + n;
		$(id).remove();
	}
	
	
	// 저장할때 어떻게 저장할지.
 	$('form').submit(function tag_post(){
		var ts ="";
		var t = $("after_tag").children('span');
		console.log(t);
		t.each(function(){
			var v = $(this).html();
			var rt = v.split('<a');
			ts += "#"+rt[0];
		});
		$("#hashResults").val(ts);
	} 
	);
	
/* 	$(document).ready(function(){
		$('#inputContents').keypress(function(){
 	var inputText = $('#inputContents').text();
 	 var expUrl = ﻿﻿ /(((http(s)?:\/\/)\S+(\.[^(\n|\t|\s,)]+)+)|((http(s)?:\/\/)?(([a-zA-z\-_]+[0-9]*)|([0-9]*[a-zA-z\-_]+)){2,}(\.[^(\n|\t|\s,)]+)+))+/gi;
 	 var changedData = ﻿ inputText.replace(expUrl, '<a onclick="javascript:location.href='+'"$&"">$&</a>');
 	 
 	 if(event.which == 13)
 	 {
 	 
	 	 if(expUrl.test(inputText) == true)
			{
	 		 $('#inputContents').append(changedData);
				console.log(changedData);
					 
			}
		}
		})
	}) */
	
/* 	<a onclick="javascript:location.href='www.naver.com'">naver</a> */
					

var imgTran = true;
$(document).ready(function(){
	$('#addPartnerPic').mouseenter(function(){
	
				$('#addPartnerPic').attr('src','/resources/upload/member/defaultUserImg.png');
				$('#addPartnerPic').addClass('border');
				

	});
	$('#addPartnerPic').mouseleave(function(){
		$('#addPartnerPic').attr('src','/resources/images/writeImages/add-button.png');
		$('#addPartnerPic').removeClass('border');
	})
	
});



/* function calledPartner(){
	
	$('#addParImg').prepend('<img style="height:100%; float:right; margin-left:-19px !important;'
							+ '" src="/resources/upload/member/defaultUserImg.png"'
							+ 'class="rounded-circle border"/>');

} */

function convertProject(no){
	var proNo = $('#-'+no).val();
	var str ="";
		$.ajax({
			url :"/convertProName.do",
			type : "post",
			data : {
				proNo : proNo
			},
			success : function(data){
				
				
				
				console.log(data);
				$('#partnersList button').remove();
				console.log("불러오기 성공");
				$('#changeType').text(data.currentProName);
				$('#changeType').css('color','#339966');
				
				
				for(var i = 0; i<data.proMember.length; i++){
					str += '<button id="calledMember_'+data.proMember[i].memberNo+'" onclick="calledProMember('+data.proMember[i].memberNo+');" class="dropdown-item" type="button">'
					str += '<img src="/resources/upload/member/'+data.proMember[i].memberPicture+'" class="rounded-circle border"> &nbsp;&nbsp;'
					str += data.proMember[i].memberName
					str += '<input type="hidden" value="'+data.proMember[i].memberPicture+'" id="calledMemPic_'+data.proMember[i].memberNo+'"/>'
					str += '<input type="hidden" value="'+data.proMember[i].memberName+'" id="calledMemName_'+data.proMember[i].memberNo+'"/>'
					str += '</button>'
					$('#partnersList').append(str);
					str="";
				}
				
			},
			error : function(data){	
			}	
		})
}

//프라이빗 클릭 시 파트너 불러오기!

$(document).ready(function(){
	var	privateNo = $('#privateSpace').val(); 
	var str = "";
	$('#privateSpace').click(function(){
		$.ajax({
		url : "/myPartners.do",
		type : "post",
		data : {
			privateNo : privateNo
			
		},
		success : function(data){
			$('#partnersList button').remove();
			console.log(data);
			$('#changeType').text(data.privateSpace);
			$('#changeType').css('color','#FF5F2E');
			
			
			for(var i = 0; i<data.partners.length; i++)
				{
					str += '<button id="calledPartner_'+data.partners[i].memberNo+'" onclick="calledPartner('+data.partners[i].memberNo+');" class="dropdown-item" type="button">'
					str += '<img src="/resources/upload/member/'+data.partners[i].memberPicture+'" class="rounded-circle border"> &nbsp;&nbsp;'
					str += data.partners[i].parName
					str += '<input type="hidden" value="'+data.partners[i].memberPicture+'" id="calledPartnerPic_'+data.partners[i].memberNo+'"/>'
					str += '<input type="hidden" value="'+data.partners[i].parName+'" id="calledPartnerName_'+data.partners[i].memberNo+'"/>'
					str += '</button>'
					$('#partnersList').append(str);
				
				str="";

				}
			

		
			
		},error : function(data){
			
		}
			
			
			
		})	
	});
	
	
});
//파트너(프라이빗 공간 친구) 호출
function calledPartner(no){
	console.log("클릭했어요!!");
	console.log(no);
	var partnerPic = $('#calledPartnerPic_'+no).val();
	
	$('#addParImg').prepend('<img style="height:100%; float:right; margin-left:-19px !important;'
			+ '" src="/resources/upload/member/'+partnerPic+'"'
			+ 'class="rounded-circle border" id="cancelCallPar_'+no+'" onclick="cancelCallPartner('+no+');"/>');
	
	console.log($('#calledPartner_'+no).val());
	$('#calledPartner_'+no).hide();
	
}

// 프로젝트(프로젝트 공간 친구) 호출 
function calledProMember(no){
	console.log("calledPromember"+no);
	console.log(no);
	var memberPic =$('#calledMemPic_'+no).val();
	console.log(memberPic + "사진 값")
	$('#addParImg').prepend('<img style="height:100%; float:right; margin-left:-19px !important;'
			+ '" src="/resources/upload/member/'+memberPic+'"'
			+ 'class="rounded-circle border" id="cancelCallMem_'+no+'" onclick="cancelCallMember('+no+');"/>');	
	
	$('#calledMember_'+no).hide();

}

//파트너(프라이빗 공간 친구) 호출 취소
function cancelCallPartner(no){
	console.log("취소");
	$('#calledPartner_'+no).show();
	$('#cancelCallPar_'+no).remove();
}

//파트너(프라이빗 공간 친구) 호출 취소
function cancelCallMember(no){
	$('#calledMember_'+no).show();
	$('#cancelCallMem_'+no).remove();
}


//현재 페이지에서 프로젝트 원 가져오기
function defaultCall(no){
	console.log("첫 페이지!");
	var memberPic = $('#memberPic_'+no).val();
	console.log($('#memberPic_'+no).val());
	
	$('#addParImg').prepend('<img style="height:100%; float:right; margin-left:-19px !important;'
			+ '" src="/resources/upload/member/'+memberPic+'"'
			+ 'class="rounded-circle border" id="defaultCancelCallMem_'+no+'" onclick="defaultCancelCallMember('+no+');"/>');
	$('#defaultCall_'+no).hide();
	
}
function defaultCancelCallMember(no){
	console.log("지울 준비 됐음");
	
	$('#defaultCancelCallMem_'+no).remove();
	$('#defaultCall_'+no).show();
	
}


					
</script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
/* div {
	margin: 0px;
	padding: 0px;
	-webkit-box-sizing: border-box !important;
	-mox-box-sizing: border-box !important;
	box-sizing: border-box !important;
} */
.colorChange.list-group li {
	border-left: none;
	height: 93px;
	border-right: none;
}

div {
	height: auto;
}

#imageSpace {
	background-color: #F5F5F5;
	overflow-y: auto;
}

#writeTitle {
	border: none;
	font-size: 20px;
}

#writeTitle:focus {
	outline: none;
}

#scheduleTitle {
	border: none;
	height: 100%;
	width: 100%;
}

#scheduleTitle:focus {
	outline: none;
}

div.tarea:focus {
	outline: none;
}

div.tarea {
	background-color: white;
	overflow-y: auto;
	border-bottom: 4px solid #F5F5F5;
}

#searchPj {
	border: none;
}

#searchPj:focus {
	outline: none;
}

#hashTag {
	border: none;
}

#hashTag:focus {
	outline: none;
}

.plus {
	margin-left: auto;
	margin-right: auto;
	vertical-align: middle;
	display: block;
}

#addImg {
	cursor: pointer;
}

  #partnerImg img {
	width: 35px;
	height: 35px;
} 



/* #defaultPartnerPic {
	background-image: url("/resources/images/writeImages/user.png");
	background-size: cover;
} */

/* #addPartnerPic {
	background-image: url("/resources/images/writeImages/add-button.png");
	background-size: cover;
} */

/* #partnerImg div img {
	width: 100%;
	height: 100%;
}
 */
#addPartnerPic {
	cursor: pointer;
}

#addPartnerPic button{
	padding:0px;

}


#closeFrame {
	background-image: url("/resources/images/writeImages/close.png");
	background-size: cover;
}

#relationSearch:focus {
	outline: none;
}

.scheduleInput:focus {
	outline: none !important;
}

.scheduleInput {
	border: none;
}

#closeBtn:focus {
	outline: none;
}

.dropdown-item:hover {
	background-color: #CFF09E !important;
}

.dropdown-item:focus {
	cursor: pointer !important;
}

.moreViewDiv {
	height: 220px;
	overflow: hidden;
}

#relationList li {
	height: 100px;
	padding-top: 0;
}
.memPic{
height : 2.4em;
width : 2.4em;
position : relative;
top : 0;
bottom:0;
margin:auto;
}

#searchImg{
	position :relative;
	top:40%;
	left:40%;
}
.removeLink:link{
	color:black;
	font-weight:bold;
	text-docoration:none;
}
.removeLink:hover{
	text-decoration:none;
}
#inputContents:focus{
	outline: none;
}

</style>



</head>
<body>

<form action="/insertPost.do" method="post" enctype="multipart/form-data">

	
	<div class="frameSize offset-md-1 col-md-10 offset-md-1">
	<!-- 제출 엔터 방지  -->
	<div style="display:none">
		<input type="submit" onclick="return false;"/>
		
	
	</div>
		
	
		<%-- 		<div class="row" style="height: 15%;">
			<div class="col-md-12" style="height: 100%;">
				<jsp:include page="/layout/header.jsp"></jsp:include>
			</div>
		</div> --%>


		<!-- <div class="row" style="height: 100%; padding:0px" > -->


		<!-- <div class="container" style="height: 100%; padding: 0px"> -->

		<!-- 			<div class="row" style="height: 10%">
				<div class="col-md-12" style="padding: 0px">
				</div>
			</div> -->

		<div class="row" style="height: 100%; padding: 0px;">

			<div class="col-md-3" id="test" style="padding-top: 40px; height: 100%;">


				<div class="row" style="height: 10%">

					<div class="colorChange col-md-12" style="height: 100%;" onclick="hide();">
						<div class="col-md-12" style="text-align: center; padding-top: 10px; vertical-align: middle; height: 100%">
							<div class="row" id="forEmptyImg" style="padding-top: 5px">
								<span id="hideList"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;임시 저장 글 <span>(4)</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div id="forClear"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="height: 90%">

					<div class="col-md-12 border-right" style="padding: 0px; height: 100%; display: none" id="tempSaved">
						<ul class="colorChange list-group" style="text-align: left;">

							<li class="list-group-item"><span>안녕하세요</span> <br> <span style="color: #B8B8B8">2018.7.16</span> <br> <span style="color: #339966">프라이빗 공간</span> <br></li>
							<li class="list-group-item"><span>안녕하세요</span> <br> <span style="color: #B8B8B8">2018.7.16</span> <br> <span style="color: #339966">프라이빗 공간</span> <br></li>
							<li class="list-group-item"><span>안녕하세요</span> <br> <span style="color: #B8B8B8">2018.7.16</span> <br> <span style="color: #339966">프라이빗 공간</span> <br></li>

						</ul>


					</div>

				</div>


			</div>
			<!-- 임시저장 공간  -->

			<div class="col-md-9" style="height: 100%">

				<div class="row" style="padding-top: 40px; height: 15%;">
					<div class="col-md-12" id="showBTop" style="height: 100%; padding-top: 14px;">
						<div class="row" style="padding-left: 15px; height: 100%;">
							<div class="col-md-2" style="height: 100%; padding: 0px;">
								<span class="changeType" style="color: #339966;" id="changeType"  onclick="changeClick();">
								<c:out value="${currentProName}"></c:out>
								</span>

								<div class="dropdown" style="padding: 0px">

									<input type="hidden" placeholder="프로젝트 검사" id="searchPj" class="findPj" data-toggle="dropdown" role="button" />
										
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" id="addPjList">
											<button id="privateSpace" class="dropdown-item" type="button" value="${myPrivateSpace.proNo}">
											<c:out value="${myPrivateSpace.proTitle}"/>
											</button>
											
											<c:forEach items="${proList}" var="proList">
												<button id="convertPro_${proList.proNo}" name="currentProNo" onclick="convertProject(${proList.proNo})" class="dropdown-item" type="button" value="${proList.proNo}">
													<c:out value="${proList.proTitle}"/>
												</button>



											</c:forEach>


										</ul>
								</div>



								<input type="hidden" id="memberNo" value="${sessionScope.member.memberNo}" />
							</div>
							<div class="col-md-10">
									<div class="col-md-12">
										<!-- 파트너 아이콘 불러오기 -->
										<div class="row" id="partnerImg" style="height: 100%;">
											
											<div class="col-md-11" style="float:left;">
											
											
											<div class="col-md-12">
											<div class="row">
												<div class="col-md-11" id="addParImg" style="padding:0px;">
												
												 <img style="height:100%; float:right;" src="/resources/upload/member/${myPicture}" class="rounded-circle border"/>											
												
												
											
												</div>
												
										  		<div class="dropup col-md-1" style="padding-left:10px;">
													<img src="/resources/images/writeImages/add-button.png" data-toggle="dropdown" class="rounded-circle" id="addPartnerPic" role="button"/>
													<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" id="partnersList">
														<c:forEach items="${proMember}" var="proMember">
														
														<button id="defaultCall_${proMember.memberNo}" onclick="defaultCall(${proMember.memberNo});" class="dropdown-item" type="button">
														<img src="/resources/upload/member/${proMember.memberPicture}" class="rounded-circle border">
														<input type="hidden" id="memberPic_${proMember.memberNo}" value="${proMember.memberPicture}"/> 
														&nbsp;&nbsp;
														${proMember.memberName}</button>
													
													
														</c:forEach>
														
														
													</ul>
	 
												</div>
											</div>
											
											
											</div>
											
											
												
											</div>
											
											
											
											







									<div class="col-md-1">

										<!-- 페이지 닫기  -->
											<button onclick="closeBtn()" id="closeBtn" type="button" class="close" aria-label="Close" style="height: 100%">
												<span aria-hidden="true" style="height: 100%;">&times;</span>
											</button>
										


									</div>
										</div> 


									</div>

								
							</div>
						</div>
					</div><!-- 쇼비탑  -->
				</div>
				<div class="row" style="height: 85%">
					<div class="col-md-8" style="height: 100%">
						<div class="row" style="height: 80%">
							<div class="col-md-12" style="height: 100%;">
								<div class="row" style="height: 10%">
									<div class="col-md-12" style="height: 100%;">
										<input type="text" name="writeTitle" id="writeTitle" placeholder="제목을 입력해 주세요" maxlength="30" size="30" style="height: 100%;" />
									</div>
								</div>
								<div class="row" style="height: 90%">
									<div class="col-md-12" style="height: 100%">
										<div class="tarea col-md-12" style="height: 100%; padding-left: 0px;">
											<textarea id="inputContents" name="inputContents" required=required style="width:100%; height:100%; border:none; resize:none;">
											
											
											</textarea>
										
										
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row" style="height: 20%">
							<div class="col-md-12" style="height: 100%;">
								<div class="row">
									<div class="col-md-12" id="after_tag">
										 <input type="text" id="hashTag" placeholder="#해시태그로 글을 분류해 보세요" size="35px" />


									</div>
								
									<div class="row">
										<div class="col-md-12">
											<button style="float:right; background-color: #CFF09E; border: none;" class="btn btn-primary" type="submit">저장</button>
										
										</div>
									
									
									</div>
									
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 imageSpace" id="imageSpace" style="height: 100%">
						<div class="row" id="moreViewDiv">
							<div class="col-md-12" style="height: 10%;">
								<b>파일/이미지</b>
							</div>
							<div class="col-md-12" style="height: 90%;">
								<div class="row" id="divEnter" style="height: 100%;">
									<div class="col-md-6" style="padding-top: 5%; cursor: pointer">
										<!-- <br -->
										<div class="col-md-12" style="border: 1px solid #E6E6E6; height: 80px;" onclick="document.all.fileElem.click();" id="fileSelect">

											<br>
											<!-- div 버튼 클릭시 아래 버튼 동작! -->
											<img class="plus" src="/resources/images/writeImages/plus.png" />
											<!-- 파일업로드 버튼 숨겨져있음!  -->
											<input id="fileElem" name="files"  multiple type="file" style="display:none" onchange="readURL(this.files);" />
										</div>




									</div>

								</div>

							</div>
						</div>

						<div class="row" style="display: none;" id="moreViewText">

							<div class="offset-md-4 col-md-8">
								<span style="text-align: center; cursor: pointer;" id="moreViewFn">더 보기</span>
							</div>
						</div>
						<br>
						<br>
						<!-- 일정 창  -->
						<div class="row" id="addSchedules">
							<div class="col-md-12">
								일정 <span id="scheduleCnt">0</span>
							</div>



							<div class="col-md-6" data-toggle="modal" data-target="#loadSchedule" style="padding-top: 5%; cursor: pointer;">
								<!-- <br -->
								<div class="col-md-12" style="border: 1px solid #E6E6E6; height: 80px;">

									<br> <img class="plus" src="/resources/images/writeImages/plus.png" />
								</div>




							</div>





						</div>
						<br>


						<!--  관련 글  -->
						<div class="row">
							<div class="col-md-12">
								관련 글 <span id="writingCnt">0</span>
							</div>
							<div class="col-md-12">
								<!-- 모달 버튼 시작  -->
								<div class="row" id="addRelationWriting">
									<div class="col-md-6" data-toggle="modal" data-target="#relationWrite" style="padding-top: 5%; cursor: pointer;">
										<!-- <br -->
										<div class="col-md-12" style="border: 1px solid #E6E6E6; height: 80px;" onclick="bringRelativeWrite();">

											<br> <img class="plus" src="/resources/images/writeImages/plus.png" />
										</div>
									</div>



								</div>


							</div>
							<!-- 모달 버튼 끝 -->

							<!-- 모달 시작 -->
							<div class="modal fade" tabindex="-1" role="dialog" id="relationWrite" aria-hidden="true">
								<!-- <div class="container" style="height:80%"> -->
								<div class="modal-dialog" role="document" style="background-color: white; height: 90%">
									<div class="modal-content" style="height: 100%; z-index: 1070;">

										<!-- 관련 글 헤더  -->
										<div class="modal-header" style="height: 10%; border: none !important;">
											<h4 class="modal-title" id="exampleModalLongTitle">관련 글 추가</h4>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<!-- 프로젝트 이름 가져오기  -->

											<div class="dropdown">
												<h6 style="color: #339966; padding-top: 5px;" id="byProNameDD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button">
													<span id="currentReProName"><c:out value="${currentProName}"></c:out></span>
												</h6>
												<div class="dropdown-menu" aria-labelledby="byProNameDD" id="proNameItems">
													<c:forEach items="${proList}" var="proList">
														<button class="dropdown-item" id="proNo_${proList.proNo}" onclick="loadByProName(${proList.proNo});" type="button" value="${proList.proNo}">
															<c:out value="${proList.proTitle}" />
														</button>



													</c:forEach>
												</div>

											</div>




											<c:set var="currentProNo" value="${currentProNo}"></c:set>
											<input type="hidden" id="currentProNo" name="currentProNo" value="${currentProNo}">

											<button type="button" class="close" id="closeRWrite" data-dismiss="modal" aria-label="Close" style="cursor: pointer;">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<!-- 검색창 -->
										<div class="modal-header" style="height: 10%;">


											<div class="col-md-12" style="height: 100%; padding: 0px">
												<input type="text" id="relationSearch" placeholder="관련 글 제목/작성자 검색" style="height: 100%; width: 100%; border: none;" />
											</div>

										</div>


										<div class="modal-body" style="height: 70%; padding: 0px">
											<div class="col-md-12" id="modalBody" style="overflow-y: auto; height: 100%; padding: 0px">


												<ul class="list-group" id="relationList" style="height: 100%">



												</ul>







											</div>

										</div>
										<div class="modal-footer">

											<button type="button" class="btn btn-primary" id="saveRelationWriting" style="background-color: #CFF09E; border: none">저장</button>


										</div>



									</div>


								</div>

							</div>

							<!-- 모달 끝 -->


							<!-- 일정 모달 시작   -->
							<div class="modal fade" tabindex="-1" role="dialog" id="loadSchedule" aria-hidden="true">
								<!--   Modal 내용 -->

								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<!-- <div class="modal-content ng-scope"> -->
										<div class="modal-header">
											<h3 style="color: #339966;">
												<c:out value="${currentProName}"></c:out>
											</h3>
											<button type="button" class="close" id="closeRWrite" data-dismiss="modal" aria-label="Close" style="cursor: pointer;">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-12" style="padding: 0px">
													<input type="text" class="form-control" placeholder="일정 제목을 입력해주세요." name="scheduleTitle" id="scheduleTitle"  size="10" style="height: 100%; width: 100%; border: none;" />

												</div>

											</div>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="col-md-12"></div>
											</div>
											<div class="row">
												<div class="col-md-12"></div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<input class="scheduleInput" type="date" id="startDate" ><br> ~ <input class="scheduleInput" type="date" id="endDate" >
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" onclick="saveScheduleToView();" style="background-color: #CFF09E; border: none;">저장</button>

										</div>
										<!-- </div> -->
									</div>
								</div>
								<!--     Modal 내용 끝 -->
							</div>
							<!--팝업모달 끝 -->








						</div>

						<!-- 							<br>
							<br>
							
							
							
							<form action="/update" method="get">

								
									<input type="text" id="url" name="url" placeholder="ex)www.naver.com" />
								
									<div class=" col-md-12 selector-wrapper">
									
									</div>






							</form> -->



					</div>
				</div>
			</div>

		</div>

		<!-- </div> -->
		<!-- 	</div> container-->
	</div>
</form>

</body>
</html>