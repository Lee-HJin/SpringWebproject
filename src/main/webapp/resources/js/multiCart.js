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