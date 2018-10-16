/**
 * 리스트 수량선택 북카드 담기(search_header.jsp와 같음)
 */


	//카운트 증가
	function cntUp(prodId, prodSaleStd) {
		if(prodSaleStd == "03") {
			alert("이 상품은 재고가 한정되어 있는 상품입니다. 북카트에 담으신 후 수량을 조절 해주시기 바랍니다.");
			return;
		}else {
			var ordCnt = parseInt($("#cntVal_"+prodId).val(),10);
			if(isNaN(ordCnt)) {
				ordCnt = 1;
			}else {
				ordCnt++;
			}
			if(ordCnt > 99) {
				alert("최대 수량입니다.");
				ordCnt = 99;
			}
			$("#cntVal_"+prodId).val(ordCnt);
		}
	}

	//카운트 감소
	function cntDown(prodId, prodSaleStd) {
		if(prodSaleStd == "03") {
			alert("이 상품은 재고가 한정되어 있는 상품입니다. 북카트에 담으신 후 수량을 조절 해주시기 바랍니다.");
			return;
		}else {
			var ordCnt = parseInt($("#cntVal_"+prodId).val(),10);
			if(isNaN(ordCnt)) {
				ordCnt = 1;
			}else {
				ordCnt--;
			}
			if(ordCnt < 1) {
				alert("최소 수량입니다.");
				ordCnt = 1;
			}
			$("#cntVal_"+prodId).val(ordCnt);
		}
	}
	//북카트
	function addCart(prodId) {
		var ordCnt = $("#cntVal_"+prodId).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		add_basket(prodId, ordCnt);
	}
	
	//바로구매
	function goOrder(prodId) {
		var ordCnt = $("#cntVal_"+prodId).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		goBuyOpt(prodId, ordCnt, 0);
	}