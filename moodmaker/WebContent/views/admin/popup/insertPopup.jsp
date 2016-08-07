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
	
		CKEDITOR.replace('ckeditor');

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
		$('#strDate').val(defaultday);
		$('#endDate').val(defaultday);
		
		//시작기간 달력 js 연동
		$('#strDate').datepicker({
			dateFormat : 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth: true, //월변경기능
			changeYear : true, //년변경기능
			showMonthAfterYear: true //년 뒤에 월 표시
		});
		//종료기간 js 연동
		$('#endDate').datepicker({
			dateFormat : 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			changeMonth: true, //월변경기능
			changeYear : true, //년변경기능
			showMonthAfterYear: true, //년 뒤에 월 표시
			onSelect: function(dateText, inst){
				var strDate = $('#strDate').val();
				var tmp = new Date(dateText) - new Date(strDate);
				if(tmp < 0 ){
					alert("종료날짜가 시작날짜보다 이전일이 될 수 없습니다.");
					return;
				}
			} 
		});
	});
	
	function goInsert(){
		var frm = document.vForm;
		frm.action = "/insertPopup.jk";
		frm.submit();
	}
	</script>
	<div id="container">
		<%@ include file="/views/admin/common/lnb.jsp" %>
		<div id="contents">
			<div class="location">
				<span class="hide">현재 본문 위치 :</span>
				<a href="#">Home</a> &gt;<a href="#">팝업관리</a> &gt; <strong>메인팝업관리</strong>
			</div>
			<!-- Start Edit -->
			<h2 class="mtit">메인팝업관리</h2>
			<form name="vForm" id="vForm" method="post">
			<!-- 
			<input type="hidden" name="seq" id="seq" value="${result.seq}">
			 -->
			<table class="bbsview">
				<caption>팝업내용 등록</caption>
				<colgroup>
					<col style="width:18%;" />
					<col />
					<col style="width:20%;" />
					<col style="width:25%;" />
				</colgroup>
				<tbody class="formtype">
					<tr>
						<th scope="row"><label for="wrtSubject">팝업제목</label></th> 
						<td class="subject" colspan="3">
							<input id="tiTle" name="tiTle" type="text" class="txttype" style="width:570px;" />
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="wrtDate">기간</label></th>
						<td colspan="3">
							<input id="strDate" name="strDate" type="text" class="txttype" style="width:65px;" readonly="readonly"/>
							<input id="strHh" name="strHh" type="text" class="txttype" style="width:20px;" maxlength="2" placeholder="00" onkeyup="onlyNum2(this);inputTimeHH(this);" value="00"/> 시
							<input id="strMm" name="strMm" type="text" class="txttype" style="width:20px;" maxlength="2" placeholder="00" onkeyup="onlyNum2(this);inputTimeMM(this);" value="00"/> 분
							~
							<input id="endDate" name="endDate" type="text" class="txttype" style="width:65px;" readonly="readonly"/>
							<input id="endHh" name="endHh" type="text" class="txttype" style="width:20px;" maxlength="2" placeholder="23" onkeyup="onlyNum2(this);inputTimeHH(this);" value="23"/> 시
							<input id="endMm" name="endMm" type="text" class="txttype" style="width:20px;" maxlength="2" placeholder="59" onkeyup="onlyNum2(this);inputTimeMM(this);" value="59"/> 분
						</td>
						
					</tr>
					<tr> 
						<th scope="row"><label for="chkStatY">구분</label></th>
						<td>
							<input id="typeY" name="loctype" value="HOME" type="radio" class="chktype" checked="checked" /><label for="typeY">홈페이지</label> &nbsp;
							<input id="typeN" name="loctype" value="ADMIN" type="radio" class="chktype" /><label for="typeN">관리자</label>
						</td>
						
					</tr>
					<tr>
						<th scope="row"><label for="chkStatY">상태</label></th>
						<td>
							<input id="useY" name="useYN" value="Y" type="radio" class="chktype" checked="checked" /><label for="useY">사용</label> &nbsp;
							<input id="useN" name="useYN" value="N" type="radio" class="chktype" /><label for="useN">중지</label>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="wrtSizeW">팝업사이즈</label></th>
						<td>
							<label for="wrtSizeW">가로</label>
							<input id="widSize" name="widSize" value="${result.widSize}" type="text" class="txttype" style="width:40px;" maxlength="3" onkeyup="onlyNum(this);"/>
							*
							<label for="wrtSizeH">세로</label>
							<input id="heiSize" name="heiSize" value="${result.heiSize}" type="text" class="txttype" style="width:40px;" maxlength="3" onkeyup="onlyNum(this);"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="wrtPoistionX">팝업 위치</label></th>
						<td colspan="3">
							<label for="wrtPoistionX">가로</label>
							<input id="widLoc" name="widLoc" value="${result.widLoc}" type="text" class="txttype" style="width:40px;" maxlength="4" onkeyup="onlyNum(this);"/>
							&nbsp;
							<label for="wrtPoistionY">세로</label>
							<input id="heiLoc" name="heiLoc" value="${result.heiLoc}" type="text" class="txttype" style="width:40px;" maxlength="4" onkeyup="onlyNum(this);"/>
							&nbsp;
							<span class="sntc">가로0 세로0 이면 화면 제일 상단 좌측에 위치됨</span>
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td colspan="3">
						<div class="editor">
							<textarea name="conText" id="ckeditor" style="width:100%; height:250px;"></textarea>
						</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="chkLinkY">바로가기 사용</label></th>
						<td colspan="3">
							<input id="shortCutN" name="shortCutYN" value="N" type="radio" class="chktype" checked="checked" /><label for="shortCutN">미사용</label> &nbsp;
							<input id="shortCutY" name="shortCutYN" value="Y" type="radio" class="chktype" /><label for="shortCutY">사용</label>
							(<label for="shortCutLink">링크</label> <input id="shortCutLink" name="shortCutLink"type="text" class="txttype" style="width:360px;"/>)
						</td>
					</tr>
					
				</tbody>
			</table>
			</form>
			<div class="rbtn">
				<span class="txbtn-em"><a href="#" onclick="goInsert();return false;">저장</a></span>
				<span class="txbtn"><a href="/listPopup.jk">목록</a></span>
			</div>
			<!-- //End Edit -->
		</div>
	</div>
</div>
	<%@ include file="/views/admin/common/footer.jsp" %>
</body>
</html>