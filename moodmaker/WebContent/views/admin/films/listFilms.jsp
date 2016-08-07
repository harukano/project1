<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" />
<head>
<!-- 메타 -->

<title>영화관리 | 바람잡이</title>
<link type="text/css" rel="stylesheet" href="/views/admin/css/login/reset.css" />
<script type="text/javascript" src="/js/nhmin/popup/selectPopupList.js"></script>
<script type="text/javascript">
//VIEW 페이지로
var fnView = function(seq){
	$("#seq").attr("value",seq);
	fnSubmit(vForm,"/updateFilmsForm.jk?seq=" + seq,"_self","post");
}


</script>
<style type="text/css">
.paging {
    margin-top: 15px;
    _height: 18px;
    min-height: 18px;
    text-align: center;
    color: #333;
    font: bold 11px Tahoma;
}
</style>
</head>
<body>
<div id="wrap">
	<%@ include file="/views/admin/common/header.jsp" %>
	<div id="container">
		<%@ include file="/views/admin/common/lnb.jsp" %>
		<div id="contents">
			<div class="location">
				<span class="hide">현재 본문 위치 :</span>
				<a href="#">Home</a> &gt;<a href="#">영화관리</a> &gt; <strong>메인영화관리</strong>
			</div>
			<!-- Start Edit -->
			<h2 class="mtit">메인영화관리</h2>
			<form name="sForm">
			<input type="hidden" name="offset"/>
			<input type="hidden" name="frm" value="sForm"/>
			<input type=hidden name="pageSize" value="10" />
			
			<table class="bbslist">
				<caption>영화 목록</caption>
				<colgroup>
					<col style="width:10%;" />
					<col style="width:20%;" />
					<col style="width:30%;" />
					<col style="width:25%;" />
					<col style="width:15%;" />
				</colgroup>
				<thead>
					<tr>
						<th class="first" scope="col">번호</th>
						<th scope="col">장르</th>
						<th scope="col">영화제목</th>
						<th scope="col">상영기간</th>
						<th scope="col">상영여부</th>
					</tr>
				</thead>
				<c:if test="${!empty list }">
				<tbody>
			 	<c:forEach var="list" items="${list }">
				
					<tr>
						<td class="num">${list.film_idx}</td>
						<td>${list.genre_code }</td>
						<td><a href="#" onclick="fnView('${list.film_idx}');return false;">${list.film_name }</a></td>
						<td>${list.film_release_date } ~ ${list.film_close_date }</td>
						<td>
							<c:if test="${list.status eq '상영중'}"><span>상영중</span></c:if>
							<c:if test="${list.status eq '상영종료'}"><span><font color="red">상영종료</font></span></c:if>
						</td>
					</tr>
					</c:forEach> 
				</tbody>
				</c:if>
				<c:if test="">
					<tr><td colspan="6">등록된 글이 없습니다.</td></tr>
				</c:if>
			</table>
			<div class='paging'>    
                     
            </div>
			</form>
			 
			<div class="paging-rbtn">
			
				<span class="txbtn-em"><a href="/insertFilmsForm.jk">신규등록</a></span>
			</div>
			<!-- //End Edit -->
			<div class="end-contents"><br />본문내용이 끝났습니다. (<a href="#skipnavi">건너뛰기 메뉴</a>)</div>
		</div>
	</div>
</div>
<form name="vForm" id="vForm" method="post"><input type="hidden" name="seq" id="seq" value=""/></form>
<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>
