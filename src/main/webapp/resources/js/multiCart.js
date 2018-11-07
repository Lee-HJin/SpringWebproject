/**
 * 리스트 수량선택 북카드 담기(search_header.jsp와 같음)
 */

	//카운트 증가
	function cntUp(isbn) {
		
		var ordCnt = parseInt($("#cntVal_"+isbn).val());
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
		
		var ordCnt = parseInt($("#cntVal_"+isbn).val());
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
	
/*	function calculation() {
		
		var bookItems = $(".storeId_1").length;

		$("#bandiDeduction_totOrdCnt").text("수량: "+bookItems+"종(아직n개)");

	}*/
	
	//카운트 증가(cartList)
	function cntUp2(seqNum) {
		//카운트 ㅅㅈ
		var ordCnt = parseInt($("#cntVal_"+seqNum).val());
		var discountedPrice = parseInt($("#pricePerBook_"+seqNum).val());
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}else {
			ordCnt++;
		}
		if(ordCnt > 99) {
			alert("최대 수량입니다.");
			ordCnt = 99;
		}

		$("#cntVal_"+seqNum).val(ordCnt);
		$("#costVal_"+seqNum).text(ordCnt*discountedPrice+"원");
		orderCalc()

	}

	//카운트 감소(cartList)
	function cntDown2(seqNum) {
		
		var ordCnt = parseInt($("#cntVal_"+seqNum).val());
		var discountedPrice = parseInt($("#pricePerBook_"+seqNum).val());
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}else {
			ordCnt--;
		}
		if(ordCnt < 1) {
			alert("최소 수량입니다.");
			ordCnt = 1;
		}
		$("#cntVal_"+seqNum).val(ordCnt);
		$("#costVal_"+seqNum).text(ordCnt*discountedPrice+"원");
		orderCalc()
		
	}
	
	function updateShopCart(seqNum) {
		var ordCnt = parseInt($("#cntVal_"+seqNum).val());
		var discountedPrice = parseInt($("#pricePerBook_"+seqNum).val());
		
		$("#costVal_"+seqNum).text(ordCnt*discountedPrice+"원");
		alert("수정하였습니다.")
		orderCalc()
		
	}
	
	//카운트 변화
	function cntChange(seqNum) {
		var seqBox = parseInt(document.getElementById("cntVal_"+seqNum).value);
		var maxBox = 0;
		
		if(!isNaN(seqBox)) {
			if(document.getElementById("maxVal_"+seqNum).value != null && document.getElementById("maxVal_"+seqNum).value != "") {
				maxBox = parseInt(document.getElementById("maxVal_"+seqNum).value);
			}
			if(maxBox != 0 && seqBox > maxBox) {
				alert("최대 수량을 초과 하였습니다.");
				document.getElementById("cntVal_"+seqNum).value = maxBox;
				return;
			}

			if(seqBox < 1) {
				alert("최소 수량은 1 입니다.");
				document.getElementById("cntVal_"+seqNum).value = 1;
				seqBox =1;
			}
			document.getElementById("costVal_"+seqNum).innerHTML = FormatNumber3(document.getElementById("cntVal_"+seqNum).value * document.getElementById("saleCostVal_"+seqNum).value)+"원";
			
		}
	}	

	
	//북카트
	function addCart(isbn) {
		var ordCnt = $("#cntVal_"+isbn).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}else{
			$(function() {
				
				var cookieValue = JSON.stringify({"isbn":isbn,"orderCount":ordCnt});
				var ck = $("#cart_isbn"+isbn).val();
				
				if(document.cookie.indexOf('shop')==-1){
					setCookie('shop',cookieValue,1);
				}else if(document.cookie.indexOf('shop')!=-1){
					addCookie(cookieValue,ck);
				}
			});

			//기존 쿠키에 추가
			function addCookie(cValue,cVal){
				var items = getCookie('shop');
				//var maxItemNum = 10;
				var flag = true;
				
				if(items){
					var itemArray=items.split('/');
					var ck = new Array();
					
					for(i=0;i<itemArray.length;i++){
		 	 			ck[i] = JSON.parse(itemArray[i]);
		 	 		}
					for(i=0;i<ck.length;i++){
						
						if(ck[i].isbn==cVal){
							
							alert("이미 있는 상품입니다.");
							return;
							
						}else{
							flag= false;
						}	
					}
					if(flag==false){
						itemArray.unshift(cValue);
/*						if(itemArray.length>maxItemNum){
							itemArray.length=10;}*/
						items = itemArray.join('/');
						setCookie('shop',items,1);
					}
				}
			}
			
			//쿠키 생성
			function setCookie(cName, cValue, cDay){
				var expire = new Date();
			    expire.setDate(expire.getDate() + cDay);
			    cookies = cName + '=' + escape(cValue) + '; path=/ ';
			    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
			    document.cookie = cookies;
			}
					
			function getCookie(cookiename){
				var cookiestring  = document.cookie;
				var cookiearray = cookiestring.split(';');
				for(var i =0 ; i < cookiearray.length ; ++i){ 
				    if(cookiearray[i].indexOf(cookiename)!=-1){ 
				        var ck = [];
				        var nameVal = cookiearray[i].split( "=" );
			            var value = nameVal[1].trim();
				        ck+= value;
				    }
				} 
				return unescape(ck);
			}
		}		
	}
	
	//바로구매
	function goOrder(isbn) {
		var ordCnt = $("#cntVal_"+isbn).val();
		if(isNaN(ordCnt)) {
			ordCnt = 1;
		}
		goBuyOpt(isbn, ordCnt);
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
		var bandiDeductionTotCost = 0;
		var bandiDeductionTotDc = 0;
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
			bandiDeductionTotCost += parseInt($("#marketSaleVal_"+seq).val(),10) * cnt;
			bandiDeductionTotPoint += parseInt($("#prodPointVal_"+seq).val(),10) * cnt;
			bandiDeductionTotDc += parseInt($("#marketSaleVal_"+seq).val(),10) * cnt * 1/parseInt($("#discountRate_"+seq).val(),10);
		}
		
		//배송비용
		if(bandiDeductionTotSaleCost < 50000){
			bandiDeductionTotDeliCost = 2000;
		}
		
		//총비용(+배달비용)
		bandiDeductionTotOrdCost = bandiDeductionTotSaleCost + bandiDeductionTotDeliCost;
		
		
		$("#bandiDeduction_totOrdCnt").text("수량: "+(bandiDeductionTotCnt)+"종("+(bandiDeductionTotProdCnt)+"개)");
		$("#bandiDeduction_totSaleCost").text(FormatNumber3(bandiDeductionTotSaleCost));
		$("#bandiDeduction_totDeliCost").text(FormatNumber3(bandiDeductionTotDeliCost));
		$("#bandiDeduction_totOrdCost").text(FormatNumber3(bandiDeductionTotOrdCost));
		$("#bandiDeduction_totPoint").text(FormatNumber3(bandiDeductionTotPoint));
		$("#pop_deduction_price").html(FormatNumber3(bandiDeductionTotOrdCost)+"원");
		
		$("#totOrdCnt").text("수량: "+(bandiDeductionTotCnt)+"종("+(bandiDeductionTotProdCnt)+"개)");
		$("#totMarketSale").text(FormatNumber3(bandiDeductionTotCost));
		$("#totDiscountCost").text(FormatNumber3(bandiDeductionTotDc));
		$("#totDeliCost").text(FormatNumber3(bandiDeductionTotDeliCost));
		$("#totOrdCost").text(FormatNumber3(bandiDeductionTotOrdCost));
		$("#totPoint").text(FormatNumber3(bandiDeductionTotPoint));
		
		
	}
	
	
	
	

	

	

	
	
		

	
	
	
	
	
	
	
	
	
	
	