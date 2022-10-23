$(function(){
	
	
	/* 리스트 페이지 글쓰기 버튼 시작 /recipe/recipeList.jsp */	
	$("#loginAlertBtn").click(function(){		
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});	
	$("#writeBtn").click(function(){		
		location.href="/recipe/recipeWrite.jsp?gnbParam=recipe";
	});
	/* 리스트 페이지 글쓰기 버튼 끝 /recipe/recipeList.jsp */
	
	
	/* 글쓰기 페이지 게시글 등록 시작 /recipe/recipeWrite.jsp */
	$("#regBtn").click(function(){
		let rTitle = $("#rTitle").val().trim();		
		
		 if (rTitle == "") {
			alert("제목은 필수입력입니다.");
			$("#rTitle").focus();
		} else {
			$("#writeFrm").attr("action", "/recipe/recipeWriteProc.jsp").submit();
		}
	
	});	
	
	/* 글쓰기 페이지 게시글 등록 끝 /recipe/recipeWrite.jsp */
	
	
	/* 게시글 삭제버튼 시작 /recipe/recipeRead.jsp */
	$("button#delBtn").click(function(){
		
		let chkTF = confirm("게시글을 삭제하시겠습니까?");
		
		if (chkTF) {
			let nowPage = $("input#nowPage").val().trim();
			let num = $("input#num").val().trim();
					
			let p3 = $("#pKeyField").val().trim();  // p3 : keyField
		    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
		    
			let url = "/bbs/deleteProc.jsp?";
				url += "num="+num+"&nowPage="+nowPage;
				url += "&keyField="+p3;
				url += "&keyWord="+p4;
			location.href=url;
		} else {
			alert("취소하셨습니다.");	
		}
		
	});
	/* 게시글 삭제버튼 끝 /recipe/recipeRead.jsp */
	
	
	
	/* 게시글 내용보기페이지에서 수정버튼 시작 /recipe/recipeRead.jsp */
	$("td.read>button#modBtn").click(function(){
	
		let nowPage = $("input#nowPage").val().trim();
		let num = $("input#num").val().trim();
				
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
		let url = "/bbs/modify.jsp?";
			url += "num="+num;
			url += "&nowPage="+nowPage;
			url += "&keyField="+p3;
	     	url += "&keyWord="+p4; 
		location.href=url;
	});
	
	/* 게시글 내용보기페이지에서 수정버튼 끝 /recipe/recipeRead.jsp */
	
	
	/* 게시글 수정페이지에서 수정내용 전송 시작 /recipe/recipeMod.jsp */
	$("td.update>button#modProcBtn").click(function(){
		let subject = $("#subject").val().trim();
		
		//let keyField = $("#keyField").val().trim();
		//let keyWord = $("#keyWord").val().trim();
		
		if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {
		
			//alert("keyField : " + keyField + "\nkeyWord : " + keyWord);
			//return;
			$("#modifyFrm").submit();
		}
	
	});	
	/* 게시글 수정페이지에서 수정내용 전송 끝 /recipe/recipeMod.jsp */
	
	
			
	/* 게시글 내용보기페이지에서 답변버튼 시작 /recipe/recipeRead.jsp */
	$("td.read>button#replyBtn").click(function(){
	
		let nowPage = $("input#nowPage").val().trim();
		let num = $("input#num").val().trim();
				
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
		let url = "/bbs/reply.jsp?";
			url += "num="+num;
			url += "&nowPage="+nowPage;
			url += "&keyField="+p3;
	     	url += "&keyWord="+p4; 
		location.href=url;
	
	});
	/* 게시글 내용보기페이지에서 답변버튼 끝 /recipe/recipeRead.jsp */
	
	
	/* 답변입력양식 페이지에서 답변내용 전송 시작 /recipe/recipeReply.jsp */
	$("td.reply>button#replyBtn").click(function(){
		
		let subject = $("#subject").val().trim();
		
		if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {		
			$("#replyFrm").submit();
		}
		
	});
	/* 답변입력양식 페이지에서 답변내용 전송 끝 /recipe/recipeReply.jsp */		
	
	
	
	/* 리스트페이지 검색 시작 /recipe/recipeList.jsp */	
	$("button#searchBtn").click(function(){
		let keyWord = $("#keyWord").val().trim();
		if (keyWord=="") {
			alert("검색어를 입력해주세요.");
			$("#keyWord").focus();			
		} else {
			$("#searchFrm").submit();
		}
	});	
	/* 리스트페이지 검색 끝 /recipe/recipeList.jsp */	
	
	
	/* 검색 결과를 유지한 리스트페이지 이동 시작 /recipe/recipeRead.jsp */
	$("#listBtn").click(function(){
		let param = $("#nowPage").val().trim();
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	     
		let url = "/bbs/list.jsp?nowPage=" + param;		    
		    url += "&keyField="+p3;
	     	url += "&keyWord="+p4 ; 
		location.href=url;
	});
	/* 검색 결과를 유지한 리스트페이지 이동 끝 /recipe/recipeRead.jsp */
	
	
});
	
	
/* 상세내용 보기 페이지 이동 시작 /recipe/recipeList.jsp => recipeRead.jsp */
function read(p1, p2) {
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	let param = "/recipe/recipeRead.jsp?rNum="+p1;
	     param += "&nowPage="+p2;
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href=param;
}		
/* 상세내용 보기 페이지 이동 끝 /recipe/recipeList.jsp => recipeRead.jsp  */



/* 리스트페이지 페이징 시작 /recipe/recipeList.jsp */
function movePage(p1) {    // 페이지 이동
	
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord

	let param = "/recipe/recipeList.jsp?gnbParam=recipe&nowPage="+p1;	    
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href= param;

}
/* 리스트페이지 페이징 끝 /recipe/recipeList.jsp */


/* 리스트페이지 페이징 블럭이동 시작 /recipe/recipeList.jsp */
function moveBlock(p1, p2, param3) {    
	                // 이전 블럭 또는 이후 블럭으로 이동  p1 => nowBlock-1  또는 nowBlock+1

	let moveBlock = parseInt(p1);    // 이전 블럭의 시작페이지로 이동에 사용하는 소
	let pagePerBlock = parseInt(p2);	
	//alert("p1(moveBlock) : " + p1 + "\np2(pagePerBlock) : " + p2);
	
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
	if (param3 == 'pb') {
		 param = "/recipe/recipeList.jsp?gnbParam=recipe&nowPage="+(moveBlock*pagePerBlock);
	                                                          // moveBlock : nowBlock - 1 
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ;
	} else if (param3 == 'nb' ) {		
		 param = "/recipe/recipeList.jsp?gnbParam=recipe&nowPage="+(pagePerBlock*(moveBlock-1)+1);   
	                                                          // moveBlock : nowBlock + 1 
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ;
	}

	location.href=param;
}
/* 리스트페이지 페이징 블럭이동 끝 /recipe/recipeList.jsp */