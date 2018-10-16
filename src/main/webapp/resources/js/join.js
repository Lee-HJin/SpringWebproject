$(document).ready(function(){
	
	//약관동의 전체클릭 이벤트
	$('.checkAll').click( function() {
		$('.chk').prop('checked', this.checked);
	});
	
	//아이디 유효성 검사
	$('#userId').on('keyup',function(){

		$(this).val( $(this).val().replace( /[^a-zA-Z0-9-_]/g, '' ) );

		var temp_id = document.getElementById('userId').value;

		if(temp_id.length>0){
			if(temp_id.length<6){
				$('#text_id').html("<span id='text_id' style='color: black;'>6~12자의 영문,숫자,-,_만 사용 가능</span>");
			}
			else if(temp_id.length>12) {
				$('#text_id').html("<span id='text_id' style='color: black;'>6~12자의 영문,숫자,-,_만 사용 가능</span>");
			}
			else{
				//Id 중복체크
				$(function(){
					var params = "userId=" + $('#userId').val();
		
					$.ajax({
						url:"idOverlapCheck.action",
						type:"POST",
						data:params,
						dataType:"json",
						success:function(data){
							if(data==true){
								$('#text_id').html("<span id='text_id' style='color: #886e45;'>사용 가능한 아이디입니다</span>");
							}
							else{
								$('#text_id').html("<span id='text_id' style='color: red;'>중복된 아이디입니다</span>");
							}
						},
						error:function(){
							alert("실패!");
						}
					});

				});
			}
		}
		else{
			$('#text_id').html("<span id='text_id' style='color: black;'>6~12자의 영문,숫자,-,_만 사용 가능</span>");
		}
	});

	//패스워드1 유효성 검사
	$('#userPwd1').on('keyup',function(){

		$(this).val( $(this).val().replace( /[^a-zA-Z0-9]/g, '' ) );

		var temp_pwd = document.getElementById('userPwd1').value;

		if(temp_pwd.length!=0){
			if(temp_pwd.length<10){
				$('#text_pwd1').text('10~15자의 영문/숫자 사용');
			}
			else {
				$('#text_pwd1').text('  ');
			}
		}
		else{
			$('#text_pwd1').text('10~15자의 영문/숫자 사용');
		}

	});

	//패스워드2 유효성 검사
	$('#userPwd2').on('keyup',function(){

		$(this).val( $(this).val().replace( /[^a-zA-Z0-9]/g, '' ) );

		var temp_pwd = document.getElementById('userPwd2').value;
		var pwd = document.getElementById('userPwd1').value;

		if(pwd==temp_pwd){
			$('#text_pwd2').text('');
			document.getElementById('userPwd').value = pwd;
		}
		else{
			$('#text_pwd2').text('비밀번호가 일치하지 않습니다.');
		}

	});
	
	//숫자만 입력할 수 있도록
	$('.onlyNum_2').on('keyup',function(){
		$(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
	});

	$('.onlyNum_3').on('keyup',function(){
		$(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
	});

	$('.onlyNum_4').on('keyup',function(){
		$(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
	});
	
	//이메일 입력 유효성 검사
	
	$('#email1').on('keyup',function(){
		$(this).val( $(this).val().replace( /[^a-zA-Z0-9-_]/g, '' ) );
	});
	
	$('#email2').on('keyup',function(){
		$(this).val( $(this).val().replace( /[^a-zA-Z0-9-_.]/g, '' ) );
	});

	//아이디저장 - 쿠키 설정
	var userInputId = getCookie("userInputId");	//쿠키 가져옴

	$("input[name='userId']").val(userInputId);  //쿠키에 저장되어 있는 아이디를 input에 입력

	if($("input[name='userId']").val() != ""){	//input이 빈칸이 아니면 체크박스 체크하도록
		$("#idSave").attr("checked", true);
	}

});//ready끝

//약관동의 다음 버튼 클릭시
function next(){
	
	for(var i=0; i<agreeForm.agree.length; i++){ 
		
		if(!agreeForm.agree[i].checked){ 
	         alert("필수 약관에 동의해주십시오."); 
	         agreeForm.agree[i].focus(); 
	         return false; 
	    }
	}
	
	agreeForm.action = "/webproject/login/mem_join.action";
	agreeForm.submit();
}

//약관 팝업
function showWindow(addr,width) {
	
	var url = "/webproject/rules/" + addr + ".action";

	var setting = 'toolbar=no,menubar=no,status=no,resizable=no,location=no,top=90,left=250,height=650,' + 'width=' + width;
	
	window.open(url,"반디앤루니스 인터넷서점",setting);

} 

//로그인 버튼 클릭시 
function login() {

	var f = document.loginForm;

	var id = f.userId.value;
	id = id.trim();
	if(!id) {
		alert("\n아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	f.userId.value = id;

	var pwd = f.userPwd.value;
	pwd = pwd.trim();
	if(!pwd) {
		alert("\n비밀번호를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = pwd;

	f.action = "/webproject/login_ok.action";

	if(f.idSave.checked){
		setCookie('userInputId',id,30);
	}
	else{
		deleteCookie('userInputId');
	}

	f.submit();
}

//한글만 입력하도록
function onlyKorean(){
	
	if((event.keyCode<48)||(event.keyCode>57)){
		event.returnValue = false;
	}
	if((event.keyCode>=48)||(event.keyCode<=57)){
		event.returnValue = false;
	}
	
}


//이메일 select 값 input text에 전달하기
function emailInput() {

	var f = document.joinForm;

	var cLength = f.email3.options.length;
	var cValue = f.email3.selectedIndex;

	f.email2.value = "";

	if(cValue==(cLength-6)){
		f.email2.readOnly = false;
		f.email2.focus();
	}
	else{
		f.email2.value = f.email3.options[cValue].value;
		f.email2.readOnly = true;
	}
}

//아이디저장 쿠키 저장
//userInputId=user_id;expires=date;
function setCookie(cookieName, value, exdays){

	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);	//현재날짜 +30일

	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());

	document.cookie = cookieName + "=" + cookieValue;
}

//아이디저장 쿠키 삭제
function deleteCookie(cookieName){

	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);

	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

//쿠키 가져오기
//userInputId=user_id;expires=date;
function getCookie(cookieName) {

	cookieName = cookieName + '=';

	var cookieData = document.cookie;	//쿠키 불러오기
	var start = cookieData.indexOf(cookieName);	//쿠키에서 찾아올 값의 index를 가져옴
	var cookieValue = '';	//불러올 값을 저장할 변수 초기화

	if(start != -1){	//쿠키에서 해당하는 cookieName을 찾아냈다면 (즉, 저장된 쿠키가 있다면)
		start += cookieName.length;	//value만을 꺼내기 위해 start의 위치를 앞에서 찾아낸 index에 cookieName의 길이를 더함
		var end = cookieData.indexOf(';', start);	//start부터 ';'가 나오는 곳(value의 끝)을 찾아냄

		if(end == -1){
			end = cookieData.length;
		}

		cookieValue = cookieData.substring(start, end);	//substring으로 value를 찾아냄
	}

	return unescape(cookieValue);
}

//회원가입 : 가입신청
function joinConfirmation(){

	var f = document.joinForm;

	var id = f.userId.value;
	id = id.trim();
	if(!id) {
		alert("\n아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	else{
		f.userId.value = id;

		var idSpan = $('#text_id').text();
		var error = '6~12자의 영문,숫자,-,_만 사용 가능';
		if(idSpan==error){
			alert("\n아이디를 확인하세요.");
			f.userId.focus();
			return;
		}
	}

	var pwd = f.userPwd1.value;
	pwd = pwd.trim();
	if(!pwd) {
		alert("\n비밀번호를 입력하세요.");
		f.userPwd1.focus();
		return;
	}
	else{
		f.userPwd1.value = pwd;

		var pwdSpan = $('#text_pwd1').text();
		error = '10~15자의 영문/숫자 사용';
		if(pwdSpan==error){
			alert("\n비밀번호를 확인하세요.");
			return;
		}
	}

	pwd = f.userPwd2.value;
	pwd = pwd.trim();
	if(!pwd) {
		alert("\n비밀번호를 한번 더 입력하세요.");
		f.userPwd2.focus();
		return;
	}
	else{
		f.userPwd2.value = pwd;

		var pwd2Span = $('#text_pwd2').text();
		error = '비밀번호가 일치하지 않습니다.';
		if(pwd2Span==error){
			alert("\n비밀번호를 정확히 입력하세요.");
			f.userPwd2.focus();
			return;
		}
	}
	
	var userName = f.userName.value;
	userName = userName.trim();
	if(!userName) {
		alert("\n이름을 입력하세요.");
		f.userName.focus();
		return;
	}
	f.userName.value = userName;

	var birth = f.year.value;
	birth = birth.trim();
	if(!birth) {
		alert("\n생년월일을 입력하세요.");
		f.year.focus();
		return;
	}
	f.year.value = birth;

	birth = f.month.value;
	birth = birth.trim();
	if(!birth) {
		alert("\n생년월일을 입력하세요.");
		f.month.focus();
		return;
	}
	f.month.value = birth;

	birth = f.day.value;
	birth = birth.trim();
	if(!birth) {
		alert("\n생년월일을 입력하세요.");
		f.day.focus();
		return;
	}
	f.day.value = birth;

	var validDate = isValidDate(f.year.value, f.month.value, f.day.value);
	if(validDate==false){
		alert("\n생년월일을 정확히 입력하세요.");
		f.month.focus();
		return;
	}

	var tel = f.tel1.value;
	tel = tel.trim();
	if(!tel) {
		alert("\n휴대폰 번호를 입력하세요.");
		f.tel1.focus();
		return;
	}
	f.tel1.value = tel;

	tel = f.tel2.value;
	tel = tel.trim();
	if(!tel) {
		alert("\n휴대폰 번호를 입력하세요.");
		f.tel2.focus();
		return;
	}
	f.tel2.value = tel;

	tel = f.tel3.value;
	tel = tel.trim();
	if(!tel) {
		alert("\n휴대폰 번호를 입력하세요.");
		f.tel3.focus();
		return;
	}
	f.tel3.value = tel;

	var email = f.email1.value;
	email = email.trim();
	if(!email) {
		alert("\n이메일을 입력하세요.");
		f.email1.focus();
		return;
	}
	f.email1.value = email;

	email = f.email2.value;
	email = email.trim();
	if(!email) {
		alert("\n이메일을 입력하세요.");
		f.email2.focus();
		return;
	}
	f.email2.value = email;

	var zipCode = f.zipCode.value;
	var address = f.address2.value;
	if(zipCode){
		if(!address){
			alert("\n주소(배송지)를 정확히 입력해 주세요.");
			f.address2.focus();
			return;
		}
	}

	tel = f.addTel1.value;
	if(tel){
		if(!f.addTel2.value){
			alert("\n추가연락처를 정확히 입력해 주세요.");
			f.addTel2.focus();
			return;
		}
		else if(!f.addTel3.value){
			alert("\n추가연락처를 정확히 입력해 주세요.");
			f.addTEl3.focus();
			return;
		}
	}

	birth = f.year.value + '-' + f.month.value + '-' + f.day.value;
	f.birth.value = birth;

	tel = f.tel1.value + '-' + f.tel2.value + '-' + f.tel3.value;
	f.phone.value = tel;
	
	tel = f.addTel1.value + '-' + f.addTel2.value + '-' + f.addTel3.value;
	f.addTel.value = tel;

	email = f.email1.value + '@' + f.email2.value;
	f.email.value = email;

	if(f.emailCheck.checked){
		f.emailReception.value = 'Y';
	}
	else{
		f.emailReception.value = 'N';
	}
	
	if(f.smsCheck.checked){
		f.smsReception.value = 'Y';
	}
	else{
		f.smsReception.value = 'N';
	}

	f.action = "/webproject/login/mem_join_success.action";

	f.submit();
}

// 날짜 검사
function isValidDate(year, month, day) {
	var days = new Array (31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

     if(year%4==0 && year%100 !=0 || year%400==0){
		days[1]=29;
	 }
     else{
		days[1]=28;
	 }

     if(month < 1 || month > 12){
		return false;
	 }

     if(day > days[month-1] || day < 1){
		return false;
	 }
       
     return true;
}
