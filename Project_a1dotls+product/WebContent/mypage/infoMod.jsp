<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("uId_Session"); 

String gnbParam = "";
if (request.getParameter("gnbParam") != null) {
	gnbParam = request.getParameter("gnbParam");
}

%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr"/>
<jsp:useBean id="mBean" class="pack_Member.MemberBean"/>
<%
mBean = mMgr.getMemData(uId_Session);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_Test.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/join_script.js"></script>
</head>
<body>

	<!-- 헤더템플릿 -->
	<header id="header" class="infoModHeader">
		<jsp:include page="/common/headerTmp.jsp"/>		
	</header>
	<!-- <iframe src="/common/headerTmp.jsp" frameborder="0" scrolling="no"></iframe> -->
	<!-- 헤더템플릿 -->
		
	<div id="wrap" class="modWrap dFlex">
		
		
		<nav id="lnbMenu">
			<jsp:include page="/common/mainLnbTmp.jsp"/>
			<!-- <iframe src="/common/mainLnbTmp.jsp" frameborder="0" scrolling="no" id="iframeLNB"></iframe> -->
		</nav>
		
	
		<main id="main">
			<h1>회원 정보 수정</h1>
			<form name="modFrm" id="modFrm">
				<table id="modFrmTbl">
					<tbody>
						<tr>
							<th class="req">아이디</th>
							<td class="printTd"><%= mBean.getuId() %></td>
							<td></td>
						</tr>
						<tr>
							<th class="req">비밀번호</th>
							<td><input type="password" name="uPw" id="uPw"
								maxlength="16"></td>
							<td><span id="uPwPattern">영어 대소문자/숫자/특수문자 조합, 8~16자</span></td>
						</tr>
						<tr>
							<th class="req">비밀번호 확인</th>
							<td><input type="password" name="uPwRe" id="uPwRe"
								maxlength="16"></td>
							<td><span id="uPwChk"></span></td>
						</tr>
						<tr>
							<th class="req">이름</th>
							<td class="printTd"><%= mBean.getuName() %></td>
							<td></td>
						</tr>
						<tr>
							<% 
								String uEmail = mBean.getuEmail(); 
								int idxAt = uEmail.indexOf("@");
								String uEmail1 = uEmail.substring(0, idxAt);
								String uEmail2 = uEmail.substring(idxAt+1);
							%>
							<th class="req">이메일</th>
							<td id="emailTd">
								<input type="text" id="uEmail_01" maxlength="20" size="13" value="<%=uEmail1%>"> 
								<span>@</span> 
								<input type="text" id="uEmail_02" maxlength="40" size="13" value="<%=uEmail2%>"> 
								<select id="emailDomain" class="frmDropMenu">
									<option value="">직접입력</option>
									<option>naver.com</option>
									<option>gmail.com</option>
								</select> 
								<input type="hidden" name="uEmail" id="uEmail">
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<%
								String uPhone = mBean.getuPhone();
								int idxDash = uPhone.indexOf("-");
								String uPhone1 = uPhone.substring(0, idxDash);
								String uPhone2 = uPhone.substring(idxDash+1, 8);
								String uPhone3 = uPhone.substring(9);
							%>
							<th class="req">휴대폰 번호</th>
							<td id="uPhoneTd">
								<input type="text" id="uPhone_01" maxlength="3" size="6" value="<%=uPhone1%>">
								<span>-</span> 
								<input type="text" id="uPhone_02" maxlength="4" size="7" value="<%=uPhone2%>"> 
								<span>-</span> 
								<input type="text" id="uPhone_03" maxlength="4" size="7" value="<%=uPhone3%>">
								<button type="button" id="phoneAuthBtn" class="frmBtn">인증코드받기</button>

								<!--  휴대폰 인증 영역 시작 : Authentication Code 인증코드-->
								<div id="phoneAuthArea" class="hidden">
									<span>인증코드 입력</span> <input type="text" id="phoneAuth"
										size="25">
									<button type="button" class="frmBtn">인증하기</button>
								</div> <!-- div#phoneAuthArea --> <input type="hidden" name="uPhone"
								id="uPhone"></td>
							<td></td>

						</tr>
						<tr>
							<th class="req">우편번호</th>
							<td>
								<input type="text" name="zipcode" id="zipcode" maxlength="7" size="10" readonly value="<%=mBean.getZipcode()%>">
								<button type="button" id="findZipBtn"
									onclick="execDaumPostcode()">우편번호찾기</button></td>
							<td><span>우편번호 찾기 버튼을 클릭하세요.</span></td>
						</tr>
						<tr>
							<th class="req">주소</th>
							<td><input type="text" name="address" id="address"
								maxlength="100" size="50" value="<%=mBean.getAddress()%>"></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th>선호 음식</th>
							<%
								String[] faveFood = mBean.getFaveFood();
							%>
							
							<td id="foodChkTd"><label> <input type="checkbox" name="faveFood"
									value="한식"> 한식
							</label> <label> <input type="checkbox" name="faveFood"
									value="양식"> 양식
							</label> <label> <input type="checkbox" name="faveFood"
									value="일식"> 일식
							</label> <label> <input type="checkbox" name="faveFood"
									value="중식"> 중식
							</label> <label> <input type="checkbox" name="faveFood"
									value="분식"> 분식
							</label></td>
							<td></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3"><button type="button" id="modBtn">정보 수정</button></td>						
						</tr>
					</tfoot>
				</table>
			</form>
		</main>

	</div>
</body>
<script>
	$(function(){
		let chkBoxAry = <%= Arrays.toString(faveFood) %>;
		let len = chkBoxAry.length;
		let chkToF;
		for(let i = 0; i < len; i++ ){
			if(chkBoxAry[i] == 1) chkToF = true;
			$("input[name=faveFood]").eq(i).prop("checked", chkToF);
			chkToF = false;
		}
	});
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var roadAddr = data.roadAddress; 
				        	var extraRoadAddr = '';
				
				 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				 extraRoadAddr += data.bname;
				 }
				 if(data.buildingName !== '' && data.apartment === 'Y'){
				 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				 }
				 if(extraRoadAddr !== ''){
				 extraRoadAddr = ' (' + extraRoadAddr + ')';
				 } 
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("address").value = data.roadAddress;
				document.getElementById("address").value = data.jibunAddress;
			}
		}).open();
	}
</script>
</html>