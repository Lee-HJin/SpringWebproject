<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="/webproject/resources/js/multiCart.js"></script>

<table cellpadding="0" cellspacing="0" class="orderTable">
	<colgroup>
		<col width="55">
		<col>
		<col width="92">
		<col width="92">
		<col width="72">
		<col width="92">
		<col width="90">
		<col width="40">
	</colgroup>
	<tbody>
	 
		<tr>
			<th colspan="2">상품명</th>
			<th>수령예상일</th>
			<th>판매가</th>
			<th>수량</th>
			<th>합계</th>
			<th>담기/삭제</th>   
			<th><input type="checkbox" id="bandiDeduction" class="checkAll"></th>                			
		</tr>
	<c:forEach var="dto" items="${lst }">	
		<tr>
			<td>
				<span class="book_img"><img src="<%=cp %>/resources/image/book/${dto.bookImage }" onerror=""></span> 
			</td>
			<td class="prod_name">
				<span class="block t_14"><a href="<%=cp %>/book_info.action?isbn=${dto.isbn}">[도서]${dto.bookTitle }</a></span>
				<span class="block mt3 t_gr">${dto.authorName } | ${dto.publisher }</span>	
			</td>
			
			<td id="bandi_deli_term_48116888">
				2018년<br>10월 13일(토)
			</td>

			<td>
				<strong><fmt:formatNumber value="${dto.discountedPrice*0.9 }" type="number"/></strong><br>
				(10%<strong class="point_b">↓</strong>)<br>
				(<strong class="point_o">P</strong> ${dto.point }원)
			</td>

			<td>
				<span class="num_c">
					<input type="text" name="cntVal" id="cntVal_${dto.isbn }" value="${dto.orderCount }" class="o_input_num fl_left" size="3" onkeydown="onlyNumber();" onkeyup="cntChange('${dto.isbn}');" style="text-align:right;ime-mode:disabled;">
					<span class="num_c_up"><img src="/webproject/resources/images/searchN/btn_num_up.gif" alt="" onclick="cntUp('${dto.isbn}');" style="cursor:pointer;"></span>
					<span class="num_c_dn"><img src="/webproject/resources/images/searchN/btn_num_down.gif" alt="" onclick="cntDown('${dto.isbn}');" style="cursor:pointer;"></span>
				</span>
				<img src="/webproject/resources/images/searchN/btn_cart_modify.gif" alt="수정" class="mt5" onclick="updateShopCart(${dto.isbn})" style="cursor:pointer;">
			</td>

			<td>
				<strong id="costVal_${dto.seqNum }"><fmt:formatNumber value="${dto.discountedPrice*0.9 }" type="number"/>원</strong>
			</td>  
			         			
			<td>
				<img src="/webproject/resources/images/searchN/btn_cart_wishlist.gif" alt="위시리스트 담기" onclick="add_wish_common('${dto.isbn}');" style="cursor:pointer;"><br>
				<img src="/webproject/resources/images/searchN/btn_cart_del.gif" alt="삭제" class="mt5" onclick="deleteShopCart('${dto.seqNum}')" style="cursor:pointer;">
			</td>
			
			<td>
		        <input type="checkbox" id="checkBox_${dto.seqNum }" name="seqArr3" class="check_bandiDeduction" value="${dto.seqNum }" checked="checked">
   				
   				<input type="hidden" class="storeId_1" value="${dto.seqNum }">
   				<input type="hidden" id="storeIdVal_${dto.seqNum }" value="1">
   				<input type="hidden" id="saleCostVal_${dto.seqNum }" value="${dto.discountedPrice }">
   				<input type="hidden" id="marketSaleVal_${dto.seqNum }" value="${dto.bookPrice }">
   				<input type="hidden" id="prodPointVal_${dto.seqNum }" value="${dto.point }">
   				<input type="hidden" id="deliCostCondiVal_${dto.seqNum }" value="10000">
   				<input type="hidden" id="deliCostVal_${dto.seqNum }" value="2000">
   				<input type="hidden" id="bundleDeliYnVal_${dto.seqNum }" value="Y">
   				<input type="hidden" id="prodIdArr_${dto.seqNum }" name="prodIdArr" value="${dto.isbn }">
   				<input type="hidden" id="prod_name_${dto.seqNum }" name="prod_name" value="${dto.bookTitle }">
   				<input type="hidden" id="optSeqVal_${dto.seqNum }" name="optSeqVal_${dto.seqNum }" value="">
   				<input type="hidden" name="is_sale_yn" value="Y">
   				<input type="hidden" id="prodTypeArr_${dto.seqNum }" name="prodType" value="01">
   				<input type="hidden" id="flag_${dto.seqNum }" value="0">
   				<input type="hidden" id="preSaleYnVal_${dto.seqNum }" value="N">
   				<input type="hidden" id="maxVal_${dto.seqNum }" value="999">
		    </td>
		</tr>
	</c:forEach>	
	</tbody>
