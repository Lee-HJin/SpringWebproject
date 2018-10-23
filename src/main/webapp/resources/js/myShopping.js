$(document).ready(function(){
	
	//엔터 치면 다음단계로
	$('#pre_myinfo_pwd').keypress(function(evt){
		if(evt.keyCode==13){
			checkPwd();
		}
	});
	
	//셀렉트 박스 날짜 지정(기본값)
	setDefaultDate();
	
	//날짜 셀렉트 박스 onchange 이벤트 발생시 
	$('#fromYear').on('change', function(){	//검색 시작 날짜 연도 변경시
		var fromYear = $('#fromYear').val();
		var fromMonth = $('#fromMonth').val();
		var fromDay = $('#fromDay').val();
		var fromLastDay = getDays(fromYear, fromMonth);

		$('#fromDay').empty();
		for(var i=1;i<fromLastDay+1;i++){
			$('#fromDay').append('<option value="' + i + '">' + i + '</option>');
		}
		$('#fromDay').val(fromDay).attr("selected","selected");
	});
	
	$('#toYear').on('change', function(){	//검색 종료 날짜 연도 변경시
		var toYear = $('#toYear').val();
		var toMonth = $('#toMonth').val();
		var toDay = $('#toDay').val();
		var toLastDay = getDays(toYear, toMonth);

		$('#toDay').empty();
		for(var i=1;i<toLastDay+1;i++){
			$('#toDay').append('<option value="' + i + '">' + i + '</option>');	
		}
		$('#toDay').val(toDay).attr("selected","selected");
		
	});
	
	$('#fromMonth').on('change', function(){	//검색 시작 날짜 월 변경시
		var fromYear = $('#fromYear').val();
		var fromMonth = $('#fromMonth').val();
		var fromDay = $('#fromDay').val();
		var fromLastDay = getDays(fromYear, fromMonth);

		$('#fromDay').empty();
		for(var i=1;i<fromLastDay+1;i++){
			$('#fromDay').append('<option value="' + i + '">' + i + '</option>');
		}
		$('#fromDay').val(fromDay).attr("selected","selected");
	});
	
	$('#toMonth').on('change', function(){	//검색 종료 날짜 월 변경시
		var toYear = $('#toYear').val();
		var toMonth = $('#toMonth').val();
		var toDay = $('#toDay').val();
		var toLastDay = getDays(toYear, toMonth);

		$('#toDay').empty();
		for(var i=1;i<toLastDay+1;i++){
			$('#toDay').append('<option value="' + i + '">' + i + '</option>');	
		}
		$('#toDay').val(toDay).attr("selected","selected");
		
	});
	
	
	
	//$("#paper_type option:selected").text();
	//$("#print_type option:selected").val();
	


	
	
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
	
	//email 수신동의 라디오버튼 옵션 value
	var emailRadio = $('input:radio[name="emailCheck"]:checked').val();
	$('#emailReception').val(emailRadio);
	
	$('input:radio[name="emailCheck"]').change(function(){
		$('#emailReception').val($('input:radio[name="emailCheck"]:checked').val());
	});
	
	//sms 수신동의 라디오버튼 옵션 value
	var smsRadio = $('input:radio[name="smsCheck"]:checked').val();
	$('#smsReception').val(smsRadio);
	
	$('input:radio[name="smsCheck"]').change(function(){
		$('#smsReception').val($('input:radio[name="smsCheck"]:checked').val());
	});
	
	//새 비밀번호1 유효성 검사
	$('#newPwd1').on('keyup',function(){

		$(this).val( $(this).val().replace( /[^a-zA-Z0-9]/g, '' ) );

		var temp_pwd = document.getElementById('newPwd1').value;

		if(temp_pwd.length!=0){
			if(temp_pwd.length<10){
				$('#text_pwd1').html("<span id='text_pwd1'>공백없는 10~15자의 영문/숫자 조합</span>");
			}
			else if(temp_pwd.length>15){
				$('#text_pwd1').html("<span id='text_pwd1'>공백없는 10~15자의 영문/숫자 조합</span>");
			}
			else {
				$('#text_pwd1').html("<span id='text_pwd1' style='color: #886e45;'>이용 가능한 비밀번호입니다</span>");
			}
		}
		else {
			$('#text_pwd1').html("<span id='text_pwd1'>공백없는 10~15자의 영문/숫자 조합</span>");
		}

	});
	
	//새 비밀번호2 유효성 검사
	$('#newPwd2').on('keyup',function(){

		$(this).val( $(this).val().replace( /[^a-zA-Z0-9]/g, '' ) );

		var temp_pwd = document.getElementById('newPwd2').value;
		var pwd = document.getElementById('newPwd1').value;
		
		if(temp_pwd.length<1){
			$('#text_pwd2').html("<span id='text_pwd2' style='color: black;'>비밀번호가 일치하지 않습니다.</span>");
		}
		else{
			if(pwd==temp_pwd){
				$('#text_pwd2').text('');
				document.getElementById('userPwd').value = pwd;
			}
			else{
				$('#text_pwd2').html("<span id='text_pwd2' style='color: #ea5759;'>비밀번호가 일치하지 않습니다.</span>");
			}	
		}
		
	});
	
});

