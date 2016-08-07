<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인 페이지</title>
<link type="text/css" rel="stylesheet" href="/views/admin/css/login/login_admin.css" />
<script type="text/javascript" src="/views/admin/js/jquery-1.11.0.min.js"></script>	

<script type="text/javascript">
function fnJoin(){
	if(lForm.userId.value == ""){
		alert("ID를 입력해주세요.");
		lForm.userId.focus();
		return;
	}
	if(lForm.userPwd.value == ""){
		alert("비밀번호를 입력해주세요.");
		lForm.userPwd.focus();
		return;
	}
	lForm.action="/loginchk.jk";
	lForm.target="_self";
	lForm.method="post";
	lForm.submit();
}
</script>
</head>
<body>
	
	<div id="index">
	<h1 class="logo_img">MOODMAKER ADMIN</h1>
	<form name="lForm" method="post" >
	<input type="hidden" name="flag" value="action"/>
	<div id="login">
		<fieldset name="field">
			<legend>로그인</legend>
			<span class="userinfo">
				<label for="userId"><img src="/views/admin/img/login/login_txt_id.gif" alt="ID" style="ime-mode:disabled"/></label>
				<input name="userId" id="userId" type="text" class="txttype" style="ime-mode:disabled" maxlength="10"/>
				<label for="userPwd"><img src="/views/admin/img/login/login_txt_pw.gif" alt="Password" style="ime-mode:disabled"/></label>
				<input name="userPwd" id="userPwd" type="password" class="txttype" maxlength="10"/>
			</span>
			<input type="image" src="/views/admin/img/login/login.gif" class="btntype" alt="로그인" onClick="javascript:fnJoin();return false;" />
		</fieldset>
	</div>
	</form>
	<form name="aform"><input type="hidden" name="flag" value="flag"/></form>
	<p class="copyright">Copyright ⓒ <em>MOODMAKER corp.</em> All Rights Reserved.</p>
</div>
</body>
</html>