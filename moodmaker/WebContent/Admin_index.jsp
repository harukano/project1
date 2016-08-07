<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
============================================================================
 -. 업  무  명 : 승희의 취업을 위한 프로젝트
 -. 프로그램명 : 무드메이커 - PC
 -. 기      능 : 무드메이커 관리자 페이지 이동
 -. 계정 정보  : admin/admin1234
============================================================================
    <프로그램 추가 및 변경사항>>
----------------------------------------------------------------------------
  성  명 : 일    자 :  내       용
----------------------------------------------------------------------------
  전창빈 : 2016-07-14 : 신규
============================================================================
*/
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: 바람잡이 관리자 ::</title>
</head>
<body>
 <%
   response.sendRedirect("loginchk.jk?userId=admin&userPwd=admin1234");         
 %>
</body>
</html>