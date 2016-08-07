/**
 *registration_ajax_json.js 
 */
function checkemail(email){
	var str="";
	
	var re = $.ajax({
		type:"POST",
		url:"emailcheck.do",
		data:"membership_email="+email,
		dataType:"text",
		success:function(redata){
			var data=jQuery.parseJSON(redata);
			var result=data.result;
			
			if(result =="success"){
				str = "사용가능한 아이디";
				$("#email").val("0");
			}else if(result == "fail"){
				str ="사용가능하지 않은 아이디";
				$("#email").val("1");
			}
			$("#checkedemail").text(str);
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
function checkname(name){
	var str="";
	
	var re = $.ajax({
		type:"POST",
		url:"namecheck.do",
		data:"membership_another_name="+name,
		dataType:"text",
		success:function(redata){
			var data=jQuery.parseJSON(redata);
			var result=data.result;
			
			if(result =="success"){
				str = "사용가능한 닉네임";
				$("#nickname").val("0")
					
			}else if(result == "fail"){
				str ="사용가능하지 않은 닉네임";
				$("#nickname").val("1")
			}
			$("#checkedname").text(str);
			
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