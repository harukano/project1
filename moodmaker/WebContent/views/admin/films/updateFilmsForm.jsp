<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/admin/common/doctype.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팝업관리 | 바람잡이</title>


<script type="text/javascript">
	//ckeditor 연동

</script>
</head>
<body>
<div id="wrap">
	<%@ include file="/views/admin/common/header.jsp" %>
	<script type="text/javascript">
	$(function(){
	
		//현재 날짜 구해와서 기간에 넣어주기.....
		var dt,year,month,day,defaultday;
		dt   = new Date();
		year  = ""+dt.getFullYear();
		month = ""+(dt.getMonth()+1);
		if(month.length == 1 ) month = "0" + month;
		day   = dt.getDate(); 
		if(day.length == 1) day = "0" + day;
		var defaultday = "" + year + "-" + month + "-" + day;
		
		//현재 날짜 기간 textfiled에 삽입
		$('#film_release_date').val(defaultday);
		$('#film_close_date').val(defaultday);
		
		//시작기간 달력 js 연동
		$('#film_release_date').datepicker({
			dateFormat : 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth: true, //월변경기능
			changeYear : true, //년변경기능
			showMonthAfterYear: true //년 뒤에 월 표시
		});
		//종료기간 js 연동
		$('#film_close_date').datepicker({
			dateFormat : 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth: true, //월변경기능
			changeYear : true, //년변경기능
			showMonthAfterYear: true, //년 뒤에 월 표시
			onSelect: function(dateText, inst){
				var film_release_date = $('#film_release_date').val();
				var tmp = new Date(dateText) - new Date(film_release_date);
				if(tmp < 0 ){
					alert("종료날짜가 시작날짜보다 이전일이 될 수 없습니다.");
					return;
				}
			} 
		});
	});
	
	function goInsert(){
		var frm = document.vForm;
		frm.action = "/updateFilms.jk";
		frm.submit();
	}
	</script>
	<div id="container">
		<%@ include file="/views/admin/common/lnb.jsp" %>
		<div id="contents">
			<div class="location">
				<span class="hide">현재 본문 위치 :</span>
				<a href="#">Home</a> &gt;<a href="#">영화관리</a> &gt; <strong>메인영화관리</strong>
			</div>
			<!-- Start Edit -->
			<h2 class="mtit">메인영화관리</h2>
			<form name="vForm" id="vForm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="film_org_poster" name="film_org_poster" value="${filmlist.film_poster }" />
			<!-- 
			<input type="hidden" name="seq" id="seq" value="${result.seq}">
			 -->
			<table class="bbsview">
				<caption>영화 등록</caption>
				<colgroup>
					<col style="width:18%;" />
					<col />
					<col style="width:20%;" />
					<col style="width:25%;" />
				</colgroup>
				<tbody class="formtype">
					<tr>
						<th scope="row"><label for="wrtSubject">영화제목</label></th> 
						<td class="subject" colspan="3">
							<input id="film_name" name="film_name" type="text" class="txttype" style="width:570px;" value="${filmlist.film_name}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="selcBoardCtg">영화 장르 선택</label></th>
						<td>
							<select name="genre_code" id="genre_code" style="width:140px;">
										<option value="">선택해주세요</option>
										<c:if test="${!empty genre }">
											<c:forEach var="list" items="${genre }">
												<option value="${list.genre_code }" <c:if test="${list.genre_code eq filmlist.genre_code }">selected</c:if> >${list.genre_description }</option>
											</c:forEach>
										</c:if>
							</select>
						
					</tr>
					<tr>
						<th scope="row"><label for="wrtDate">기간</label></th>
						<td colspan="3">
							<input id="film_release_date" name="film_release_date" type="text" class="txttype" style="width:65px;" readonly="readonly" value="${filmlist.film_release_date}"/>
							~
							<input id="film_close_date" name="film_close_date" type="text" class="txttype" style="width:65px;" readonly="readonly" value="${filmlist.film_close_date}"/>
						</td>
						
					</tr>
					<tr> 
						<th scope="row"><label for="chkStatY">감독</label></th>
						<td>
							<input id=film_director name="film_director" type="text" class="txttype" style="width:150px;" value="${filmlist.film_director }"/>
						</td>
						
					</tr>
					<tr>
						<th scope="row"><label for="chkStatY">출연진</label></th>
						<td>
							<input id=film_cast name="film_cast" type="text" class="txttype" style="width:450px;" value="${filmlist.film_cast }"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="chkStatY">관람등급</label></th>
						<td>
							<select name=films_class id="films_class" style="width:140px;">
										<option value="">선택해주세요</option>
										<option value="0"  <c:if test="${filmlist.films_class eq '0' }">selected</c:if>>전체 관람가</option>
										<option value="12" <c:if test="${filmlist.films_class eq '12' }">selected</c:if>>12세이상 관람가</option>
										<option value="15" <c:if test="${filmlist.films_class eq '15' }">selected</c:if>>15세이상 관람가</option>
										<option value="19" <c:if test="${filmlist.films_class eq '19' }">selected</c:if>>청소년 관람불가</option>
							</select>
						</td>
					</tr>
					<tr> 
						<th scope="row"><label for="chkStatY">포스터이미지</label></th>
						<td>
							<input id=film_poster name="film_poster" type="file" class="txttype" style="height:22px;" />
							<span><a href="${filmlist.film_poster}" >${filename }</a></span><font color="blue"><br/><sub>*이미지를 변경 하실려면 다시 파일 첨부를 해주세요</sub> </font>
						</td>
						
					</tr>
					<tr>
						<th scope="row"><label for="wrtSizeW">줄거리</label></th>
						<td>
							<textarea id="film_synopsys" name="film_synopsys" rows="10" cols="94">${filmlist.film_synopsys }</textarea>	
						</td>
					</tr>
					
				</tbody>
			</table>
			</form>
			<div class="rbtn">
				<span class="txbtn-em"><a href="#" onclick="goInsert();return false;">저장</a></span>
				<span class="txbtn"><a href="/listFilms.jk">목록</a></span>
			</div>
			<!-- //End Edit -->
		</div>
	</div>
</div>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>