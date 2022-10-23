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
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<jsp:useBean id="mBean" class="pack_Member.MemberBean" />
<%
mBean = mMgr.getMemData(uId_Session);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_Test.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/join_script.js"></script>
</head>
<body>

	<!-- 헤더 영역 시작 -->
	<jsp:include page="/common/headerTmp.jsp" />
	<!-- 헤더 영역 끝  -->
	<div id="wrap" class="memQuitWrap">
		<main id="main">
			<h4>회원 탈퇴를 위해 아이디와 비밀번호를 입력해주세요.</h4>
			<form name="quitFrm" id="quitFrm">
				<div id="quitArea">
					<table id="memQuitTbl">
						<tbody>
							<tr>
								<td colspan="2"><input type="text" name="uId" id="uId"
									placeholder="아이디">
								</td>
							</tr>
							<tr>

								<td colspan="2"><input type="password" name="uPw" id="uPw"
									placeholder="비밀번호"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button type="button" id="quitBtn">회원 탈퇴</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</form>
		</main>
	</div>
</body>
</html>