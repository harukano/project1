<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 메인 페이지</title>
</head>
<body>
<div id="wrap">
	<%@ include file="/views/admin/common/header.jsp" %>
	<div id="container">
		<%@ include file="/views/admin/common/lnb.jsp" %>
		<div id="contents">
			<div class="location">
				<span class="hide">현재 본문 위치 :</span>
				<a href="#">Home</a> &gt; <strong>컨텐츠관리</strong>
			</div>

			<h2 class="mtit">컨텐츠관리</h2>
			<form name="sForm" id="sForm">
			<!-- 본문내용 들어갈곳... -->
			</form>
			
			<div class="paging">
			</div>
			<div class="rbtn">
				<span class="txbtn-em"><a href="#">버튼영역</a></span>
			</div>
			
		</div>
	</div>
</div>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>