//회원정보수정 저장
function updateUserInfo(){
	
	var f = document.myInfoUpdateForm;
	
	var zipCode = f.zipCode.value;
	if(zipCode){
		if(!f.address1.value){
			alert("\n주소(배송지)를 정확히 입력해 주세요.");
			f.address2.focus();
			return;
		}
		else if(!f.address2.value){
			alert("\n주소(배송지)를 정확히 입력해 주세요.");
			f.address2.focus();
			return;
		}
	}
	else if(!zipCode) {
		if(f.address1.value){
			alert("\n주소(배송지)를 정확히 입력해 주세요.");
			f.address1.focus();
			return;
		}
		else if(f.address2.value){
			alert("\n주소(배송지)를 정확히 입력해 주세요.");
			f.zipCode.focus();
			return;
		}
	}

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
		
		tel = f.addTel1.value + '-' + f.addTel2.value + '-' + f.addTel3.value;
		f.addTel.value = tel;
		
	}
	else if(f.addTel2.value){
		
		if(!f.addTel1.value){
			alert("\n추가연락처를 정확히 입력해 주세요.");
			f.addTel1.focus();
			return;
		}
		else if(!f.addTel3.value){
			alert("\n추가연락처를 정확히 입력해 주세요.");
			f.addTEl3.focus();
			return;
		}
		
		tel = f.addTel1.value + '-' + f.addTel2.value + '-' + f.addTel3.value;
		f.addTel.value = tel;
	}
	else if(f.addTel3.value){
		if(!f.addTel1.value){
			alert("\n추가연락처를 정확히 입력해 주세요.");
			f.addTel1.focus();
			return;
		}
		else if(!f.addTel2.value){
			alert("\n추가연락처를 정확히 입력해 주세요.");
			f.addTEl2.focus();
			return;
		}
		
		tel = f.addTel1.value + '-' + f.addTel2.value + '-' + f.addTel3.value;
		f.addTel.value = tel;
	}
	
	tel = f.addTel1.value + '-' + f.addTel2.value + '-' + f.addTel3.value;
	f.addTel.value = tel;
	
	tel = f.tel1.value + '-' + f.tel2.value + '-' + f.tel3.value;
	f.phone.value = tel;

	email = f.email1.value + '@' + f.email2.value;
	f.email.value = email;
	
	f.action = "updateMyInfo_ok.action";
	
	f.submit();
	
}

//비밀번호 변경 팝업
function showWindow(addr,width) {
	
	var url = "/webproject/" + addr + ".action";

	var setting = 'toolbar=no,menubar=no,status=no,resizable=no,location=no,top=90,left=250,height=350,' + 'width=' + width;
	
	window.open(url,"반디앤루니스 인터넷서점",setting);

} 

