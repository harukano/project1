//현재 상영중인 영화목록
function movielist(){

		$("#movie_list").empty();
		var str = "";
		var re = $.ajax({
			type:"POST",
			url:"movielist.do",
			/*data:"test="+"1234",*/
			dataType:"text",
			success:function(redata){
				//alert(redata);
				$("#movie_list").empty();
				var data=jQuery.parseJSON(redata);
				$.each(data, function(entryIndex, entry){
					str += "<li class='movie' id='"+entry["film_idx"]+"'>";
					str += "<span class='poster_src'>"+entry["film_poster"]+"</span>";
					str += "<a href='#'>" + "<img alt='"+entry["film_class"]+"' src='views/reservation/img/"+entry["film_class"]+".png' class='round'>";
					str += "<span class='subject'>"+entry["film_name"]+"</span></a></li>";
				});
				$("#movie_list").append(str);
			},
			statusCode: {
			    404: function() {
			      alert('해당 파일이 없어요');
			    }
			}
		});
		re.fail(function(jqXHR, textStatus) {
			alert( "요청 오류 : " + textStatus ); 
		});	

}
//특정날짜의 영화목록
function movielistforday(day){

	$("#movie_list").empty();
	var str = "";
	var re = $.ajax({
		type:"POST",
		url:"movielistforday.do",
		data:"fortheday="+day,	/*data:"test="+"1234",*/
		dataType:"text",
		success:function(redata){
			//alert(redata);
			$("#movie_list").empty();
			var data=jQuery.parseJSON(redata);
			if(data!=""){
				$.each(data, function(entryIndex, entry){
					str += "<li class='movie' id='"+entry["film_idx"]+"'>";
					str += "<span class='poster_src'>"+entry["film_poster"]+"</span>";
					str += "<a href='#'>" + "<img alt='"+entry["film_class"]+"' src='views/reservation/img/"+entry["film_class"]+".png' class='round'>";
					str += "<span class='subject'>"+entry["film_name"]+"</span></a></li>";
				});
			}else{
				str += "<li>영화없음</li>";
			}
			
			$("#movie_list").append(str);
			
		},
		statusCode: {
		    404: function() {
		      alert('movielistforday 해당 파일이 없어요');
		    }
		}
	});
	re.fail(function(jqXHR, textStatus) {
		alert( "요청 오류 : " + textStatus ); 
	});	

}
function daylist(){

	$("#step1-date").empty();
	var str = "";
	var m = "";
	var re = $.ajax({
		type:"POST",
		url:"daylist.do",
		/*data:"test="+"1234",*/
		dataType:"text",
		success:function(redata){
			//alert(redata);
			//$("#movie_list").empty();
			var data=jQuery.parseJSON(redata);
			$.each(data, function(entryIndex, entry){
			
				//월이 바뀔경우 
				if(m!=entry["month"]){
					//alert("new month");
					m=entry["month"];
					str+="<li class='dimmed'><span class='year'>"+entry["year"]+"</span>";
					str+="<span class='month'>"+Number(entry["month"])+"</span></li>";
				}
				//일요일일경우
				if(entry["dayofweek"]=="일"){
					str+="<li class='day sunday' id='"+entry["year"]+"-"+entry["month"]+"-"+entry["day"]+"'><a href='#'> <span class='dayweek'>";
					str+=entry["dayofweek"]+"</span>";
					str+="<span class='day'> "+Number(entry["day"])+"</span></a></li>";
					return true;
				}
				//토요일일경우
				if(entry["dayofweek"]=="토"){
					str+="<li class='day saturday' id='"+entry["year"]+"-"+entry["month"]+"-"+entry["day"]+"'><a href='#'> <span class='dayweek'>";
					str+=entry["dayofweek"]+"</span>";
					str+="<span class='day'> "+Number(entry["day"])+"</span></a></li>";
					return true;
				}
				//평일
				str+="<li class='day' id='"+entry["year"]+"-"+entry["month"]+"-"+entry["day"]+"'><a href='#'> <span class='dayweek'>";
				str+= entry["dayofweek"]+"</span>";
				str+= "<span class='day'> "+Number(entry["day"])+" </span></a></li>";

			});
			$("#step1-date").append(str);
		},
		statusCode: {
		    404: function() {
		      alert('해당 파일이 없어요');
		    }
		}
	});
	re.fail(function(jqXHR, textStatus) {
		alert( "요청 오류 : " + textStatus ); 
	});	

}
//상영시간표
function runninginfo(film_idx,date,branch){

	$("#time-list").empty();
	
	var str="";
	var para ={"film_idx":film_idx,"start_show_time":date,"branch_code":branch};
	var re = $.ajax({
		type:"POST",
		url:"runninginfo.do",
		data: para,
		dataType:"text",
		success:function(redata){
			var theater="";
			var t="";
			$("#time-list").empty();
			var data=jQuery.parseJSON(redata);
			
				if(data!=""){
					$.each(data, function(entryIndex, entry){
					
						//상영관이 변경될 경우
						if(t != entry["theater_code"] & t.length == entry["theater_code"].length){
							str+="</ul></div>";
						}
						if(t != entry["theater_code"]){
							t=entry["theater_code"];
							var theater = entry["theater_code"].substring(entry["theater_code"].length-1,entry["theater_code"].length);
							str += "<div class='theater'>";
							str += "<span class='title'> <span class='floor'>"+theater+"관</span>";
							str += "<span class='seatcount'>(총100석)</span></span><ul>";
						}
						//str+="<li class='one'><a href='#'><span class='time'>"+entry["start_show_time"];
						//str+="</span><span class='count'>0석</span></a></li>";
					//end_show_time 정보 담아두기
						//str+="<li class='one' id='"+entry["running_idx"]+"' title='"+entry["end_show_time"]+"'>";
						str+="<li class='one' id='"+entry["running_idx"]+"'>";
						str+="<span class='time' title='"+entry["end_show_time"]+"'>"+entry["start_show_time"];
						str+="</span><span class='count'>100석</span></li>";
					
					});
				}
				else{
					str+="<div class='theater'><img src='/views/reservation/img/error.png' style='margin:auto'>상영정보없음</div>";
//					str+="<div class='theater'>상영정보없음<span class='title'> <span class='floor'></span>";
//					str+="<span class='seatcount'></span></span><ul><li>상영정보없음</li></ul></div>";
					
						
				}
				$("#time-list").append(str);
			
		},//success
		statusCode: {
		    404: function() {
		      alert('runninginfo 해당 파일이 없어요');
		    }
		}
	});
	re.fail(function(jqXHR, textStatus) {
		alert( "runninginfo 요청 오류 : " + textStatus ); 
	});	

}
//좌석정보
function seatslist(info){

	$("#seats_list li").removeClass("reservation");
	//$("li[title='J1']").addClass("reservation");
	
	var str = "";
	var re = $.ajax({
		type:"POST",
		url:"seatslist.do",
		data:"info="+info,
		dataType:"text",
		success:function(redata){
			//$("#seats_list").removeClass("reservation");
			var data=jQuery.parseJSON(redata);
			if(data!=""){
				$.each(data, function(entryIndex, entry){
					//데이터 받아서 예약 클래스 더해주기
					$("li[title='"+entry["seat_number"]+"']").addClass("reservation");
				});
			}
		},
		statusCode: {
		    404: function() {
		      alert('해당 파일이 없어요');
		    }
		}
	});
	re.fail(function(jqXHR, textStatus) {
		alert( "요청 오류 : " + textStatus ); 
	});	

}
