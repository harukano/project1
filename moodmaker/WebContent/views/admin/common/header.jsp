<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link type="text/css" rel="stylesheet" href="/views/admin/css/login/login_admin.css" />
<script type="text/javascript" src="/views/admin/js/common.js"></script>

<!-- ckEditor -->
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/views/admin/js/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />


<script type="text/javascript">

	$(function(){
		var id 	  = '${ID}';
		var login = '${LOGIN}';
		if(id == "" || id == null){
			location.href("/login.jk");
		}
	});
</script>

	<div id="skipnavi"><a href="#contents">본문내용 바로가기</a></div>
	<hr />
	<div id="header">
		<div class="utill">
			<p><strong>${NAME }</strong>님이 로그인하셨습니다</p>
			<span class="txbtn"><a href="/logout.jk">로그아웃</a></span>
		</div>
		<div id="gnbbar">
			<div class="logo"><h1 class="logo_img"><sub>MOODMAKER 관리자</sub><br/>
			<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;By. 승희</sub>
			</sub></h1></div>
			<ul id="gnb">
			</ul>
		</div>
	</div>
	<hr />