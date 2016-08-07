<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	 function clickHandler() {
	 var targetId, srcElement, targetElement;
	 srcElement = window.event.srcElement;
	 
	 if (srcElement.className == "Outline") {
		 targetId = srcElement.id + "details";
		 targetElement = document.all(targetId);
		 
		 if (targetElement.style.display == "none") {
			targetElement.style.display = "";
		 } else {
			targetElement.style.display = "none";
		 }
	}
 }
	 
 document.onmouseover = clickHandler;
</script>


<!--  script header에 포함 -->
<div id="menu">
	<!-- 티켓 예매 | 상영 시간표 | 멤버쉽 | 영화 추천 | 커뮤니티 -->
	<table style="width: 100%;">
		<tr>
			<td style="width: *; text-align: center;">
				<a href="">
					<img 
						src="views/common/images/reservation.gif" 
						onMouseOver="overImage('views/common/images/reservationb.gif', 'reservation')" 
						onMouseOut="outImage('views/common/images/reservation.gif', 'reservation')"
						class="Outline"
						id="reservation"
						name="reservation"
						alt="메뉴(예매)" 
						style="border:none;"/>
				</a>
				
				<a href="">
					<img	
						src="views/common/images/movie.gif" 
						onMouseOver="overImage('views/common/images/movieb.gif', 'movie')" 
						onMouseOut="outImage('views/common/images/movie.gif', 'movie')" 
						class="Outline"
						id="movie"
						name="movie" 
						alt="메뉴(영화)" 
						style="border:0px;" />
				</a>
				
				<a href="">
					<img 
						src="views/common/images/membership.gif" 
						onMouseOver="overImage('views/common/images/membershipb.gif', 'membership')" 
						onMouseOut="outImage('views/common/images/membership.gif', 'membership')" 
						class="Outline"
						id="membership" 
						name="membership" 
						alt="메뉴(멤버쉽)" 
					/></a>
				
				<a href="">
					<img 
						src="views/common/images/community.gif" 
						onMouseOver="overImage('views/common/images/communityb.gif', 'community')" 
						onMouseOut="outImage('views/common/images/community.gif', 'community')" 
						class="Outline"
						id="community" 
						name="community" 
						alt="메뉴(커뮤니티)" 
					/></a>
			</td>
			<td style="width: 430px; text-align: left;">
				<input type="text" name="search" id="search" value="" style="border: 1px solid #666666; width: 250px; height: 20px;">
				<input type="button" name="btnSearch" id="btnSearch" value="검색" style="border: 1px solid #666666; height: 24px;">
			</td>
		</tr>
	</table>
</div>

<div id="communitydetails" style="display:None; position:absolute; width:1000px; text-align: center; background-color:#000000;">
	<a href="views/community/write_article.jsp">질의응답 (Q&A)</a>
	<a href="test.html">자주묻는질문 (FAQ)</a>
	<a href="test.html">공지사항</a>
	<a href="test.html">민원제기</a>
</div>


