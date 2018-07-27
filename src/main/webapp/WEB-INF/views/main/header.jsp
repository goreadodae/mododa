<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
/* header */
.header {
	margin: 0px;
	padding: 0px;
}

#banner {
	background-color: #339966;
	color: white;
	height: 30px;
	margin: 0px;
	padding: 0px;
	text-align: center;
	line-height: 25px;
	font-size: 15px;
}

.topbar {
	height: 50px;
	border-bottom: 1px solid #c8c8c8;
	padding: 0px;
}

#logo-img {
	height: 40px;
	vertical-align: middle;
	top: 10%;
	left: 50%;
	position: absolute;
}

#menu-img {
	height: 25px;
	top: 25%;
	left: 20%;
	position: absolute;
}

#cancel-img {
	height: 50%;
	vertical-align: middle;
	top: 22%;
	right: 3%;
	position: absolute;
	cursor: pointer;
}

/* header */
.myInfo{
	height: 70%; width: auto; position:absolute; top:0; bottom:0; margin:auto;
}
.myInfoPop{
	height: auto; width: 100%;
}
#myInfoDropDown{
	height: auto; width: 400px;
}
.dropdown-item:active{
	background-color: #CFF09E;
}
</style>

<body>

<!-- header -->
		<div class="header">

			<!-- 팝업창 -->
			<div class="row">
				<div class="col-12" id="banner">
					모두다에 대해 더 알고싶다면 여기를 클릭해 주세요. <img id="cancel-img"
						onclick="bannerClose();"
						src="../resources/images/layout-img/cancel.png" />
				</div>
			</div>

			<!-- 상단바 -->
			<div class="row">
				<div class="col-md-3 topbar">
					<img id="menu-img" src="../resources/images/layout-img/menu.png" />
				</div>

				<div class="col-md-5 topbar">
					<img id="logo-img"          
						src="../resources/images/layout-img/main_logo_rec.png" />
				</div>

				<div class="col-md-4 topbar">
					<div class="row" style="height: 100%;">
					<div class="col-md-4 topbar"></div>
					<div class="col-md-1 dropdown topbar">
						<!-- 회원 썸네일 -->
					<c:choose>
						<c:when test="${sessionScope.member.memberPicture!=null }">
							<c:set var="memberPic" value="${sessionScope.member.memberPicture }"/>
						</c:when>
						<c:otherwise>
							<c:set var="memberPic" value="../resources/upload/member/whale.png"/>
						</c:otherwise>
					</c:choose>
					<img src="${memberPic }" class="img-circle rounded-circle border myInfo dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="dropdown-menu dropdown-menu-right" id="myInfoDropDown">
						<div class="row" style="margin: 20px;">
							<div class="col-md-4" style="margin: 0;">
							<img src="${memberPic }" class="img-circle rounded-circle border myInfoPop">
							</div>
							<div class="col-md-8">
								<div class="row">
								<div class="col-md-12">${sessionScope.member.memberName }</div>
								<div class="col-md-12">${sessionScope.member.memberId }</div>
								</div>
							</div>
    						<a class="dropdown-item" href="#" onclick="gotoMyInfo();">내정보</a>
    						<a class="dropdown-item" href="#">멤버 초대 및 탈퇴</a>
    						<a class="dropdown-item" href="/logout.do">로그아웃</a>
 						</div>
 						</div>
						</div>
						<div class="col-md-1 topbar">
						<!-- 파트너추가 -->
					<img src="../resources/upload/member/add-friend.png" class="myInfo">
						</div>
						<div class="col-md-3 topbar">
						<!-- 파트너 목록 -->
						<a class="myInfo" href="">파트너 목록</a>
						</div>
						<div class="col-md-3 topbar">
						</div>
					</div>
					
					
					
					
					
				</div>
			</div>
		</div>
		<!-- header 끝 -->

</body>
</html>