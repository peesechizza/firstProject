<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_Test.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/join_script.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

		<!-- 로고 이미지 영역 -->
		<header id="header">
			<a href="../index.jsp" target="_top"> <img src="../images/logo-saruwa.png"
						alt="logo" style="width: 250px;"></a>
		</header>
		<!-- 로고 이미지 영역 -->

	<div id="wrap" class="joinWrap">
		<main id="main">
			<h1>회원가입</h1>
			<form name="joinFrm" id="joinFrm">
				<table id="joinFrmTbl">
					<tbody>
						<tr>
							<!-- <th class="req">아이디</th> -->
							<%
							String uId = request.getParameter("uId");
							if(uId == null){ %>
								<td><input type="text" name="uId" id="uId" maxlength="20"
									autofocus placeholder="아이디" readonly>
								</td>
							<% } else {%>
								<td><input type="text" name="uId" id="uId" maxlength="20"
									autofocus placeholder="아이디" value="<%=uId %>" readonly>
								</td>							
							<% } %>
							<td>
								<button type="button" id="idChkBtn">아이디 체크</button>
							</td>
							<td><span>영어 대소문자, 숫자, 5~20자</span></td>
						</tr>
						<tr>
							<!-- <th class="req">비밀번호</th> -->
							<td><input type="password" name="uPw" id="uPw"
								maxlength="16" placeholder="비밀번호"></td>
							<td></td>
							<td><span id="uPwPattern">영어 대소문자/숫자/특수문자 조합, 8~16자</span></td>
						</tr>
						<tr>
							<!-- <th class="req">비밀번호 확인</th> -->
							<td><input type="password" name="uPwRe" id="uPwRe"
								maxlength="16" placeholder="비밀번호 확인"></td>
							<td></td>
							<td><span id="uPwChk"></span></td>
						</tr>
						<tr>
							<!-- <th class="req">이름</th> -->
							<td><input type="text" id="uName" name="uName" placeholder="이름"></td>
							<td></td>
							<td><span id="uNameChk"></span></td>
						</tr>
						<tr>
							<!-- <th class="req">이메일</th> -->
							<td>
								<input type="text" id="uEmail_01" name="uEmail_01" maxlength="20" size="13" placeholder="이메일 아이디"> 
								<span>@</span> 
								<input type="text"
								id="uEmail_02" name="uEmail_02" maxlength="40" size="13" placeholder="이메일 주소"> 
							</td> 
							<td>
								<select id="emailDomain" class="frmDropMenu">
									<option value="">직접 입력</option>
									<option>naver.com</option>
									<option>gmail.com</option>
								</select>								
								<input type="hidden" name="uEmail" id="uEmail"></td>
					
							<td>이메일 아이디와 주소를 입력해주세요.</td>
						</tr>
						<tr>
							<!-- <th class="req">휴대폰 번호</th> -->
							<td id="uPhoneTd">
								<input type="text" id="uPhone_01" name="uPhone_01" maxlength="3" size="6" placeholder="ex) 010">
								<span>-</span> 
								<input type="text" id="uPhone_02" name="uPhone_02" maxlength="4"
								size="7" placeholder="1234"> 
								<span>-</span> 
								<input type="text" id="uPhone_03" name="uPhone_03" maxlength="4" size="7" placeholder="5678">
							</td>
							<td>
								<button type="button" id="phoneAuthBtn" class="frmBtn">인증코드 받기</button>							
								<input type="hidden" name="uPhone" id="uPhone">
							</td>
							<td>휴대폰 번호를 입력해주세요.</td>
						</tr>
						<tr id="phoneAuthArea" class="hidden">
							<td>
							<!--  휴대폰 인증 영역 시작 : Authentication Code 인증코드-->
								<div id="phoneAuthArea">
									<input type="text" id="phoneAuth" size="25" placeholder="인증코드 입력">
								</div> 
							<!-- div#phoneAuthArea --> 
							</td>
							<td>
									<button type="button" class="frmBtn">인증하기</button>							
							</td>
							<td></td>
						</tr>
						<tr>
							<!-- <th class="req">우편번호</th> -->
							<td>
								<input type="text" name="zipcode" id="zipcode" maxlength="7" size="10" readonly placeholder="우편번호">
							</td>
							<td>
								<button type="button" id="findZipBtn" onclick="execDaumPostcode()">우편번호 찾기</button>							
							</td>
							<td>
								<span>우편번호 찾기 버튼을 클릭하세요.</span>
							</td>
						</tr>
						<tr>
							<!-- <th class="req">주소</th> -->
							<td><input type="text" name="address" id="address"
								maxlength="100" size="40" placeholder="상세주소"></td>
								<td></td>
							<td>상세주소를 입력해주세요.</td>
						</tr>
						<tr>
							<!-- <th>선호 음식</th> -->
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
							<td>선호음식을 선택해주세요.</td>
						</tr>

					</tbody>
					<tfoot>
						<tr>
							<td colspan="3">
								<div id="contents" class="joinAgree">
									<div id="chkAllArea">
										<label> <input type="checkbox" id="chkAll">
											이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.
										</label>
									</div>

									<div id="licenseArea">
										<div class="termArea dFlex">
												<div id="chkBoxArea">
													<h3>
														<label> <input type="checkbox"
															class="usingAgreeChk chkRequired" > 이용약관 동의 [필수] 
														</label>												
													</h3>
												</div>
												<div id="detailBtn">
													<button type="button" onclick="window.open('/common/usingAgree.jsp')">자세히</button>
												</div>
											<!-- <iframe src="/common/usingAgree.jsp" class="usingAgree"></iframe> -->
										</div>

										<div class="termArea dFlex">
												<div id="chkBoxArea">							
													<h3>
														<label> <input type="checkbox"
															class="usingAgreeChk chkRequired" > 개인정보 수집 및 이용 동의 [필수] 
														</label>
													</h3>
												</div>
												<div id="detailBtn">
													<button type="button" onclick="window.open('/common/personalInfoAgree.jsp')">자세히</button>
												</div>
											<!-- <iframe src="/common/personalInfoAgree.jsp"
												class="usingAgree"></iframe> -->
										</div>
										<div class="termArea dFlex">
												<div id="chkBoxArea">	
													<h3>	
														<label> <input type="checkbox"
															class="usingAgreeChk"  name="sa" id="sa"
															value="1"> 쇼핑정보 수신 동의 [선택] 
														</label>
													</h3>
												</div>
												<div id="detailBtn">
													<button type="button" onclick="window.open('/common/shopInfoAgree.jsp')">자세히</button>
												</div>
											<!-- <iframe src="/common/personalInfoAgree.jsp"
												class="usingAgree"></iframe> -->
										</div>
									</div>
									<!--  div#licenseArea -->
								</div> 
								<!-- div#contents -->
							</td>
						</tr>

						<tr>
							<td colspan="3"><input type="hidden" id="status"
								name="status" value="1">
								<button type="submit" id="joinSbmBtn" class="frmBtn">회원가입</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</main>
	</div>

	<footer id="footer" class="joinFooter">
		<iframe id="iframeFooter" src="/common/footerTmp.jsp" frameborder="0"
			scrolling="no"></iframe>
	</footer>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				/* var roadAddr = data.roadAddress; */
				/*         	var extraRoadAddr = '';
				
				 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				 extraRoadAddr += data.bname;
				 }
				 if(data.buildingName !== '' && data.apartment === 'Y'){
				 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				 }
				 if(extraRoadAddr !== ''){
				 extraRoadAddr = ' (' + extraRoadAddr + ')';
				 } */
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("address").value = data.roadAddress;
				document.getElementById("address").value = data.jibunAddress;
			}
		}).open();
	}
</script>
</html>