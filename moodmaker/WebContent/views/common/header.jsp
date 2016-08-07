<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="views/common/css/header.css" />

<script type="text/javascript">

function overImage(path, name) {
	document.images[name].src = path;
}

function outImage(path, name) {
	document.images[name].src = path;
}

 function membershipLogin(){
	var login_email = $("#login_email").val();
	var login_password= $("#login_password").val();
	if(login_email == null || login_email =="" ||  login_password == null || login_password ==""){
		alert("아이디와 비밀번호를 확인해주세요.");
		return false;
	}else{
		$("#loginForm").attr("action","login.do");
		$("#loginForm").submit();
	}
}
</script>

<title>바람잡이</title>
</head>
<body>
	<div id="centered">
	<div id="head">
		<div style="width: 1000px; height: 5px; background-color:#006699;"></div>
		<div id="loginFormArea">
			<form name="loginForm" id="loginForm" method="post">
				<table style="width: 100%;">
					<tr>
						<td style="width: *; text-align: left;">
							<a href="index.do"><img src="views/common/images/titleimage.gif" alt="바람잡이" /></a>
						</td>
						<td style="width: 70px">
						</td>
						
						<c:set var="membership_email_session" scope="session" value="${membership_email}" />
						<c:set var="membership_another_name_session" scope="session" value="${membership_another_name}" />
						<c:set var="membership_point_session" scope="session" value="${membership_point}" />
									
						<c:choose>
							<c:when test="${membership_email_session == null}">
								<td style="width: 220px; line-height: 27px;">
									<input 
										type="text" 
										name="login_email"
										id="login_email" 
										value="" 
										style="border: 1px solid #666666; width: 160px; height: 19px;"
									>
									<input 
										type="password" 
										name="login_password" 
										id="login_password" 
										value="" 
										style="border: 1px solid #666666; width: 160px; height: 19px;"
									>
								</td>
								<td style="width: 50px">
									<input 
										type="button" 
										name="login" 
										id="login" 
										value="로그인"
										onClick="membershipLogin();" 
										style="height: 49px;"
									>
								</td>
								<td style="width: 160px; text-align: center;">
									<a href="registration.do" style="text-decoration:none" >
										<img 
											src="views/common/images/membershipjoin.gif" 
											onMouseOver="overImage('views/common/images/membershipjoinb.gif', 'joinImage');" 
											onMouseOut="outImage('views/common/images/membershipjoin.gif', 'joinImage');" 
											name="joinImage" 
											alt="회원가입" 
										/>
									</a>
									&nbsp;&nbsp;&nbsp;
									<a href="lostpassword.do" style="text-decoration:none" >
										<img 
											src="views/common/images/lostpassword1.png" 
											onMouseOver="overImage('views/common/images/lostpasswordb.gif', 'lostPassword');" 
											onMouseOut="outImage('views/common/images/lostpassword1.png', 'lostPassword');" 
											name="lostPassword" 
											alt="비밀번호 찾기"
										/>
									</a>
								</td>
							</c:when>
							<c:otherwise>
								<td style="line-height: 20px; padding: 0px; text-align: right; color: #333333;">								
									<a href="/" class="member">${membership_email_session}</a> ( 별칭 : ${membership_another_name_session} )
									<br />마일리지 : ${membership_point_session} point
								</td>
								<td style="width: 84px;">
									<input 
										type="button" 
										name="logout"
										id="logout" 
										value="로그아웃" 
										onClick="location.href='logout.do'"
										style="height: 41px;"
									>
								</td>
								<td style="width: 10px;"></td>
							</c:otherwise>
						</c:choose>						
					</tr>
				</table>
			</form>
		</div>
		</div>
	
			<div id="menu">
	<!-- 티켓 예매 | 상영 시간표 | 멤버쉽 | 영화 추천 | 커뮤니티 -->
	<table style="width: 100%;">
		<tr>
			<td style="width: *; text-align: center;">
				<a href="reservation.do">
					<img 
						src="views/common/images/reservation.gif" 
						onMouseOver="overImage('views/common/images/reservationb.gif', 'reservation')" 
						onMouseOut="outImage('views/common/images/reservation.gif', 'reservation')"
						class="Outline"
						id="reservation"
						name="reservation"
						alt="메뉴(예매)" 
						style="border:none;"					
					/></a>
				
				<a href="">
					<img	
						src="views/common/images/movie.gif" 
						onMouseOver="overImage('views/common/images/movieb.gif', 'movie')" 
						onMouseOut="outImage('views/common/images/movie.gif', 'movie')" 
						class="Outline"
						id="movie"
						name="movie" 
						alt="메뉴(영화)" 
						style="border:0px;"
					/></a>
				
				<a href="">
					<img 
						src="views/common/images/membership.gif" 
						onMouseOver="overImage('views/common/images/membershipb.gif', 'membership')" 
						onMouseOut="outImage('views/common/images/membership.gif', 'membership')" 
						class="Outline"
						id="membership" 
						name="membership" 
						alt="메뉴(멤버쉽)" 
					/></a>
				
				<a href="">
					<img 
						src="views/common/images/community.gif" 
						onMouseOver="overImage('views/common/images/communityb.gif', 'community')" 
						onMouseOut="outImage('views/common/images/community.gif', 'community')" 
						class="Outline"
						id="community" 
						name="community" 
						alt="메뉴(커뮤니티)" 
					/></a>
			</td>
			<td style="width: 430px; text-align: left;">
				<input type="text" name="search" id="search" value="" style="border: 3px solid #D5D4C9; width: 250px; height: 20px; border-radius:10px; padding-left: 10px;">
				<input type="button" name="btnSearch" id="btnSearch" value="검색" style="border: 1px solid #666666; height: 24px;">
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>