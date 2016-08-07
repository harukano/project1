/**
 * registration.js
 */

$(function(){
	$("input#membership_email").blur(function(){
	//	$("input#membership_email").focusout(function(){
			if($("#membership_email").val() != ""){
				
				var email = $("#membership_email").val();
				if(email.indexOf("@") < 0){
					alert("이메일을 입력해주세요.");
					$("#membership_email").val("");
					$("#membership_email").focus();
				}else{
					checkemail(email);
				}
				
			}else{
				alert("이메일을 입력해주세요.");
				$("#membership_email").focus();
			}
			
	//	});
	});
	$("input#membership_another_name").blur(function(){
			if($("#membership_another_name").val() != ""){
					
				var name = $("#membership_another_name").val();
				if(name.value == ""){
					alert("닉네임을 입력해주세요.");
					$("#membership_another_name").val("");
					$("#membership_another_name").focus();
				}else{
					checkname(name);
				}
					
			}else{
				alert("닉네임을 입력해주세요.");
				$("#membership_another_name").focus();
			}
				
		});
});

function validate(form)
{		

   if (form.term.checked == false) {
	   alert( "이용약관에 동의하여 주십시오." );
	   form.term.focus();
	   return false;
   } else if (form.membership_email.value.indexOf("@") < 0 ) {
	   alert( "이메일 계정을 입력하여 주십시오." );
	   form.membership_email.focus();
	   return false;
   } else if( form.email.value == "1") {
	   alert( "이메일 계정을 다시 입력하여 주십시오." );
	   form.membership_email.focus();
	   return false;
   } else if(form.membership_password.value == "") {
	   alert( "패스워드를 입력하여 주십시오" );
	   form.membership_password.focus() ;
	   return false;
	} else if(form.confirm_password.value != form.membership_password.value ) {
	   alert( "입력한 패스워드와 일치하지 않습니다.\n 확인하여 주십시오." );
	   form.confirm_password.focus() ;
	   return false;
	} else if(form.membership_another_name.value == "") {
		alert( "닉네임을 입력하여 주십시오." );
		form.membership_another_name.focus() ;
		return false;
	} else if( form.nickname.value == "1") {
		alert( "닉네임을 다시 입력하여 주십시오." );
		form.membership_another_name.focus() ;
		return false;
	} else if(form.membership_loss_email.value.indexOf("@") < 0) {
		alert( "계정 분실시 비상 연락 이메일을 입력하여 주십시오." );
		form.membership_loss_email.focus();
		return false;
	} else {		
		form.submit();
	}

   return true;
}