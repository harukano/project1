	/**
	 * ���� ��ǲ�� �Է� �Ϸ�� ���� ��ǲ������ �̵� 
	 * @param {Object} obj 	: this
	 * @param {Object} len 	: ���� INPUT���� ����
	 * @param {Object} next : ex)��ǲ�� ID 
	 */
	function nextFocus(obj,len,next){ 
		//alert(next.length);
		if(obj.value.length == len){
			if (next.length == undefined) {
				//alert("1");
				next.focus();
			}else{
				//alert("2");
				document.getElementById(next).focus();
			}
			
		}
	}
	
	/**
	 * ���ڸ� �Է�
	 * @param {Object} str : üũ�� INPUT ex)this 
	 */
	function onlyNum(str){
	    var inText = str.value;
	    var ret;
	    
	    for (var i = 0; i < inText.length; i++) {  
	        ret = inText.charCodeAt(i);
	        if (!((ret > 47) && (ret < 58))) {
	            alert("숫자만 입력 가능합니다.");
	            str.value = "";
	            str.focus();
	            return false;
	        }
	    }
	    return true;
	}	
	/**
	 * ���ڸ� �Է�
	 * @param {Object} str : üũ�� INPUT ex)this 
	 */
	function onlyNum2(str){
	    var inText = str.value;
	    var ret;
	    
	    for (var i = 0; i < inText.length; i++) { 
	        ret = inText.charCodeAt(i);
	        if((event.keyCode > 57 || event.keyCode < 48) && (event.keyCode > 105 || event.keyCode < 96) 
	        		&& (event.keyCode > 8 || event.keyCode < 8) && (event.keyCode > 46 || event.keyCode < 46)){
	        	str.value = "";
	            alert("숫자만 입력 가능합니다.");
	            str.focus();
	            return false;
	        }
	    }
	    return true;
	}
	
	function onlyNum3(str){
	    var inText = str.value;
	    var ret;
	    
	    for (var i = 0; i < inText.length; i++) { 
	        ret = inText.charCodeAt(i);
	        if((event.keyCode > 57 || event.keyCode < 48) && (event.keyCode > 105 || event.keyCode < 96) 
	        		&& (event.keyCode > 8 || event.keyCode < 8) && (event.keyCode > 46 || event.keyCode < 46)){
	        	str.value = inText.substring(0,inText.length-1);
	            alert("숫자만 입력 가능합니다.");
	            str.focus();
	            return false;
	        }
	    }
	    return true;
	}
	
	/**
	 * ��� �ʵ� �ʱ�ȭ
	 * @param {Object} frm : ex) allClear(this.form)
	 */
	function allClear(frm){
		for(var i = 0 ; i < frm.length ; i++ ){
			if(frm.elements[i].type == 'text'){
				frm.elements[i].value = "";
			}else if(frm.elements[i].type == 'password'){
				frm.elements[i].value = "";
			}
		}
	}
	/**
	 * ��¥ ��ȿ�� �˻�(YYYYMMDD)
	 * @param {Object} str : �˻��� INPUT ��
	 * @return True:Ʋ��, False:����
	 */
	function dateCheck(str){
	    var flag = false;
	    
	    var year =  parseInt(str.substring(0,4));
	    var month = parseInt(str.substring(4,6));
	    var day = parseInt(str.substring(6,8));
	
		lastDay = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
		
		if(year %4 == 0 && year % 100 != 0 || year % 400 == 0){
			lastDay[1] = 29;
		}
		if(month > 12){
			return true;
		}
		if(day > lastDay[month-1]){
			return true;
		} 
		return flag;
	}
	/**
	 * ���ڿ� ���� �˻�
	 * @param {Object} obj : �˻��� INPUT ��
	 * @param {Object} len : ���ڿ��� ����
	 * @param {Object} text: Alert ����
	 */
	function strLengthCheck(obj,len,text){
		if(obj.value.length == 0 || obj.value.length == len){
			alert(text);
			return;
		}
	}
	/**
	 * �׼� ����
	 * @param {Object} form : document.form
	 * @param {Object} actionName : �׼Ǹ�
	 * @param {Object} target: Ÿ��
	 * @param {Object} methode: �޼ҵ�
	 */
	function fnSubmit(frm,actionName,targetLayer,methode){
		//alert(frm.name + " , " + actionName + " , " + targetLayer + " , " + methode );
		frm.method = methode;
		frm.target = targetLayer;
		frm.action = actionName;
		frm.submit();
	}
	
	/**
	 * ���� �׼�
	 * @param actionName
	 * @param targetLayer
	 * @param methode
	 * @return
	 */
	function fnXSubmit(actionName,targetLayer,methode){
		//alert(" fnXSubmit " + actionName + " , " + targetLayer + " , " + methode );
		
		if(EncForm2(goForm, sendForm)) {
			//Submit �׼�
			fnSubmit(sendForm, actionName, targetLayer, methode);
		}else {
			alert("���Ȼ� ������ ���� ������ ��� �Ǿ����ϴ�.");
			window.location.href="/";
		}
	}
	
	function printMessage(msg, target){
		if(msg == "" || msg.length == 0){
			return;
		}else{
			alert(msg);
		}
		_focus(target);
	}
	
	
	function LogMessage(msg1, msg2, target){
		if(!msg1 == "" || !msg1.length == 0){
			return;
		}else if(msg2 == "" || msg2.length == 0){
			return;
		}else{
			alert(msg2);
		}
		_focus(target);
	}
	
	function _focus(target){
		document.getElementById(target).focus();
		return;
	}
	
	function pageSubmit(url,frm,off,size){
		//alert(url + " , " + frm + " , " + off + " , " + size ); 
		frm.offset.value = off;
		frm.pageSize.value = size; 
		url = url;
		fnSubmit(frm, url ,"_self","post"); 
	}
	
	function validateChar(obj,min,max,msg){
		if(obj.value.length < min || obj.value.length > max){
			alert(msg);
			obj.value = "";
			obj.focus();
			
			return true;
		}else{
			return false;
		}
	}
	
	function validateEmpty(obj,msg){
		if(obj.value == ""){
			alert(msg);
			obj.focus();
			
			return true;
		}else{
			return false;
		}
	}
	
	function selectNext(target){
		target.focus();
	}
	
	function jumin_check(strjumin, ele) 
	{
	    if (strjumin.length != 13) 
	    {
	       alert("�ֹι�ȣ�� �ùٸ��� �ʽ��ϴ�"); 
	       ele.focus(); 
	       return false;
	    } 
        var a1=strjumin.substring(0,1)   
        var a2=strjumin.substring(1,2)          
        var a3=strjumin.substring(2,3)
        var a4=strjumin.substring(3,4)
        var a5=strjumin.substring(4,5)
        var a6=strjumin.substring(5,6)
        var checkdigit=a1*2+a2*3+a3*4+a4*5+a5*6+a6*7
        var b1=strjumin.substring(6,7)
        var b2=strjumin.substring(7,8)
        var b3=strjumin.substring(8,9)
        var b4=strjumin.substring(9,10)
        var b5=strjumin.substring(10,11)
        var b6=strjumin.substring(11,12)
        var b7=strjumin.substring(12,13)
        var checkdigit=checkdigit+b1*8+b2*9+b3*2+b4*3+b5*4+b6*5 
        checkdigit = checkdigit%11
        checkdigit = 11 - checkdigit
        checkdigit = checkdigit%10
        
        if (checkdigit != b7) 
        {   
           alert('�߸��� �ֹε�Ϲ�ȣ�Դϴ�.\n\n�ٽ� Ȯ���ϰ� �Է��Ͽ� �ֽñ� �ٶ��ϴ�'); 
           ele.focus();   
           return false;
        } 
	      return true;
	}
	
	//����Ʈ ������ �׸� �Է�
	function insertIMG(irid,filename){ 
		var sHTML = "<img src='" + imagepath + filename + "' border='0' />"; 
		oEditors.getById[irid].exec("PASTE_HTML", [sHTML]); 
	} 
	
	/**
	 * ��Ű ��������
	 * @param strName
	 * @return
	 */
	function getCookie(name)        
	{
	        var nameOfCookie = name + "=";
	        var x = 0;
	        while(x <= document.cookie.length)
	        {
	                var y = (x + nameOfCookie.length);
	                if(document.cookie.substring(x,y) == nameOfCookie)
	                {
	                        if((endOfCookie = document.cookie.indexOf(";",y)) == -1)
	                                endOfCookie = document.cookie.length;
	                        return unescape(document.cookie.substring(y,endOfCookie));
	                }
	                x = document.cookie.indexOf(" ",x) + 1;
	                if(x == 0)
	                        break;
	        }
	        return "";
	}

	/**
	 * ��Ű �����ϱ�
	 * @param name
	 * @param value
	 * @param expiredays
	 * @return
	 */
	function setCookie( name, value, expiredays )
	{
	    var today = new Date();
	    today.setDate( today.getDate() + expiredays );
	    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
	}
	
 	function removeSelect(obj){
		for(var i=obj.options.length-1;i>=0;i--){
			obj.options.remove(i);
		}
 	}
 	function setComma(str){
 	 	return Number(String(str).replace(/\..*|[^\d]/g,"")).toLocaleString().slice(0,-3);
 	} 
 	
 	function checkEmail(formObj) {
 	    var str = formObj.value;
 	    var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+$/;
 	    if (re.test(str) == true) { return true; }
 	       formObj.focus();
 	       formObj.select();
 	    return false;
 	}
 	
 	function getTimeStamp() {
	  var d = new Date();
	  var s = leadingZeros(d.getFullYear(), 4) + '-' + leadingZeros(d.getMonth() + 1, 2) + '-' + leadingZeros(d.getDate(), 2);
	  return s;
	}

	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}
	
	//숫자만 입력
	function inputNumCom(obj){
		var keycode = event.keyCode;
	 
		if( !((48 <= keycode && keycode <=57) || keycode == 13 || keycode == 46) || document.getElementById(obj.id).value.length > 19){
			alert("숫자만 입력 가능합니다.");
			event.keyCode = 0;  // 이벤트 cancel
			obj.value = "";
			obj.focus();
			event.preventDefault(); 
			return;
		}
	}
	
	//숫자만 입력
	function inputTimeHH(obj){
		var value = obj.value;
		if(Number(value) > 24){
			alert("시간은 00시부터 24시만 입력 가능합니다.");
			obj.value = "";
			obj.focus();
			return
		}
	}
	
	//숫자만 입력
	function inputTimeMM(obj){
		var value = obj.value;
		if(Number(value) >= 60){
			alert("시간은 00분부터 59분만 입력 가능합니다.");
			obj.value = "";
			obj.focus();
			return
		}
	}
	
	
	
	
 		
