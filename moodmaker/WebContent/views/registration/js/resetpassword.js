/**
 * 
 */
function validate(form)
{		
   if (form.membership_password.value == "") {
	   alert( "패스워드 입력해주세요." );
	   form.term.focus();
	   return false;
	} else if(form.confirm_password.value != form.membership_password.value ) {
	   alert( "입력한 패스워드와 일치하지 않습니다.\n 확인하여 주십시오." );
	   form.confirm_password.focus() ;
	   return false;

	} else {		
		form.submit();
	}

   return true;
}