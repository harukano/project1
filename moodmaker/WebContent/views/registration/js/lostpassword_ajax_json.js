/**
 * lostpassword_ajax_json.js
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
				str = "등록되지 않은 이메일";
				$("#checked").val("1");
			}else if(result == "fail"){
				str ="ok";
				$("#checked").val("1");
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
function checklossemail(email,lossemail){
	var str="";
	var para ={"membership_email":email,"membership_loss_email":lossemail};
	var re = $.ajax({
		type:"POST",
		url:"allmailcheck.do",
		data:para,
		dataType:"text",
		success:function(redata){
			var data=jQuery.parseJSON(redata);
			var result=data.result; 
			
			if(result =="success"){
				str = "등록되지 않은 이메일";
				$("#checked").val("1");
			}else if(result == "fail"){
				str ="ok";
				$("#checked").val("0");
			}
			$("#checkedlossemail").text(str);
		},
		statusCode: {
		    404: function() {
		      alert('해당 파일이 없어요');
		    }
		}
	});
	re.fail(function(jqXHR, textStatus) {
		alert( "요청 오류checkloss : " + textStatus ); 
	});	

}