//비밀번호 변경 확인버튼 클릭시
function updatePwd(){
	
	var f = document.updatePwdForm;
		
	var pwd = f.userPwd.value;
	pwd = pwd.trim();
	if(!pwd) {
		alert("\n비밀번호를 입력하세요.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = pwd;
	
	var pwd1 = f.newPwd1.value;
	pwd1 = pwd1.trim();
	if(!pwd1) {
		alert("\n비밀번호를 입력하세요.");
		f.newPwd1.focus();
		return;
	}
	f.newPwd1.value = pwd1;
	
	var pwd2 = f.newPwd2.value;
	pwd2 = pwd2.trim();
	if(!pwd2) {
		alert("\n비밀번호를 입력하세요.");
		f.newPwd2.focus();
		return;
	}
	f.newPwd2.value = pwd2;
	
	if(!pwd1==pwd2){
		alert("\n새 비밀번호가 일치하지 않습니다.");
		f.newPwd1.focus();
		return;
	}
	
	f.action = "updatePwd_ok.action";
		
	f.submit();
}

//말일 구하기
function getDays(year, month){
	
	var day = 30;
	
	if(year%400==0 || year%4 ==0){	//윤년
		if(month==2){
			day = 29;
		}
		if( (month>7 && month%2==0) || (month<=7 && month%2==1) ){
			day = 31;
		}
	}
	else{	//평년
		if(month==2){
			day = 28;
		}
		if( (month>7 && month%2==0) || (month<=7 && month%2==1) ){
			day = 31;
		}
	}
	
	return day;
	
}

//날짜 select option 기본값 입력 (조회기간: 오늘로부터 한달)
function setDefaultDate(){
	
	//조회 시작 날짜
	var fromDate = new Date();	
	
	var fromYear = fromDate.getFullYear();
	var fromMonth = (fromDate.getMonth()+1)-1;
	var fromDay = fromDate.getDate();
	var fromLastDay = getDays(fromYear, fromMonth);
	
	//조회 끝 날짜
	today = new Date();	
	
	var toYear = today.getFullYear();
	var toMonth = today.getMonth()+1;
	var toDay = today.getDate();
	var toLastDay =  getDays(toYear, toMonth);
	
	//셀렉트 박스 element가져와서 옵션 넣기
	var select = document.getElementById('fromYear');
	for(var i=fromYear-10;i<fromYear+1;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==fromYear){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('fromMonth');
	for(var i=1;i<13;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==fromMonth){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('fromDay');
	for(var i=1;i<=fromLastDay;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==fromDay){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}	
	
	var select = document.getElementById('toYear');
	for(var i=toYear-10;i<toYear+1;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==toYear){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('toMonth');
	for(var i=1;i<13;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==toMonth){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('toDay');
	for(var i=1;i<=toLastDay;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==toDay){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	
}

//최근15일  1개월  3개월  6개월 조회
function setDate(month, day){
	
	var today, fromYear, fromMonth, fromDay, fromLastDay = '';
	var toYear, toMonth, toDay, toLastDay = '';
	
	
	//최근15일 조회
	if(month<1){
		
		//조회 시작 날짜
		today = new Date();
		
		fromYear = today.getFullYear();
		fromMonth = today.getMonth()+1;
		fromDay = today.getDate()-day;
		fromLastDay = getDays(fromYear, fromMonth);
		
		//조회 끝 날짜
		today = new Date();	
		
		toYear = today.getFullYear();
		toMonth = today.getMonth()+1;
		toDay = today.getDate();
		toLastDay =  getDays(toYear, toMonth);
	}
	else{	//최근 1개월,3개월, 6개월 조회
		
		//조회 시작 날짜
		today = new Date();
		
		fromYear = today.getFullYear();
		fromMonth = (today.getMonth()+1)-month;
		fromDay = today.getDate()-day;
		fromLastDay = getDays(fromYear, fromMonth);
		
		//조회 끝 날짜
		today = new Date();	
		
		toYear = today.getFullYear();
		toMonth = today.getMonth()+1;
		toDay = today.getDate();
		toLastDay =  getDays(toYear, toMonth);
	}
	
	//셀렉트 박스 element가져와서 옵션 넣기
	var select = document.getElementById('fromYear');
	select.options.length = 0;	
	for(var i=fromYear-10;i<fromYear+1;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==fromYear){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('fromMonth');
	select.options.length = 0;
	for(var i=1;i<13;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==fromMonth){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('fromDay');
	select.options.length = 0;
	for(var i=1;i<=fromLastDay;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==fromDay){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}	
	
	var select = document.getElementById('toYear');
	select.options.length = 0;
	for(var i=toYear-10;i<toYear+1;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==toYear){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('toMonth');
	select.options.length = 0;
	for(var i=1;i<13;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==toMonth){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}
	
	select = document.getElementById('toDay');
	select.options.length = 0;
	for(var i=1;i<=toLastDay;i++){
		var opt = document.createElement('option');
		opt.value = i;
		opt.innerHTML = i;
		if(i==toDay){
			opt.selected = 'selected';
		}
		select.appendChild(opt);
	}	
	
}


