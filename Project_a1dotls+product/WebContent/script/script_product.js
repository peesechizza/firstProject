/**
 * 
 */
	
function out() {
	wantOut =  confirm('정말로 나가시겠습니까?');
    if(wantOut == true){
        location.href='/product/productList.jsp';
    }
}

//productList >> productContent.jsp 이동
function productContent(p1, p2) {
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	let param = "productContent.jsp?pNum="+p1;
	     param += "&nowPage="+p2;
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href=param;
}


//장바구니 버튼 클릭시
function cartBtn(pCode){ 
	if (confirm("장바구니에 담으시겠습니까?")){
		location.href='/cart/cartAdd.jsp?pCode='+pCode+'&pSellPrice'+pSellPrice;
	}
	}
function cartMove(){
	if(confirm("장바구니로 바로 이동할까요?")){
		location.href='/cart/cartList.jsp';
	}else{
		lacation.href='#';
	}
}


//주문 결제 버튼
function CartPay(){
	alert("결제 기능을 지원하지 않습니다.");
}
// 장바구니 삭제버튼
function CartClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href = "/cart/cartClear.jsp";	
	}
}


$(function() {
	
	// productList.jsp  글쓰기 버튼
	 $('#loginAlertBtn').click(function(){
		alert('로그인 이후 게시글 작성이 가능합니다');
		let loginMove = alert('로그인 페이지로 이동하시겠습니까?');
		if(loginMove == true){
			location.href="/login/login.jsp";
		}
		});
	$('#writeBtn').click(function(){
		location.href='/product/productAWrite.jsp'
	});
	
	/* 리스트페이지 검색 시작 */	
	$("button#searchBtn").click(function(){
		let keyWord = $("#keyWord").val().trim();
		if (keyWord=="") {
			alert("검색어를 입력해주세요.");
			$("#keyWord").focus();			
		} else {
			$("#searchFrm").submit();
		}
	});	
	/* 리스트페이지 검색 끝 */
	
	
	// (productContent.jsp)수정버튼 클릭
	$("#btnArea>button#UpContent").click(function(){
	
		let nowPage = $("input#nowPage").val().trim();
		let pNum = $("input#pNum").val().trim();
				
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
		let url = "/product/productAUpdate.jsp?";
			url += "pNum="+pNum;
			url += "&nowPage="+nowPage;
			url += "&keyField="+p3;
	     	url += "&keyWord="+p4; 
		location.href=url;
	});
	
	
	// 게시글 삭제하기
	$("button#DelContent").click(function(){
		
		let chkTF = confirm("게시글을 삭제하시겠습니까?");
		
		if (chkTF) {
			let nowPage = $("input#nowPage").val().trim();
			let pNum = $("input#pNum").val().trim();
					
			let p3 = $("#pKeyField").val().trim();  // p3 : keyField
		    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
		    
			let url = "/product/productADeleteProc.jsp?";
				url += "pNum="+pNum+"&nowPage="+nowPage;
				url += "&keyField="+p3;
				url += "&keyWord="+p4;
			location.href=url;
		} else {
			alert("취소하셨습니다.");	
		}
		});
		
		
	// productAUpdate.jsp null 값 경고
	//productAUpdate.jsp 수정 전송 시작 .. 수정 필요
	
});