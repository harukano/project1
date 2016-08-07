<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="views/registration/js/resetpassword.js"></script>
<title>비밀번호 재설정</title>
<style type="text/css">
.wrap{
	width:1000px;
	height: 100%;
	padding-top:200px;
	padding-bottom:200px;
	background-color: white;
	margin:auto;
}
.container{
	
	width:600px;
	height: 300px;
	border-top: 3px solid #333;
	border-bottom: 3px solid #333;
	margin: auto;
}
.hd{
	height: 15%;	
	background-color:#333;
	color:white;
	font-size: 15pt;
	border-bottom:3px solid #333;
	
}
.bd{
	height: 80%;
	padding-top: 50px;
	padding-bottom : 30px;
	padding-left: 100px;
	padding-right: 100px;
	margin: auto;
	
}
.title_area{
	height:99%;
	width:99%;
	border: 1px solid #333; 
	margin:auto;
}
.title{
	padding-left: 10px;
	margin-bottom: 10px;
	margin-top:10px;
}
</style>
</head>
<body>
<div class="wrap"><!-- 전체 -->
	<div class="container"><!-- 창 -->
		<div class="hd">
			<div class="title_area">
			<h4 class="title">아이디찾기</h4>
			</div>
		</div>
		<div class="bd">
		<form action="resetpassword.do" method="post" name="toresetpassword">
		<input type="hidden" id="membership_email" name ="membership_email" value="${membership_email}"/>
		<span style="width: 250px">
		 </span> 새 비밀번호 <input 
								type="password" 
								name="membership_password"
								id="membership_password"
								tabindex="5"
								value=""
								style="border: 1px solid #666666; width: 240px; height: 25px;"
							/>
		<span style="width: 250px">
		새 비밀번호 재입력 	<input 
								type="password" 
								name="confirm_password"
								id="confirm_password"
								tabindex="5"
								value="" 
								style="border: 1px solid #666666; width: 240px; height: 25px;"
							/>
		</span>
		<input type="button" value="다음" onclick="validate(this.form);">
		</form>
		</div>
	
	</div>

</div>
</body>
</html>