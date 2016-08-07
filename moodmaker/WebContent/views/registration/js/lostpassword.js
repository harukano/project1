/**
 * lostpassword.js
 */
$(function(){
	//alert("test");
	$("input#membership_email").blur(function(){
		//alert("test");
			if($("#membership_email").val() != ""){
				
				var email = $("#membership_email").val();
				if(email.indexOf("@") < 0){
					alert("이메일을 입력해주세요.");
					$("#membership_email").val("");
					$("#membership_email").focus();
				}else{
					checkemail(email);
				}
				
			}/*else{
				alert("이메일을 입력해주세요.");
				$("#membership_email").focus();
			}*/
			
	});
	$("input#membership_loss_email").blur(function(){
			if($("#membership_loss_email").val() != ""){
					
				var email = $("#membership_email").val();
				var lossemail= $("#membership_loss_email").val();
				if(email.indexOf("@") < 0){
					alert("이메일을 입력해주세요.");
					$("#membership_email").focus();
				}else if(lossemail.indexOf("@") < 0){
					alert("이메일을 입력해주세요.");
					$("#membership_loss_email").focus();
				}
				else{
					checklossemail(email,lossemail);
				}
					
			}/*else{
				alert("등록한 비상 이메일을 입력해주세요.");
				$("#membership_loss_email").focus();
			}*/
				
		});
});
function validate(form){

	if (form.membership_email.value.indexOf("@") < 0) {
			alert( "이메일 계정을 입력하여 주십시오." );
			form.membership_email.focus();
		   return false;
	   } else if (form.membership_loss_email.value.indexOf("@") < 0 ) {
		   alert( "계정 분실시 비상 연락 이메일을 입력하여 주십시오." );
		   form.membership_loss_email.focus();
		   return false;
	   } else if(form.checked.value =="1"){
			alert( "이메일 계정을 확인하여 주십시오." );
			form.membership_email.focus();
		   return false;
		}else {		
				form.submit();
		}
	   return true;
}