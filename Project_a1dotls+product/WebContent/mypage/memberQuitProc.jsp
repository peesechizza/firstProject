<%@page import="pack_Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("uId_Session"); 
%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr"/>

<%
boolean modRes = mMgr.memberQuit(uId_Session);
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
		<script src="/script/find_script.js"></script>	
</head>
<body>
	<div id="wrap">
	</div>
<script>
<% if(modRes){ %>
	alert("회원 탈퇴가 완료되었습니다.");
	location.href="/index.jsp";
	<% session.invalidate(); %>
<% } else{ %>
	alert("회원 탈퇴 처리 중 문제가 발생헀습니다. 고객센터로 문의주세요.");
	history.back();
<% } %>

</script>
</body>
</html>