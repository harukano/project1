<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*
============================================================================
 -. 업  무  명 : 바람잡이 영화예매 
 -. 프로그램명 : 팝업 - PC
 -. 기      능 : 메인팝업창
============================================================================
    <프로그램 추가 및 변경사항>
----------------------------------------------------------------------------
  성  명 : 일    자 :  내       용
----------------------------------------------------------------------------
  신연근 : 2016-07-19 : 신규
============================================================================
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>팝업 | 바람잡이</title>
<link type="text/css" rel="stylesheet" href="/views/admin/css/login/reset.css" />
<link type="text/css" rel="stylesheet" href="/views/admin/css/login/popup_common.css" />
<script type="text/javascript" src="/views/admin/js/jquery-1.11.0.min.js"></script>

<script type="text/javascript">

// 쿠키 생성
function setCookie(cName, cValue, cDay){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}


var cName = "popup_"+'${popup.seq}';
$(document).ready(function(){
	
	$("a#close").click(function(){
		self.close();
	});
	$("#chkToday").click(function(){
		var isChecked = $("#chkToday").is(":checked");
		if(isChecked){
			setCookie(cName,'done',1);
		}else{
			setCookie(cName,'',-1);
		}
	});
});
</script>
</head>
<body>
	<div class="open_popup" style="width:100%;"">
		<form name="vForm" id="vForm">
			<input type="hidden" name="shortCutLink" value="${popup.shortCutLink}" />
			<div class="open_data">
				
				<div class="pop_data">
					<c:if test="${popup != null }">
						${popup.context}
					</c:if>
				</div>
				 <div class="pop_bot">
	              <c:if test="${popup.shortCutYn == 'Y'}">
	              	<span class="btn_comm pop_btn"><a href="${popup.shortCutLink}" onclick="Link();">자세히 보기</a></span>
	              </c:if>
	           	  <p class="popup_check"><input id="chkToday" name="chkToday" type="checkbox"/><label for="pop_close"><span>오늘 하루 열지 않음</span></label></p>
	              <a class="pop_bot_ban_close" href="#none" id="close"><img alt="팝업 닫기" src="/views/admin/img/btn_pop_close.png"></a>
	            </div>
	        </div>
        </form>
    </div>
</div>
</body>
</html>