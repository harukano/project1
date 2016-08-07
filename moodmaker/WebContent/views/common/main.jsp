<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="views/common/css/main.css">
</head>
<body>
<script type="text/javascript">
//쿠키 가져오기
 function getCookie(cName) {
   cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue); 
} 

function popupOpen(seq, title, content, width, height, widLoc, heiLoc){
	var url = "/popup.jk?seq=" + seq;
	var title = title;
	var status = "width="+width;
	status += ",height=" + height;
	status += ",left="+widLoc;
	status += ",top="+heiLoc;
	status += ",scrollbar=no, menubar=no";
	window.open(url, "_blank", status); 
};

</script>
<div id="wrap">
	<div id="main_slide">
	<c:if test="${popupList != null }">
		<script type="text/javascript">
			$(document).ready(function(){
				 <c:forEach var="list" items="${popupList}" varStatus="idx">
				 	if(getCookie("popup_"+'${list.seq}') != "done"){
						popupOpen('${list.seq}','${list.title}',
								  '${list.context}',
								  '${list.widSize}','${list.heiSize}','${list.widLoc}','${list.heiLoc}');
				 	}
				</c:forEach> 
			});
		</script>
	</c:if>
		<div class="container">
			<div id="slides">
				 <img src="views/common/images/bigheros.jpg" alt="">
				<img src="views/common/images/boyhood.jpg" alt="">
				<img src="views/common/images/slide1.PNG" alt="">
				<img src="views/common/images/grandhotel.jpg" alt="">
			</div><!-- slide images -->
		</div><!--container  -->
	</div><!-- main_slide -->
	<div class="movies_area"><!-- movies -->
		<div class="title">오늘의 BOX OFFICE</div>
		<div class="ranking">
			<div class="ranking_head">영화예매랭킹</div>
			<div class="ranking_inner">
				<ul id="ranking_list">
					<li class="item">
					<a href="#">1</a><span class="subject">이다</span>
					</li>
					<li class="item">
					<a href="#">2</a><span class="subject">채피</span>
					</li>
					<li class="item">
					<a href="#">3</a><span class="subject">파리폴리</span>
					</li>
					<li class="item">
					<a href="#">4</a><span class="subject">보이후드</span>
					</li>
					<li class="item">
					<a href="#">5</a><span class="subject">그랜드 부다페스트호텔</span>
					</li>
					<li class="item">
					<a href="#">6</a><span class="subject">님아,그강을 건너지마오</span>
					</li>
					<li class="item">
					<a href="#">7</a><span class="subject">킹스맨</span>
					</li>
				</ul>
			</div>
		
		</div>
		<div class="poster_session">
			<div class=""><img src="views/common/images/ida.jpg" style=" display:block; width:380px; height: 550px; margin: 0px 10px 10px; float: left; border-radius:5px; "></div>
			<div class=""><img src="views/common/images/cheppie.jpg" style="display:block; width:175px; height: 270px; margin: 0px 10px 10px 0px; float: left; border-radius:5px;"></div>
			<div class=""><img src="views/common/images/paris.jpg" style="display:block; width:175px; height: 270px; margin: 0px 10px 10px 0px ; float: left; border-radius:5px;"></div>
			<div class=""><img src="views/common/images/boyhood.jpg" style="display:block; width:175px; height: 270px; margin: 0px 10px 10px 0px; float: left; border-radius:5px;"></div>
			<div class=""><img src="views/common/images/grandhotel.jpg" style="display:block; width:175px; height: 270px; margin: 0px 10px 10px 0px; float: left; border-radius:5px;"></div>
		</div>
	
	</div>
</div>
<script src="views/common/js/jquery.slides.min.js"></script>
 <script type="text/javascript">
    $(function() {
      $("#slides").slidesjs({
        width: 1200,
        height: 400,
         play: {
          active: true,
          auto: true,
          interval: 4000,
          swap: true
        }
      });
    });
  </script>
</body>
</html>