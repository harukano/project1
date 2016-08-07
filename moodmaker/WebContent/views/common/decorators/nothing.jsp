<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><decorator:title default="::::: 바람잡이 :::::" /></title>
	
	<decorator:head />
</head>
<body>
	<decorator:body />	
	<jsp:include page="/views/common/footer.jsp" flush="false" />
</body>
</html>