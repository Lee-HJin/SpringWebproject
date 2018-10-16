
$(document).ready(function(){
	/* onLoad */
	onLoad();
	
	//주문상품 전체보기
	$("#btn_switchView").click(function(){
		$(".prodViewRepr").toggle();
		$(".prodViewAll").toggle();
		if($("#btn_switchView").attr("src") === "/ra/resources/images/order/btn_order_prodview.gif") {
			$("#btn_switchView").attr("src","/ra/resources/images/order/btn_order_prodview_s.gif");
		}else {
			$("#btn_switchView").attr("src","/ra/resources/images/order/btn_order_prodview.gif");
		}
	});

	//배송방법선택
	$(".btn_deliCode").click(function(){
		deliOpen(this.value);
	});

	//선물포장
	$(".btn_giftYn").click(function(){
		if(this.value === "Y") {
			$("#div_giftMsg").show();
			document.frmMain.gift_price.value = 1000;
		}else {
			$("#div_giftMsg").hide();
			document.frmMain.gift_price.value = 0;
		}
		orderCalc();
	});

	//선물포장 안내
	$("#btn_giftInfo").click(function(){
		var wnd = window.open("/global/global_giftbox_info.html", "globalpop", "width=480, height=520, status=no, scrollbars=no, resizable=no, menubar=no");
		wnd.focus();
	});

	//배송지 정보 우측 닫기
	$(".deli_box_close").click(function(){
		$(".order_deli_box").hide();
		$(".order_deli_box").eq(0).show();
	});

	//배송지 더 보기
	$("#btn_deliAddrMore").click(function(){
		$(".deli_info").show();
	});

	//배송지 선택
	$("#tr_deliAddrSelect input[type=radio]").click(function(){

		var frm = document.frmMain;
		
		if(this.value === "01") {
			//기본배송지
			changeAddr("");
		}
		else if(this.value === "02") {
			//새로입력
	        frm.rcvr_name.value = "";
	        frm.rcvr_tel1_part1.value = "";
	        frm.rcvr_tel1_part2.value = "";
	        frm.rcvr_tel1_part3.value = "";
	        frm.rcvr_tel2_part1.value = "";
	        frm.rcvr_tel2_part2.value = "";
	        frm.rcvr_tel2_part3.value = "";
	        frm.rcvr_zip1.value = "";
	        frm.rcvr_zip2.value = "";
	        frm.rcvr_addr1.value = "";
	        frm.rcvr_addr2.value = "나머지 주소 입력";
	        extraPostCost();
		}
		else if(this.value === "03") {
			//최근배송지
			changeAddr("");
		}
		else if(this.value === "04") {
			//회원정보와 동일
	        frm.rcvr_name.value = "라영준";
	        frm.rcvr_tel1_part1.value = "";
	        frm.rcvr_tel1_part2.value = "";
	        frm.rcvr_tel1_part3.value = "";
	        frm.rcvr_tel2_part1.value = "010";
	        frm.rcvr_tel2_part2.value = "5461";
	        frm.rcvr_tel2_part3.value = "0811";
	        frm.rcvr_zip1.value = "";
	        frm.rcvr_zip2.value = "";
	        frm.rcvr_addr1.value = "";
	        frm.rcvr_addr2.value = "";
	        extraPostCost();
		}
        getOrdDeliExpect(frm.rcvr_zip1.value);
	});

	//배송지 설정
	$(".addrList").click(function(){
		var seq = this.value;
		if(seq === "" || seq === undefined) {
			alert("배송지를 선택해 주세요.");
			return false;
		} else {
			document.getElementsByName("deli_input_type")[3].checked = true;
			changeAddr(seq);
			$(".deli_list>li").removeClass("deli_select");
			$("#li_addrist_"+seq).addClass("deli_select");
		}
	});

	//당일배송 선택/해제
	$("input[name=todayDeliYn]").change(function(){
		if(this.value == "N") {
			if(confirm(("일반배송 주문건으로 변경하시면 당일배송으로 다시 수정 불가능 합니다. 계속 진행하시겠습니까?"))) {
				$("#today_deli_n").prop("checked", true);
			}else {
				$("#today_deli_y").prop("checked", true);
			}
		}
	});

	//우편번호 찾기
	$(".btn_popPost").click(function(){
		var wnd = window.open("/common/zipcodeNew.do", "searchPost", "menubar=no,width=400,height=220,scrollbars=no");
		wnd.focus();
	});

	//상세주소 입력시
	$("#rcvr_addr2").focus(function(){
		if(this.value === "나머지 주소 입력") {
			this.value = "";
		}
	});

	//배송메시지선택
	$("#ref_msg").hover(function() {
		$(".pre_deliMsg").show();
		},function() {
			$(".pre_deliMsg").hide();
	});
	$(".pre_deliMsg").hover(function() {
		$(".pre_deliMsg").show();
		},function() {
		$(".pre_deliMsg").hide();
	});
	$(".pre_deliMsg>li").click(function() {
		$("#ref_msg").val($(".pre_deliMsg>li").eq(this.value).text());
		$(".pre_deliMsg").hide();
	});

	//편의점 택배 안내
	$("#btn_cvsNetInfo").click(function(){
		var wnd = window.open("/global/global_cvsInfo.html", "globalpop", "width=617, height=600, status=no, scrollbars=yes, resizable=yes, menubar=no");
		wnd.focus();
	});

	//편의점 택배 배송시간 안내
	$("#btn_cvsNetInfo2").click(function(){
		var wnd = window.open("/front/help/helpIndex.do?bid=3180&bidUp=4004");
		wnd.focus();
	});

	//편의점 선택
	$("#btn_cvsNetMap_CU").click(function(){
		var wnd = window.open("/pages/front/cooperation/cvsNetPopUp.jsp?type=CU", "cvsnet", "width=1000, height=650, status=yes, scrollbars=yes,resizable=yes, menubar=no");
		wnd.focus();
	});
	
	$("#btn_cvsNetMap_GS").click(function(){
		var wnd = window.open("/pages/front/cooperation/cvsNetPopUp.jsp?type=GS", "cvsnet", "width=1000, height=650, status=yes, scrollbars=yes,resizable=yes, menubar=no");
		wnd.focus();
	});

	//해외배송비 안내
	$("#btn_globalDeliCost").click(function(){
		var wnd = window.open("/global/global_deli_cost.html","globalpop","width=637, height=650, status=no, scrollbars=yes, resizable=yes, menubar=no");
		wnd.focus();
	});

	//해외배송 국가 선택
	$(".tr_deliEng select").change(function(){
		var counSeq = this.value;
		var ordCnt = "2";
		setCountryDeliCost(counSeq,ordCnt);
	});

	//상품권 환전하기
	$("#btn_giftCardInfo").click(function(){
		$("#tr_giftCardInfo").toggle();
	});

	//포인트 사용
	$(".use_point").keypress(function(){
		goNumCheck();
	});

	//포인트 사용
	$(".use_point").keyup(function(){
		setUpPoint(this.id);
	});

	//모두 사용
	$(".use_all").click(function(){
		if(this.checked){
			$("#"+this.value).val($("#"+this.value+"_max").val());
		}else{
			$("#"+this.value).val(0);
		}
		setUpPoint(this.value);
	});

	//쿠폰선택
	$("#btn_popCoupon").click(function(){
		if('N' == 'Y'){
			alert("대여제, 특가 상품이 포함된 경우 쿠폰을 사용하실 수 없습니다.");
			return;
		}
		
		var cartType = "01";
		if(cartType === "04") {
			document.flow.action = "/front/order/popEbooKCoupon.do";
			document.flow.target = "Window"+document.frmMain.ordr_idxx.value;
			document.flow.method = "post";
			window.open("", "Window"+document.frmMain.ordr_idxx.value, "width=610px, height=620px, status=yes, scrollbars=no,resizable=yes, menubar=no");
			document.flow.idx.value = 20181016142510;
			document.flow.totalAllowCost.value = document.frmMain.tot_sale_cost.value;
			document.flow.flag.value = this.name;
			document.flow.submit();
		}else{
			document.flow.action = "/front/order/popCoupon.do";
			document.flow.target = "Window"+document.frmMain.ordr_idxx.value;
			document.flow.method = "post";
			window.open("", "Window"+document.frmMain.ordr_idxx.value, "width=610px, height=620px, status=yes, scrollbars=no,resizable=yes, menubar=no");
			document.flow.idx.value = 20181016142510;
			document.flow.totalAllowCost.value = document.frmMain.tot_sale_cost.value;
			document.flow.flag.value = this.name;
			document.flow.submit();
		}
	});

	//결제수단선택
	$(".pi_select input[type=radio]").click(function(){
		if (this.value == "68") {
			var _date = new Date();
	    	
	    	var _year = _date.getFullYear();
	    	var _month = _date.getMonth()+1;
	    	var _day = _date.getDate();
	    	var _hour = _date.getHours();
	    	var _min = _date.getMinutes();
		    	
	    	var std = "" + LPAD2(_year) + LPAD2(_month) + LPAD2(_day) + LPAD2(_hour) + LPAD2(_min);
	    	
	    	if(std >= "201808040200" && std <= "201808040700"){
	    		alert("네이버페이 시스템 점검으로 인해 2018년 8월 4일(토) 02:00 ~ 07:00 5시간 동안 사용이 불가능합니다. 양해 부탁 드립니다.");
				$("#sett_68").prop("checked", false);
	    		$("#sett_10").prop("checked", true);
	    		return;
	    	}
		}
		settleOpen(this.value);
		settleInfo(this.value);
	});

	//결제하기
	$("#btn_order").click(function(){
		
		if(!$("input[name=item03]").is(":checked") || !$("input[name=item04]").is(":checked")){
			alert('약관에 동의하셔야 결제가 가능합니다.');
			return;
		}
		
		//setMertId() -> orderAlert() -> formCheck() -> getOrderId() -> goOrder()
		hideOrdBtn();
		setMertId();
	});
	
	//Ocb 포인트적립
	$("#btn_OcbSaveCardInfo").click(function(){
		if("true"){//우선 회원만
			var _date = new Date();
	    	
	    	var _year = _date.getFullYear();
	    	var _month = _date.getMonth()+1;
	    	var _day = _date.getDate();
	    	var _hour = _date.getHours();
	    	var _min = _date.getMinutes();
		    	
	    	var std = "" + LPAD2(_year) + LPAD2(_month) + LPAD2(_day) + LPAD2(_hour) + LPAD2(_min);
	    	
	    	if(std >= "201809110000" && std <= "201809110600"){
	    		alert("OK캐쉬백 시스템 점검으로 인해 2018년 9월 11일(화) 00:00 ~ 06:00 동안 포인트 조회, 적립, 사용이 불가능합니다. 양해 부탁 드립니다.");
	    		$("#btn_OcbSaveCardInfo").prop("checked", false);
	    		return;
	    	}
	    	
			$("#btn_OcbCardInfo").prop("checked", false);
			$("#btn_OcbSaveCardInfo").prop("checked", false);
			
			$("#ocb_save_yn").val("N");
			$("#tr_OcbSaveCardInfo").toggle();
			$("#tr_OcbCardInfo").hide();
			
			$("#ocb_AvPoint").html(0);
			$("#ocb_point_max").val(0);
			$("#ocb_txNo").val("");//인증코드 초기화
			$("#ocbPw").val("");//패스워드 초기화
			//포인트 사용 초기화
			//$("#ocb_point_all").prop("checked", false);
			//$("#ocb_point_all").prop("disabled", true);
			setUpPoint("ocb_point");
		}
	});
	
	//Ocb 포인트적립 체크
	$("#ocb_save_check").click(function(){
		var frm = document.frmMain;
		if(frm.saveCard1.value.length == 0 || frm.saveCard2.value.length == 0 || frm.saveCard3.value.length == 0 || frm.saveCard4.value.length == 0) {
			if(frm.saveCard4.value.length == 0) frm.saveCard4.focus();
			if(frm.saveCard3.value.length == 0) frm.saveCard3.focus();
			if(frm.saveCard2.value.length == 0) frm.saveCard2.focus();
			if(frm.saveCard1.value.length == 0) frm.saveCard1.focus();
			alert("카드번호를 입력해 주세요.");
			return;
		}
		var authId=frm.saveCard1.value+frm.saveCard2.value+frm.saveCard3.value+frm.saveCard4.value;
		$("#authId").val(authId);
		$("#ocbPw").val("");
		
		$("#btn_OcbSaveCardInfo").prop("checked", true);
		$("#ocb_save_yn").val("Y");
		$("#tr_OcbSaveCardInfo").hide();
	});	
	
	//Ocb 포인트조회
	$("#btn_OcbCardInfo").click(function(){
		if("true"){//우선 회원만
			var _date = new Date();
	    	
	    	var _year = _date.getFullYear();
	    	var _month = _date.getMonth()+1;
	    	var _day = _date.getDate();
	    	var _hour = _date.getHours();
	    	var _min = _date.getMinutes();
		    	
	    	var std = "" + LPAD2(_year) + LPAD2(_month) + LPAD2(_day) + LPAD2(_hour) + LPAD2(_min);
	    	
    		if(std >= "201809110000" && std <= "201809110600"){	    		
	    		alert("OK캐쉬백 시스템 점검으로 인해 2018년 9월 11일(화) 00:00 ~ 06:00 동안 포인트 조회, 적립, 사용이 불가능합니다. 양해 부탁 드립니다.");
	    		$("#btn_OcbCardInfo").prop("checked", false);
	    		return;
	    	}
	    	
			//적립
			$("#btn_OcbCardInfo").prop("checked", false);
			$("#btn_OcbSaveCardInfo").prop("checked", false);
			$("#ocb_save_yn").val("N");
			$("#tr_OcbSaveCardInfo").hide();
			
			$("#ocb_AvPoint").html(0);
			$("#ocb_point_max").val(0);
			$("#ocb_txNo").val("");//인증코드 초기화
			$("#ocbPw").val("");//패스워드 초기화
			//포인트 사용 초기화
			//$("#ocb_point_all").prop("checked", false);
			//$("#ocb_point_all").prop("disabled", true);
			setUpPoint("ocb_point");
			$("#tr_OcbCardInfo").toggle();
		}
	});	
	
	//Ocb 포인트조회(캐쉬백)
	$("#btn_OcbPoint").click(function(){		
		var frm = document.frmMain;
		if(frm.ocbPw.value.length == 0) {
			alert("카드 비밀번호를 입력해 주세요.");
			return;
		}
		
		if(frm.card1.value.length == 0 || frm.card2.value.length == 0 || frm.card3.value.length == 0 || frm.card4.value.length == 0) {
			if(frm.card4.value.length == 0) frm.card4.focus();
			if(frm.card3.value.length == 0) frm.card3.focus();
			if(frm.card2.value.length == 0) frm.card2.focus();
			if(frm.card1.value.length == 0) frm.card1.focus();
			alert("카드번호를 입력해 주세요.");
			return;
		}
		var authId=frm.card1.value+frm.card2.value+frm.card3.value+frm.card4.value;
		
		if(frm.ocbPw.value.length == 0) {
			alert("카드 비밀번호를 입력해 주세요.");
			frm.ocbPw.focus();
			return;
		}
		
		$.ajax({
			url: "/ajax/getOcbPoint.do",
			type: "post",
			data: {
				"memSeq":'21058516'
				,"authId":authId
				,"ocbPw":frm.ocbPw.value
				,"prctName":"[도서] 돌이킬 수 없는 약속 외 1종 "
			},
			dataType: "json",
			success: function(data)	{
				if(data != "") {
					//orderCalc();
					if(data.ReplyCode == "000000"){
						if(data.ApprDivCd == "00"){
							alert("포인트 사용/적립이 불가능한 OK캐쉬백 카드입니다. OK캐쉬백 고객센터(1599-0512)로 문의해주시기 바랍니다.");
							$("#ocbPw").val("");//패스워드 초기화
							$("#tr_OcbCardInfo").hide();
							return;
						}
						if(data.ApprDivCd == "12"){
							alert("포인트 적립만 가능한 OK캐쉬백 카드입니다. OK캐쉬백 고객센터(1599-0512)로 문의해주시기 바랍니다.");
							$("#ocbPw").val("");//패스워드 초기화
							$("#tr_OcbCardInfo").hide();
							return;
						}
						$("#ocb_AvPoint").html(Add_MoneyComma(data.AvPoint));
						$("#ocb_point_max").val(data.AvPoint);
						$("#ocb_txNo").val(data.TxNo);
						$("#authId").val(authId);
						$("#tr_OcbCardInfo").hide();
						$("#ocb_save_yn").val("N");
						$("#btn_OcbCardInfo").prop("checked", true);
					}else{
						alert(data.ReplyMessage);//테스트까지만사용
						return;
					}
				}else { resetOrdBtn("포인트조회를 실패하였습니다. 카드 번호를 다시 확인해 주세요."); return; }
			},
			error: function(){ resetOrdBtn("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
		});		
	});	
	
	// 반디상품권
	$("#btn_view_bookcoupon").click(function(){
		var frm = document.frmMain;
		if(frm.bookcpn_price.value>0) {
			if(!confirm("이미 적용된 반디상품권 금액이 있습니다. 재적용 하시겠습니까? 재적용 하시면 적용된 반디상품권 내역은 초기화됩니다.")){
				return;
			}
			//기 적용된 쿠폰 리셋
			frm.bookcpn_price.value = 0;
			frm.bookCpnArray.value = "";
			frm.bookCpnPriceArray.value = "";
			orderCalc();
		}

		var allowCost = "25920";
		var obj_prodId = $(".prod_id");
		var obj_ordCnt = $(".ord_cnt");

		var ordCnts = "";
		for(i=0;i<obj_ordCnt.size();i++){
			ordCnts += obj_ordCnt[i].value + ",";
		}

		var prodIds = "";
		for(i=0;i<obj_prodId.size();i++){
			prodIds += obj_prodId[i].value + ",";
		}
		$.ajax({
			url: "/ajax/popBookCoupon.do",
			type: "post",
			data: {"allowCost":allowCost,"prodIds":prodIds,"ordCnts":ordCnts},
			dataType: "json",
			success: function(data){
				
				if(data.length == 0){
					alert('사용 가능한 반디상품권이 없습니다. \n※ 반디상품권에 표기된 금액대 이상 구매 시 사용 가능합니다.');
					return false;
				}
				
				var result = "";
				var newRow1 = "0";
				var newRow2 = "0";
				$.each(data, function(){
					
					var discountAmount = this.DISCOUNT_NUM;
					var cpnTypeName = "";
					var cpnSeq = this.CPN_SEQ;
					var evtSeq = this.EVT_SEQ;
					
					if(this.CPN_TYPE == "10" && newRow1 == "0"){
						cpnTypeName = "중복 사용 불가";
						result += "<h6>반디상품권</h6>"; 
						result += "<div class='coupon_list'><input type='hidden' class='select_prod_coupon_"+this.prod_id+"'/><input type='checkbox' name='bookcpn_prod' id='"+this.MEM_CPN_SEQ+"' class='select_bookcoupon' value='"+this.MEM_CPN_SEQ+","+this.CPN_TYPE+","+discountAmount+"' onclick='javascript:chkDupProdBookCpn("+this.CPN_TYPE+","+this.MEM_CPN_SEQ+");' /><label for='"+this.MEM_CPN_SEQ+"'><span class='coupon_pay'>"+this.DISCOUNT_NUM+"원 할인 <span class='coupon_name'>"+this.CPN_NAME+"</span> </span><span class='coupon_date'>("+this.CPN_ST+" ~ "+this.CPN_ED+")</span></label></div>";
						newRow1 = "1";
					}else if(this.CPN_TYPE == "10" && newRow1 != "0"){
						cpnTypeName = "중복 사용 불가"; 
						result += "<div class='coupon_list'><input type='hidden' class='select_prod_coupon_"+this.prod_id+"'/><input type='checkbox' name='bookcpn_prod' id='"+this.MEM_CPN_SEQ+"' class='select_bookcoupon' value='"+this.MEM_CPN_SEQ+","+this.CPN_TYPE+","+discountAmount+"' onclick='javascript:chkDupProdBookCpn("+this.CPN_TYPE+","+this.MEM_CPN_SEQ+");' /><label for='"+this.MEM_CPN_SEQ+"'><span class='coupon_pay'>"+this.DISCOUNT_NUM+"원 할인 <span class='coupon_name'>"+this.CPN_NAME+"</span> </span><span class='coupon_date'>("+this.CPN_ST+" ~ "+this.CPN_ED+")</span></label></div>";
					}else if(this.CPN_TYPE == "07" && newRow2 == "0"){
						cpnTypeName = "중복 사용 가능";
						result += "<h6>스페셜 반디상품권 <span>※ 스페셜 반디상품권간에는 중복사용이 가능</span></h6>"; 
						result += "<div class='coupon_list'><input type='hidden' class='select_prod_coupon_"+this.prod_id+"'/><input type='checkbox' name='bookcpn_prod' id='"+this.MEM_CPN_SEQ+"' class='select_bookcoupon' value='"+this.MEM_CPN_SEQ+","+this.CPN_TYPE+","+discountAmount+","+cpnSeq+","+evtSeq+"' onclick='javascript:chkDupProdBookCpn("+this.CPN_TYPE+","+this.MEM_CPN_SEQ+");' /><label for='"+this.MEM_CPN_SEQ+"'><span class='coupon_pay'>"+this.DISCOUNT_NUM+"원 할인 <span class='coupon_name'>"+this.CPN_NAME+"</span> </span><span class='coupon_date'>("+this.CPN_ST+" ~ "+this.CPN_ED+")</span></label></div>";
						newRow2 = "1";
					}else if(this.CPN_TYPE == "07" && newRow2 != "0"){
						cpnTypeName = "중복 사용 가능";
						result += "<div class='coupon_list'><input type='hidden' class='select_prod_coupon_"+this.prod_id+"'/><input type='checkbox' name='bookcpn_prod' id='"+this.MEM_CPN_SEQ+"' class='select_bookcoupon' value='"+this.MEM_CPN_SEQ+","+this.CPN_TYPE+","+discountAmount+","+cpnSeq+","+evtSeq+"' onclick='javascript:chkDupProdBookCpn("+this.CPN_TYPE+","+this.MEM_CPN_SEQ+");' /><label for='"+this.MEM_CPN_SEQ+"'><span class='coupon_pay'>"+this.DISCOUNT_NUM+"원 할인 <span class='coupon_name'>"+this.CPN_NAME+"</span> </span><span class='coupon_date'>("+this.CPN_ST+" ~ "+this.CPN_ED+")</span></label></div>";
					}
							
					//result += "<tr><td><input type='hidden' class='select_prod_coupon_"+this.prod_id+"'/><input type='radio' name='bookcpn_prod' class='select_bookcoupon' value='"+this.MEM_CPN_SEQ+",07,"+discountAmount+"' /></td><td class='t_l'>"+this.CPN_NAME+"</td><td>"+this.DISCOUNT_NUM+"원 할인</td><td></td></tr>";
						
				});
				
				if(result == ""){
					alert("사용가능 반디상품권이 없습니다.");
					return false;
				}else{
					$("#result_bookcoupon_area").html(result);
					$("#my_bookcoupon_area").toggle();
				}
			},
			error: function(){ alert("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
		});
		
	});

	//반디상품권 적용
	$("#btn_apply_bookcoupon").click(function(){
		
		var frm = document.frmMain;
		var applyCost = 0;
		var cpnArray = "";
		var cpnPriceArray = "";
		
		var couponInfo = "";
		var prodCpnCost = 0;
		var deliCpnCnt = 0;
		var giftCpnCnt = 0;
		
		var cpnSeqArray = [];
		//var evtSeqArray = [];
		
		for(i=0;i<$(".select_bookcoupon:checked").size();i++){
			var memCpnSeq = $(".select_bookcoupon:checked")[i].value.split(",")[0];
			var cpnType = $(".select_bookcoupon:checked")[i].value.split(",")[1];
			var discountPrice = $(".select_bookcoupon:checked")[i].value.split(",")[2];
			
			if(cpnType == '07') {
				var cpnSeq = $(".select_bookcoupon:checked")[i].value.split(",")[3];
				//var evtSeq = $(".select_bookcoupon:checked")[i].value.split(",")[4];

				if($.inArray(cpnSeq, cpnSeqArray) == -1) { cpnSeqArray.push(cpnSeq); }
				else { alert('반디상품권 적용에 문제가 있습니다.');	return;	}
				
				//if($.inArray(evtSeq, evtSeqArray) == -1) { evtSeqArray.push(evtSeq); }
				//else { alert('반디상품권 적용에 문제가 있습니다.');	return;	}
			}
			
			cpnArray += memCpnSeq + ",";
			prodCpnCost += parseInt(discountPrice);
			cpnPriceArray += parseInt(discountPrice) + ",";
		}
		
		if(prodCpnCost > getCashCost()) {
			alert("결제 금액 이상 설정할 수 없습니다.")
			$("#my_bookcoupon_area").hide();
			return;
		}
		
		applyCost += prodCpnCost;
				
		frm.bookcpn_price.value = applyCost;
		frm.bookCpnArray.value = cpnArray;
		frm.bookCpnPriceArray.value = cpnPriceArray;
		orderCalc();
		$("#my_bookcoupon_area").hide();
	});

	// 5. 현금영수증, 예치금 금액 금액 입력시 현금영수증 발급 보이기
	$('#disposit_point_all').change(function () {
		var point = parseInt($('#disposit_point_all').val());
		if ($('#disposit_point_all').is(":checked")) {
			$('#cashReceiptDiv').css('display', 'block');
		} else {
			setCashReceiptInfo();
		}
	});
	
	$('#conv_point_all').change(function () {
		var point = parseInt($('#conv_point_all').val());
		if ($('#conv_point_all').is(":checked")) {
			$('#cashReceiptDiv').css('display', 'block');
		} else {
			setCashReceiptInfo();
		}
	});
	
	
	// 5. 현금영수증, 예치금 금액 금액 입력시 현금영수증 발급 보이기
	$('#disposit_point').keyup(function () {
		setCashReceiptInfo();
	});
	
	// 5. 현금영수증, 상품권 전환금 금액 입력시 현금영수증 발급 보이기
	$('#conv_point').keyup(function () {
		setCashReceiptInfo();
	});
	
	// 5. 현금영수증, 결제정보 선택시
    $("input:radio[name=settle_type]").click(function()
	{
    	setCashReceiptInfo();
    });
	
    // 5. 현금영수증	발급 신청하기
    $("input:radio[name=cashReceiptType]").click(function()
    {
    	// 소득공제용
        if ($('input[name="cashReceiptType"]:checked').val() === '02') {
            $("#cashReceiptInfoView1").show();
            $("#cashReceiptInfoView2").hide();
        // 지출증빙용
        } else if ($('input[name="cashReceiptType"]:checked').val() === '01') {
            $("#cashReceiptInfoView1").hide();
            $("#cashReceiptInfoView2").show();
        	alert("법인 결제, 지출증빙용은 문화비 소득공제 적용이 되지 않습니다.\n 사업자 지출증빙 용도로만 발행합니다.");
        // 신청 안함
        } else {
            $("#cashReceiptInfoView1").hide();
            $("#cashReceiptInfoView2").hide();
        }
    });

    // 5-1. 지출증빙용 > 휴대폰번호 사업자번호 선택
    $("#cashReceiptInfoTypeS").change(function() {
        if ($("#cashReceiptInfoTypeS").val() === '1') {
            $("#cashReceiptInfoType1").show();
            $("#cashReceiptInfoType2").hide();
        // 사업자번호
        } else if ($("#cashReceiptInfoTypeS").val() === '2') {
            $("#cashReceiptInfoType1").hide();
            $("#cashReceiptInfoType2").show();
        } else {
        }
    });	
});

	// 쇼핑카트 수정
	function goCart() {
		
			document.location.href = "http://www.bandinlunis.com/front/order/shopCartList.do?cartType=01";
		
	}

	//반디상품권 중복 불가타입 추가
	function chkDupProdBookCpn(cpnType,memCpnSeq){
		if(cpnType == "10"){
			for(i=0;i<$(".select_bookcoupon").size();i++){
				var memCpnSeqChk = $(".select_bookcoupon")[i].value.split(",")[0];
				if(memCpnSeq != memCpnSeqChk){
					document.getElementsByName("bookcpn_prod")[i].checked = false;
				}
			}
		}else{
			for(i=0;i<$(".select_bookcoupon").size();i++){
				var cpnTypeChk = $(".select_bookcoupon")[i].value.split(",")[1];
				if(cpnTypeChk == "10"){
					document.getElementsByName("bookcpn_prod")[i].checked = false;
				}
			}
		}
	}

	var partnerDcRate = 0;		//전역변수 : 즉시할인 제휴사 즉시할인율
	var partnerName = "제휴";	//전역변수 : 즉시할인 제휴사명

	//int 캐스팅
	function ParseInt10(val) {
		return parseInt(val,10);
	}

	var oldDeliCode = "01";

	//배송지 정보 화면 컨트롤
	function deliOpen(deliCode) {
		
		if (deliCode == undefined || deliCode == "") {
			deliCode = $(".btn_deliCode:checked").val();
		}
		
		$(".order_deli>table tr").hide();
		$(".order_deli>div").hide();
		$("#tr_deliCode").show();
		
		// 전에 선택한 주소가 편의점택배 이면서 지금 선택한 택배가 편의점 택배가 아닌 경우
		// (편의점 선택 값이 주소 데이터에 남아있는 경우가 있어 공백처리)
		if((oldDeliCode === "07" || oldDeliCode === "13") && (deliCode != "07" && deliCode != "13")){
			var frm = document.frmMain;
			frm.store_code.value = "";
			frm.ho_code.value = "";
			frm.dc_code.value = "";
			frm.codePany.value = "";
			frm.codeName.value = "";
			frm.codeTel.value = "";
			frm.dc_name.value = "";
			frm.dcr_dock.value = "";
			frm.code_f.value = "";
			frm.dd_zone.value = "";
			frm.dd_bag.value = "";
			frm.eupmyeon.value = "";
			frm.post_no.value = "";
			frm.store_address1.value = "";
			frm.store_address2.value = "";
			frm.rcvr_addr1.value = "";
			frm.rcvr_addr2.value = "";
			frm.cvs_rcvr_addr1.value = "";
			frm.cvs_rcvr_addr2.value = "";
		}
		
		if(deliCode === "01") {
			//일반택배
			if(isLogin()) {
				changeAddr("");
				$("#tr_deliAddrSelect").show();
			}
			$("#tr_deliName").show();
			$("#tr_deliMobile").show();
			$("#tr_deliPhone").show();
			$("#tr_deliAddr").show();
			$(".order_deli_box").eq(0).show();
			
			$("#tr_deliMsg").show();
			deliGiftCtr();
			
				
					$("#tr_deliAddrSelect input[type=radio]").eq(1).prop("checked", true);
				
				
			
			document.frmMain.deli_store_code.disabled = true;
			
			var zipCode = document.frmMain.rcvr_zip1.value;
			if(typeof zipCode != "undefined" && zipCode != null && zipCode != ""){
				$("#todayDeliTab").show();
			}
			
			$("#abroad_deli").hide();
		}
		else if(deliCode === "02") {
			//오프라인 매장수령(직원주문)
			$("#tr_deliAddrSelect input[type=radio]").eq(3).prop("checked", true);
			document.frmMain.deli_store_code.disabled = false;
			$("#todayDeliTab").hide();
			$("#abroad_deli").hide();
		}
		else if(deliCode === "03") {
			//해외배송
			$(".tr_deliEng").show();
			$(".foreignInfo").show();
			$("#abroad_deli").show();
			//alert("해외 배송시 주소는 필히 영문으로 입력 해 주세요");
			$("#tr_deliAddrSelect input[type=radio]").eq(2).prop("checked", true);
			document.frmMain.deli_store_code.disabled = true;
			$("#todayDeliTab").hide();
		}
		else if(deliCode === "04") {
			//당일배송 - 가상코드
		}
		else if(deliCode === "05") {
			//북셀프
			$("#tr_deliName").show();
			$("#tr_deliMobile").show();
			$("#tr_deliPhone").show();
			$(".order_deli_box").eq(0).show();
			$("#abroad_deli").hide();
		}
		else if(deliCode === "06") {
			//미배송(온라인컨텐츠)
		}
		else if(deliCode === "07" || deliCode === "13") {
			//편의점택배
			$("#tr_deliName").show();
			$("#tr_deliMobile").show();
			$("#tr_deliPhone").show();
			$("#tr_deliCvsName").show();
			$("#tr_deliCvsPhone").show();
			$(".cvsnetInfo").show();
			$("#tr_deliAddrSelect input[type=radio]").eq(1).prop("checked", true);
			document.frmMain.deli_store_code.disabled = true;
			$("#todayDeliTab").hide();
			$("#abroad_deli").hide();
		}
		
		oldDeliCode = deliCode;
		orderCalc();
	}

	//배송방법 화면 컨트롤
	function deliMethodCtr() {
		var cartType = "01";
		var bandiOnlyYn = "Y";
		var memGroup = "01";
		if(cartType === "01") {
			//반디상품만 구매시 해외배송,편의점택배 OPEN
			if(bandiOnlyYn === "Y") {
				
				/* 편의점 택배 control */
				
					$("#deliMethod_07").show();
				
				
				
				
				/* 해외배송 control */
				//$("#deliMethod_03").show();	//해외배송 차단
				
				/* 직원배송 control */
				
				if(memGroup.match("07")) {
					$("#deliMethod_02").show();
					$("#deliMethod_02_1").show();
				}
				
			}
		}
	}

	//선물포장 활성화
    function deliGiftCtr() {
        //반디상품 5개 이하 구매시 선물포장 가능
    	var totCnt = "2";
    	var bandiOnlyYn = "Y";
    	var chkGift = 0;
    	if(bandiOnlyYn === "Y" && totCnt <= 5 && chkGift == 0) {
	    	$("#tr_deliGift").show();
    	}
    }

	//배송지 정보 세팅
	function changeAddr(seq) {
		
		if(seq != "") {
			var obj = $(".addrList_"+seq);
			var frm = document.frmMain;
	        frm.rcvr_name.value			= obj.eq(0).val();
	        frm.rcvr_tel1_part1.value	= obj.eq(1).val();
	        frm.rcvr_tel1_part2.value	= obj.eq(2).val();
	        frm.rcvr_tel1_part3.value	= obj.eq(3).val();
	        frm.rcvr_tel2_part1.value	= obj.eq(4).val();
	        frm.rcvr_tel2_part2.value	= obj.eq(5).val();
	        frm.rcvr_tel2_part3.value	= obj.eq(6).val();
	        frm.rcvr_zip1.value			= obj.eq(7).val()+obj.eq(8).val();
	        frm.rcvr_zip2.value			= '';
	        frm.rcvr_addr1.value		= obj.eq(9).val();
	        frm.rcvr_addr2.value		= obj.eq(10).val();
	        getOrdDeliExpect(frm.rcvr_zip1.value);
	        extraPostCost();
		}
		
	}

	//우편번호 찾기 callback
	function setAddress(zip1, zip2, addr1, addr2) {
		var frm = document.frmMain;
		frm.rcvr_zip1.value = zip1;
// 		frm.rcvr_zip2.value = zip2;
		frm.rcvr_addr1.value = addr1;
		frm.rcvr_addr2.value = addr2;
		getOrdDeliExpect(frm.rcvr_zip1.value);
		extraPostCost();
		
	}

	//추가배송비 계산
	function extraPostCost() {
		var frm = document.frmMain;
		var zipcode = frm.rcvr_zip1.value;
		var extraDeliCost = 0;
		
			if("539910" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539911" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539912" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539913" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539914" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539915" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539916" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539917" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539918" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("539919" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("54000" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("530145" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("550270" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("53031" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53032" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53033" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("56347" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("56348" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("56349" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("57068" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("546908" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("535805" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535806" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535811" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535813" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535816" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535823" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("63000" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("63001" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59421" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("59789" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59790" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("58953" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58954" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58955" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58956" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58957" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59531" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59563" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59568" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("58958" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("63365" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("63514" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("63515" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("573810" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("573811" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("573812" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59650" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("650833" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650835" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650910" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650911" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650912" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650913" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650914" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650915" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650916" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650920" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650921" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650922" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650923" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650924" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650925" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650926" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650927" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650930" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650931" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650932" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650933" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650934" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650941" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650944" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650945" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("650946" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("695950" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("695951" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("695952" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("573813" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("573814" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("573815" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("695980" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("695983" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("573816" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("573817" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("573818" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("573819" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("58760" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("58761" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("58762" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("58800" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58801" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58802" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58803" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58804" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58805" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58806" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58809" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58810" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58816" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58817" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58818" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58826" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58828" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58829" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58830" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58831" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58832" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58833" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58834" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59102" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59103" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59106" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59127" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59137" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59138" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59139" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59140" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59141" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("579910" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("579911" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("579912" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("579913" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("579914" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("579915" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("656876" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("573955" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59142" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59143" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59144" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59145" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59149" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59150" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59151" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59152" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59153" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59154" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59155" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59156" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59157" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59158" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59159" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59160" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59161" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59162" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59163" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59164" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59165" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59166" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59167" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59168" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("59169" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59170" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("58835" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58836" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58837" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58838" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58839" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58840" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58841" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58842" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58843" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58844" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58845" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58846" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58847" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58848" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58849" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58850" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58851" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58852" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58853" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58854" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58855" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58856" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58857" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58858" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58859" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58860" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58861" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58862" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58863" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58864" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58865" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("58866" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("59766" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59781" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59782" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59783" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59784" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59785" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59786" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59787" === zipcode) {
				extraDeliCost = "8000";
			}
		
			if("59788" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("664250" === zipcode) {
				extraDeliCost = "3000";
			}
		
			if("664270" === zipcode) {
				extraDeliCost = "3000";
			}
		
			if("699936" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("699937" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("425350" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("417930" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("417931" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("417932" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("417933" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("409852" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409853" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409880" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409881" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409882" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409883" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409890" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409891" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409892" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409893" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409910" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409911" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409912" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409913" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409919" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("417910" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("417912" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("409830" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409831" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409832" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409833" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409840" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409841" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409842" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409850" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("409851" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("799800" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799801" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799802" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799803" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799804" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799805" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799810" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799811" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799812" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799813" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799820" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799821" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799822" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("799823" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("15654" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23100" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23101" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23102" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23103" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23104" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23105" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23106" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23107" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23108" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23109" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23110" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23111" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23112" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23113" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23114" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23115" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23116" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23124" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23125" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23126" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23127" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23128" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23129" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23130" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23131" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23132" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23133" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23134" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23135" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23136" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("23006" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("23007" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("23008" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("23009" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("23010" === zipcode) {
				extraDeliCost = "4500";
			}
		
			if("22386" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("22387" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("22388" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("31700" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("31708" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("40200" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40201" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40202" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40203" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40204" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40205" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40206" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("355842" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("355845" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("355846" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("355847" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("355848" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40207" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40208" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40209" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40210" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40211" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40212" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40213" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40214" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40215" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40216" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40217" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40218" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40219" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40220" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40221" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40222" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40223" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40224" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40225" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40226" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40227" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40228" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40229" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40230" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40231" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40232" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40233" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40234" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40235" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40236" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40237" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40238" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40239" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("40240" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("33411" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("32133" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("356878" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("357941" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("343852" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("400460" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("535824" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535830" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535831" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535832" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535833" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535834" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535835" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535836" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535837" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535838" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535840" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535841" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535842" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535843" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535844" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535845" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535847" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535850" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535851" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535852" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535860" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535861" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535862" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535863" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535870" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535871" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535872" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535873" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535880" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535881" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535882" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535883" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535884" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535885" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535890" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535891" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535892" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535893" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535894" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535895" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535896" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535897" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535898" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535910" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535911" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535912" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535913" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535914" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535915" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535916" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535917" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535918" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("530430" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("530440" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("535919" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535920" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535921" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535922" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535923" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535924" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535925" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535926" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535930" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535931" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535932" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535933" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535934" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535935" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535936" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535940" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535941" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535942" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("535943" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("556830" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556831" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556832" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556834" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556835" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556836" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556837" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556838" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556839" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556840" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556841" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556842" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556843" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556844" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556846" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556847" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556848" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556849" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556850" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("536928" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("536929" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("536935" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("548894" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("548902" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("548906" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("548909" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("556851" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556852" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556853" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556854" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("556855" === zipcode) {
				extraDeliCost = "6000";
			}
		
			if("548941" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("548990" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537809" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537813" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537814" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537815" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537816" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537817" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537818" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537820" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537821" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537822" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537823" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537824" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537825" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537826" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537830" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537831" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537832" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537833" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537834" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537835" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537836" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537840" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537841" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537842" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537843" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537844" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537845" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537846" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537847" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537848" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537849" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537850" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537851" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537852" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537853" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("548991" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("548992" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("548993" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("548994" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537900" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537901" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537902" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537903" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537904" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537905" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537907" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537909" === zipcode) {
				extraDeliCost = "7000";
			}
		
			if("537920" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537921" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("537922" === zipcode) {
				extraDeliCost = "5000";
			}
		
			if("513890" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("513891" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("513892" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("513893" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("52570" === zipcode) {
				extraDeliCost = "3000";
			}
		
			if("52571" === zipcode) {
				extraDeliCost = "3000";
			}
		
			if("53089" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53090" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53091" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53092" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53093" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53094" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53095" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53096" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53097" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53098" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53099" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53100" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53101" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53102" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53103" === zipcode) {
				extraDeliCost = "4000";
			}
		
			if("53104" === zipcode) {
				extraDeliCost = "4000";
			}
		
		if(extraDeliCost != undefined && extraDeliCost > 0) {
			frm.extra_deli_cost.value = extraDeliCost;
			alert("도서 산간 지역은 추가 배송비를 적용합니다.\n(추가배송비 : "+FormatNumber3(extraDeliCost)+"원)");
		}else {
			frm.extra_deli_cost.value = 0;
		}
		orderCalc();
	}
	
	// 예상수령일 변경
	function getOrdDeliExpect(zipCode){
		if(typeof zipCode == "undefined" || zipCode == null || zipCode == ""){
			$("#todayDeliTab").hide();
			return;
		}
		
		ajaxRequest("getOrdDeliExpect",
			{"zipCode":zipCode,"prod_id":"","prod_id_ally":"4034224,4181047,","ord_cnt":"","cnt_ally":"1,1,"},
				function(data){
					if(true){
						if(false){
							$("#bandi_deli_expect").text(' '+data+' 이후');
						}else {
							$("#bandi_deli_expect").text(' '+data+'');
						}
					}
					
					var deliCode = $(".btn_deliCode:checked").val();
					
					// 요일 정보 제거
					data = data.substring(0, data.indexOf("("));
					
					if(true && '20181016' == data.replace('년 ','').replace('월 ','').replace('일','').replace(' ','') && deliCode === "01"){
						$("#todayDeliTab").show();
						$("#today_deli_y").prop("disabled", false);
						$("#today_deli_y").prop("checked", true);
					}else{
						$("#todayDeliTab").hide();
					}
			}
		);
	}

	//편의점 선택 callback
	function setCvsNetInfo(store_code, ho_code, dc_code, codePany, codeName, codeTel, dc_name, dcr_dock, code_f, dd_zone, dd_bag, eupmyeon, post_no, store_address1, store_address2) {
		var frm = document.frmMain;
		frm.store_code.value = store_code;
		frm.ho_code.value = ho_code;
		frm.dc_code.value = dc_code;
		frm.codePany.value = codePany;
		frm.codeName.value = codeName;
		frm.codeTel.value = codeTel;
		frm.dc_name.value = dc_name;
		frm.dcr_dock.value = dcr_dock;
		frm.code_f.value = code_f;
		frm.dd_zone.value = dd_zone;
		frm.dd_bag.value = dd_bag;
		frm.eupmyeon.value = eupmyeon;
		frm.post_no.value = post_no;
		frm.store_address1.value = store_address1;
		frm.store_address2.value = store_address2;
		frm.rcvr_addr1.value = codePany+" ("+codeName+")";
		frm.rcvr_addr2.value = codeTel;
		frm.cvs_rcvr_addr1.value = codePany+" ("+codeName+")";
		frm.cvs_rcvr_addr2.value = codeTel;
		//ho_code = "01" -> GS
		if(ho_code == "01"){
			$("#deliMethod_07").show();
			$("#deliMethod_13").hide();
			$("#deli_07").prop("checked", true);
			$("#deli_13").prop("checked", false);
		//ho_code = "02" -> CU
		}else if(ho_code == "02"){
			$("#deliMethod_07").hide();
			$("#deliMethod_13").show();
			$("#deli_07").prop("checked", false);
			$("#deli_13").prop("checked", true);
		}
	}

	//입력 문자열 길이체크
	function onChangeText(obj,val) {
		if(obj.value.length>50) {
			alert('50자 이상 입력하실 수 없습니다.');
			obj.value = obj.value.substring(0,50);
			return;
		}
		// 길이체크 바이트 체크 안함
		var len = obj.value.length;
		document.getElementById(val).innerHTML = "("+len+"/50)";
    }

	//해외배송 배송비설정
	function setCountryDeliCost(counSeq,ordCnt) {
		if(ordCnt>30) {
			ordCnt = 30;
		}
		$.ajax({
			url: "/ajax/getForeDeliCost.do",
			type: "post",
			data: {"counSeq":counSeq,"ordCnt":ordCnt},
			dataType: "json",
			success: function(data)	{
				if(data != "") {
					document.frmMain.fore_deli_cost.value = data;
					orderCalc();
				}else {
					resetOrdBtn("배송비를 가져오는데 실패하였습니다. 국가를 다시 선택해 주세요.");
					return;
				}
			},
			error: function(){ resetOrdBtn("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
		});
	}

	//결제수단 화면 컨트롤
	function settleOpen(settleType) {

		if(settleType === "10" || settleType === "11") {

			//사용가능 카드 열기
			setUsableCard(settleType);
			
			//할부기간 세팅
			if(document.frmMain.cash_price.value < 50000) {
				$("#selectCardInstallRange").html("<select name='fix_inst'><option value='0'>일시불</option></select>");
			}else {
				$("#selectCardInstallRange").html("<select name='fix_inst'><option value='0'>일시불</option><option value='2'>2개월</option><option value='3'>3개월</option><option value='4'>4개월</option><option value='5'>5개월</option><option value='6'>6개월</option><option value='7'>7개월</option><option value='8'>8개월</option><option value='9'>9개월</option><option value='10'>10개월</option><option value='11'>11개월</option><option value='12'>12개월</option></select>");
			}

			$(".pi_box").show();	//카드선택창 열기
			$(".pi_box2").hide();	//직접입금 닫기
			$(".pi_box3").hide();	//에스크로 선택창 닫기
			$(".pi_box4").hide();	//휴대폰 선택창 닫기
			$(".pi_box5").hide();	//카카오 선택창 닫기
			$(".pi_box6").hide();	//네이버페이 선택창 닫기
			$("input[name=escrowYn]").eq(1).prop("checked", true); ////에스크로 미적용 디폴트
		}else if(settleType === "15"){
			//직접 입금
			$(".pi_box").hide();	//카드선택창 닫기
			$(".pi_box2").show();	//직접입금 열기
			$(".pi_box3").hide();	//에스크로 선택창 닫기
			$(".pi_box4").hide();	//휴대폰 선택창 닫기
			$(".pi_box5").hide();	//카카오 선택창 닫기
			$(".pi_box6").hide();	//네이버페이 선택창 닫기
			$("input[name=escrowYn]").eq(1).prop("checked", true); //에스크로 미적용 디폴트
			$("#selectAccountCode").html("<select name='acountType' onchange='javascript:changeFixBank(this);'><option value='1'>우리은행 1005-402-800704</option><option value='2'>국민은행 006037-04-003335</option><option value='3'>신한은행 140-011-050578</option><option value='4'>농협은행 301-0178-2671-11</option><option value='5'>기업은행 024-077262-01-014</option><option value='6'>하나(구 외환)은행 630-010093-670</option><option value='7'>스탠다드차타드은행 569-20-149452</option><option value='8'>하나은행 549-910021-18504</option></select>");
			document.frmMain.setAcName.value = "라영준";
			// 우리은행 전산점검으로 인한 임시 체크
			var _date = new Date();
	    	var _year = _date.getFullYear();
	    	var _month = _date.getMonth()+1;
	    	var _day = _date.getDate();
	    	var std = "" + LPAD2(_year) + LPAD2(_month) + LPAD2(_day);
	    	if(std >= "20180505" && std <= "20180507"){
				$("select[name=acountType] option:eq(1)").attr("selected","selected");
	    	}
		} else {
			//휴대폰
			//실시간 계좌이체
			//무통장 입금
			if(settleType === "12") {
				$(".pi_box").hide();	//카드선택창 닫기
				$(".pi_box2").hide(); 	//직접입금 닫기
				$(".pi_box3").hide();	//에스크로 선택창 닫기
				$(".pi_box4").hide();	//휴대폰 선택창 닫기
				$(".pi_box5").hide();	//카카오 선택창 열기
				$(".pi_box6").hide();	//네이버페이 선택창 열기
			}
			else if(settleType === "20") {
				$(".pi_box").hide();	//카드선택창 닫기
				$(".pi_box2").hide(); 	//직접입금 닫기
				$(".pi_box3").hide();	//에스크로 선택창 닫기
				$(".pi_box4").show();	//휴대폰 선택창 닫기
				$(".pi_box5").hide();	//카카오 선택창 열기
				$(".pi_box6").hide();	//네이버페이 선택창 열기
			}
			else if(settleType === "68") {
				$(".pi_box").hide();	//카드선택창 닫기
				$(".pi_box2").hide(); 	//직접입금 닫기
				$(".pi_box3").hide();	//에스크로 선택창 닫기
				$(".pi_box4").hide();	//휴대폰 선택창 닫기
				$(".pi_box5").hide();	//카카오 선택창 열기
				$(".pi_box6").hide();	//네이버페이 선택창 열기
			}else {
				$(".pi_box").hide();	//카드선택창 닫기
				$(".pi_box2").hide(); 	//직접입금 닫기
				$(".pi_box3").hide();	//에스크로 선택창 닫기
				$(".pi_box4").hide();	//휴대폰 선택창 닫기
				$(".pi_box5").hide();	//카카오 선택창 열기
				$(".pi_box6").hide();	//네이버페이 선택창 열기
			}
			
			$("input[name=escrowYn]").eq(1).prop("checked", true); //에스크로 미적용 디폴트
			if((settleType === "30" || settleType === "40") && "01" != "04" && "01" != "03"){
				$(".pi_box3").show();	//에스크로 선택창 열기
			}
		}
	}

	//베네피아
	function useBenePoint() {
		window.open("/pages/kcp/preOrder.jsp", "preOrder", "left=600,top=400, height=200,width=450,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
	}

	//베네피아 callback
	function setupBenepoint(point, pt_idno, pt_pwd, tno) {
		var point = FormatNumber3(ParseInt10(point));
		var benepia_point = document.frmMain.benepia_point;
		benepia_point.value = point;
		document.frmMain.pt_idno.value= pt_idno;
		document.frmMain.pt_pwd.value= pt_pwd;
		document.frmMain.tno.value= tno;
		setUpPoint("benepia_point");
	}
	
	//이제너두
	function useExanaduPoint() {
		var amount = ParseInt10(document.frmMain.good_mny.value) + ParseInt10(document.frmMain.exanadu_point.value);
		var urlEXanadu = decodeURIComponent("")+amount+"&VENDORPOPUPURL=https://www.bandinlunis.com/pages/front/cooperation/exanaduPopUp.jsp";
		
		window.open(urlEXanadu, "preOrder", "left=600,top=400, height=200,width=450,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
	}

	//이제너두 callback
	function fillXanMon(XAN_SUM_MONEY, XAN_KEY) {
		document.frmMain.exanadu_point.value= XAN_SUM_MONEY;
		document.frmMain.exanadu_point_max.value= XAN_SUM_MONEY;
		document.frmMain.exanadu_key.value= XAN_KEY;
		setUpPoint("exanadu_point");
	}

	//E1
	function useE1Point() {
		window.open("/pages/e1/cardCheck.jsp", "preOrder", "left=600,top=480, height=250,width=610,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
	}

	//E1 callback
	function setupE1Point(point, pt_idno, pt_pwd) {
		var point = FormatNumber3(ParseInt10(point));
		var e1_point = document.frmMain.e1_point;
		e1_point.value = point;
		document.frmMain.pt_idno.value= pt_idno;
		document.frmMain.pt_pwd.value= pt_pwd;
		setUpPoint("e1_point");
	}

	//컬쳐캐쉬
	function useCultureCash() {
		var amount = ParseInt10(removeComma(document.frmMain.tot_price.value));
		var wnd = window.open('/pages/front/cooperation/culturelandPopUp.jsp?Amount='+amount,'preOrder','height=520,width=500,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no');
		wnd.focus();
	}

	//컬쳐캐쉬 callback
	function setCultureCash(CustID, UserID, HashNo, RequestAmount, McashAmount) {
		var frm = document.frmMain;
		frm.culture_cash.value = FormatNumber3(ParseInt10(RequestAmount));
		frm.culture_cash_max.value = McashAmount;
		frm.CustID.value = CustID;
		frm.UserID.value = UserID;
		frm.HashNo.value = HashNo;
		setUpPoint("culture_cash");
	}

	//쿠폰팝업 callback
	var cpnPrice = 0;
	function applyCpn(val,obj,obj2) {
		
		var frm = document.frmMain;
		frm.cpn_price.value = FormatNumber3(ParseInt10(val));
		frm.cpn_price_chk.value = ParseInt10(val);
		frm.cpnArray.value = "";
		frm.cpnPriceArray.value = "";
		cpnPrice = 0;
		
		// 쿠폰적용시 선물포장비 무료 쿠폰이 있다면 선물포장 "예" 체크 후 "아니오" 비활성화
		// 다시 적용시 선물포장비 무료 쿠폰이 없다면 선물포장 "아니오" 체크 후 체크박스 활성화
		for(var i=0; i<obj.length; i++) {
			if(obj[i].id === "pk_cpn_id") {
				if(obj[i].value != "") {
					frm.gift_yn[0].checked = true;
					frm.gift_yn[1].disabled = true;
				}else {
					if(frm.gift_yn[1].disabled === true) {
						frm.gift_yn[1].checked = true;
					}
					frm.gift_yn[1].disabled = false;
				}
			}
		}
		
		var seq = 0;
		for(var i=0;i<obj.length;i++) {
			if(obj[i].value != "") {
				if(seq > 0) {
					frm.cpnArray.value += ",";
					frm.cpnPriceArray.value += ",";
				}
				frm.cpnArray.value += obj[i].value;
				frm.cpnPriceArray.value += obj2[i].value;
				cpnPrice += ParseInt10(obj2[i].value);
				seq++;
			}
		}
		orderCalc();
	}	

	//포인트 사용 처리
	function setUpPoint(objId) {
		
		var obj = $("#"+objId);

		if(obj.val().length <= 0){
			obj.val(0);
		}else{
			var inPoint = ParseInt10(removeComma(obj.val()));
			var maxPoint = ParseInt10($("#"+objId+"_max").val());
			
			// 적립금의 경우 사용시 제한사항 체크
			if(objId == 'reserve_point'){
				var totSaleCost = ParseInt10(document.frmMain.tot_sale_cost.value);
				// 상품 판매가 합이 5000원 미만 && 사용가능 적립금이 판매가 합보다 클 때
				if((totSaleCost < 5000) && (maxPoint > totSaleCost)){
					maxPoint = totSaleCost;
					if(inPoint > maxPoint){
						alert("주문하신 상품금액 합계가 5,000원 미만인 경우, 적립금은 상품금액 합계를 초과하여 사용하실 수 없습니다.");
					}
				}
			}
			
			var returnVal = inPoint;
			if(inPoint > maxPoint){
				returnVal = maxPoint;
			}
			
	        var cashCost = getCashCost() + ParseInt10(inPoint);
	        if(ParseInt10(returnVal) > ParseInt10(cashCost)) {
	            alert("결제 금액 이상 설정할 수 없습니다.");
	            returnVal = cashCost;
	        }
			obj.val(FormatNumber3(returnVal));
		}
		orderCalc();
	}

	function getCashCost(){
		
		var frm = document.frmMain;
		
		//할인금액
		var reservePoint		= ParseInt10(removeComma(frm.reserve_point.value));
		var dispositPoint		= ParseInt10(removeComma(frm.disposit_point.value));
		var b2bPoint			= ParseInt10(removeComma(frm.b2b_point.value));
		var convPoint			= ParseInt10(removeComma(frm.conv_point.value));
		var ezwelPoint			= ParseInt10(removeComma(frm.ezwel_point.value));
		var ezwelMileage		= ParseInt10(removeComma(frm.ezwel_mileage.value));
		var ezwelSpecialPoint	= ParseInt10(removeComma(frm.ezwel_special_point.value));
		var benepiaPoint		= ParseInt10(removeComma(frm.benepia_point.value));
		var exanaduPoint		= ParseInt10(removeComma(frm.exanadu_point.value));
		var e1Point				= ParseInt10(removeComma(frm.e1_point.value));
		var cultureCash			= ParseInt10(removeComma(frm.culture_cash.value));
		var cpnCost				= ParseInt10(removeComma(frm.cpn_price.value));
		var bookCpnCost			= ParseInt10(removeComma(frm.bookcpn_price.value));
		var ocbPoint		        = ParseInt10(removeComma(frm.ocb_point.value));

		//배송비
		var bandiDeliCost		= ParseInt10(frm.bandi_deli_cost.value);
		var extraDeliCost		= ParseInt10(frm.extra_deli_cost.value);
		var storeDeliCost		= ParseInt10(frm.store_deli_cost.value);
		var foreDeliCost		= ParseInt10(frm.fore_deli_cost.value);
		var giftCost			= ParseInt10(frm.gift_price.value);
		
		var deliCode			= $(".btn_deliCode:checked").val();
		if(deliCode === "01") {
			//일반택배
			foreDeliCost = 0;
		}
		else if(deliCode === "02") {
			//오프라인 매장수령(직원주문)
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "03") {
			//해외배송
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "04") {
			//당일배송 - 가상코드
		}
		else if(deliCode === "05") {
			//북셀프
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "06") {
			//미배송(온라인컨텐츠)
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "07" || deliCode === "13") {
			//편의점택배
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		
		//합계
		var totSaleCost	= ParseInt10(frm.tot_sale_cost.value);
		var finalDiscountCost = reservePoint + dispositPoint + b2bPoint + convPoint + ezwelPoint + ezwelMileage + ezwelSpecialPoint + benepiaPoint + exanaduPoint + e1Point + cultureCash + cpnCost + bookCpnCost + ocbPoint;
		var finalDeliCost = bandiDeliCost + extraDeliCost + storeDeliCost + foreDeliCost;
		var finalCashCost = totSaleCost + finalDeliCost + giftCost - finalDiscountCost;
		
		//제휴즉시할인적용
		var partnerDcPrice = partnerDC(finalCashCost);
		finalCashCost -= partnerDcPrice;

		return finalCashCost;
	}

	//제휴 즉시할인 금액 계산
	function partnerDC(cashCost) {

		var partner = "";
		var lotteDcPrice = 0;
		
		if(cashCost > 0 && partnerDcRate > 0) {
			
			lotteDcPrice = ParseInt10(cashCost*partnerDcRate/100);
			
			//KB국민카드는 최대 2천원
			if(partner === "172" && lotteDcPrice > 2000) {
				//lotteDcPrice = 2000;
			}
			
		}
		
		document.frmMain.lotte_dc_price.value = lotteDcPrice;
		return lotteDcPrice;
	}

	//제휴 즉시할인 할인율 가져오기
	function getPartnerDcRate() {

		var partner = "";

		//롯데카드몰, 신한카드 올대쇼핑, 한국능률협회, 씨티카드몰, KB국민카드, BC카드
		if(partner === "137" || partner === "151" || partner === "157" || partner === "158" || partner === "172" || partner === "175") {

			var ordDtm = "20181016142510";
			var dt = new Date(ParseInt10(ordDtm.substring(0,4)),ParseInt10(ordDtm.substring(4,6)-1),ParseInt10(ordDtm.substring(6,8)));
			var day = dt.getDay();

			$.ajax({
				url: "/ajax/getCompany.do",
				type: "post",
				data: {"compId":partner},
				success: function(data)	{
					eval(data);
					partnerName = data.compName;
					if(day === 0 || day === 6) {
						partnerDcRate = data.weekendDcRate;	//주말
					} else {
						partnerDcRate = data.weekDcRate;	//평일
					}
					orderCalc();
				},
				error: function(){ resetOrdBtn("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
			});
		}
	}

	//합계 금액 계산
	function orderCalc() {
		
		var frm = document.frmMain;
		
		//할인금액
		var reservePoint		= ParseInt10(removeComma(frm.reserve_point.value));
		var dispositPoint		= ParseInt10(removeComma(frm.disposit_point.value));
		var b2bPoint			= ParseInt10(removeComma(frm.b2b_point.value));
		var convPoint			= ParseInt10(removeComma(frm.conv_point.value));
		var ezwelPoint			= ParseInt10(removeComma(frm.ezwel_point.value));
		var ezwelMileage		= ParseInt10(removeComma(frm.ezwel_mileage.value));
		var ezwelSpecialPoint	= ParseInt10(removeComma(frm.ezwel_special_point.value));
		var benepiaPoint		= ParseInt10(removeComma(frm.benepia_point.value));
		var exanaduPoint		= ParseInt10(removeComma(frm.exanadu_point.value));
		var e1Point				= ParseInt10(removeComma(frm.e1_point.value));
		var cultureCash			= ParseInt10(removeComma(frm.culture_cash.value));
		var cpnCost				= ParseInt10(removeComma(frm.cpn_price.value));
		var bookCpnCost			= ParseInt10(removeComma(frm.bookcpn_price.value));
		var ocbPoint		        = ParseInt10(removeComma(frm.ocb_point.value));

		//배송비
		var bandiDeliCost		= ParseInt10(frm.bandi_deli_cost.value);
		var extraDeliCost		= ParseInt10(frm.extra_deli_cost.value);
		var storeDeliCost		= ParseInt10(frm.store_deli_cost.value);
		var foreDeliCost		= ParseInt10(frm.fore_deli_cost.value);
		var giftCost			= ParseInt10(frm.gift_price.value);
		
		var deliCode			= $(".btn_deliCode:checked").val();
		if(deliCode === "01") {
			//일반택배
			foreDeliCost = 0;
		}
		else if(deliCode === "02") {
			//오프라인 매장수령(직원주문)
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "03") {
			//해외배송
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "04") {
			//당일배송 - 가상코드
		}
		else if(deliCode === "05") {
			//북셀프
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "06") {
			//미배송(온라인컨텐츠)
			bandiDeliCost = 0;
			extraDeliCost = 0;
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		else if(deliCode === "07" || deliCode === "13") {
			//편의점택배
			storeDeliCost = 0;
			foreDeliCost = 0;
			giftCost = 0;
		}
		
		//합계
		var totSaleCost	= ParseInt10(frm.tot_sale_cost.value);
		var finalDiscountCost = reservePoint + dispositPoint + b2bPoint + convPoint + ezwelPoint + ezwelMileage + ezwelSpecialPoint + benepiaPoint + exanaduPoint + e1Point + cultureCash + cpnCost + bookCpnCost + ocbPoint;
		var finalDeliCost = bandiDeliCost + extraDeliCost + storeDeliCost + foreDeliCost;
		var finalCashCost = totSaleCost + finalDeliCost + giftCost - finalDiscountCost;
		var totTaxFreeAmount = "25920";
		
		//제휴즉시할인적용
		var partnerDcPrice = partnerDC(finalCashCost);
		finalDiscountCost += partnerDcPrice;
		finalCashCost -= partnerDcPrice;
		
		//합계금액 폼에 입력
		frm.gift_price.value = giftCost;
		frm.tot_price.value = totSaleCost + finalDeliCost + giftCost;
		frm.deli_price.value = finalDeliCost;
		frm.cash_price.value = finalCashCost;
		frm.good_mny.value = frm.cash_price.value;

		// good_mny = comm_tax_mny(과세공급가액= 과세금액/1.1) + comm_vat_mny(부가가치세=과세금액-과세공급가액) + comm_free_mny(비과세금액)
		if(parseInt(totTaxFreeAmount) > parseInt(frm.good_mny.value)) {
			frm.comm_free_mny.value = frm.good_mny.value;
			frm.comm_tax_mny.value = "0";
			frm.comm_vat_mny.value = "0";
		}else {
			//과세금액 계산
			var totTaxAmount = parseInt(frm.good_mny.value) - parseInt(totTaxFreeAmount);
			frm.comm_free_mny.value = totTaxFreeAmount;
			frm.comm_tax_mny.value = Math.round(totTaxAmount/1.1);
			frm.comm_vat_mny.value = totTaxAmount - parseInt(frm.comm_tax_mny.value);
		}

		$("#finalDeliCost").text(FormatNumber3(finalDeliCost+giftCost));
		$("#finalDiscountCost").text(FormatNumber3(finalDiscountCost));
		$(".finalCashCost").text(FormatNumber3(finalCashCost));

		//결제수단
		if(finalCashCost === 0) {
			$("input[name=settle_type]").prop("disabled", true);
			$("#sett_50").prop("disabled", false);
			$("#sett_50").prop("checked", true);
			$(".pi_box").hide();
		}else if(finalCashCost > 0) {
			$("input[name=settle_type]").prop("disabled", false);
			$("#sett_50").prop("disabled", true);
			$("#sett_10").prop("checked", true);
			settleOpen("10");
			settleInfo("10");
			//settleOpen($(":radio[name=settle_type]:checked").val());
		}else {
			alert("할인금액이 결제금액을 초과하였습니다. 할인정보를 다시 입력해 주세요.(쿠폰을 쓰실경우 쿠폰을 가장 먼저 사용해주세요.)");
			window.location.reload();
			return;
		}
		
		if ("N" == "Y"){
			//네이버페이 고정
			$("input[name=settle_type]").prop("disabled", true);
			$("#sett_68").prop("disabled", false);
			$("#sett_68").prop("checked", true);
			settleOpen("68");
			settleInfo("68");
		}
		
		//배송&포장비 안내
		var finalDeliCostInfoTxt = "";
		if((finalDeliCost+giftCost) > 0 ) {
			if(foreDeliCost > 0)		finalDeliCostInfoTxt += "해외배송비+";
			if(bandiDeliCost > 0)		finalDeliCostInfoTxt += "배송비+";
			if(extraDeliCost > 0)		finalDeliCostInfoTxt += "추가배송비+";
			if(storeDeliCost > 0)		finalDeliCostInfoTxt += "업체배송비+";
			if(giftCost > 0)			finalDeliCostInfoTxt += "선물포장+";
			finalDeliCostInfoTxt = "("+finalDeliCostInfoTxt.substring(0,finalDeliCostInfoTxt.length-1)+")";
		}
		$("#finalDeliCostInfo").text(finalDeliCostInfoTxt);
		
		//할인내역 안내
		var finalDiscountCostInfoTxt = "";
		if(finalDiscountCost > 0 ) {
			if(partnerDcPrice > 0)		finalDiscountCostInfoTxt += partnerName+" 즉시할인 "+FormatNumber3(partnerDcPrice)+"원+";
			if(reservePoint > 0)		finalDiscountCostInfoTxt += "적립금+";
			if(dispositPoint > 0)		finalDiscountCostInfoTxt += "예치금+";
			if(b2bPoint > 0)			finalDiscountCostInfoTxt += "복리후생포인트+";
			if(convPoint > 0)			finalDiscountCostInfoTxt += "상품권전환금+";
			if(ezwelPoint > 0)			finalDiscountCostInfoTxt += "이지웰포인트+";
			if(ezwelMileage > 0)		finalDiscountCostInfoTxt += "이지웰마일리지+";
			if(ezwelSpecialPoint > 0)	finalDiscountCostInfoTxt += "이지웰특별포인트+";
			if(benepiaPoint > 0)		finalDiscountCostInfoTxt += "베네피아포인트+";
			if(exanaduPoint > 0)		finalDiscountCostInfoTxt += "이제너두포인트+";
			if(e1Point > 0)				finalDiscountCostInfoTxt += "E1오렌지포인트 +";
			if(cultureCash > 0)			finalDiscountCostInfoTxt += "컬쳐캐쉬+";
			if(cpnCost > 0)				finalDiscountCostInfoTxt += "쿠폰할인+";
			if(bookCpnCost > 0)			finalDiscountCostInfoTxt += "반디상품권할인+";
			if(ocbPoint > 0)             finalDiscountCostInfoTxt += "OK캐쉬백+";
			finalDiscountCostInfoTxt = "("+finalDiscountCostInfoTxt.substring(0,finalDiscountCostInfoTxt.length-1)+")";
		}
		$("#finalDiscountCostInfo").text(finalDiscountCostInfoTxt);
		
		// 반디앤루니스 상품들 제외 합계(store_id != 1)
		var storeCost = 0;
		
		// 적립률 계산 위한 합계		[총금액 - (쿠폰+상품권+적립금+b2b)]
		var cashCost = frm.tot_price.value - (cpnCost + bookCpnCost + b2bPoint + reservePoint);
		// 5만원 적립금 계산 위한 합계	[총금액 - (배송비+선물포장비+상점상품금액)]
		var cashCost_5 = frm.tot_price.value - (finalDeliCost + giftCost + storeCost);
		// 등급별 적립금 계산 위한 합계	[총금액 - (쿠폰+상품권+적립금)]
		var cashCost_grade	= frm.tot_price.value - (cpnCost + bookCpnCost + reservePoint);
		// 바로온/즐겨찾기 위한 합계	[총금액 - (쿠폰+상품권+적립금+b2b+이지웰+베네피아+e제너두+e1+켤쳐캐쉬)]
		var cashCost_etc = cashCost - (ezwelPoint + ezwelMileage + ezwelSpecialPoint + benepiaPoint + exanaduPoint + e1Point + cultureCash);
		
		pointCalc(frm.tot_price.value, cashCost, cashCost_5, cashCost_grade, cashCost_etc);
	}

	//예상 적립금 계산
	function pointCalc(totCost, cashCost, cashCost_5, cashCost_grade, cashCost_etc) {
		var prodPoint = "1440";
		var cashRate = 0;
		if(totCost > 0 && cashCost > 0) {
			cashRate = cashCost / totCost;
		}
		var extProdPoint = 0;
		
		var obj_ordCnt = $(".ord_cnt");
		var obj_point = $(".save_point");
		
		var ordCnt = 0;
		var savePoint = 0;
		for(i=0;i<obj_ordCnt.size();i++){
			ordCnt = obj_ordCnt[i].value;
			savePoint = obj_point[i].value;
			extProdPoint += ParseInt10(ParseInt10(savePoint)*cashRate) * ParseInt10(ordCnt);
		}
		
		var extAddPoint = 0;
		var extGradeText = "일반";
		var extGradePoint = 0;
		var extPartner = "";
		var extPartnerPoint = 0;
		var cpnFlag = 0;
		var bandiCpnFlag = 0;
		var cartType = 01;
		if(cpnFlag > 0 && cartType != "04"){
			// 5만원 적립금 계산(한이뮤직을 제외한 상품금액만 합산)
			if(bandiCpnFlag > 0 && cashCost_5 >= 50000){
				extAddPoint = 2000;
			}
			// 등급별 적립금 계산
			if(extGradeText == "실버루니"){
				extGradePoint = Math.round(cashCost_grade*0.01);
			}else if(extGradeText == "골드루니"){
				extGradePoint = Math.round(cashCost_grade*0.02);
			}else if(extGradeText == "슈퍼루니"){
				extGradePoint = Math.round(cashCost_grade*0.03);
			}
			// 바로온/즐겨찾기 적립금 계산
			if(extPartner == "200" || extPartner == "201"){
				extPartnerPoint = Math.round((cashCost_etc)*0.02);
			}
		}
		
		$("#extProdPoint").text(FormatNumber3(extProdPoint));
		$("#extAddPoint").text(FormatNumber3(extAddPoint));
		$("#extGradePoint").text(FormatNumber3(extGradePoint));
		$("#extPartnerPoint").text(FormatNumber3(extPartnerPoint));
		$("#finalProdPoint").text(FormatNumber3(extProdPoint+extAddPoint+extGradePoint+extPartnerPoint));
	}

	//결제수단별 안내
	function settleInfo(val) {
		if(val === "11") {
			$("#iframe_settleInfo").attr("src","/html/order/settleInfo_10.htm");
		}else {
			$("#iframe_settleInfo").attr("src","/html/order/settleInfo_"+val+".htm");
		}
	}
	
	// 직접입금 은행 선택
	function changeFixBank(obj) {
		if(obj.value == '1'){
			var _date = new Date();
	    	
	    	var _year = _date.getFullYear();
	    	var _month = _date.getMonth()+1;
	    	var _day = _date.getDate();
	    	//var _hour = _date.getHours();
		    	
	    	var std = "" + LPAD2(_year) + LPAD2(_month) + LPAD2(_day);
	    	
 	    	if(std >= "20180505" && std <= "20180507"){
	    		var alertMsg = "[우리은행 서비스 일시 중단 안내]\n";
	    		alertMsg += "우리은행 전산시스템 재구축에 따라 아래와 같이 카드 및 금융거래 중 일부거래가 중단되거나, 제한적으로 이용이 가능함을 알려드립니다.\n";
	    		alertMsg += "1. 은행업무 중단 내용\n";
	    		alertMsg += "1) 중단 기간 : 5월 5일 토요일 00시 ~ 5월 7일 월요일 24시\n";
	    		alertMsg += "2) 중단에 따른 영향 : 계좌이체, 가상계좌 이용/취소 불가\n";
	    		alertMsg += "2. 체크카드 업무 중단 내용\n";
	    		alertMsg += "1) 중단 기간 : 5월 5일 토요일 00시 ~ 5월 7일 월요일 24시\n";
	    		alertMsg += "2) 중단에 따른 영향 : 체크카드 승인/취소 불가 (신용카드 이용 가능)\n";
	    		alert(alertMsg);
	    		$("select[name=acountType] option").removeAttr("selected");
	    		$("select[name=acountType] option:eq(1)").attr("selected","selected");
	    		return;
	    	}
		}
	}

	//카드사 선택
	function changeCardCode(obj) {
		// 우리카드 서버점검
		if(obj.value == 'CCPH'){
			var _date = new Date();
	    	
	    	var _year = _date.getFullYear();
	    	var _month = _date.getMonth()+1;
	    	var _day = _date.getDate();
	    	//var _hour = _date.getHours();
		    	
	    	var std = "" + LPAD2(_year) + LPAD2(_month) + LPAD2(_day);
	    	
	    	if(std >= "20180505" && std <= "20180507"){
	    		var alertMsg = "[우리은행 서비스 일시 중단 안내]\n";
	    		alertMsg += "우리은행 전산시스템 재구축에 따라 아래와 같이 카드 및 금융거래 중 일부거래가 중단되거나, 제한적으로 이용이 가능함을 알려드립니다.\n";
	    		alertMsg += "1. 은행업무 중단 내용\n";
	    		alertMsg += "1) 중단 기간 : 5월 5일 토요일 00시 ~ 5월 7일 월요일 24시\n";
	    		alertMsg += "2) 중단에 따른 영향 : 계좌이체, 가상계좌 이용/취소 불가\n";
	    		alertMsg += "2. 체크카드 업무 중단 내용\n";
	    		alertMsg += "1) 중단 기간 : 5월 5일 토요일 00시 ~ 5월 7일 월요일 24시\n";
	    		alertMsg += "2) 중단에 따른 영향 : 체크카드 승인/취소 불가 (신용카드 이용 가능)\n";
	    		alert(alertMsg);
	    		$("select[name=used_card] option:eq(0)").attr("selected","selected");
	    		return;
	    	}
		}
		
		var user_agent = navigator.userAgent.toLowerCase();
		var frm = document.frmMain;
		
		// 비씨: CCBC, 국민: CCKM (맥에서 결제 불가 / ISP 계열)
		if(user_agent.indexOf("macintosh") != -1 && (obj.value == 'CCBC' || obj.value == 'CCKM')){
			alert("해당 은행/카드사가 맥OS에서 결제를 지원하지 않습니다. 다른 결제 방법을 선택해 주세요");
			frm.used_card.value = "" ;
			return;
		}
		
		// 하나(외환): CCHN, 씨티: CCCT (EDGE 브라우저에서 결제 불가 / 보안 프로그램 문제)
		if(user_agent.indexOf("edge") != -1 && (obj.value == 'CCHN' || obj.value == 'CCKE' || obj.value == 'CCCT')){
			alert("해당 은행/카드사가 EDGE 버전에서 결제를 지원하지 않습니다. 다른 결제 방법을 선택해 주세요");
			frm.used_card.value = "" ;
			return;
		}
		
		//반디 서프라이즈 무이자 처리 start (12개월 무이자 가능한 상황에서 12개월 추가 표시)
		if(document.frmMain.cash_price.value < 50000) {
			$("#selectCardInstallRange").html("<select name='fix_inst'><option value='0'>일시불</option></select>");
		}else {
			
			// LG 모듈의 경우 PG사 무이자 할부 외에 별도의 무이자 할부가 있었지만
			// KCP 모듈의 경우 PG사 무이자 할부만 있기에 주석처리
			var noInterest = "N";
			// 외환: CCKE, 하나SK: CCHN, 하나(외환): CCKE, 신한: CCLG, 삼성: CCSS, 현대: CCDI, 롯데: CCLO, NH채움: CCNH
			if(noInterest === "Y" && (obj.value === "CCKE" || obj.value === "CCHN" || obj.value === "CCKE" || obj.value === "CCLG" || obj.value === "CCSS" || obj.value === "CCDI" || obj.value === "CCLO" || obj.value === "CCNH")) {
				$("#selectCardInstallRange").html("<select name='fix_inst'><option value='0'>일시불</option><option value='2'>2개월</option><option value='3'>3개월(무이자)</option><option value='4'>4개월</option><option value='5'>5개월</option><option value='6'>6개월(무이자)</option><option value='7'>7개월</option><option value='8'>8개월</option><option value='9'>9개월</option><option value='10'>10개월</option><option value='11'>11개월</option><option value='12'>12개월(무이자)</option></select>");
				//document.frmMain.kcp_noint_quota.value = "CCKE-03:06:12,CCHN-03:06:12,CCLG-03:06:12,CCSS-03:06:12,CCDI-03:06:12,CCLO-03:06:12,CCNH-03:06:12";
			}else {
				$("#selectCardInstallRange").html("<select name='fix_inst'><option value='0'>일시불</option><option value='2'>2개월</option><option value='3'>3개월</option><option value='4'>4개월</option><option value='5'>5개월</option><option value='6'>6개월</option><option value='7'>7개월</option><option value='8'>8개월</option><option value='9'>9개월</option><option value='10'>10개월</option><option value='11'>11개월</option><option value='12'>12개월</option></select>");
				//document.frmMain.kcp_noint_quota.value = "";
			}
		}
		
		//신한카드(CCLG),하나(외환)카드(CCKE),현대카드(CCDI) 선택시 포인트사용 체크박스 활성화
		if(obj.value === "CCLG" || obj.value === "CCKE" || obj.value === "CCDI") {
			
			$("#cardPointCheckbox").prop("disabled", false);

			if(obj.value === "CCLG") {
				$("#cardPointCheckboxLabel").html("마이 신한 포인트 사용");
				$("#cardPointCheckboxLabel2").show();
			}else if(obj.value === "CCKE") {
				$("#cardPointCheckboxLabel").html("하나머니 사용");
				$("#cardPointCheckboxLabel2").hide();
			}else if(obj.value === "CCDI") {
				$("#cardPointCheckboxLabel").html("현대카드 M포인트 사용");
				$("#cardPointCheckboxLabel2").hide();
			}
			
			$("#tr_cardPointUse").show();
			
		}else {
			$("#cardPointCheckbox").prop("disabled", true);
			$("#tr_cardPointUse").hide();
		}
		$("#cardPointCheckbox").prop("checked", false);
		
	}

	//주문버튼 시작 처리(hide)
	function hideOrdBtn() {
		$("#orderCheck").val("1");
		$("#btn_order").hide();
		$("#btn_order_loading").show();
	}

	//주문버튼 리셋
	function resetOrdBtn(msg) {
		if(msg != "" || msg != undefined) {
			alert(msg);
		}
		$("#orderCheck").val("0");
		$("#btn_order_loading").hide();
		$("#btn_order").show();
		unLockCost();
	}

	//제한사항 체크
	function orderAlert() {

		var frm = document.frmMain;

		var memBanBuyCnt = "0";
		var compId = "";
		var partner = "false";
		var cartType = "01";
		var msg = "";

		//최종금액 재확인(주문금액 합계 = 할인금액합계 + PG결제금액)
		var totPrice			= ParseInt10(removeComma(frm.tot_price.value));
		var cashCost			= ParseInt10(removeComma(frm.good_mny.value));
		var reservePoint		= ParseInt10(removeComma(frm.reserve_point.value));
		var dispositPoint		= ParseInt10(removeComma(frm.disposit_point.value));
		var b2bPoint			= ParseInt10(removeComma(frm.b2b_point.value));
		var convPoint			= ParseInt10(removeComma(frm.conv_point.value));
		var ezwelPoint			= ParseInt10(removeComma(frm.ezwel_point.value));
		var ezwelMileage		= ParseInt10(removeComma(frm.ezwel_mileage.value));
		var ezwelSpecialPoint	= ParseInt10(removeComma(frm.ezwel_special_point.value));
		var benepiaPoint		= ParseInt10(removeComma(frm.benepia_point.value));
		var exanaduPoint		= ParseInt10(removeComma(frm.exanadu_point.value));
		var e1Point				= ParseInt10(removeComma(frm.e1_point.value));
		var cultureCash			= ParseInt10(removeComma(frm.culture_cash.value));
		var cpnCost				= ParseInt10(removeComma(frm.cpn_price.value));
		var bookCpnCost			= ParseInt10(removeComma(frm.bookcpn_price.value));
		var cpnCostChk			= ParseInt10(removeComma(frm.cpn_price_chk.value));
		var partnerDC			= ParseInt10(removeComma(frm.lotte_dc_price.value));
		var ocbPoint		        = ParseInt10(removeComma(frm.ocb_point.value));

		if((cashCost > 0 && $("#sett_50").is(":checked")) || (totPrice != (cashCost + reservePoint + dispositPoint + b2bPoint + convPoint + ezwelPoint + ezwelMileage + ezwelSpecialPoint + benepiaPoint + exanaduPoint + e1Point + cultureCash + cpnCost + bookCpnCost + partnerDC + ocbPoint)) || (cpnCost != cpnCostChk) || (cpnPrice < cpnCostChk)) {
			alert("결제 금액에 오류가 있습니다. 할인정보 및  결제정보를 다시 입력해 주세요.[2]");
			window.location.reload();
			return;
		}
		//핸드폰 결제금액 제한
		if(cashCost < 100 && $("#sett_20").is(":checked")){
			resetOrdBtn("100원 미만 금액은 결제 하실 수 없습니다.");
			return;
		}
		//신용카드, 네이버페이, 카카오페이, 페이코 결제금액 제한
		if(cashCost < 100 && ($("#sett_10").is(":checked") || $("#sett_11").is(":checked")
				|| $("#sett_68").is(":checked") || $("#sett_12").is(":checked") || $("#sett_14").is(":checked"))){
			resetOrdBtn("100원 미만 금액은 결제 하실 수 없습니다.");
			return;
		}
		//계좌이체 결제금액 제한
		if(cashCost <= 150 && $("#sett_30").is(":checked")){
			resetOrdBtn("150원 이하 금액은 결제 하실 수 없습니다.");
			return;
		}
		//무통장입금 결제금액 제한
		if(cashCost < 100 && $("#sett_40").is(":checked")){
			resetOrdBtn("100원 미만 금액은 결제 하실 수 없습니다.");
			return;
		}
		//맥에서 계좌이체 제한
		if($("#sett_30").is(":checked")){
			var user_agent = navigator.userAgent.toLowerCase();
			if(user_agent.indexOf("macintosh") != -1){
				resetOrdBtn("맥OS에서는 계좌이체 결제를 지원하지 않습니다.");
				return;
			} 
		}
		//베네피아 복합결제 얼럿
		if(benepiaPoint > 0 && cashCost > 0) {
			resetOrdBtn("베네피아 포인트와 신용카드/휴대폰/계좌이체/무통장 입금의 복합결제는 불가능 합니다. 베네피아 포인트로만 결제를 하시거나 포인트 사용을 취소하시기 바랍니다.");
			return;
		}

		//복리후생업체 얼럿
		if(ParseInt10(removeComma(frm.b2b_point.value)) > 0 && ParseInt10(memBanBuyCnt) > 0) {
			if(compId === "1000031") {
				msg = "해당 구매 물품중 KT임원 자기계발비 가이드라인에 따라 구매 제한된 물품이 포함되어 있으므로 결제가 불가능합니다";
			}else {
				msg = "복리후생포인트로는\n[음반,기프트,잡지,만화,학습서,유아,어린이,여행취미레져]\n등의 상품은 결제가 불가능힙니다.";
			}
			resetOrdBtn(msg);
			return;
		}

		//이지웰 얼럿
		if(partner == "true" && ParseInt10(memBanBuyCnt) > 0) {
			resetOrdBtn("복지몰 회원은 GIFT 상품을 구매하실 수 없습니다.");
			history.back();
			return;
		}
		
		//문화이용권 얼럿
		if(compId === "173" && ParseInt10(memBanBuyCnt) > 0) {
			resetOrdBtn("문화이용권으로는 기프트 상품을 구매하실수 없습니다. 기프트 상품을 제외하신 후 결제 하시기 바랍니다.");
			return;
		}

		//전자책 이전 구매 얼럿
		if(cartType === "04") {
			ajaxRequest("saleEbookCheckList", {"prodId" :"4034224,4181047,"},
					function(data) {
						if(data === "") {
							formCheck();
						}else if(data === "N") {
							alert("판매중지 도서가 있습니다. 고객센터에 문의 바랍니다.(1577-4030)");
							history.back();
						}else if(data === "error"){
							resetOrdBtn("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요.");
						}else if(data === "epubError"){
							alert("eBook 제공사인 한국이퍼브의 일시적인 장애로 현재 서비스 이용이 원활하지 않습니다.\n잠시후 시도해 주시기 바라며, 지속적인 문제 발생시 고객센터 1대1 문의를 이용해 주시기 바랍니다.");
							history.back();
						}else {
							alert("이미 구매하신 도서 ["+data+"] 가 있습니다. 확인 후 다시 주문하시기 바랍니다.");
							history.back();
						}
					}
			);
		}else if(cartType === "01") {
			//재고기준판매 상품 재고 체크 후 결제 진행(잡지,음반)
			var prodIds = ",4181047";
			var ordCnts = ",1";
			if(prodIds != "") {
				$.ajax({
					url: "/ajax/getProdRealQty.do",
					type: "post",
					data: {"prodIds":prodIds,"ordCnts":ordCnts},
					dataType: "text",
					success: function(data)	{
						if(data != "OK") {
							alert("구매중인 도서 [" + data + "]는\n현재 재고가 모두 소진 되었습니다.\n해당도서 제외 후 다시 주문해주세요.");
							location.href = "http://www.bandinlunis.com/front/order/shopCartList.do";
							return;
						}else {
							formCheck();
						}
					},
					error: function(){ resetOrdBtn("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
				});
			}else {
				formCheck();
			}
		}else {
			formCheck();
		}
	}
	
	//폼 검증
	function formCheck() {

		// 폼정리
		var obj_frmDiv  = document.getElementById("KCP_PAYINFO");
		if(obj_frmDiv) {
			var obj_inputEA = obj_frmDiv.getElementsByTagName("input");
			for (i=0; i<obj_inputEA.length; i++ ) {
				obj_inputEA[i].value = obj_inputEA[i].value.trim();
			}
			var obj_textEA  = obj_frmDiv.getElementsByTagName("textarea");
			for (i=0; i<obj_textEA.length; i++ ) {
				obj_textEA[i].value = obj_textEA[i].value.trim();
			}
		}
		
		var frm = document.frmMain;
		
		//1.주문자 정보
		if(frm.sndr_name.value === "") {
			$(".deli_box_close").click();
			resetOrdBtn("주문자 이름을 입력해주세요.");
			frm.sndr_name.focus();
			return;
		}
		if(frm.sndr_tel2_part1.value === "" || frm.sndr_tel2_part2.value === "" || frm.sndr_tel2_part3.value === "") {
			$(".deli_box_close").click();
			resetOrdBtn("주문자 휴대폰번호를 입력해 주세요.");
			return;
		}else {
			frm.sndr_tel2.value = frm.sndr_tel2_part1.value+"-"+frm.sndr_tel2_part2.value+"-"+frm.sndr_tel2_part3.value;
		}
		if(frm.sndr_tel1.value === "") {
			frm.sndr_tel1.value = frm.sndr_tel2.value;
		}
		if(frm.sndr_mail.value === "") {
			$(".deli_box_close").click();
			resetOrdBtn("주문자 이메일을 입력해 주세요");
			frm.sndr_mail.focus();
			return;
		}		
		if(!checkEmail(frm.sndr_mail.value)) {
			$(".deli_box_close").click();
			resetOrdBtn("주문자 이메일 형식이 잘못 되었습니다.");
			frm.sndr_mail.focus();
			return;
		}
	
		if(!isLogin()) {
			if(frm.ord_pw.value === "") {
				$(".deli_box_close").click();
				resetOrdBtn("주문 비밀번호를 입력해주세요.");
				frm.ord_pw.focus();
				return;
			}
			if(frm.ord_pw.value.length < 6) {
				$(".deli_box_close").click();
				resetOrdBtn("주문 비밀번호를  6자 이상으로 입력해주세요.");
				frm.ord_pw.focus();
				return;
			}
			if(frm.ord_pw_sim.value === "") {
				$(".deli_box_close").click();
				resetOrdBtn("주문 비밀번호 확인을 입력해주세요.");
				frm.ord_pw_sim.focus();
				return;
			}
			if(frm.ord_pw.value != frm.ord_pw_sim.value) {
				$(".deli_box_close").click();
				frm.ord_pw_sim.value = "";
				resetOrdBtn("주문 비밀번호와 확인 비밀번호가 동일하지 않습니다 재입력해 주세요.");
				frm.ord_pw_sim.focus();
				return;
			}
		}
		//OCB사용금액
		var ocbPoint=$("#ocb_point").val();
		var ocbPointMax=$("#ocb_point_max").val();
		if(ocbPointMax != 0 && (ocbPoint < 10 && ocbPoint > 0)){
			resetOrdBtn("OK캐쉬백은 10원 부터 사용이 가능합니다.");
			$("#ocb_point").focus();
			$("#ocb_point").val(0);
			return;
		}
		
		//2.배송지 정보
		var deliCode = $(".btn_deliCode:checked").val();
		if(deliCode === "") {
			resetOrdBtn("배송방법을 선택해 주세요.");
			return;
		}
		
		if(deliCode === "01") {
			//일반택배
			if(frm.rcvr_name.value === "") {
				resetOrdBtn("받으실분  이름을 입력해주세요.");
				frm.rcvr_name.focus();
				return;
			}
			if((frm.rcvr_tel1_part1.value === "" || frm.rcvr_tel1_part2.value === "" || frm.rcvr_tel1_part3.value === "") && (frm.rcvr_tel2_part1.value === "" || frm.rcvr_tel2_part2.value === "" || frm.rcvr_tel2_part3.value === "")) {
				resetOrdBtn("받으실분 전화번호나 휴대폰번호를 입력해 주세요");
				return;
			}else {
				if(!(frm.rcvr_tel1_part1.value === "" || frm.rcvr_tel1_part2.value === "" || frm.rcvr_tel1_part3.value === "")) {
					frm.rcvr_tel1.value = frm.rcvr_tel1_part1.value+"-"+frm.rcvr_tel1_part2.value+"-"+frm.rcvr_tel1_part3.value;
				}
				if(!(frm.rcvr_tel2_part1.value === "" || frm.rcvr_tel2_part2.value === "" || frm.rcvr_tel2_part3.value === "")) {
					frm.rcvr_tel2.value = frm.rcvr_tel2_part1.value+"-"+frm.rcvr_tel2_part2.value+"-"+frm.rcvr_tel2_part3.value;
				}
			}
			if(frm.rcvr_zip1.value === "" || frm.rcvr_addr1.value === "") {
				resetOrdBtn("받으실분 주소를 입력해주세요");
				return;
			}else {
				frm.rcvr_post.value = frm.rcvr_zip1.value;
			}

			if(isLogin()) {
				frm.sndr_post.value = frm.rcvr_post.value;
				frm.sndr_addr1.value = frm.rcvr_addr1.value;
				frm.sndr_addr2.value = frm.rcvr_addr2.value;
			}
			if(frm.ref_msg.value != "") {
				if(frm.ref_msg.value.length > 50) {
					resetOrdBtn("배송요구사항은 50자를 넘을수 없습니다.");
					return;
				}
			}
			if(frm.gift_yn[0].checked) {
				if(frm.gift_msg.value === "") {
					resetOrdBtn("선물포장 메시지를 입력해주세요");
					frm.gift_msg.focus();
					return;
				}else {
					if(frm.gift_msg.value.length>50) {
						resetOrdBtn("선물포장 메시지는 50자를  넘을수 없습니다.");
						frm.gift_msg.focus();
						return;
					}
				}
			}
			
		}else if(deliCode === "02") {
			//오프라인 매장수령
			if(frm.deli_store_code.value === "") {
				resetOrdBtn("수령 받으실 매장을 선택하세요.");
				frm.deli_store_code.focus();
				return;
			}
		}else if(deliCode === "03") {
			//해외배송
			if(frm.deli_price.value === "0") {
				resetOrdBtn("해외배송비가 계산되지 않았습니다. Country를 다시선택 해주세요.");
				return;
			}
			if(frm.eng_rcvr_name.value === "") {
				resetOrdBtn("받으실분  Name을 입력해주세요.");
				return;
			}
			if(frm.eng_rcvr_tel1.value === "") {
				resetOrdBtn("받으실분 Phone을 입력해 주세요");
				return;
			}
			if(frm.eng_rcvr_post.value === "") {
				resetOrdBtn("받으실분 Zip code를 입력해주세요");
				return;
			}
			if(frm.eng_rcvr_country.value === "") {
				resetOrdBtn("받으실분  Country를 선택해주세요");
				return;
			}
			if(frm.eng_rcvr_city.value === "") {
				resetOrdBtn("받으실분 City를 입력해주세요");
				return;
			}
			if(frm.eng_rcvr_state.value === "") {
				resetOrdBtn("받으실분 State/Province를 입력해주세요");
				return;
			}
			if(frm.eng_rcvr_addr1.value === "") {
				resetOrdBtn("받으실분 주소를 입력해주세요");
				return;
			}
	
		}else if(deliCode === "05") {
			//북셀프
			if(frm.gu.value === "" || frm.guname.value === "") {
				alert("북셀프 수령 매장이 선택되지 않았습니다. 매장을 다시 선택하신 후 주문해 주세요.");
				history.back();
			}
			if(frm.rcvr_name.value === "") {
				resetOrdBtn("받으실분  이름을 입력해주세요.");
				frm.rcvr_name.focus();
				return;
			}
			if((frm.rcvr_tel1_part1.value === "" || frm.rcvr_tel1_part2.value === "" || frm.rcvr_tel1_part3.value === "") && (frm.rcvr_tel2_part1.value === "" || frm.rcvr_tel2_part2.value === "" || frm.rcvr_tel2_part3.value === "")) {
				resetOrdBtn("받으실분 전화번호나 휴대폰번호를 입력해 주세요");
				return;
			}else {
				if(!(frm.rcvr_tel1_part1.value === "" || frm.rcvr_tel1_part2.value === "" || frm.rcvr_tel1_part3.value === "")) {
					frm.rcvr_tel1.value = frm.rcvr_tel1_part1.value+"-"+frm.rcvr_tel1_part2.value+"-"+frm.rcvr_tel1_part3.value;
				}
				if(!(frm.rcvr_tel2_part1.value === "" || frm.rcvr_tel2_part2.value === "" || frm.rcvr_tel2_part3.value === "")) {
					frm.rcvr_tel2.value = frm.rcvr_tel2_part1.value+"-"+frm.rcvr_tel2_part2.value+"-"+frm.rcvr_tel2_part3.value;
				}
			}
		}else if(deliCode === "06") {
			//미배송
		}else if(deliCode === "07" || deliCode === "13") {
			//편의점택배
			if(frm.rcvr_name.value === "") {
				resetOrdBtn("수령하실분  이름을 입력해주세요.");
				frm.rcvr_name.focus();
				return;
			}
			if((frm.rcvr_tel1_part1.value === "" || frm.rcvr_tel1_part2.value === "" || frm.rcvr_tel1_part3.value === "") && (frm.rcvr_tel2_part1.value === "" || frm.rcvr_tel2_part2.value === "" || frm.rcvr_tel2_part3.value === "")) {
				resetOrdBtn("받으실분 전화번호나 휴대폰번호를 입력해 주세요");
				return;
			}else {
				if(!(frm.rcvr_tel1_part1.value === "" || frm.rcvr_tel1_part2.value === "" || frm.rcvr_tel1_part3.value === "")) {
					frm.rcvr_tel1.value = frm.rcvr_tel1_part1.value+"-"+frm.rcvr_tel1_part2.value+"-"+frm.rcvr_tel1_part3.value;
				}
				if(!(frm.rcvr_tel2_part1.value === "" || frm.rcvr_tel2_part2.value === "" || frm.rcvr_tel2_part3.value === "")) {
					frm.rcvr_tel2.value = frm.rcvr_tel2_part1.value+"-"+frm.rcvr_tel2_part2.value+"-"+frm.rcvr_tel2_part3.value;
				}
			}
			if(frm.store_code.value === "" || frm.ho_code.value === "" || frm.codeName.value === "") {
				resetOrdBtn("픽업할 편의점이 지정되지 않았습니다. 편의점 선택 버튼을 눌러 픽업할 편의점을 선택해 주시시 바랍니다.");
				return;
			}
		}else {
			resetOrdBtn("배송방법이 잘 못 선택되었습니다. 다시 선택해 주세요.");
			return;
		}
		
		//3.할인정보
		if(ParseInt10(removeComma(frm.cpn_price.value)) > 0 && frm.cpnArray.value === "") {
			resetOrdBtn("쿠폰적용에 오류가 있습니다. 쿠폰을 재 적용 해주세요.");
			return;
		}
		
		//KCP 파라미터 세팅
		frm.buyr_name.value = frm.sndr_name.value;
		frm.buyr_mail.value = frm.sndr_mail.value;
		frm.buyr_tel1.value = frm.sndr_tel1.value;
		frm.buyr_tel2.value = frm.sndr_tel2.value;
		frm.good_name.value = "[도서] 돌이킬 수 없는 약속 외 1종 ";
		
		frm.good_name.value = "[도서] 돌이킬 수 없는...";
		
		
		//4.결제정보
		if(($("#sett_10").is(":checked") || $("#sett_11").is(":checked")) && frm.used_card.value === "") {
			resetOrdBtn("카드를 선택해 주세요.");
			frm.used_card.focus();
			return;
		}
		if($("#sett_15").is(":checked") && frm.setAcName.value === "") {
			resetOrdBtn("입금자성명을 입력해주세요.");
			frm.setAcName.focus();
			return;
		}
        // 5. 현금영수증
        // 소득공제용
        if ($('#cashReceiptDiv').css('display') != 'none' && $('input[name="cashReceiptType"]:checked').val() === '02') {
            // 휴대폰 번호 검증
            if (($("#cashReceiptInfo_part1").val().length < 1) || ($("#cashReceiptInfo_part2").val().length < 1) || ($("#cashReceiptInfo_part3").val().length < 1)) {
                resetOrdBtn("현금영수증 발급 휴대폰 번호를 입력해주세요.");
                $("#cashReceiptInfo_part1").focus();
                return;
            } else {
                $('#cashReceiptInfo').val($('#cashReceiptInfo_part1').val()+'-'+$('#cashReceiptInfo_part2').val()+'-'+$('#cashReceiptInfo_part3').val());
                $('#cashReceiptInfoType').val('');
            }
        // 지출증비용
        } else if ($('#cashReceiptDiv').css('display') != 'none' && $('input[name="cashReceiptType"]:checked').val() === '01') {
            // 휴대폰 번호 검증
	        if ($("#cashReceiptInfoTypeS").val() === '1') {
	            if (($("#cashReceiptInfo1_part1").val().length < 1) || ($("#cashReceiptInfo1_part2").val().length < 1) || ($("#cashReceiptInfo1_part3").val().length < 1)) {
	                resetOrdBtn("현금영수증 발급 휴대폰 번호를 입력해주세요.");
	                $("#cashReceiptInfo1_part1").focus();
	                return;
	            } else {
	            	console.log($('#cashReceiptInfo1_part1').val()+$('#cashReceiptInfo1_part2').val()+$('#cashReceiptInfo1_part3').val())
	                $('#cashReceiptInfo').val($('#cashReceiptInfo1_part1').val()+'-'+$('#cashReceiptInfo1_part2').val()+'-'+$('#cashReceiptInfo1_part3').val());
	            	$('#cashReceiptInfoType').val($("#cashReceiptInfoTypeS").val());
	            }
	        // 사업자 번호 검증
	        } else if ($("#cashReceiptInfoTypeS").val() === '2') {
	        	if (($("#cashReceiptInfo2_part1").val().length < 1) || ($("#cashReceiptInfo2_part2").val().length < 1) || ($("#cashReceiptInfo2_part3").val().length < 1)) {
	                resetOrdBtn("현금영수증 발급 사업자 번호를 입력해주세요.");
	                $("#cashReceiptInfo2_part1").focus();
	                return;
	            } else {
	            	console.log($('#cashReceiptInfo2_part1').val()+$('#cashReceiptInfo2_part2').val()+$('#cashReceiptInfo2_part3').val())
	                $('#cashReceiptInfo').val($('#cashReceiptInfo2_part1').val()+'-'+$('#cashReceiptInfo2_part2').val()+'-'+$('#cashReceiptInfo2_part3').val());
	            	$('#cashReceiptInfoType').val($("#cashReceiptInfoTypeS").val());
	            }
	        } else {
	        }
		// 신청안함
        } else if ($('#cashReceiptDiv').css('display') != 'none' && $('input[name="cashReceiptType"]:checked').val() === '00') {
        	$('#cashReceiptInfo').val('010-000-1234');
            $('#cashReceiptInfoType').val('');
        }
        
		getOrderId();
	}

	function setUsableCard(settleType) {

		var partner = "";
		var cardType = "";
		var onchange = "onchange='javascript:changeCardCode(this);'";
		
		//카드 종류
		if(settleType === "10") {
			if(partner === "137") {
				// 롯데카드몰(137)&롯데카드(CCLO)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCLO'>롯데</option></select>");
			}else if(partner === "148" || (partner === "104" && cardType === "51")) {
				// 삼성카드쇼핑(148)&삼성카드(CCSS)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCSS'>삼성</option></select>");
			}else if(partner === "151") {
				// 신한카드올댓(151)&신한카드(CCLG)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCLG'>신한</option></select>");
			}else if(partner === "380") {
				// 현대카드몰(380)&현대카드(CCDI)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCDI'>현대</option></select>");
			}else if(partner === "158") {
				// 씨티카드몰(158)&씨티카드(CCCT)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCCT'>씨티</option></select>");
			}else if(partner === "172") {
				// KB국민카드(172)&국민카드(CCKM)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCKM'>국민</option></select>");
			}else if(partner === "175") {
				// BC카드라운지(175)&BC카드(CCBC)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCBC'>비씨</option></select>");
			}else if(partner === "173") {
				// 문화누리(173)&NH카드(CCNH)
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCNH'>NH채움</option></select>");
			}else {
				// 해외(CCXX)카드 제외
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCDI'>현대</option><option value='CCLG'>신한</option><option value='CCSS'>삼성</option><option value='CCHN'>하나</option><option value='CCKE'>하나(구 외환)</option><option value='CCLO'>롯데</option><option value='CCKM'>국민</option><option value='CCNH'>NH채움</option><option value='CCBC'>비씨</option><option value='CCPH'>우리</option><option value='CCCT'>씨티</option><option value='CCSU'>수협</option><option value='CCSM'>MG새마을</option><option value='CCCJ'>제주</option><option value='BC81'>하나BC</option><option value='CCJB'>전북</option><option value='CCCU'>신협</option><option value='CCPB'>우체국</option><option value='CCKJ'>광주</option><option value='CCKD'>KDB산은</option><option value='CCSB'>저축</option><option value='CCHS'>KB증권(현대증권)</option><option value='CCKA'>카카오뱅크</option></select>");
			}
		}else if(settleType === "11") {
			if(partner === "137") {
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCLO'>반디앤루니스 롯데카드</option></select>");
			}else if(partner === "148" || partner === "151" || partner === "173" || partner === "158" || partner === "172" || partner === "175") {
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option></select>");
			}else {
				$("#selectCardCode").html("<select name='used_card' "+onchange+"><option value=''>카드사 선택</option><option value='CCPH'>반디앤루니스 우리V카드</option><option value='CCLO'>반디앤루니스 롯데카드</option></select>");
			}
		}
		
		//포인트 사용 초기화
		$("#cardPointCheckbox").prop("checked", false);
		$("#cardPointCheckbox").prop("disabled", true);
		$("#tr_cardPointUse").hide();
	}
	

	//SITE_CD 세팅
	function setMertId() {
		
		var partner = "";
		var cardPointUseYn = $("#cardPointCheckbox").prop("checked");
		var frm = document.frmMain;
		var nonDeductionProdCnt = "0";	//[2018.06 문화비소득공제] 일반 상품 수(0개 이면 소득공제 결제)
		
		/* 순서 바뀌면 안됨 */
		// 모바일 소액결제
 		if($("#sett_20").is(":checked")) {
			frm.site_cd.value = "Y7933";
		// 151 : 신한카드올댓
		}else if(partner === "151") {
			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80EL";
			else 							frm.site_cd.value = "Y7939";
		// 380 : 현대카드몰
		}else if(partner === "380") {
			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80EB";
			else 							frm.site_cd.value = "A79A5";
		/* 순서 바뀌면 안됨 (제휴사 추가는 아래에서..) */
		// 137 : 롯데카드몰
 		}else if(partner === "137") {
 			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80EG";
			else 							frm.site_cd.value = "Y7941";
		// 148 : 삼성카드쇼핑
		}else if(partner === "148") {
			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80EH";
			else 							frm.site_cd.value = "Y7940";
		// 158 : 씨티카드몰
		}else if(partner === "158") {
			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80ED";
			else 							frm.site_cd.value = "Y7944";
		// 172 : KB국민카드
		}else if(partner === "172") {
			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80EF";
			else 							frm.site_cd.value = "Y7942";
		// 173 : 문화누리카드
		}else if(partner === "173") {
			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80EC";
			else 							frm.site_cd.value = "Y7945";
		}else {
			if(nonDeductionProdCnt == 0)	frm.site_cd.value = "A80ES";
			else 							frm.site_cd.value = "Y7931";
		}
		
		orderAlert();
	}

	function getOrderId() {
		//버튼 처리
		var frm = document.frmMain;
		if($("#orderCheck").val() != "1") {
			alert("결제처리 중입니다. 잠시만 기다려 주세요.");
			return;
		}else {
			$("#orderCheck").val("2");
		}
		//주문번호+해쉬값
		$.ajax({
			url: "/ajax/getOrderId.do",
			type: "post",
			dataType: "json",
			success: function(data)	{
				if(data.ordId != "") {
					frm.ordr_idxx.value = data.ordId;
					frm.time_stamp.value = data.ordDtm;
					
					//KCP 에스크로 세팅
					var escrowYn = $("input[name=escrowYn]:checked").val();
					if(escrowYn != null && escrowYn != "" && escrowYn != "undefined"){
						if(escrowYn == "Y" && "01" != "04" && "01" != "03"){
							frm.escw_used.value="Y";
							frm.pay_mod.value="O";
							var chr31 = String.fromCharCode(31);	// ASCII 코드값 31(항목별 구분자)
							// seq(일련번호), ordr_numb(상품주문번호), good_name(상품명), good_cntx(상품수량), good_amtx(상품금액)
							var good_info = "seq=1" + chr31 + "ordr_numb=" + frm.ordr_idxx.value + chr31 + "good_name=" + frm.good_name.value + chr31 + "good_cntx=1" + chr31 + "good_amtx=" + frm.good_mny.value;
							frm.good_info.value = good_info;
						}else {
							frm.escw_used.value="N";
							frm.pay_mod.value="N";
						}
					}
					goOrder();
				}else {
					resetOrdBtn("주문번호가 생성 되지 않았습니다. 다시 시도해 주세요.");
					return;
				}
			},
			error: function(){ resetOrdBtn("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
		});
		
	}

	function lockCost() {
		var frm = document.frmMain;
		//ReadOnly
		frm.reserve_point.readOnly = true;
		frm.disposit_point.readOnly = true;
		frm.conv_point.readOnly = true;
		frm.b2b_point.readOnly = true;
		frm.ezwel_point.readOnly = true;
		frm.ezwel_mileage.readOnly = true;
		frm.ezwel_special_point.readOnly = true;
		frm.benepia_point.readOnly = true;
		frm.e1_point.readOnly = true;
		frm.culture_cash.readOnly = true;
		frm.ocb_point.readOnly = true;
		
		//Disabled
		frm.reserve_point_all.disabled = "disabled";
		frm.disposit_point_all.disabled = "disabled";
		frm.conv_point_all.disabled = "disabled";
		frm.b2b_point_all.disabled = "disabled";
		frm.ezwel_point_all.disabled = "disabled";
		frm.ezwel_mileage_all.disabled = "disabled";
		frm.ezwel_special_point_all.disabled = "disabled";
		frm.btn_OcbCardInfo.disabled = "disabled";
		frm.btn_OcbSaveCardInfo.disabled = "disabled";
		
		//콤마제거
		frm.reserve_point.value = ParseInt10(removeComma(frm.reserve_point.value));
		frm.disposit_point.value = ParseInt10(removeComma(frm.disposit_point.value));
		frm.cpn_price.value = ParseInt10(removeComma(frm.cpn_price.value));
		frm.conv_point.value = ParseInt10(removeComma(frm.conv_point.value));
		frm.b2b_point.value = ParseInt10(removeComma(frm.b2b_point.value));
		frm.ezwel_point.value = ParseInt10(removeComma(frm.ezwel_point.value));
		frm.ezwel_mileage.value = ParseInt10(removeComma(frm.ezwel_mileage.value));
		frm.ezwel_special_point.value = ParseInt10(removeComma(frm.ezwel_special_point.value));
		frm.benepia_point.value = ParseInt10(removeComma(frm.benepia_point.value));
		frm.exanadu_point.value = ParseInt10(removeComma(frm.exanadu_point.value));
		frm.e1_point.value = ParseInt10(removeComma(frm.e1_point.value));
		frm.culture_cash.value = ParseInt10(removeComma(frm.culture_cash.value));
		frm.ocb_point.value = ParseInt10(removeComma(frm.ocb_point.value));
	}

	function unLockCost() {
		var frm = document.frmMain;
		//ReadOnly
		frm.reserve_point.readOnly = false;
		frm.disposit_point.readOnly = false;
		frm.conv_point.readOnly = false;
		frm.b2b_point.readOnly = false;
		frm.ezwel_point.readOnly = false;
		frm.ezwel_mileage.readOnly = false;
		frm.ezwel_special_point.readOnly = false;
		frm.benepia_point.readOnly = false;
		frm.e1_point.readOnly = false;
		frm.culture_cash.readOnly = false;
		frm.ocb_point.readOnly = false;
		
		//Disabled
		frm.reserve_point_all.disabled = "";
		frm.disposit_point_all.disabled = "";
		frm.conv_point_all.disabled = "";
		frm.b2b_point_all.disabled = "";
		frm.ezwel_point_all.disabled = "";
		frm.ezwel_mileage_all.disabled = "";
		frm.ezwel_special_point_all.disabled = "";
		frm.btn_OcbCardInfo.disabled = "";
		frm.btn_OcbSaveCardInfo.disabled = "";		
	}

	function goOrder() {

		var frm = document.frmMain;
		
		if(!($("#sett_50").is(":checked") || $("#sett_15").is(":checked"))) {
			// 카카오페이, payco, 네이버pay, 반디페이
			if($("#sett_12").is(":checked") || $("#sett_14").is(":checked") || $("#sett_68").is(":checked") || $("#sett_70").is(":checked")){
				lockCost();
				document.domain="bandinlunis.com";
				frm.target = "hidorder";
		        frm.action = "https://www.bandinlunis.com/front/order/orderRegSub.do";
		        frm.submit();
			}else{
				if($("#sett_10").is(":checked") || $("#sett_11").is(":checked")){ // 카드
					frm.pay_method.value = "100000000000";
				}
				else if($("#sett_20").is(":checked")){ // 핸드폰
					frm.pay_method.value = "000010000000";
				}
				else if($("#sett_30").is(":checked")){ // 계좌이체
					frm.pay_method.value = "010000000000";
				}
				else if($("#sett_40").is(":checked")){ // 무통장
					frm.pay_method.value = "001000000000";
				}
				else {
					resetOrdBtn("결제방식을 선택해주세요.");
					return;
				}
				lockCost();
				frm.target = "hidorder";
				frm.action="https://www.bandinlunis.com/front/order/orderRegSub.do";
				frm.submit();
			}
		}else {
			lockCost();
			frm.target = "_self";
			frm.action="https://www.bandinlunis.com/front/order/orderReg.do";
			frm.submit();
		}
	}
	
	function numCheck(a, b){
		if(!isNumber(a)){
			alert('숫자만 입력해 주세요.');
			$("input[name="+b+"]").val("");
		}
	}

	function setSettleType() {

		var cartType = "01";
		var partner = "";
		var socialShopping = "false";
		var superDeal = "false";
		var memSeq = '21058516';
		var naverYn = "N";
		var cardType = "";
		
		/* 카드 제휴사 당사카드로만 결제 고정을 위해 휴대폰,계좌이체 무통장 결제를 열지 않는다.
			- 137:롯데카드몰 / 148:삼성카드포인트몰 / 151:신한카드올댓 / 158:씨티카드몰 / 172:KB국민카드 / 173:문화이용권 / 175:BC라운지 / 380:현대카드몰
		*/
		if(partner != "137" && partner != "148" && partner != "151" && partner != "158" && partner != "172" && partner != "173" && partner != "175" && partner != "380"
				&& !(partner ==="104" && cardType ==="51")) {
			$("#span_settleType_10").show();
			$("#span_settleType_11").show();
			$("#span_settleType_12").show();
// 			$("#span_settleType_13").show();
			$("#span_settleType_14").show();
			$("#span_settleType_68").show();
			$("#span_settleType_20").show();
			$("#span_settleType_30").show();
			// 반디페이의 경우 비회원 사용 불가
			if(memSeq != ''){
				$("#span_settleType_70").show();
			}
			
			if(cartType != "04" && superDeal != "true" && socialShopping != "true") {
				//전자책, 소셜쇼핑, 슈퍼딜 구매시 무통장 결제 제한
				$("#span_settleType_40").show();
				$("#span_settleType_15").show();
			}
		}
		
		// 문화누리카드의 경우 신용카드 외에 페이코도 결제수단에 포함 
		if(partner == "173"){
			$("#span_settleType_14").show();
		}
		
		if(naverYn == "Y"){
			$("input[name=settle_type]").prop("disabled", true);
			$("#sett_68").prop("disabled", false);
			$("#sett_68").prop("checked", true);
			settleOpen("68");
			settleInfo("68");	
		}
		
		var frm = document.frmMain;
		var partner_text = "";
		if(partner === "137") {
			partner_text = "롯데카드몰 청구할인 혜택이 적용됩니다.";
		}else if(partner === "151") {
			partner_text = "신한카드몰 청구할인 혜택이 적용됩니다.";
		}else if(partner === "172") {
			partner_text = "KB카드몰 청구할인 혜택이 적용됩니다.";
		}else if(partner === "372") {
			partner_text = "KB카드 모바일몰 청구할인 혜택이 적용됩니다.";
		}
		
		if(partner_text != "") {
			$("#span_partner_text").html(partner_text);
			$("#span_partner_text").show();
		}
		
	}

	function etcCtr() {
		//기타
    }

    function onLoad() {
		var totCnt = "2";
		var isSaleYn = "Y";
		var cartType = "01";
		if(totCnt === 0) {
			alert("구매할수있는 상품이 없습니다.");
			window.location.replace("/");
		}
		else if(cartType != "03" && isSaleYn === "N") {
			alert("판매중지된 상품이 포함되어 있습니다.");
			window.location.replace("/");
		}else {
	    	deliMethodCtr();
	    	deliOpen("");
	    	if(isLogin()) {
		    	changeAddr("");
		    	$("#label_addr_name").text("최근배송지()");
	    	}
	    	orderCalc();
	    	etcCtr();
	    	//getPartnerDcRate();
	    	setSettleType();
	    	
			// 현금영수증 발급 활성화
			if ($('#ezwel_point_tr').css('display') != 'none' 
					|| $('#benepia_point_tr').css('display') != 'none' 
// 이제너두 10월1일에 함, 일단 보류						
					|| $('#exanadu_point_tr').css('display') != 'none'
			) {
				$('#cashReceiptDiv').css('display', 'block');
			} else {
				$('#cashReceiptDiv').css('display', 'none');
			}	    	
		}
    }
 	
	// 현금영수증 관련 보이기/감추기
	function setCashReceiptInfo() {
    	var disposit_point = parseInt($('#disposit_point').val());
    	var conv_point = parseInt($('#conv_point').val());
    	if ($('input[name="settle_type"]:checked').val() === '68' || $('input[name="settle_type"]:checked').val() === '15') {
    		$('#cashReceiptDiv').css('display', 'block');
    	} else if (($('#disposit_point').val().length > 0 && disposit_point > 0) || ($('#conv_point').val().length > 0 && conv_point > 0)) {
    		$('#cashReceiptDiv').css('display', 'block');
    	} else {
    		if ($('#ezwel_point_tr').css('display') != 'none' 
				|| $('#benepia_point_tr').css('display') != 'none' 
// 이제너두 10월1일에 함, 일단 보류				
				|| $('#exanadu_point_tr').css('display') != 'none'
				) {
				$('#cashReceiptDiv').css('display', 'block');
			} else {
				$('#cashReceiptDiv').css('display', 'none');
	        	$('#cashReceiptInfo').val('');
	            $('#cashReceiptInfoType').val('');
			}
    	}
	}    


function jsf__pay() {
	var frm = document.frmMain;
	try {
    	KCP_Pay_Execute( frm ); 
	}
	catch (e){/* IE 에서 결제 정상종료시 throw로 스크립트 종료 */}
} 
// cnspay  를 통해 결제를 시작합니다.
function cnspay() {
	var frm = document.frmMain;
	if($("#sett_12").is(":checked")){ // 카카오페이
        // TO-DO : 가맹점에서 해줘야할 부분(TXN_ID)과 KaKaoPay DLP 호출 API
        // 결과코드가 00(정상처리되었습니다.)
        if(frm.resultCode.value == '00') {
            // TO-DO : 가맹점에서 해줘야할 부분(TXN_ID)과 KaKaoPay DLP 호출 API
            kakaopayDlp.setTxnId(frm.txnId.value);
            kakaopayDlp.setChannelType('WPM', 'TMS');
            kakaopayDlp.addRequestParams({ MOBILE_NUM : '010-5461-0811'});
            kakaopayDlp.callDlp('kakaopay_layer', frm, cnspaySubmit);
            
        } else {
        	resetOrdBtn('[RESULT_CODE] : ' + frm.resultCode.value + '\n[RESULT_MSG] : ' + frm.resultMsg.value);
        }
    }
}

function setTxnId(resultCode,resultMsg,txnId){
	document.getElementById('resultCode').value = resultCode;
    document.getElementById('resultMsg').value = resultMsg;
    document.getElementById('txnId').value = txnId;
    
    cnspay();
    
}

function cnspaySubmit(data){
	var frm = document.frmMain;
    if(data.RESULT_CODE === '00') {
        // 부인방지토큰은 기본적으로 name="NON_REP_TOKEN"인 input박스에 들어가게 되며, 아래와 같은 방법으로 꺼내서 쓸 수도 있다.
        // 해당값은 가군인증을 위해 돌려주는 값으로서, 가맹점과 카카오페이 양측에서 저장하고 있어야 한다.
        // var temp = data.NON_REP_TOKEN;
        frm.target = "";
        frm.action = "/front/order/orderSett.do";
        frm.submit();
        
    } else if(data.RESLUT_CODE === 'KKP_SER_002') {
        // X버튼 눌렀을때의 이벤트 처리 코드 등록
        resetOrdBtn('[RESULT_CODE] : ' + data.RESULT_CODE + '\n[RESULT_MSG] : ' + data.RESULT_MSG);
    } else {
    	resetOrdBtn('[RESULT_CODE] : ' + data.RESULT_CODE + '\n[RESULT_MSG] : ' + data.RESULT_MSG);
    }
        
    }