<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cnt"/>

		<div id="side">
			<h1><img src="/views/admin/img/main/navtit_admin.gif" alt="무드메이커 관리자페이지" /></h1>
		
			<ul id="lnb">
			<li class="snav0"><a href="/listPopup.jk">팝업관리</a></li>
			<li class="snav1"><a href="#">영화관리</a>
				<ul>
					<li class=snav1-1><a href="listFilms.jk">영화목록</a></li>
				</ul>
			</li>
				
			<%-- <c:forEach items="${sessionScope.highList}" var="highMenu" varStatus="idx" >
					<c:if test="${highMenu.useYn eq 'Y' }">
					<c:set var="cnt" value="${idx.count }" />
						<li class="snav${idx.count}"><a href="${highMenu.urlInf}">${highMenu.text }</a>
							<ul class="subUl">
								<c:forEach items="${sessionScope.rowList}" var="rowMenu" varStatus="idx2" >
									<c:if test="${highMenu.highLevel eq rowMenu.highLevel }">
										<li class="snav${idx.count }-${idx2.count}"><a href="${rowMenu.urlInf }" >${rowMenu.text }</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
						
					</c:if>
				
			</c:forEach>
			
			<script>
				$(function(){
					$.each($(".subUl"),function(){
						var a = $(this).has('li');
						//console.log();
						if(a.length == 0){
							$(this).remove();
						}
					})
					
					
					$("#lnb").find('a').each(function(){
						var contentTitle = $(".mtit").text();
						var lnb =$(this).text();
						if(contentTitle == lnb){
							var menu = $(this).parents().attr("class");
							var menuCode = menu.match(/[0-9]/g);
							
							if(menuCode.length == 1){
								currentMenu(menuCode[0]);	//메뉴 활성화 1depth, 2depth
							}else if(menuCode.length == 2){
								if(menu.indexOf("-") == -1){
									var tmp = menuCode[0] + menuCode[1]
									currentMenu(tmp);	//메뉴 활성화 1depth, 2depth
								}else{
									currentMenu(menuCode[0],menuCode[1]);	//메뉴 활성화 1depth, 2depth	
								}
								
							}else if(menuCode.length == 3){
								currentMenu(menuCode[0]+menuCode[1],menuCode[2]);
							}
							
						}
					});
				
					
				})
			</script>
			
			<c:if test="${sessionScope.adminInfo.mgrtypcde eq '1' }">
				<li class="snav${cnt+1}"><a href="/nhmin/nhminCode/selectNhminCodeList.nh">코드관리</a></li>
			</c:if> --%>
			<%--  
				<li class="snav0"><a href="/nhmin/contents/selectContentsList.nh">컨텐츠관리</a></li>
				<li class="snav1"><a href="/nhmin/nhmin/selectNhminList.nh">회원관리</a></li>
				<li class="snav2"><a href="/nhmin/popup/selectPopupList.nh">팝업관리</a>
					<ul>
						<li class="snav2-1"><a href="/nhmin/popup/selectPopupList.nh">메인팝업관리</a></li>
						<li class="snav2-2 last"><a href="/nhmin/popup/selectPopupLimitList.nh">대출진입제한관리</a></li>
					</ul>
					
				</li>	
				<li class="snav3"><a href="/nhmin/manageposts/selectManagepostsList.nh">게시물관리</a></li>
				<li class="snav4"><a href="/nhmin/statements/selectStatementsList.nh">재무현황관리</a></li>
				<li class="snav5"><a href="/nhmin/faq/selectFaqList.nh">FAQ</a></li>
				<li class="snav6"><a href="/nhmin/glossary/selectGlossaryList.nh">금융용어사전</a></li>
				<li class="snav7"><a href="/nhmin/saleofpublic/selectSaleofpublicList.nh">공개매각 관리</a></li>
				<li class="snav8"><a href="/nhmin/aboutus/selectAboutusList.nh">회사소개</a></li>
				<li class="snav9"><a href="/nhmin/aboutus/selectAboutusList.nh">금융상품</a></li>
				 --%>
			</ul>
		</div>
		<hr />