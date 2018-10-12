<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<title>반디앤루니스 인터넷서점</title>

<style type="text/css">
	.up_div {width: 750px; border-bottom: 2px solid #000; height: 95px;}
	.left_div {float: left; height: 50px; padding-top: 40px;}
	.right_div {float: right;}

	.okBtn {color: white; background-color: #886e45; border: none; height: 40px; width: 120px; font-size: 20px; font-weight: bold; cursor: pointer;}
	.okBtn:hover {color: #886e45; background-color: white; border: 2px solid #886e45; height: 40px; width: 120px; font-size: 20px; font-weight: bold; cursor: pointer;}
	.cancelBtn {color: #886e45; background-color: white; border: 1px solid #886e45; height: 40px; width: 120px; font-size: 20px; font-weight: bold; cursor: pointer;}
	.cancelBtn:hover {border: 2px solid #886e45;}
	.moreBtn {color: white; background-color: #886e45; border: none; cursor: pointer; height: 22px;}
	
	.agree_main_box {border-bottom: 1px solid #886e45; border-top: 2px solid #886e45; width: 500px; padding: 10px; margin-top: 10px;}
	.agree_sub_box {width: 500px; padding: 10px; margin-bottom: 15px;}
	.agree_additional_box {width: 500px; padding: 10px; margin-bottom: 15px;}
	
</style>

<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$( document ).ready( function() {
  	  $( '.checkAll' ).click( function() {
  	      $( '.chk' ).prop( 'checked', this.checked );
  	  });
	});
	
	function next(){
		
		for(var i=0; i<agreeForm.agree.length; i++){ 
			
			if(!agreeForm.agree[i].checked){ 
		         alert("필수 약관에 동의해주십시오."); 
		         agreeForm.agree[i].focus(); 
		         return false; 
		    }
		}
		
		agreeForm.action = "<%=cp%>/login/mem_join.action";
		agreeForm.submit();
		
	}
	
	function showWindow(addr,width) {
		
		var url = "<%=cp%>/rules/" + addr + ".action";

		var setting = 'toolbar=no,menubar=no,status=no,resizable=no,location=no,top=90,left=250,height=650,' + 'width=' + width;
		
		window.open(url,"반디앤루니스 인터넷서점",setting);

	} 

</script>


</head>
<body>

<div class="up_div">
	<div class="left_div"><img alt="회원가입" src="<%=cp%>/resources/img/login/tit_h1_member.gif"></div>
	<div class="right_div">
		<img alt="" src="<%=cp%>/resources/img/login/img_member_join_info.gif">
	</div>
</div>





<form action="" name="agreeForm" method="post">

<div>
	<div>
		<font size="6" color="#886e45"><b>약관 동의</b></font>
	</div>
	<div class="checkbox">
		<div class="agree_main_box">
			<label><input type="checkbox" name="allCheck" class="checkAll"><b>전체동의</b></label>
		</div>
		<div>
			<div class="agree_sub_box">
				<div style="float: left;"><label><input type="checkbox" class="chk" name="agree">"이용 약관"에 동의 (필수)</label></div>
				<div style="float: right;"><input type="button" value="내용보기" onclick="showWindow('rulesInfo',1100);" class="moreBtn"></div>
			</div>
			<div class="agree_sub_box">
				<div style="float: left;"><label><input type="checkbox" class="chk" name="agree">개인정보 "필수" 항목에 대한 수집과 이용 동의 (필수)</label></div>
				<div style="float: right;"><input type="button" value="내용보기" onclick="showWindow('rules_privacy',700);" class="moreBtn"></div>
			</div>
			<div class="agree_additional_box">
				<div style="float: left;"><label><input type="checkbox" class="chk">개인정보 "선택" 항목에 대한 수집과 이용 동의 (선택)</label></div>
				<div style="float: right;"><input type="button" value="내용보기" onclick="showWindow('rules_privacy2',700);" class="moreBtn"></div>
			</div>
			<div style="width: 500px; padding: 10px; margin-top: 30px; text-align: center; border-top: 2px solid #886e45;">
				선택 항목의 경우 동의하지 않아도 회원 가입이 가능하나, <br/>
				구매 등 서비스 이용시 추가적인 정보 입력이 필요합니다. <br/><br/>
				<input type="button" value="다음" class="okBtn" onclick="next();">&nbsp;&nbsp;
				<input type="button" value="취소" class="cancelBtn" onclick="javascipt:location.href='<%=cp%>/login.action';">
			</div>
		</div>
	</div>
</div>

</form>


</body>
</html>