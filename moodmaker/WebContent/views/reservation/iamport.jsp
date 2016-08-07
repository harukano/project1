<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap{
	width:1000px;
	height: 100%;
	padding-top:200px;
	padding-bottom:200px;
	background-color: white;
	margin:auto;
}
.container{
	
	width:600px;
	height: 300px;
	border-top: 3px solid #333;
	border-bottom: 3px solid #333;
	margin: auto;
}
.hd{
	height: 15%;	
	background-color:#333;
	color:white;
	font-size: 15pt;
	border-bottom:3px solid #333;
	
}
.bd{
	height: 80%;
	padding-top: 50px;
	padding-bottom : 30px;
	padding-left: 100px;
	padding-right: 100px;
	margin: auto;
	
}
.title_area{
	height:99%;
	width:99%;
	border: 1px solid #333; 
	margin:auto;
}
.title{
	padding-left: 10px;
	margin-bottom: 10px;
	margin-top:10px;
}
</style>
</head>

<script type="text/javascript">
var IMP = window.IMP;
IMP.init('imp71819361'); //'iamport' 대신 부여받은 "가맹점 식별코드"를 사용.
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
        /*
            'kakao':카카오페이,
            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
            'nice':나이스,
            'jtnet':jtnet,
            'uplus':LG유플러스
        */
    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 1000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    /* buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456', */
    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        msg += '영수증 : '+  rsp.receipt_url;
       
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    $("#result").text(msg);
});
</script>

<body>
<div id=result style="width:1000px; height: 650px">
<div class="wrap"><!-- 전체 -->
	<div class="container"><!-- 창 -->
		<div class="hd">
			<div class="title_area">
			<h4 class="title">결제가 완료되었습니다</h4>
			</div>
		</div>
		<div class="bd">
	<!-- 	<form action="" method="post" name="tofindpassword"> -->
		<span style="width: 250px">
		등록된 이메일 </span>	<input 
								type="text" 
								name="membership_email"
								id="membership_email"
								tabindex="5"
								value="" 
								style="border: 1px solid #666666; width: 240px; height: 25px;"
							/>
		<span style="color:red; font-weight: bold;" id="checkedemail"></span>
		<span style="width: 250px">
		비상 연락 이메일 	<input 
								type="text" 
								name="membership_loss_email"
								id="membership_loss_email"
								tabindex="5"
								value="" 
								style="border: 1px solid #666666; width: 240px; height: 25px;"
							/>
		</span>
		<span style="color:red; font-weight: bold;" id="checkedlossemail"></span>
		<input type="hidden" id="checked" value="1"/>
		<input type="button" value="다음" onclick="validate(this.form);">
		<!-- </form> -->
		</div>
	
	</div>

</div>




</div>
</body>
</html>