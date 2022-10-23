<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("uId_Session"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Test.css">
		<script src="/source/jquery-3.6.0.min.js"></script>
		<script src="/script/login_script.js"></script>		
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
		
	<div id="wrap" class="loginWrap">
		<main id="main" class="d-flex">
			
			<form id="loginFrm" name="loginFrm">			
				<div id="loginArea">
					<table id="inputTbl">
						<tbody>
							<tr>
								<td colspan="2">
									<input type="text" name="uId" id="uId" placeholder="아이디">								
								</td>
							</tr>
							<tr>
								
								<td colspan="2">
									<input type="password" name="uPw" id="uPw" placeholder="비밀번호">								
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">							
									<button type="button" id="loginBtn">로그인</button>
								</td>
							</tr>						
						</tfoot>
					</table>
					

				</div>
				<!-- loginArea -->
				
				<div id="findArea">
					<a href="/find/findId.jsp">아이디 찾기</a>
					<span>|</span>
					<a href="/find/findPw.jsp">비밀번호 찾기</a>
					<span>|</span>
					<a href="/join/join.jsp">회원가입</a>

				</div>
				<!-- findArea -->
			</form>
		</main>	
	</div>
	<!-- div#wrap -->
	
		<!-- 푸터 템플릿 영역 -->
		<footer id="footer" class="loginFooter">
			<iframe id="iframeFooter" src="/common/footerTmp.jsp" frameborder="0" scrolling="no"></iframe>
		</footer>
		<!-- 푸터 템플릿 영역 -->
</body>
</html>