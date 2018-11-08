
$(document).ready(function(){
	
	/* onLoad */
	
	orderCalc();
	onLoad();
	
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
			var cnt = parseInt($("#orderCnt_"+seq).val(),10);
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
	
			
		
});
	


 