</table>
<script type="text/javascript">
$(document).ready(function(){

	$(".checkAll").each(function(){
		this.checked = true;
	});
	
	//OnLoad
	orderCalc();
	prevInfo();
	setInside(1);
	bookselfAlert();
	//해당 역역에 카트에 담긴 상품이 있을경우 화면 노출
	if($(".check_bandiDeduction").size() > 0)	$("#bandi_deduction_list").show();
	if($(".check_bandi").size() > 0)			$("#bandi_list").show();
	if($(".check_store").size() > 0)			$("#store_list").show();

	$(".check_bandiDeduction").click(function(){
		clickCheckBox();
	});
	$(".check_bandi").click(function(){
		clickCheckBox();
	});
	
	$(".check_store").click(function(){
		orderCalc();
		
		var cartType = "01";
		if(cartType === "01"){
			getOrdDeli();
		}
	});

	//전체선택&해제
	$(".checkAll").click(function(){
		if(this.checked) {
			$(".check_"+this.id).prop("checked",true);
		}else {
			$(".check_"+this.id).prop("checked",false);
		}
		orderCalc();
		
		var cartType = "01";
		if(cartType === "03") {
			getPickUpList();
		}else if(cartType === "01"){
			getOrdDeli();
		}
	});

	//북셀프로 주문하기
	$(".btn_bookSelf").click(function(){

		var p_arr = "";
		var cnt = 0;
		var mCnt = 0;

		for(i=0;i<$(".check_"+this.id+":checked").size();i++) {
			if($("#prodTypeArr_"+$(".check_"+this.id+":checked").eq(i).val()).val() === "01") {
				if(cnt > 0) {
					p_arr += ",";
				}
				p_arr += $("#prodIdArr_"+$(".check_"+this.id+":checked").eq(i).val()).val();
				cnt++;
			}else {
				mCnt++;
			}
		}

		if(mCnt > 0) {
			alert("반디앤루니스 도서 상품만 북셀프 주문이 가능합니다.\n(중고, 전집, 음반상품, 뷰티, 묶음상품  불가");
			return;
		}

		if(p_arr == "") {
			alert("상품을 1개 이상 선택해주세요.");
			return;
		}
		
	    bookSelfOrder(p_arr);
	});
	
	//선택상품 삭제
	$(".btn_del").click(function(){

		var p_seqArr = "";
		var cnt = 0;

		for(i=0;i<$(".check_"+this.id+":checked").size();i++) {
			if(cnt > 0) {
				p_seqArr += ",";
			}
			p_seqArr += $(".check_"+this.id+":checked").eq(i).val();
			cnt++;
		}

		if(p_seqArr == "") {
			alert("상품을 1개 이상 선택해주세요.");
			return;
		}
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		deleteShopCartArray(p_seqArr);
	});

	//추천Inside - Prve
	$("#btn_insidePrev").click(function(){
		var insideIdx = $("#insideIdx").text();
		var insideMax = $("#insideMax").text();
		if(insideIdx != 1 || insideMax != 1) {
			if(insideIdx == 1) {
				insideIdx = insideMax;
			}else {
				insideIdx--;
			}
			$("#insideIdx").text(insideIdx);
			setInside(insideIdx);
		}
	});

	//추천Inside - Next
	$("#btn_insideNext").click(function(){
		var insideIdx = $("#insideIdx").text();
		var insideMax = $("#insideMax").text();
		if(insideIdx != 1 || insideMax != 1) {
			if(insideIdx == insideMax) {
				insideIdx = 1;
			}else {
				insideIdx++;
			}
			$("#insideIdx").text(insideIdx);
			setInside(insideIdx);
		}
	});
	
	$(".btn_cosmetic_view").click(function(){
		$(".recomm_cosmetic").addClass("recomm_cosmetic_fixed");
		$(".cart_mask").show();
	});
	$(".btn_gift_view").click(function(){
		$(".recomm_gift").addClass("recomm_gift_fixed");
		$(".cart_mask").show();
	});
	$(".recomm_cosmetic .btn_w_comm").click(function(){
		$(".recomm_cosmetic").removeClass("recomm_cosmetic_fixed");
		$(".cart_mask").hide();
	});
	$(".recomm_gift .btn_w_comm").click(function(){
		$(".recomm_gift").removeClass("recomm_gift_fixed");
		$(".cart_mask").hide();
	});
	$(".cart_mask").click(function(){
		$(".recomm_cosmetic").removeClass("recomm_cosmetic_fixed");
		$(".recomm_gift").removeClass("recomm_gift_fixed");
		$(".cart_mask").hide();
	});

	//MD추천 화장품 - Prve
	$("#btn_cosPrev").click(function(){
		var cosIdx = $("#cosIdx").val();
		var cosMax = $("#cosMax").val();
		if(cosIdx != 1 || cosMax != 1) {
			if(cosIdx == 1) {
				cosIdx = cosMax;
			}else {
				cosIdx--;
			}
			$(".mdCosList>li").hide();
			for(i=0;i<5;i++) {
				$(".mdCosList>li").eq((cosIdx-1)*5+i).show();
			}
			$("#cosIdx").val(cosIdx);
		}
	});

	//MD추천 화장품 - Next
	$("#btn_cosNext").click(function(){
		var cosIdx = $("#cosIdx").val();
		var cosMax = $("#cosMax").val();
		if(cosIdx != 1 || cosMax != 1) {
			if(cosIdx == cosMax) {
				cosIdx = 1;
			}else {
				cosIdx++;
			}
			$(".mdCosList>li").hide();
			for(i=0;i<5;i++) {
				$(".mdCosList>li").eq((cosIdx-1)*5+i).show();
			}
			$("#cosIdx").val(cosIdx);
		}
	});
	
	//MD추천 GIFT - Prve
	$("#btn_giftPrev").click(function(){
		var giftIdx = $("#giftIdx").val();
		var giftMax = $("#giftMax").val();
		if(giftIdx != 1 || giftMax != 1) {
			if(giftIdx == 1) {
				giftIdx = giftMax;
			}else {
				giftIdx--;
			}
			$(".mdMusicList>li").hide();
			for(i=0;i<5;i++) {
				$(".mdMusicList>li").eq((giftIdx-1)*5+i).show();
			}
			$("#giftIdx").val(giftIdx);
		}
	});

	//MD추천 GIFT - Next
	$("#btn_giftNext").click(function(){
		var giftIdx = $("#giftIdx").val();
		var giftMax = $("#giftMax").val();
		if(giftIdx != 1 || giftMax != 1) {
			if(giftIdx == giftMax) {
				giftIdx = 1;
			}else {
				giftIdx++;
			}
			$(".mdMusicList>li").hide();
			for(i=0;i<5;i++) {
				$(".mdMusicList>li").eq((giftIdx-1)*5+i).show();
			}
			$("#giftIdx").val(giftIdx);
		}
	});
	
	//위시리스트 - Prve
	$("#btn_wishPrev").click(function(){
		var wishIdx = $("#wishIdx").text();
		var wishMax = $("#wishMax").text();
		if(wishIdx != 1 || wishMax != 1) {
			if(wishIdx == 1) {
				wishIdx = wishMax;
			}else {
				wishIdx--;
			}
			$(".cart_wl>li").hide();
			for(i=0;i<9;i++) {
				$(".cart_wl>li").eq((wishIdx-1)*9+i).show();
			}
			$("#wishIdx").text(wishIdx);
		}
	});

	//위시리스트 - Next
	$("#btn_wishNext").click(function(){
		var wishIdx = $("#wishIdx").text();
		var wishMax = $("#wishMax").text();
		if(wishIdx != 1 || wishMax != 1) {
			if(wishIdx == wishMax) {
				wishIdx = 1;
			}else {
				wishIdx++;
			}
			$(".cart_wl>li").hide();
			for(i=0;i<9;i++) {
				$(".cart_wl>li").eq((wishIdx-1)*9+i).show();
			}
			$("#wishIdx").text(wishIdx);
		}
	});

	//주문하기
	$("#btn_order").click(function(){

		var userAgent   = navigator.userAgent;
		
		if(userAgent.indexOf("Android") == -1 && userAgent.indexOf("iPhone") == -1 && userAgent.indexOf("iPod") == -1 && userAgent.indexOf("iPad") == -1) {
			// LGU+ 결제모듈에 Non ActiveX 방식이 적용으로 인해 브라우저 제한 해제
			if(userAgent.indexOf("Firefox") > -1 && false) {
				alert("파이어폭스에서는 주문이 불가능합니다.");
				return false;
			}
			// LGU+ 결제모듈에 Non ActiveX 방식이 적용으로 인해 브라우저 제한 해제
			if(userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1 && false) {
				alert("사파리에서는 주문이 불가능합니다.");
				return;
			}
		}
		
		var cartType = "01";	//전역변수

		if($("#bookSelfAlertYn").val() === "Y") {
			$("#bookSelfAlertLayer_2").show();
		}
		 //EBOOK 상품 유효성 체크
		else if(cartType === "04"){
			
			var objBox = new Array();
			
			var objbox3 = document.getElementsByName("seqArr3");
			var objBox1 = document.getElementsByName("seqArr1");
			var objbox2 = document.getElementsByName("seqArr2");
			
			for(j=0;j<objbox3.length;j++) {
				objBox.push(objbox3[j]);			
			}			
			for(k=0;k<objBox1.length;k++) {
				objBox.push(objBox1[k]);			
			}
			for(j=0;j<objbox2.length;j++) {
				objBox.push(objbox2[j]);			
			}
			
			var prodIdList = new Array();
			var ebookCodeList = new Array();
			var prodId = "";
			
			for(i=0;i<objBox.length;i++) {
			 if(objBox[i].checked) {
			   	prodId = document.getElementById("prodIdArr_"+objBox[i].value).value;
			   	ebookCode = document.getElementById("ebookCodeArr_"+objBox[i].value).value;
			   	prodIdList.push(prodId);
			   	ebookCodeList.push(ebookCode);
			  }
			}
			
			if(prodId == "") {
				alert("상품을 1개 이상 선택해주세요.");
				return;
			}
			
			$.ajaxSettings.traditional = true;
 			$.ajax({
				url: "/ajax/getEbookShoppingCartCheck.do",
				type: "post",
				data: {"prodIdList":prodIdList , "ebookCodeList":ebookCodeList},
					success: function(data){ 
						var checkNum = data.trim();
						if(checkNum == -1){
							alert("같은 상품은 주문 불가능합니다.(대여/일반)");
						}else{
							orderProc();
						}
					},
						error: function(){ 
							alert("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); 
					}
				});  
			}
		else {
			//크레마 샤인 12개월 무이자 처리
				var objBox = new Array();
			
				var objbox3 = document.getElementsByName("seqArr3");
				var objBox1 = document.getElementsByName("seqArr1");
				var objbox2 = document.getElementsByName("seqArr2");
				
				for(k=0;k<objBox1.length;k++) {
					objBox.push(objBox1[k]);			
				}
				for(j=0;j<objbox2.length;j++) {
					objBox.push(objbox2[j]);			
				}
				for(j=0;j<objbox3.length;j++) {
					objBox.push(objbox3[j]);			
				}
		
				var prodId = "";
				var cremaProd = "";
				var cremaCnt = 0;
				var anotherCnt = 0;
		
			for(i=0;i<objBox.length;i++) {
			 if(objBox[i].checked) {
			   	prodId = document.getElementById("prodIdArr_"+objBox[i].value).value;
				if(prodId === "3657551" || prodId === "3657554") {
					cremaCnt++;
					cremaProd += "<p class='mb5 musicWon'>[GIFT]"+document.getElementById('prod_name_'+objBox[i].value).value+"</p>";
				}else {
					anotherCnt++;
				}
			  }
			}
			if(cremaCnt>0 && anotherCnt>0) {
				document.getElementById("laypop_crema_prod").innerHTML = cremaProd;
				document.getElementById("laypop_crema").style.display = "block";
			}else {
				orderProc();
			}
			//크레마 샤인 12개월 무이자 처리 end.
			
			//orderProc();
		}
		
	});

});
	
	function getOrdDeli( seq ){
		var zipCode = '';
		
		if(seq != null && seq != ''){
			var bandiYn = $("#checkBox_"+seq).attr("name");
			//반디앤루니스 상품만 수령예상일 조회
			if(bandiYn == "seqArr1"){
				var prodId = $("#prodIdArr_"+seq).val();
				var prodCnt = $("#cntVal_"+seq).val();
				var preSaleYn = $("#preSaleYnVal_"+seq).val();
				
				ajaxRequest("getOrdDeliExpect", {"prod_id":prodId, "ord_cnt":prodCnt, "zipCode":zipCode}, function (data) {
					// 정상판매가 아니거나 재고기준판매인데 재고가 없는 경우는 제외
					if($("#bandi_deli_term_"+seq).text().replace(/\s/g,'') != '-'){
						var deliTermMsg = data.substring(0,5)+"<br>"+data.substring(6,16);
						if(preSaleYn == "Y"){
							deliTermMsg += " 이후";
						}
						$("#bandi_deli_term_"+seq).html(deliTermMsg);
					}
				});
			}
		}
		
		var preSaleYnAll = "N";
		var prodIds = "";
		var prodCnts = "";
		
		var objBox1 = document.getElementsByName("seqArr1");
		for(i=0;i<objBox1.length;i++) {
			if(objBox1[i].checked) {
				// 정상판매인 상품이 하나라도 있는 경우에 배송예정일 노출
				if($("#bandi_deli_term_"+objBox1[i].value).text().replace(/\s/g,'') == '-'){
					continue;
				}
				
				prodIds += document.getElementById("prodIdArr_"+objBox1[i].value).value + ',';
				prodCnts += document.getElementById("cntVal_"+objBox1[i].value).value + ',';
				
				// 하나라도 예약 상품이 있는 경우 "이후"를 붙여준다. 
				if($("#preSaleYnVal_"+objBox1[i].value).val() == "Y"){
					preSaleYnAll = "Y";
				}
			}
		}
		
		if(prodIds != null && prodIds != ""){
			ajaxRequest("getOrdDeliExpect", {"prod_id_ally":prodIds, "cnt_ally":prodCnts, "zipCode":zipCode}, function (data) {
				if(preSaleYnAll == "Y"){
					data += " 이후";
				}
				$("#bandi_total_deli").show();
				$("#bandi_total_deli").html('반디배송상품 <span class="t_red">['+data+']</span>');
				
			});
		}else {
			$("#bandi_total_deli").hide();
		}
		
		var maxDeliTerm = 0;
		var storeDeliTermTxt = "";
		
		var objBox2 = document.getElementsByName("seqArr2");
		for(i=0;i<objBox2.length;i++) {
			if(objBox2[i].checked) {
				// 업체상품의 경우 기존 체크하는 방식 그대로 확인
				var deliTerm = Number(document.getElementById("deliTerm_"+objBox2[i].value).value);
				if(deliTerm > maxDeliTerm){
					maxDeliTerm = deliTerm;
				}
				var deliTermTxt = document.getElementById("deliTermTxt_"+objBox2[i].value).value;
				if($("#preSaleYnVal_"+objBox2[i].value).val() == "Y" && deliTermTxt > storeDeliTermTxt){
					storeDeliTermTxt = deliTermTxt;
				}
			}
		}
		
		if(maxDeliTerm > 0){
			var store_total_deli = "업체배송상품 <span class=\"t_red\">[";
			if(storeDeliTermTxt != null && storeDeliTermTxt != ""){
				store_total_deli += storeDeliTermTxt; 
			} else {
				store_total_deli += (maxDeliTerm + 1)+"일 이내";
			}
			store_total_deli += "]</span>";
			$("#store_total_deli").show();
			$("#store_total_deli").html(store_total_deli);
		}else {
			$("#store_total_deli").hide();
		}
	}
	
	//크레마 샤인 12개월 무이자 처리
	function orderCrema() {
		
		var objBox = new Array();
		
		var objbox3 = document.getElementsByName("seqArr3");
		var objBox1 = document.getElementsByName("seqArr1");
		var objbox2 = document.getElementsByName("seqArr2");
		
		for(j=0;j<objbox3.length;j++) {
			objBox.push(objbox3[j]);			
		}
		for(k=0;k<objBox1.length;k++) {
			objBox.push(objBox1[k]);			
		}
		for(j=0;j<objbox2.length;j++) {
			objBox.push(objbox2[j]);			
		}
		
		var prodId = "";
		var cremaCnt = 0;
		var anotherCnt = 0;
		for(i=0;i<objBox.length;i++) {
			if(objBox[i].checked) {
				prodId = document.getElementById("prodIdArr_"+objBox[i].value).value;
				if(prodId === "3657551" || prodId === "3657554") {
					objBox[i].checked = true;
				}else {
					objBox[i].checked = false;
				}
			}
		}
		orderProc();
	}

	var cartType = "01";	//전역변수

	function wndReload(cnt){
		alert('쇼핑카트에 상품이 추가되었습니다.');
	    window.location.reload();
	}

	function setInside(val) {
		if(cartType === "01") {
			$(".inside_book dl").hide();
			$("#BOOKCART_1_"+val).show();
			
		}
	}

	function deleteShopCart(p_seq) {
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}

		// 업체에 해당하는 상점 목록 가져오기
		var param = {seq:p_seq};
		OrderDwr.deleteShopCart(param,
			function (val) {
				if(val==0) {
					window.location.reload();
				}else {
					alert("오류사항이 발견되었습니다, 관리자에게 문의해 주세요.");
				}
			}
		);
	}

	function deleteShopCartArray(p_seqArr) {
		var param = {seqArr:p_seqArr};
		OrderDwr.deleteShopCart(param,
			function (val) {
				if(val==0) {
					window.location.reload();
				}else {
					alert("오류사항이 발견되었습니다, 관리자에게 문의해 주세요.");
				}
			}
		);
	}

	function array_interest(type) {
		add_wish_array(document.getElementsByName("seqArr"+type),document.getElementsByName("prodIdArr"));
	}
	
	function getPickUpList(seq){
		// 수량 변경 시에 해당 상품의 가능매장 가져오기
		if(seq != null && seq != ''){
			var prodId = document.getElementById("prodIdArr_"+seq).value;
			var prodCnt = document.getElementById("cntVal_"+seq).value;
			
			$.ajax({
				url: "/ajax/getPickUpListAjax.do",
				type: "post",
				data: {"prodIds":prodId, "prodCnts":prodCnt},
				dataType: "json",
				success: function(data){
					var pickUpList = "";
					if(data != null && data.length > 0){
						$.each(data, function(){
							pickUpList += this.guname + ',';
						});
						pickUpList = pickUpList.substring(0, pickUpList.length - 1);
					}else {
						pickUpList += "<font color=\"red\">없음</font>";
					}
					$("#bandi_deli_term_"+seq).html(pickUpList);
				},
				error: function(){ alert("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
			});
		}
		
		// 선택된 상품 전체에 대한 가능매장 가져오기
		var prodIds = "";
		var prodCnts = "";
		
		var objBox = new Array();
		
		var objbox3 = document.getElementsByName("seqArr3");
		var objBox1 = document.getElementsByName("seqArr1");
		var objbox2 = document.getElementsByName("seqArr2");
		
		for(j=0;j<objbox3.length;j++) {
			objBox.push(objbox3[j]);			
		}
		for(k=0;k<objBox1.length;k++) {
			objBox.push(objBox1[k]);			
		}
		for(j=0;j<objbox2.length;j++) {
			objBox.push(objbox2[j]);			
		}
		
		for(i=0;i<objBox.length;i++) {
			if(objBox[i].checked) {
				prodIds += document.getElementById("prodIdArr_"+objBox[i].value).value + ',';
				prodCnts += document.getElementById("cntVal_"+objBox[i].value).value + ',';
			}
		}
		$.ajax({
			url: "/ajax/getPickUpListAjax.do",
			type: "post",
			data: {"prodIds":prodIds, "prodCnts":prodCnts},
			dataType: "json",
			success: function(data){
				var pickUpTime = "";
				var selectPickUp = "<option value=\"\">수령매장을 선택하세요</option>";
				var pickUpAll = "";
				if(data != null && data.length > 0){
					$.each(data, function(){
						selectPickUp += "<option value=\""+this.gu+"\" id="+this.min_qty+"\">"+this.guname+"</option>";
						pickUpAll += "<li class=\"dot_comm\">"+this.guname+"<input type=\"hidden\" id=\"shelfTel_"+this.gu+"\" value=\""+this.shelf_tel+"\"/></li>";
						pickUpTime = this.pickUpTime;
					});
					$("#pickUpWay").show();
					$("#pickUpTime1").text(pickUpTime+'까지');
					$("#pickUpTime2").text(pickUpTime+' 이후');
					
				}else {
					selectPickUp += "<option value=\"\">없음</option>";
					pickUpAll = "없음";
					$("#pickUpWay").hide();
				}
				$("#selectPickUp").html(selectPickUp);
				$("#pickUpAll").html(pickUpAll);
			},
			error: function(){ alert("네트워크가 불안정합니다. 잠시 후 다시 시도해주세요."); }
		});
	}

	function updateShopCart(p_seq) {
		var p_ord_cnt = document.getElementById("cntVal_"+p_seq).value;
		var param = {ord_cnt:p_ord_cnt,seq:p_seq};
		OrderDwr.updateShopCart(param,
			function (val) {
				if(val==0) {
					if(cartType === "03") {
						window.location.reload();
					}else {
						alert("수정하였습니다.");
					}
				}else {
					alert("오류사항이 발견되었습니다, 관리자에게 문의해 주세요.");
				}
			}
		);
	}

	function bookSelfOrder(p_arr) {

		var tmpArr  = p_arr.split(",");
		var resultArr   = Array();
		var cntArr      = Array();
		for(var i=0 ; i < tmpArr.length ; i++) {
			resultArr.push(" ");
			cntArr.push(1);
		}

		ajaxRequest("createShopCarts", {
			"prod_id"       : p_arr,
			"opt_seq"       : resultArr.join(","),
			"cnt"           : cntArr.join(","),
			"book_mem_id"   : resultArr.join(","),
			"cart_type"  	: "03"
			},
			function(cnt) {
				if(cnt == -10) {
					alert("옵션이 있는 상품은 상품상세에서 옵션을 선택해 주시기 바랍니다.");
					return;
				}
				if(cnt == -20) {
					alert("연령제한이 적용되어 있는 상품입니다.");
					return;
				}
                if(cnt == -90){
                	alert("연령제한이 적용된 상품은 로그인 후 이용가능합니다.");
                	resLoginPage();
            	    return;
                }
                if(cnt == -99){
                	alert("19세 이상 상품 이용가능한 상품으로 본인인증 후 이용가능합니다.");
                	resAdultCertPage();
            	    return;
                }
				if(cnt >= 0) {
					location.href = "/front/order/shopCartList.do?cartType=03";
				}
			}
		);
	}	

	//카운트 증가
	function cntUp(val) {
		var seqBox = parseInt(document.getElementById("cntVal_"+val).value);
		var maxBox = 0;
		if(document.getElementById("maxVal_"+val).value != null && document.getElementById("maxVal_"+val).value != "") {
			maxBox = parseInt(document.getElementById("maxVal_"+val).value);
		}
		if(maxBox != 0 && seqBox == maxBox) { // 최대수량이 없으면 무제한
			alert("최대 수량입니다.");
			return;
		}
		document.getElementById("cntVal_"+val).value = seqBox+1;
		document.getElementById("costVal_"+val).innerHTML = FormatNumber3(document.getElementById("cntVal_"+val).value * document.getElementById("saleCostVal_"+val).value)+"원";
		orderCalc();
		if(cartType === "03") {
			getPickUpList(val);
		}else {
			getOrdDeli(val);
		}
	}

	//카운트 감소
	function cntDown(val) {
		var seqBox = parseInt(document.getElementById("cntVal_"+val).value);
		if(seqBox <= 1) {
			alert("최소 수량입니다.");
			return;
		}
		document.getElementById("cntVal_"+val).value = seqBox-1;
		document.getElementById("costVal_"+val).innerHTML = FormatNumber3(document.getElementById("cntVal_"+val).value * document.getElementById("saleCostVal_"+val).value)+"원";
		orderCalc();
		if(cartType === "03") {
			getPickUpList(val);
		}else {
			getOrdDeli(val);
		}
	}

	//카운트 변화
	function cntChange(val) {
		var seqBox = parseInt(document.getElementById("cntVal_"+val).value);
		var maxBox = 0;
		
		if(!isNaN(seqBox)) {
			if(document.getElementById("maxVal_"+val).value != null && document.getElementById("maxVal_"+val).value != "") {
				maxBox = parseInt(document.getElementById("maxVal_"+val).value);
			}
			if(maxBox != 0 && seqBox > maxBox) {
				alert("최대 수량을 초과 하였습니다.");
				document.getElementById("cntVal_"+val).value = maxBox;
				return;
			}

			if(seqBox < 1) {
				alert("최소 수량은 1 입니다.");
				document.getElementById("cntVal_"+val).value = 1;
				seqBox =1;
			}
			document.getElementById("costVal_"+val).innerHTML = FormatNumber3(document.getElementById("cntVal_"+val).value * document.getElementById("saleCostVal_"+val).value)+"원";
			orderCalc();
			if(cartType === "03") {
				getPickUpList(val);
			} else {
				getOrdDeli(val);
			}
		}
	}	

	//체크박스 선택시 액션
	function clickCheckBox() {
		orderCalc();
		
		var cartType = "01";
		if(cartType === "03") {
			getPickUpList();
		}else if(cartType === "01"){
			getOrdDeli();
		}
	}
	
	//금액 계산
	function orderCalc() {

		var bookCnt = 0;
		var giftCnt = 0;
		var bandiGiftCnt = 0;
		var storeCost=0;

		/* 소득공제상품 */
		var bandiDeductionTotCnt = 0;
		var bandiDeductionTotProdCnt = 0;
		var bandiDeductionTotMarketSale = 0;
		var bandiDeductionTotSaleCost = 0;
		var bandiDeductionTotDeliCost = 0;
		var bandiDeductionTotOrdCost = 0;
		var bandiDeductionTotPoint = 0;
		
		bandiDeductionTotCnt = $(".check_bandiDeduction:checked").size();
		for(i=0;i<bandiDeductionTotCnt;i++) {
			var seq = $(".check_bandiDeduction:checked").eq(i).val();
			var cnt = parseInt($("#cntVal_"+seq).val(),10);
			bandiDeductionTotProdCnt += cnt;
			bandiDeductionTotMarketSale += parseInt($("#marketSaleVal_"+seq).val(),10) * cnt;
			bandiDeductionTotSaleCost += parseInt($("#saleCostVal_"+seq).val(),10) * cnt;
			bandiDeductionTotPoint += parseInt($("#prodPointVal_"+seq).val(),10) * cnt;
			
			// 도서정가제 상품을 제외한 상품들의 수
			giftCnt += $("#flag_"+seq).val();
			
			// 도서정가제 상품을 제외한 상품들의 수(반디앤루니스 상품만 체크)
			bandiGiftCnt += $("#flag_"+seq).val();
			
			if($("#prodTypeArr_"+seq).val() == "01"
				|| $("#prodTypeArr_"+seq).val() == "02"){
				bookCnt = bookCnt+1;
			}
		}
		
		bandiDeductionTotDeliCost = bandiDeliCostCalc("bandiDeduction", bandiDeductionTotSaleCost, bookCnt);
		bandiDeductionTotOrdCost = bandiDeductionTotSaleCost + bandiDeductionTotDeliCost;
		
		$("#bandiDeduction_totOrdCnt").text("수량: "+(bandiDeductionTotCnt)+"종("+(bandiDeductionTotProdCnt)+"개)");
		$("#bandiDeduction_totSaleCost").text(FormatNumber3(bandiDeductionTotSaleCost));
		$("#bandiDeduction_totDeliCost").text(FormatNumber3(bandiDeductionTotDeliCost));
		$("#bandiDeduction_totOrdCost").text(FormatNumber3(bandiDeductionTotOrdCost));
		$("#bandiDeduction_totPoint").text(FormatNumber3(bandiDeductionTotPoint));
		$("#pop_deduction_price").html(FormatNumber3(bandiDeductionTotOrdCost)+"원");
		
		
		/* 반디배송 상품 */
		var bandiTotCnt = 0;
		var bandiTotProdCnt = 0;
		var bandiTotMarketSale = 0;
		var bandiTotSaleCost = 0;
		var bandiTotDeliCost = 0;
		var bandiTotOrdCost = 0;
		var bandiTotPoint = 0;
		
		bandiTotCnt = $(".check_bandi:checked").size();
		for(i=0;i<bandiTotCnt;i++) {
			var seq = $(".check_bandi:checked").eq(i).val();
			var cnt = parseInt($("#cntVal_"+seq).val(),10);
			bandiTotProdCnt += cnt;
			bandiTotMarketSale += parseInt($("#marketSaleVal_"+seq).val(),10) * cnt;
			bandiTotSaleCost += parseInt($("#saleCostVal_"+seq).val(),10) * cnt;
			bandiTotPoint += parseInt($("#prodPointVal_"+seq).val(),10) * cnt;
			
			// 도서정가제 상품을 제외한 상품들의 수
			giftCnt += $("#flag_"+seq).val();
			
			// 도서정가제 상품을 제외한 상품들의 수(반디앤루니스 상품만 체크)
			bandiGiftCnt += $("#flag_"+seq).val();
			
			if($("#prodTypeArr_"+seq).val() == "01"
				|| $("#prodTypeArr_"+seq).val() == "02"){
				bookCnt = bookCnt+1;
			}
		}

		bandiTotDeliCost = bandiDeliCostCalc("bandi", bandiTotSaleCost, bookCnt);
		bandiTotOrdCost = bandiTotSaleCost + bandiTotDeliCost;
		
		$("#bandi_totOrdCnt").text("수량: "+(bandiTotCnt)+"종("+(bandiTotProdCnt)+"개)");
		$("#bandi_totSaleCost").text(FormatNumber3(bandiTotSaleCost));
		$("#bandi_totDeliCost").text(FormatNumber3(bandiTotDeliCost));
		$("#bandi_totOrdCost").text(FormatNumber3(bandiTotOrdCost));
		$("#bandi_totPoint").text(FormatNumber3(bandiTotPoint));


		/* 입점상품 */
		var storeTotCnt = 0;
		var storeTotProdCnt = 0;
		var storeTotMarketSale = 0;
		var storeTotSaleCost = 0;
		var storeTotDeliCost = 0;
		var storeTotOrdCost = 0;
		var storeTotPoint = 0;

		if(cartType === "01") {
			storeTotCnt = $(".check_store:checked").size();
	
			for(i=0;i<storeTotCnt;i++) {
				var seq = $(".check_store:checked").eq(i).val();
				var cnt = parseInt($("#cntVal_"+seq).val(),10);
				storeTotProdCnt += cnt;
				storeTotMarketSale += parseInt($("#marketSaleVal_"+seq).val(),10) * cnt;
				storeTotSaleCost += parseInt($("#saleCostVal_"+seq).val(),10) * cnt;
				storeTotPoint += parseInt($("#prodPointVal_"+seq).val(),10) * cnt;
				
				// 도서정가제 상품을 제외한 상품들의 수
				giftCnt += $("#flag_"+seq).val();
				
				if($("#storeIdVal_"+seq).val() != "1"){
					storeCost = storeCost + parseInt($("#saleCostVal_"+seq).val(),10) * cnt;
				}
			}
	
			storeTotDeliCost = storeDeliCostCalc();
			storeTotOrdCost = storeTotSaleCost + storeTotDeliCost;
	
			$("#store_totOrdCnt").text("수량: "+storeTotCnt+"종("+storeTotProdCnt+"개)");
			$("#store_totSaleCost").text(FormatNumber3(storeTotSaleCost));
			$("#store_totDeliCost").text(FormatNumber3(storeTotDeliCost));
			$("#store_totOrdCost").text(FormatNumber3(storeTotOrdCost));
			$("#store_totPoint").text(FormatNumber3(storeTotPoint));		
		}

		/* 합계 */
		$("#totOrdCnt").text((bandiDeductionTotCnt+bandiTotCnt+storeTotCnt)+"종("+(bandiDeductionTotProdCnt+bandiTotProdCnt+storeTotProdCnt)+"개)");
		$("#totMarketSale").text(FormatNumber3(bandiDeductionTotMarketSale+bandiTotMarketSale+storeTotMarketSale));
		$("#totDiscountCost").text(FormatNumber3((bandiDeductionTotMarketSale+bandiTotMarketSale+storeTotMarketSale)-(bandiDeductionTotSaleCost+bandiTotSaleCost+storeTotSaleCost)));
		$("#totDeliCost").text(FormatNumber3(bandiDeductionTotDeliCost+bandiTotDeliCost+storeTotDeliCost));
		$("#totOrdCost").text(FormatNumber3(bandiDeductionTotOrdCost+bandiTotOrdCost+storeTotOrdCost));
		
		//[2018.06 문화비소득공제] 2회 주문결제 안내 레이어 내 일반상품 금액합
		$("#pop_non_deduction_price").html(FormatNumber3(bandiTotOrdCost+storeTotOrdCost)+"원");
		
		var extAddPoint = 0;
		var extGradeText = "";
		var extGradePoint = 0;
		var extPartner = "";
		var extPartnerPoint = 0;
		var extPointTxt = "";
		var pointTxt = "";
		if(giftCnt > 0){
			if(bandiGiftCnt > 0){
				if((bandiTotSaleCost + storeTotSaleCost - storeCost) >= 50000){
					extAddPoint = 2000;
				}
			}
			if(extGradeText == "실버루니"){
				extGradeText = "실버루니 멤버십(1%)";
				extGradePoint = Math.round((bandiTotOrdCost+storeTotOrdCost)*0.01);
			}else if(extGradeText == "골드루니"){
				extGradeText = "골드루니 멤버십(2%)";
				extGradePoint = Math.round((bandiTotOrdCost+storeTotOrdCost)*0.02);
			}else if(extGradeText == "슈퍼루니"){
				extGradeText = "슈퍼루니 멤버십(3%)";
				extGradePoint = Math.round((bandiTotOrdCost+storeTotOrdCost)*0.03);
			}
			if(extPartner == "200" || extPartner == "201"){
				extPartnerPoint = Math.round((bandiTotOrdCost+storeTotOrdCost)*0.02);
			}
			
			extPointTxt = "(상품적립금: <strong>"+FormatNumber3(bandiTotPoint+storeTotPoint)+"원</strong>";
			
			if(extAddPoint > 0) {
				extPointTxt += " + 5만원이상 추가적립금: <strong>"+FormatNumber3(extAddPoint)+"원</strong>" + 
							   "<a href=\"javascript:popLayer('addPointInfo')\"><img src=\"/images/order/btn_layerinfo_comm.gif\" class=\"al_middle\"></a>";
			}
			if(extGradePoint > 0) {
				extPointTxt += " + "+extGradeText+": <strong>"+FormatNumber3(extGradePoint)+"원</strong>";
			}
			if(extPartnerPoint > 0) {
				if(extPartner == "200"){
					extPointTxt += " + 즐겨찾기2%: <strong>";
				}else{
					extPointTxt += " + 바로온2%: <strong>";
				}
				extPointTxt += FormatNumber3(extPartnerPoint)+"원</strong>";
			}
			extPointTxt += ")";
			
			pointTxt = "최대 "+FormatNumber3(bandiTotPoint+storeTotPoint+extAddPoint+extGradePoint+extPartnerPoint)+"원";
		}else{
			pointTxt = "상품적립금 "+FormatNumber3(bandiTotPoint+storeTotPoint)+"원";
		}
		
		$("#totPoint").text(pointTxt);
		$("#extTotPoint").html(extPointTxt);
	}

	//상점별 주문금액 합계
	function getStoreSum(storeId) {

		var ordCost = 0;
		var cnt = $(".storeId_"+storeId).size();
		
		for(j=0;j<cnt;j++) {
			
			var seq = $(".storeId_"+storeId).eq(j).val();

			if($("#checkBox_"+seq).prop("checked")) {
				
				var bundleDeliYn = $("#bundleDeliYnVal_"+seq).val();
				var saleCost = parseInt($("#saleCostVal_"+seq).val(),10);
				var ordCnt = parseInt($("#cntVal_"+seq).val(),10);
	
				if(bundleDeliYn === "Y") {
					ordCost += saleCost * ordCnt;
				}
			}
		}
		
		return ordCost;
	}

	function bandiDeliCostCalc(type, totSaleCost, bookCnt) {
		
		var retDeliCost = 0;
		var retDeliCostY = 0;
		var retDeliCostN = 0;
		var bundleDeliFreeFlag = false;
		
		
		if(cartType === "01") {	//일반카트만 배송비 계산

			if(totSaleCost < 30000) {	//속도 개선을 위해 약식 계산
				
				var cnt = $(".check_"+type+":checked").size();
				var prevStoreId = 0;
	
				for(i=0;i<cnt;i++) {
					var seq = $(".check_"+type+":checked").eq(i).val();
					
					var bundleDeliYn = $("#bundleDeliYnVal_"+seq).val();
					var saleCost = parseInt($("#saleCostVal_"+seq).val(),10);
					var ordCnt = parseInt($("#cntVal_"+seq).val(),10);
					var deliCostCondi = parseInt($("#deliCostCondiVal_"+seq).val(),10);
					var deliCost = parseInt($("#deliCostVal_"+seq).val(),10);
					var storeId = parseInt($("#storeIdVal_"+seq).val(),10);
					/* [2018.06 문화비소득공제] 도서+음반 구매시 배송비 정책 변경 부분. 최초 개발 당시 이 정책은 무시하고 도서,음반 각각 계산하기로 함
					var prodType= $("#prodTypeArr_"+seq).val();
					if(typeof bookCnt != "undefined" && bookCnt != null && bookCnt > 0){
						deliCostCondi = 10000;
						deliCost = 2000;
					}
					*/
					if(bundleDeliYn === "N") {
						if(saleCost*ordCnt < deliCostCondi) {
							retDeliCostN += deliCost;
						}
					}else {
						if(prevStoreId != storeId && totSaleCost < deliCostCondi) {
							retDeliCostY += deliCost;
							
						}else if(prevStoreId == storeId && totSaleCost > deliCostCondi){
							bundleDeliFreeFlag = true;
						}
					}
					prevStoreId = storeId;
				}
			}
		}
		
			//상품이 1개라도 배송비가 무료이면 0원처리
			if(bundleDeliFreeFlag){
				retDeliCostY = 0;
			}
			
			retDeliCost= retDeliCostY+retDeliCostN;
			
		return retDeliCost;
	}

	function storeDeliCostCalc() {
		
		var retDeliCost = 0;
		var type = "store";
		
		if(cartType === "01") {	//일반카트만 배송비 계산
			
			var cnt = $(".check_"+type+":checked").size();
			var prevStoreId = 0;

			for(i=0;i<cnt;i++) {
				
				var seq = $(".check_"+type+":checked").eq(i).val();
				
				var bundleDeliYn = $("#bundleDeliYnVal_"+seq).val();
				var saleCost = parseInt($("#saleCostVal_"+seq).val(),10);
				var ordCnt = parseInt($("#cntVal_"+seq).val(),10);
				var deliCostCondi = parseInt($("#deliCostCondiVal_"+seq).val(),10);
				var deliCost = parseInt($("#deliCostVal_"+seq).val(),10);
				var storeId = parseInt($("#storeIdVal_"+seq).val(),10);

				if(bundleDeliYn === "N") {
					if(saleCost*ordCnt < deliCostCondi) {
						retDeliCost += deliCost;
					}
				}else {
					if(prevStoreId != storeId && getStoreSum(storeId) < deliCostCondi) {
						retDeliCost += deliCost;
					}
				}
				prevStoreId = storeId;
			}
		}
		
		return retDeliCost;
	}

	function orderProc() {
		
		var frm = document.frmMain;
		
		var objBox = new Array();
		
		var objbox3 = document.getElementsByName("seqArr3");
		var objBox1 = document.getElementsByName("seqArr1");
		var objbox2 = document.getElementsByName("seqArr2");
		
		for(j=0;j<objbox3.length;j++) {
			objBox.push(objbox3[j]);			
		}
		for(k=0;k<objBox1.length;k++) {
			objBox.push(objBox1[k]);			
		}
		for(j=0;j<objbox2.length;j++) {
			objBox.push(objbox2[j]);			
		}
		
		var isSaleBox = document.getElementsByName("is_sale_yn");
		var prodType = document.getElementsByName("prodType");

		var prodIdArr = "";
		var cntArr = "";
		var optSeqArr = "";
		var oldCntArr = "";
		var seqArrAlly = "";

		var srcProdAlly = "";
		var srcMemAlly = "";
		var srcOldMemAlly = "";

		var seq = 0;
		var oldSeq = 0;
		var seqArrSeq = 0; // 장바구니 일련번호
		var srcSeq = 0; // 제휴사 코드 일련번호
		var srcOldSeq = 0; // 제휴사 코드 일련번호

		var partner = "";
		var bookOnly = "false";
		var memGroup = "";

		for(i=0;i<objBox.length;i++) {

			if(objBox[i].checked) {
				
				if(document.getElementById("prod_name_"+objBox[i].value).value.indexOf('기프티쇼') > -1){
						alert('반값딜 상품(기프티쇼)은 모바일앱 이벤트 페이지에서만 주문가능합니다.');
						return;
				}
				
				// 시퀀스 번호
				if(seqArrSeq > 0) {
					seqArrAlly += ",";
				}

				//이지웰 GIFT 상품 구매 차단
				if(bookOnly == "true" && (prodType[i].value === "04" || prodType[i].value === "11")) {
					alert("복지몰 회원은 GIFT 상품을 구매하실 수 없습니다.");
					return;
				}
				//이제너두 도서 외 차단
				if('' == '118' && (prodType[i].value == "03" || prodType[i].value == "07" || prodType[i].value == "09")){
					alert("복지몰 회원은 도서 상품만 구매하실 수 있습니다.");
					return;
				}

				if(isSaleBox[i].value === "N") {
					alert("판매중지된 상품은 주문하실수 없습니다.");
					return;
				}

				seqArrSeq++;
				seqArrAlly += objBox[i].value;

				// 최대수량 체크 추가 20090213
				var seqBox = parseInt(document.getElementById("cntVal_"+objBox[i].value).value);
				var maxBox = 0;
				if(document.getElementById("maxVal_"+objBox[i].value).value != null && document.getElementById("maxVal_"+objBox[i].value).value != "") {
					maxBox = parseInt(document.getElementById("maxVal_"+objBox[i].value).value);
				}
				if(seqBox > maxBox) { // 최대수량이 없으면 무제한
					alert(document.getElementById("prod_name_"+objBox[i].value).value+" 상품은 "+maxBox+"개 까지 주문하실 수 있습니다.");
					return;
				}

				if(seq>0) {
					prodIdArr += ",";
					cntArr += ",";
					optSeqArr += ",";
				}

				prodIdArr += document.getElementById("prodIdArr_"+objBox[i].value).value;
				cntArr += document.getElementById("cntVal_"+objBox[i].value).value;

				if(document.getElementById("optSeqVal_"+objBox[i].value).value!="") {
					optSeqArr += document.getElementById("optSeqVal_"+objBox[i].value).value;
				}else {
					optSeqArr += "0";
				}

				seq++;
			}
		}

		if(prodIdArr === "") {
			alert("상품을 1개 이상 선택해주세요.");
			return;
		}

		if(cartType === "03" && frm.gu.value === "") {
			alert("수령 매장을 선택해 주세요.");
			return;
		}
		
		if(memGroup.indexOf("07") > -1 && (partner != "" && partner != "200" && partner != "201" && partner != "155")) {
			if(confirm("직원은 www.bandinlunis.com 주소로 들어오셔서 복리후생포인트를 사용하시기 바랍니다.\n\n바로 이동 하시겠습니까?")) {
				location.href = "/front/partner.do?partner=&url=/front/order/shopCartList.do";
				//location.href = "http://www.bandinlunis.com/front/partner.do?partner=&url=/front/order/shopCartList.do";
				return;
			}else {
				return;
			}
		}

		if(prodIdArr.length > 4000){
			alert("한번에 최대 500종의 상품까지 주문 가능합니다.");
			return;
		}
		
		frm.prod_id_ally.value = prodIdArr;
		frm.cnt_ally.value = cntArr;
		frm.prod_opt_ally.value = optSeqArr;
		frm.seq_ally.value = seqArrAlly;
		frm.src_prod_id_ally.value = srcProdAlly;
		frm.src_mem_ally.value = srcMemAlly;

		var userAgent   = navigator.userAgent;
		/* if(userAgent.indexOf("Android") > -1 || userAgent.indexOf("iPhone") > -1 || userAgent.indexOf("iPod") > -1 || userAgent.indexOf("iPad") > -1) {
			alert("ActiveX를 설치 할 수 없는 브라우저입니다. 정상적인 결제를 위해 모바일 결제 창으로 이동 합니다.");
			if(cartType === "04"){
				frm.action = "https://minibandi.com/m/order/order.do?eBookYn=Y";
			}else{
				frm.action = "https://minibandi.com/m/order/order.do";
			}
		}else {
			frm.action = "https://www.bandinlunis.com/front/order/order.do";
		} */
		frm.action = "https://www.bandinlunis.com/front/order/order.do";

		// [2018.06 문화비소득공제] 복합결제시 Layer팝업
		var selectedDeductionProdCnt = $(".check_bandiDeduction:checked").size();
		if(selectedDeductionProdCnt > 0 && selectedDeductionProdCnt < seqArrSeq) {
			$("#checkOneSelect").show();
		}else {
			if(!isLogin()) {
				goBuyLoginPopUp("goOrderPage()");
			}else {
				frm.submit();
			}
		}
	}
	
	function submitDeductionLayer() {
		if(!isLogin()) {
			goBuyLoginPopUp("goOrderPage()");
		}else {
			document.frmMain.submit();
		}
	}

    function goOrderPage(dfsgwdgweq){
        if(isLogin()){
            document.location.reload();
        }else{
            document.frmMain.action = "https://www.bandinlunis.com/front/order/order.do";
            document.frmMain.submit();
        }
    }

	function changeGu(obj) {

		var gu = obj.options[obj.selectedIndex].value;
		var guname = obj.options[obj.selectedIndex].text;
		var minQty = obj.options[obj.selectedIndex].id;

		document.frmMain.gu.value = gu;
		
		var _date = new Date();
		var _year = _date.getFullYear();
		var _month = _date.getMonth()+1;
		var _day = _date.getDate();
		var _hour = _date.getHours();
		var std2 = "" + LPAD2(_year)  + LPAD2(_month) + LPAD2(_day) + LPAD2(_hour);
		if((std2 >= "2015050800" && std2 < "2015052800") && gu=="05") {
			alert("신세계강남점은 매장위치 이전으로 인해\r\n2015.05.11~05.27 동안 임시휴점합니다. \r\n\r\n‘신세계강남점' 북셀프 수령 및 매장/교환반품은 \r\n5월 10일(일) 오후9시 30분까지만 가능합니다.\r\n\r\n이용에 참고해주시기 바랍니다.\r\n자세한 내용은 공지사항을 참고해주세요. ");
		}

		if(gu != "") {

			var shelfTel = document.getElementById("shelfTel_"+gu).value;
			var stdCnt = 3;	//alert 기준 재고 값 (기준 이하 얼럿)
			var prodName = "";

			if(minQty <= stdCnt) {

				$("#bookSelfAlertYn").val("Y");
				ajaxRequest("getBookSelfProduct", {"gu":gu,"cnt":stdCnt},
					function(list) {
						for (var i = 0; i < list.length; i++) {
							product = list[i];
							prodName += product.prod_name+"\n";
						}
						$(".bookSelfAlertStore").text("["+guname+"] 재고 "+stdCnt+"권 이하 도서");
						$(".bookSelfAlertProdName").text(prodName);
						$(".bookSelfAlertShelfTel").text("["+guname+"]\n대표전화 : "+shelfTel);
						$("#bookSelfAlertLayer").show();
					}
				);
			}else {
				$("#bookSelfAlertYn").val("N");
			}
		}
	}

	function closeBookSelfAlertLayer(idx) {
		if(idx === 2){
			$("#bookSelfAlertLayer_2").hide();
		}else {
			$("#bookSelfAlertLayer").hide();
		}
	}

	function bookselfAlert() {
		
	}

	function deletePrevBuy() {

		var obj = document.getElementsByName("prevBuyChk");
		var p_seqArr = "";
		var cnt = 0;

		for(var i=0;i<obj.length;i++) {
			if(obj[i].checked) {
				if(cnt > 0) {
					p_seqArr += ",";
				}
				p_seqArr += obj[i].value;
				document.getElementById("checkBox_"+obj[i].value).checked = false;
				cnt++;
			}
		}

		if(p_seqArr === "") {
			alert("상품을 1개 이상 선택해주세요.");
			return;
		}

		var param = {seqArr:p_seqArr};
		OrderDwr.deleteShopCart(param,
			function (val) {
				if(val === 0){
					orderProc();
				}else {
					alert("오류사항이 발견되었습니다, 관리자에게 문의해 주세요.");
				}
			}
		);
	}

	function preBuyProduct() {
		openCon("laypop_bookCart");
		document.getElementById("contentWrap").focus();
	}

	function prevInfo() {
		var prevCnt = "0";
		if(prevCnt > 0) {
			$("#span_prevInfo").html("이전에 <a href='javascript:preBuyProduct();'><u>구매한 상품 <strong>"+prevCnt+"</strong>개</u></a> 있습니다.");
		}
	}

</script>