<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr"/>
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId"); 

%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
 	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta charset="UTF-8">
		<title>아이디 중복 체크</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Test.css">
		<script src="/source/jquery-3.6.0.min.js"></script>
		<script src="/script/join_script.js"></script>	
</head>
<body>
	<div id="wrap_Popup">
		
		<form name="idChkFrm" id="idChkFrm">
		
			<div id="idChkArea">
				<input type="text" name="uId" id="uId" placeholder="아이디를 입력해주세요.">
				<button type="button" id="dupChkBtn">중복 확인</button>
			</div>
	
		</form>
	
	</div>
</body>
</html>