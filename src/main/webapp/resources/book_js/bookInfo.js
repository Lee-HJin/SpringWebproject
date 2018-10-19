/**
 * 
 */

/*************************************
* 도서 상품 미리보기 팝업
*************************************/ 
function popPreview(prodId) {

    if (typeof(prodId) == "undefined" || prodId == "") {
        return;
    }
    
    window.open("/front/product/previewBook.do?prodId=" + prodId, "preview", "width="+screen.availWidth+",height="+screen.availHeight+",resizable=yes,scrollbars=yes");
}