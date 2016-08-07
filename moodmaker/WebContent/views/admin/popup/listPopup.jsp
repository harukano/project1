<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" />
<head>
<!-- 메타 -->

<title>팝업관리 | 바람잡이</title>
<link type="text/css" rel="stylesheet" href="/views/admin/css/login/reset.css" />
<script type="text/javascript" src="/js/nhmin/popup/selectPopupList.js"></script>
<script type="text/javascript">
//VIEW 페이지로
var fnView = function(seq){
	$("#seq").attr("value",seq);
	fnSubmit(vForm,"/updatePopupForm.jk?seq=" + seq,"_self","post");
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
				<a href="#">Home</a> &gt;<a href="#">팝업관리</a> &gt; <strong>메인팝업관리</strong>
			</div>
			<!-- Start Edit -->
			<h2 class="mtit">메인팝업관리</h2>
			<form name="sForm">
			<input type="hidden" name="offset"/>
			<input type="hidden" name="frm" value="sForm"/>
			<input type=hidden name="pageSize" value="10" />
			
			<table class="bbslist">
				<caption>팝업 목록</caption>
				<colgroup>
					<col style="width:10%;" />
					<col style="width:30%;" />
					<col style="width:20%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
					<col style="width:20%;" />
				</colgroup>
				<thead>
					<tr>
						<th class="first" scope="col">번호</th>
						<th scope="col">팝업설명</th>
						<th scope="col">기간</th>
						<th scope="col">사이즈</th>
						<th scope="col">상태</th>
						<th scope="col">구분</th>
					</tr>
				</thead>
				<c:if test="${!empty result}">
				<tbody>
				<c:forEach var="list" items="${result}">
				
					<tr>
						<td class="num">${list.seq}</td>
						<td><a href="#" onclick="fnView('${list.seq}');return false;">${list.title}</a></td>
						<td>${list.strDate} ~ ${list.endDate}</td>
						<td>${list.heiSize}*${list.widSize}</td>
						<td class="stat"><span>
							<c:if test="${list.useYn eq 'Y'}"><span>사용</span></c:if>
							<c:if test="${list.useYn eq 'N'}"><span><font color="red">중지</font></span></c:if>
							<c:if test="${list.useYn eq 'T'}"><span><font color="blue">만료</font></span></c:if>
						</span></td>
						<td>
							<c:if test="${list.locType eq 'HOME' }">홈페이지</c:if>
							<c:if test="${list.locType eq 'LP' }">상담사</c:if>
						</td>
						<td>
							<c:if test="${list.popGrpYn eq 'Y'}">사용</c:if>
						</td>
						
					</tr>
					</c:forEach>
				</tbody>
				</c:if>
				<c:if test="${empty result}">
					<tr><td colspan="6">등록된 글이 없습니다.</td></tr>
				</c:if>
			</table>
			<div class='paging'>    
                     ${page.getPageImageNavi()}
            </div>
			</form>
			 
			<div class="paging-rbtn">
			
				<span class="txbtn-em"><a href="/insertPopupForm.jk">신규등록</a></span>
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
