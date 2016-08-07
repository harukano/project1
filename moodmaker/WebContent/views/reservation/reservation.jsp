<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reservation</title>
<link rel="stylesheet" href="views/reservation/css/reservation.css" type="text/css"/>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="views/reservation/js/reservation.js"type="text/javascript"></script>
<script src="views/reservation/js/reservation_ajax_json.js" type="text/javascript"></script>

</head>
<body>
<div class="wrap">
	<div id="container">
		<div class="back_c">
			<div id="reservation_step1" style="height: 98%;width: 100%;">
				<div class="step1" id="moviepart">
					<div class="col-head title">영화</div>
					<div class="col-body">
						<div class="movie-select">
							<div class="sortmenu">
								<a href=""
									style="padding-left: 20px; padding-right: 20px; padding-bottom: 10px"
									id="rank">rank</a> <a href=""
									style="padding-left: 20px; padding-right: 20px; padding-bottom: 10px"
									id="name">abc <c:if test="${!empty movielist }">empty</c:if></a>
								<hr>
							</div>
							<div class="movie-list scroll">
								<ul id="movie_list">
									<!-- <li class="movie" id="film_idx">
										<span class="poster_src"></span>
										<a href="#">
										<img alt="0" src="views/reservation/img/0.png" class="round">
										<span class="subject">님아, 그 강을 건너지 마오</span></a>
									</li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- movie part -->
				
				<div class="step1 step1_1" id="branchpart">
					<div class="col-head title">극장</div>
					<div class="col-body">

						<div class="step1-date">
							<ul id="branchs">
								<!-- <li class="dimmed"><span class="year">2015</span> <span
									class="month">2</span></li> -->
								<li class="branch" id="B001">
									<a href="#"><span class="day">서울 본점</span></a>
								</li>
								<li class="branch" id="B002">
									<a href="#"><span class="day">인천</span></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- branchpart -->
				
				<div class="step1 step1_2" id="datepart">
					<div class="col-head title">날짜</div>
					<div class="col-body">

						<div class="step1-date">
							<ul id="step1-date">
							<!-- 	<li class="dimmed"><span class="year">2015</span> <span
									class="month">2</span></li>
								<li class="day sunday " id="2015-3-5"><a href="#"> <span
										class="dayweek">일</span> <span class="day">15</span>
								</a></li> -->
							</ul>
						</div>
					</div>
				</div>
				<!-- datepart -->

				<div class="step1">
					<!-- timepart -->
					<div class="col-head title">시간</div>
					<div class="col-body">
						<hr style="width: 90%; margin-top: 34px">
						<div class="time-list" id="time-list">
						 <!-- <div class="theater">
								<span class="title"> <span class="floor">1관</span> <span
									class="seatcount">(총100석)</span>
								</span>
								<ul>
									<li class="one" id="running_idx"><a href="#"><span class="time" title="end_show_time">11:30</span> <span
											class="count">100석</span>
									</a></li>
									<li><a href="#"> <span class="time">12:50</span> <span
											class="count">49석</span>
									</a></li>
									<li><a href="#"> <span class="time">14:30</span> <span
											class="count">38석</span>
									</a></li>
									<li><a href="#"> <span class="time">16:00</span> <span
											class="count">58석</span>
									</a></li>
									<li><a href="#"> <span class="time">17:40</span> <span
											class="count">45석</span>
									</a></li>
								</ul>
							</div>
							<div class="theater">
								<span class="title"> <span class="floor">2관</span> <span
									class="seatcount">(총100석)</span>
								</span>
								<ul>
									<li class="one"><span class="time" title="10:40">09:10</span> <span
											class="count">100석</span>
									</li>
									<li class="one"><span class="time">11:00</span> <span
											class="count">61석</span>
									</li>
									<li class="one"><span class="time">13:30</span> <span
											class="count">77석</span>
									</li>
									<li class="one"><span class="time">15:00</span> <span
											class="count">54석</span>
									</li>
									<li class="one"><span class="time">16:55</span> <span
											class="count">59석</span>
									</li>
								</ul>
							</div> -->
						</div>
						</div>
					</div><!-- timepart -->
				</div><!-- reservation_step1 -->
				<div id="reservation_step2" style="height: 100%; width: 100%;">
					<div class="step2">
						<div class="col-head title">인원/좌석</div>
						<div class="col-body">
							<div class="person_screen"><!-- 인원 -->
								
									<div class="col-body" style="margin:20px 0px; padding:0px 20px">
										<div class="numberofpeople-select">
											<div class="group adult" id="adult">
												<span class="title">일반</span>
												<ul>
													<li class="selected"><a href="#">0</a></li>
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#">6</a></li>
													<li><a href="#">7</a></li>
													<li><a href="#">8</a></li>
												</ul>
											</div>
											<div class="group young" id="young" >
												<span class="title">청소년</span>
												<ul>
													<li class="selected"><a href="#">0</a></li>
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#">6</a></li>
													<li><a href="#">7</a></li>
													<li><a href="#">8</a></li>
												</ul>
											</div>
										</div>
										<div class="adjacent_seat_wrap">
											<span class="title">좌석 붙임 설정</span>
											<div class="block_wrap">
												<span class="block selected1">
													<label>
														<input type="radio" name="block1" id="block1" value="1" checked="checked" style="vertical-align: middle;" >
														<span class="box"></span>
													</label>
												</span>
												<span class="block">
													<label>
														<input type="radio" name="block2" id="block2" value="2" style="vertical-align: middle;">
														<span class="box"></span>
														<span class="box"></span>
													</label>
												</span>
												<span class="block">
													<label>
														<input type="radio" name="block3" id="block3" value="3" style="vertical-align: middle;">
														<span class="box"></span>
														<span class="box"></span>
														<span class="box"></span>
													</label>
												</span>
												<span class="block">
													<label>
														<input type="radio" name="block4" id="block4" value="4" style="vertical-align: middle;">
														<span class="box"></span>
														<span class="box"></span>
														<span class="box"></span>
														<span class="box"></span>
													</label>
												</span>
											</div>
										</div>
										<div class="section-screen-select">
											<span class="title">선택하신 상영관/시간</span>
											<div class="screen-time">
											<span class="screen">CINE 2관</span>
											<span style="font-size: 12px">(총 100석)</span>
											<span class="step2_time">9:10 ~ 10:30</span>
											
											</div>
										</div>
									</div>
							</div>
							<div id="wrap_theater">
							<div class="theater_minimap">
								<div class="content">
									<div class="screen"><img alt="" src="views/reservation/img/screen1.png" style="width: 600px; height: 30px;"></div>
									<div class="seats" id="seats_list">
										<div class="row" id="A"><!-- 한행 -->
											<div class="label">A</div>
											<div class="group_left" style="padding-left: 84px;">
												<ul>
													<li title="A1"><a href="#">1</a></li>
													<li title="A2"><a href="#">2</a></li>
													<li title="A3"><a href="#">3</a></li>
													<li title="A4"><a href="#">4</a></li>
													<li title="A5"><a href="#">5</a></li>
													<li title="A6"><a href="#">6</a></li>
													<li title="A7"><a href="#">7</a></li>
													<li title="A8"><a href="#">8</a></li>
												</ul>
											</div>
											<div class="group_middle"></div>
											<div class="group_right"></div>
										</div>
										<div class="row" id="B"><!-- 한행 -->
											<div class="label">B</div>
											<div class="group_left" style="padding-left: 84px;">
												<ul>
													<li title="B1" class="reservation"><a href="#">1</a></li>
													<li title="B2" class="reservation"><a href="#">2</a></li>
													<li title="B3" class="reservation"><a href="#">3</a></li>
													<li title="B4" class="reservation"><a href="#">4</a></li>
													<li title="B5" class="reservation"><a href="#">5</a></li>
													<li title="B6" class="reservation"><a href="#">6</a></li>
													<li title="B7" class="reservation"><a href="#">7</a></li>
													<li title="B8" class="reservation"><a href="#">8</a></li>
												</ul>
											</div>
											<div class="group_middle"></div>
											<div class="group_right"></div>
										</div>
										<div class="row" id="C"><!-- 한행 -->
											<div class="label">C</div>
											<div class="group_left" style="padding-left: 84px;">
												<ul>
													<li title="C1" class="reservation"><a href="#">1</a></li>
													<li title="C2"><a href="#">2</a></li>
													<li title="C3"><a href="#">3</a></li>
													<li title="C4"><a href="#">4</a></li>
													<li title="C5"class="reservation"><a href="#">5</a></li>
													<li title="C6"class="reservation"><a href="#">6</a></li>
													<li title="C7"class="reservation"><a href="#">7</a></li>
													<li title="C8"class="reservation"><a href="#">8</a></li>
												</ul>
											</div>
											<div class="group_middle"></div>
											<div class="group_right"></div>
										</div>
										<div class="row" id="D"><!-- 한행 -->
											<div class="label">D</div>
											<div class="group_left" style="padding-left: 84px;">
												<ul>
													<li title="D1"><a href="#">1</a></li>
													<li title="D2"><a href="#">2</a></li>
													<li title="D3"><a href="#">3</a></li>
													<li title="D4"><a href="#">4</a></li>
													<li title="D5"class="reservation"><a href="#">5</a></li>
													<li title="D6"><a href="#">6</a></li>
													<li title="D7"><a href="#">7</a></li>
													<li title="D8"><a href="#">8</a></li>
												</ul>
											</div>
											<div class="group_middle"></div>
											<div class="group_right"></div>
										</div>
										<div class="row" id="E"><!-- 한행 -->
											<div class="label">E</div>
											<div class="group_left" style="padding-left: 84px;">
												<ul>
													<li title="E1" class="reservation"><a href="#">1</a></li>
													<li title="E2"><a href="#">2</a></li>
													<li title="E3"><a href="#">3</a></li>
													<li title="E4"><a href="#">4</a></li>
													<li title="E5"><a href="#">5</a></li>
													<li title="E6"><a href="#">6</a></li>
													<li title="E7" class="reservation"><a href="#">7</a></li>
													<li title="E8"><a href="#">8</a></li>
												</ul>
											</div>
											<div class="group_middle"></div>
											<div class="group_right"></div>
										</div>
										<div class="row" style="margin:10px 0px;"></div>
										<div class="row" id="F"><!-- 한행 -->
											<div class="label">F</div>
											<div class="group_left">
												<ul>
													<li title="F1"class="reservation"><a href="#">1</a></li>
													<li title="F2"class="reservation"><a href="#">2</a></li>
													<li title="F3"><a href="#">3</a></li>
													<li title="F4"><a href="#">4</a></li>
												</ul>
											</div>
											<div class="group_middle">
												<ul>
													<li title="F5"><a href="#">5</a></li>
													<li title="F6"><a href="#">6</a></li>
													<li title="F7"><a href="#">7</a></li>
													<li title="F8"><a href="#">8</a></li>
													<li title="F9"><a href="#">9</a></li>
													<li title="F10"><a href="#">10</a></li>
												</ul>
											</div>
											<div class="group_right">
												<ul>
													<li title="F11"><a href="#">11</a></li>
													<li title="F12"><a href="#">12</a></li>
													<li title="F13"><a href="#">13</a></li>
													<li title="F14"><a href="#">14</a></li>
												</ul>
											</div>
										</div>
										<div class="row" id="G"><!-- 한행 -->
											<div class="label">G</div>
											<div class="group_left">
												<ul>
													<li title="G1"><a href="#">1</a></li>
													<li title="G2"><a href="#">2</a></li>
													<li title="G3"class="reservation"><a href="#">3</a></li>
													<li title="G4"class="reservation"><a href="#">4</a></li>
												</ul>
											</div>
											<div class="group_middle">
												<ul>
													<li title="G5"><a href="#">5</a></li>
													<li title="G6"><a href="#">6</a></li>
													<li title="G7"><a href="#">7</a></li>
													<li title="G8"><a href="#">8</a></li>
													<li title="G9"><a href="#">9</a></li>
													<li title="G10"><a href="#">10</a></li>
												</ul>
											</div>
											<div class="group_right">
												<ul>
													<li title="G11" class="reservation"><a href="#">11</a></li>
													<li title="G12" class="reservation"><a href="#">12</a></li>
													<li title="G13"><a href="#">13</a></li>
													<li title="G14"><a href="#">14</a></li>
												</ul>
											</div>
										</div>
										<div class="row" id="H"><!-- 한행 -->
											<div class="label">H</div>
											<div class="group_left">
												<ul>
													<li title="H1"><a href="#">1</a></li>
													<li title="H2"><a href="#">2</a></li>
													<li title="H3"><a href="#">3</a></li>
													<li title="H4"><a href="#">4</a></li>
												</ul>
											</div>
											<div class="group_middle">
												<ul>
													<li title="H5"><a href="#">5</a></li>
													<li title="H6"><a href="#">6</a></li>
													<li title="H7"><a href="#">7</a></li>
													<li title="H8"><a href="#">8</a></li>
													<li title="H9"><a href="#">9</a></li>
													<li title="H10"><a href="#">10</a></li>
												</ul>
											</div>
											<div class="group_right">
												<ul>
													<li title="H11"><a href="#">11</a></li>
													<li title="H12"><a href="#">12</a></li>
													<li title="H13"><a href="#">13</a></li>
													<li title="H14"><a href="#">14</a></li>
												</ul>
											</div>
										</div>
										<div class="row" id="I"><!-- 한행 -->
											<div class="label">I</div>
											<div class="group_left">
												<ul>
													<li title="I1"><a href="#">1</a></li>
													<li title="I2"><a href="#">2</a></li>
													<li title="I3"><a href="#">3</a></li>
													<li title="I4"><a href="#">4</a></li>
												</ul>
											</div>
											<div class="group_middle">
												<ul>
													<li title="I5"><a href="#">5</a></li>
													<li title="I6"><a href="#">6</a></li>
													<li title="I7"><a href="#">7</a></li>
													<li title="I8"><a href="#">8</a></li>
													<li title="I9"><a href="#">9</a></li>
													<li title="I10"><a href="#">10</a></li>
												</ul>
											</div>
											<div class="group_right">
												<ul>
													<li title="I11"><a href="#">11</a></li>
													<li title="I12"><a href="#">12</a></li>
													<li title="I13"><a href="#">13</a></li>
													<li title="I14"><a href="#">14</a></li>
												</ul>
											</div>
										</div>
										<div class="row" id="J"><!-- 한행 -->
											<div class="label">J</div>
											<div class="group_left">
												<ul>
													<li title="J1"><a href="#">1</a></li>
													<li title="J2"><a href="#">2</a></li>
													<li title="J3"><a href="#">3</a></li>
													<li title="J4"><a href="#">4</a></li>
												</ul>
											</div>
											<div class="group_middle">
												<ul>
													<li title="J5"><a href="#">5</a></li>
													<li title="J6"><a href="#">6</a></li>
													<li title="J7"><a href="#">7</a></li>
													<li title="J8"><a href="#">8</a></li>
													<li title="J9"><a href="#">9</a></li>
													<li title="J10"><a href="#">10</a></li>
												</ul>
											</div>
											<div class="group_right">
												<ul>
													<li title="J11"><a href="#">11</a></li>
													<li title="J12"><a href="#">12</a></li>
													<li title="J13"><a href="#">13</a></li>
													<li title="J14"><a href="#">14</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="description">
									<!-- <img alt="kindofseats" src="views/reservation/img/kindofseats.png"> -->
									<ul style="color: #666; ">
										<li ><img alt="" src="views/reservation/img/red.png" height="13px" width="13px"><span style="vertical-align : text-bottom; font-size:11pt"> 선택</span></li>
										<li><img alt="" src="views/reservation/img/reservegray.png" height="13px" width="13px"><span style="vertical-align : text-bottom; font-size:11pt"> 예매완료</span></li>
										<li><img alt="" src="views/reservation/img/gray.png" height="13px" width="13px"><span style="vertical-align : text-bottom; font-size:11pt"> 가능</span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div><!-- step2 -->
			</div><!-- reservation_step2 -->	
		</div><!-- back_c-->
		</div><!-- container -->
		<div class="tnb_area">
			<div class="tnb_container">
				<div class="tnb step1">
					<div class="before_bnt">
					<a id="step1" href="#" ><img id="leftbtn" alt="nextStep" src="views/reservation/img/graymovie.png" class="tnb-btn"></a>
					</div>
					<div class="info movie">
						<div class="default">영화선택</div>
						<span class="movie_poster" style="display: none"><img
							src="" alt="영화 포스터" class="poster"></span>
						<div class="movie_title" style="display: none; " >
							<span>
							<a	href="#" target="_blank">영화제목</a></span>
						</div>
						<div class="movie_grade" style="display: none">
							<span>
							<a	href="#" target="_blank">상영등급</a></span>
						</div>
					</div>
					<div class="info theater">
						<div class="default">상영관선택</div>

						<div class="row name" style="display: none; margin-top: 14px;">
							<span class="header">극장</span>
							<span class="data" id="branch"></span>
						</div>
						<div class="row date"  style="display: none">
							<span class="header">일시</span>
							<span class="data" id="date" style="width: 90px"></span>
							<span class="data" id="time" style="width: 30px"></span>
							
						</div> 
						<div class="row screen" style="display: none">
							<span class="header">상영관</span>
							<span class="data" id="screen"></span>
						</div>
						<div class="row number" style="display: none">
							<span class="header">인원</span>
							<span class="data" id="persons"></span>
						</div>
					</div>
					<div class="info seat">
						<div class="row seat_name" style="margin-top: 14px;">
							<span class="header">좌석명</span>
							<span class="data">일반석</span>
						</div>
						<div class="row seat_no">
							<span class="header">좌석번호</span>
							<span class="data" id="seats_no"></span>
						</div>
					
					</div>
					<div class="info payment-ticket" style="display:none;">
						<div class="row payment-adult" style="display:none;">
							<span class="header">일반</span>
							<span class="data">
								<span class="price">9,000</span>원 x 
								<span class="quantity" id="adult-quantity">2</span>
							</span>
						</div>
						<div class="row payment-young" style="display:none;">
							<span class="header">청소년</span>
							<span class="data">
								<span class="price">6000</span>원 x 
								<span class="quantity" id="young-quantity"></span>
								
							</span>
						</div>
						<div class="row payment-final">
							<span class="header">총금액</span>
							<span class="data">
								<span class="price" id="total_price">18,000</span>원  
							</span>
						</div>
					</div>
					<div class="info path">
						<div class="default">> 좌석선택 > 결제</div>
					</div>
					<a id="step2" href="#" ><img id="rightbnt" alt="nextStep" src="views/reservation/img/grayseat.png" class="tnb-btn"></a>
				</div>
			</div>
		</div><!-- tnb_area -->
		<form action="" id="procreserve" method="post">
		<c:set var="membership_email_session" scope="session" value="${membership_email}" />
		<c:choose>	
			<c:when test="${membership_email_session != null}">
				<input type="hidden" name="membership_email" id="membership_email" value="${membership_email_session}">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="membership_email" id="membership_email" value="null">
			</c:otherwise>
		</c:choose>	
			<input type="hidden" name="running_idx" id="running_idx">
			<input type="hidden" name="seat_number" id="seat_number">
			<input type="hidden" name="sale_price" id="sale_price">
		</form>
	</div><!-- wrap -->
</body>
</html>