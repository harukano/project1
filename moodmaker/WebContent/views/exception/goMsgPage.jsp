<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
/*
============================================================================
 -. 업  무  명 : NH농협캐피탈 
 -. 프로그램명 : 페이지이동
 -. 기      능 : 결고 메시지 출력 후 페이지 이동
============================================================================
    <프로그램 추가 및 변경사항>>
----------------------------------------------------------------------------
  성  명 : 일    자 :  내       용
----------------------------------------------------------------------------
  홍길동 : 2016-04-16 : 신규
============================================================================
*/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: 얼럿 창 후 페이지 이동::</title>
<script type="text/javascript">
	window.onload=function(){
		<c:if test="${errMsg ne null}">
			<c:if test="${errMsg ne ''}">
				alert('${errMsg}');
			</c:if>
		</c:if>
		<c:choose>
			<c:when test="${goPage=='back'}">
				history.back();
			</c:when>
			<c:otherwise>
				location.href = "<%=request.getContextPath()%>/${goPage}";
			</c:otherwise>
		</c:choose>
	}
</script>
</head>
<body>
</body>
</html>