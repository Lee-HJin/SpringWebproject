/**
 * 리스트 수량선택 북카드 담기(search_header.jsp와 같음)
 */

	//카운트 증가
	function cntUp(isbn) {
		
		var ordCnt = parseInt($("#cntVal_"+isbn).val(),10);
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}else {
			ordCnt++;
		}
		if(ordCnt > 99) {
			alert("최대 수량입니다.");
			ordCnt = 99;
		}
		$("#cntVal_"+isbn).val(ordCnt);
		
	}

	//카운트 감소
	function cntDown(isbn) {
		
		var ordCnt = parseInt($("#cntVal_"+isbn).val(),10);
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}else {
			ordCnt--;
		}
		if(ordCnt < 1) {
			alert("최소 수량입니다.");
			ordCnt = 1;
		}
		$("#cntVal_"+isbn).val(ordCnt);
		
	}
	//북카트
	function addCart(isbn) {
		var ordCnt = $("#cntVal_"+isbn).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		add_basket(isbn, ordCnt);
	}
	
	//바로구매
	function goOrder(isbn) {
		var ordCnt = $("#cntVal_"+isbn).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		goBuyOpt(isbn, ordCnt, 0);
	}