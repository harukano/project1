<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
	
	width:350px;
	height: 300px;
	border: 3px solid #333;
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
}
.title_area{
	height:99%;
	width:99%;
	border: 1px solid white; 
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
			<h4 class="title">바람잡이 회원등록확인</h4>
			</div>
		</div>
		<div class="bd">
		정상적으로 등록되었습니다.
		<input type="button" value="메인으로" onclick="location.href='index.do'">
		</div>
	
	</div>

</div>
</body>
</html>