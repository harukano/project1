
$(function() {
		$("#rank").click(function() {
			alert("rank");
	
		});
		//현재상영중인 영화 목록생성
		movielist();
		//현재 예매가능한 날짜 목록생성
		daylist();
		$("#reservation_step2").css("display","none");
		$(".before_bnt").css("display","none");
	
		//붙임좌석 비활성화
		$(".block_wrap input:radio").attr("disabled","disabled");
		
		$("#rank").click(function() {
			$("#rank").addClass("underbar");
			$("#name").removeClass("underbar");

		});
		$("#name").click(function() {

			$("#name").addClass("underbar");
			$("#rank").removeClass("underbar");

		});
		//영화 선택시 
		$(document).on("click","li.movie",function() {

			$("li.movie").removeClass("selected");
			$(this).addClass("selected");
			// 글자 숨기기
			$(".movie>div.default").css("display", "none");
			
			// defualt클래스 뒤 모든 형제엘리먼트 보여주기
			var grade = $(this).find("img").attr("alt");
			var str = "";
			switch(grade){
			case "0": str = "전제 관람가"; break;
			case "12":str = "12세 관람가";break;
			case "15":str = "15세 관람가";break;
			case "19":str = "청소년관람불가";break;
			}
			
			$(".movie .movie_poster>img").attr("src","views/reservation/img/"+$(this).children("span.poster_src").text());
			$(".movie .movie_title >span>a").text($(this).find("span.subject").text());
			$(".movie .movie_grade >span>a").text(str);
			$(".movie>div.default").nextAll().css("display", "");
			

		});
		//극장 선택시
		$(document).on("click","li.branch",function() {
		//$("li.day").click(function() {
			$("li.branch").removeClass("selected");
			$(this).addClass("selected");
			//theater
			// 글자 숨기기
			$(".theater>div.default").css("display", "none");
			// defualt클래스 뒤 모든 형제엘리먼트 보여주기
			//alert("id : "+$(this).attr("id")+" ("+$(this).find("span.dayweek").text()+")");
			
			$("#branch").text($(this).find("span").html());
			$(".theater>div.default").nextAll().css("display", "");

		});
		//날짜 선택시
		$(document).on("click","li.day",function() {
		//$("li.day").click(function() {
			$("li.day").removeClass("selected");
			$(this).addClass("selected");
			//theater
			// 글자 숨기기
			$(".theater>div.default").css("display", "none");
			// defualt클래스 뒤 모든 형제엘리먼트 보여주기
			//alert("id : "+$(this).attr("id")+" ("+$(this).find("span.dayweek").text()+")");
			
			$("#time").text('');
			$("#screen").text('');
			$("#date").text($(this).attr("id")+" ("+$(this).find("span.dayweek").text()+") ");
			$(".theater>div.default").nextAll().css("display", "");
			
			//상영영화리스트 재검색
			if($("li.movie").hasClass("selected")){
				//nothing
			}else{
				var string =$(this).attr("id");
				movielistforday(string);
			}
			
			

		});
		//상영관선택시
		$(document).on("click","li.one",function() {
		//$("li.one").click(function() {
			$(".theater li").children().removeClass("selected");
			$(this).children("span.time").addClass("selected");
			/* $("#date").text($("#date").text()+" "+$(this).children("span.time").text()); */
			/* $("#date").append($(this).children("span.time").text()); */
		
			$("#time").text("");
			$("#time").text($(this).children("span.time").text());
			$("#screen").text("");
			$("#screen").text($(this).parents("div.theater").find("span.floor").text());
			$("#rightbnt").attr("src","views/reservation/img/redseat.png");
			//step2 상영관/시간 영역 설정
			$("div.screen-time span.screen").text($("li.branch.selected").find("span").html()+" "+$(this).parents("div.theater").find("span.floor").text());
			$("div.screen-time span.step2_time").text($(this).children("span.time").text()+" ~ "+$(this).children("span.time").attr("title"));
			//step2 좌석정보
			seatslist($(this).attr("id"));
			//예매정보-상영정보
			$("#running_idx").attr("value",$(this).attr("id"));
		});
		
		//영화,극장,날짜 선택시
		$(document).on("click","li.day, li.branch, li.movie ",function() {
			
			$("#rightbnt").attr("src","views/reservation/img/grayseat.png");
			if($("li.day").hasClass("selected") & $("li.branch").hasClass("selected") & $("li.movie").hasClass("selected")){
				//상영정보불러오기
				runninginfo($("li.movie.selected").attr("id"), $("li.day.selected").attr("id"), $("li.branch.selected").attr("id"));
			}
			$("li.one span.time").tooltip();
		});
		
		
		/* step2 */
		//인원선택시 어른
		$("#adult li").click(function(){
			$(".adult li").removeClass("selected");
			$(this).addClass("selected"); 
			$(".block_wrap input:radio").removeAttr("disabled");
			//0명이면 wrap_theater로 mini theather
			$("#wrap_theater").attr("id","show_theater");
			//$("#show_theater").attr("id","wrap_theater");
		});
		//청소년
		$("#young li").click(function(){
			$(".young li").removeClass("selected");
			$(this).addClass("selected"); 
			$(".block_wrap input:radio").removeAttr("disabled");
			//0명이면 wrap_theater로 mini theather
			$("#wrap_theater").attr("id","show_theater");
		});
		//붙임좌석선택
		$(".block_wrap input:radio").click(function(){
			
			//라디오버튼 하나만 선택되게
			$(".block_wrap input:radio[name!=block"+$(this).val()+"]").attr("checked",false);
			$(".block_wrap input:radio[name=block"+$(this).val()+"]").attr("checked",true);
			
			$("span.block").removeClass("selected1");
			$(this).parents("span.block").addClass("selected1");
		});
		
		//인원수에 따른 붙임좌석 설정
		function seatcount(){
			//인원수에 따라 붙임좌석 disable="disable"설정
			var total=Number($("#young li.selected").text())+Number($("#adult li.selected").text());
			var seatcount = $("div.row").find("li.select").length;
			$(".block_wrap input:radio").attr("checked",false);
			if(total-seatcount <4){
				for (var int = 3; int >= total-seatcount; int--) {
					$(".block_wrap input:radio[name=block"+(int+1)+"]").attr("disabled",true);
					$(".block_wrap input:radio").attr("checked",false);
					$(".block_wrap input:radio[name=block"+int+"]").attr("checked",true);
				}
			}else{
				$(".block_wrap input:radio[name=block4]").attr("checked",true);
			}
			var select =$("input:radio:checked").attr("id");

			$("span.block").removeClass("selected1");
			$(".block_wrap input:radio[name="+select+"]").parents("span.block").addClass("selected1");
			
		}
		
		
		//인원수에 따른 붙임좌석 활성화/비활성화
		$("#young li, #adult li").click(function(){
			
			$(".seats ul li").removeClass("select");
			$("div.payment-ticket").css('display','');
			var young =Number($("#young li.selected").text());
			var adult = Number($("#adult li.selected").text());
			if(young>0){
				$("div.payment-young").css('display','');
				$("#young-quantity").text($("#young li.selected").text());
				
			}else{
				$("div.payment-young").css('display','none');
			}
			if(adult>0){
				$("div.payment-adult").css('display','');
				$("#adult-quantity").text($("#adult li.selected").text());
				
			}else{
				$("div.payment-adult").css('display','none');
			}
			
			$("#total_price").text(young*6000+adult*9000);
			//$("div.payment-final").css('display','');
			
			seatcount();
		});
	
		//좌석미리보기-포인터올릴때
		$(".seats ul li").mouseover(function(){
			//$(".seats ul li, .seats ul li a ").mouseover(function(){
			 var cnt = Number($(".block_wrap input:radio:checked").val()); //붙임좌석수
			 var num = Number($(this).text())-(Number($(this).parent().find("li").eq(0).text())-1); //좌석번호
			 var start,end=0;
			 var limit = $(this).parent().find("li").length; //붙어 있는 좌석의 총 수
			//좌석선택활성화시
			if($(this).parents("#wrap_theater").length != 1){
				if(!($(this).hasClass("reservation"))){
				
					if(cnt==2){
						if(num%2==1){
							start = num-1;
							end = num+1;
						}else{
							start = num-2;
							end = num;
						}
					}else if(cnt==3){
						if(num%3==1 || num%3==0){
							start = num-1;
							end = num+2;
						}else{
							start = num-2;
							end = num+1;
						}
					}else if(cnt==4){
						if(num%2==1){
							start = num-1;
							end = num+3;
							
						}else{
								start = num-2;
								end = num+2;
						}
					}else{
						start=num-1;
						end=num;
					}
					
					if(end>limit){
						end=limit
					}
					for(var i =end; i>num ;i--){
						
						var last = $(this).parent().find("li").eq(i-1).hasClass("reservation");
						if(last){
							end = i-1;
							start = end-cnt;
							
						}
					}
					if(end-start<cnt){
						start = end-cnt;
						if(start<0){
							start=0;
						}
					}
					for(var k = start ; k<num;k++){
						var first = $(this).parent().find("li").eq(k).hasClass("reservation");
						if(first){
							start = k+1;
							end =start+cnt;
						}
					}
					if(end>limit){
						end=limit
					}
					var end2 = end;
					for (var int = start; int <end2; int++) {
						var item=$(this).parent().find("li").eq(int).hasClass("reservation");
						if(item){
							if(int <num){
								start=int+1;
							}else if(int>num){
								end = int;
							}
						}
					}
					/*if(end>limit){
						for(var k = limit-cnt ; k<limit;k++){
							var first = $(this).parent().find("li").eq(k).hasClass("reservation");
							if(first){
								start = k+1;
								end =limit;
							}
						}
						$(this).parent().find("li").slice(start-end).addClass("preselect");
					}else{
						$(this).parent().find("li").slice(start,end).addClass("preselect");
					}*/
					$(this).parent().find("li").slice(start,end).addClass("preselect");
				}
			}
			
		
		});
		//좌석미리보기-마우스포인터떠날때
		$(".seats ul li").mouseout(function(){
			 $(".seats ul li").removeClass("preselect");
			  
		});
		
		//좌석클릭후 
		$(".seats ul li").click(function(){
			if($(this).parents("#wrap_theater").length != 1){
				
				var cnt = Number($(".block_wrap input:radio:checked").val()); //붙임좌석수
				var person=Number($("#young li.selected").text())+Number($("#adult li.selected").text()); //총 예약인원수
				//if($("div.row").find("li.select").length+$("div.row").find("li.preselect").length >cnt){
				if(person > $("div.row").find("li.select").length){
					
					$(this).parent().find("li.preselect").addClass("select");
						
				}else if($("div.row").find("li.select").length+$("div.row").find("li.preselect").length >person){
					
					var res = confirm("좌석을 변경하시겠습니까?");
					if(res){
						$(".seats ul li").removeClass("select");
						$(this).parent().find("li.preselect").addClass("select");
					}
				}
				if(person==$("div.row").find("li.select").length){
					$("#rightbnt").attr("src","views/reservation/img/redpayment.png");
				}
				
				var str="";
				$("li.select").each(function(index){
//					str+=$(this).attr("")+ $(this).text()+" "
					str+=$(this).attr("title")+" "
				});
				
				$("#persons").text(person);
				$("#seats_no").text(str);
				seatcount();
			}
		});
		
		//이전버튼
		$("#step1").click(function(){
			$("#reservation_step2").css("display","none");
			$("#reservation_step1").css("display","");
			$(".before_bnt").css("display","none");
		
			if($("li.day").hasClass("selected") & $("li.branch").hasClass("selected") & $("li.movie").hasClass("selected") & $("li.one span.time").hasClass("selected")){
				$("#rightbnt").attr("src","views/reservation/img/redseat.png");
			}
			$("div.tnb").removeClass("step2").addClass("step1");
			
		});
		//다음버튼
		$("#step2").click(function(){
			var person=Number($("#young li.selected").text())+Number($("#adult li.selected").text());
				if($("#rightbnt").attr("src")=="views/reservation/img/redseat.png" && $("#membership_email").val() != 'null'){
					$("#reservation_step1").css("display","none"); //step1 hide
					$("#reservation_step2").css("display","");
					$(".before_bnt").css("display","");
					if(person == $("div.row").find("li.select").length && person != 0){
						$("#rightbnt").attr("src","views/reservation/img/redpayment.png");
					}else{
						$("#rightbnt").attr("src","views/reservation/img/graypayment.png");
						$("#step2").attr("href","#");
						
					}
					$("div.tnb").removeClass("step1").addClass("step2");
				}else if($("#rightbnt").attr("src")=="views/reservation/img/redpayment.png" && $("#membership_email").val() != 'null'){
					//상영정보는 상영관선택시 미리 설정
					//좌석정보
					$("#seat_number").val($("#seats_no").text());
					//가격정보
					$("#sale_price").val($("#total_price").text());
					//회원정보
					//$("#membership_email").val("test@");
					$("#procreserve").attr("action","procreserve.do");
					$("#procreserve").submit();
					
				}else{
					//예매정보확인
					if(!($("li.movie").hasClass("selected"))){
						alert("영화를 선택해 주세요");
					}else if(!($("li.branch").hasClass("selected"))){
						alert("극장을 선택해 주세요");
					}else if(!($("li.day").hasClass("selected"))){
						alert("날짜를 선택해 주세요");
					}else if(!($("li.one span.time").hasClass("selected"))){
						alert("시간을 선택해 주세요");
					}else if($("#rightbnt").attr("src")=="views/reservation/img/graypayment.png"){
						alert("좌석을 선택해주세요");
					}else if($("#membership_email").val() == 'null'){
						alert("로그인 해주세요");
					}
				}
		});
		
		$("#reservation_step2").mouseover(function(){
			var person=Number($("#young li.selected").text())+Number($("#adult li.selected").text());
			if(person == $("div.row").find("li.select").length && person > 0){
				$("#rightbnt").attr("src","views/reservation/img/redpayment.png");
			}else{
				$("#rightbnt").attr("src","views/reservation/img/graypayment.png");
			}
		});
		

	});