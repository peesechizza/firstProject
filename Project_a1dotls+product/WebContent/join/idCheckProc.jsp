<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
boolean chkRes = mMgr.checkID(uId);
String btnCont = null;
%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
 	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta charset="UTF-8">
		<title>아이디 중복 확인</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Test.css">
		<script src="/source/jquery-3.6.0.min.js"></script>
		<script src="/script/join_script.js"></script>	
</head>
<body>
	<div id="wrap" class="idChkProc">
	<%
		if (chkRes) { 
			btnCont = "재입력";
	%>
		<p>존재하는 ID 입니다. 다른 아이디를 입력해주세요.</p>
	<% 
		} else{ 
			btnCont = "사용";
	%>
		<p>사용 가능한 ID 입니다.</p>
	<% } %>
		<button type="button" id="chkIdPopupBtn" class="chkIdPopupBtn"><%= btnCont %></button>
		<input type="hidden" id="uId" value="<%= uId %> ">
	</div>
</body>
</html>