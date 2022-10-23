$(function(){
	///////// FAQ 게시판 -admin -buttons
	

	///////// FAQ 게시판 -admin -게시글 전체 체크
	$("table#faqBoardList input#faqCheckAll").click(function(){
		let chkToF = $(this).prop("checked");
		$("input.faqDelCheck").prop("checked", chkToF);
	});
	
});