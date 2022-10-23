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
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
 	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta charset="UTF-8">
		<title>주문 내역</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Test.css">
		<script src="/source/jquery-3.6.0.min.js"></script>
		<script src="/script/script.js"></script>		
</head>
<body>
	
	<!-- 헤더템플릿 -->
	<header id="header" class="orderListHeader">
		<jsp:include page="/common/headerTmp.jsp"/>		
	</header>
	<!-- <iframe src="/common/headerTmp.jsp" frameborder="0" scrolling="no"></iframe> -->
	<!-- 헤더템플릿 -->
		
	<div id="wrap" class="orderListWrap dFLex">
		
		<nav id="lnbMenu">
			<jsp:include page="/common/mainLnbTmp.jsp"/>
			<!-- <iframe src="/common/mainLnbTmp.jsp" frameborder="0" scrolling="no" id="iframeLNB"></iframe> -->
		</nav>
	
		<main id="main">
			<div id="orderList">
				<h1>주문 내역</h1>
				<hr>
				<div id="orderContents" class="dFlex">
					<p>최근 주문 내역이 없습니다. </p>
					<button type="button" onclick="location.href='/product/product.jsp'" id="prodShopBtn">상품 보러 가기</button>
				</div>
			</div>

		</main>
		<!-- main#main -->
	</div>
	<!-- div#wrap -->
	
		<!-- 푸터템플릿 -->
		<iframe src="/common/footerTmp.jsp" frameborder="0" scrolling="no" id="iframeFooter"></iframe>
		<!-- 푸터템플릿 -->	
</body>
</html>