$(function(){
	
	$("button#memDelBtn").click(function(){
		
		let procChk = confirm("해당 회원목록을 삭제하시겠습니까?");
		
		if(procChk){
			let param = $(this).val();
			$("form#memDelFrm").attr("action", "/admin/memberDelProc.jsp?uNum="+param).submit();
		} else {
			alert("취소하셨습니다.");
		}
		
	});
	
});