<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String uId_Session_HTmp = (String)session.getAttribute("uId_Session"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header template</title>
<link rel="stylesheet" href="/style/style_Template.css">
<script src="/script/jquery-3.6.0.min.js"></script>
<script src="/script/script_Template.js"></script>
</head>
<body>
	<hr class="sepLine">
	<header id="header">
		<div id="headerTop">

				<% if (uId_Session_HTmp == null) { %>
            		<a href="/login/login.jsp" target="_top">Login</a>
            		|
            		<a href="/join/join.jsp" target="_top">Join</a>
            		|
            		<a href="/login/login.jsp" target="_top">Cart</a>
            		|
            		<a href="/login/login.jsp" target="_top">Order</a>
            		
				<% } else if (uId_Session_HTmp.equals("admin")){ %>
					<a href="/login/logout.jsp" target="_top">Logout</a>           		
            		|
            		<a href="/product/productList.jsp?gnbParam=store" target="_top">Product</a>
            		|
            		<a href="/recipe/recipeList.jsp?gnbParam=recipe" target="_top">Recipe</a>
            		|
            		<a href="/bbsFaq/faqList.jsp?gnbParam=community" target="_top">CS</a>
            		|
            		<a href="/admin/memberList.jsp" target="_top">Member</a>
					
				<% } else { %>
            		<a href="/login/logout.jsp" target="_top">Logout</a>
            		|
            		<a href="/mypage/orderList.jsp?gnbParam=myPage" target="_top">My Page</a>
            		|
            		<a href="/cart/cart.jsp?gnbParam=myPage target="_top">Cart</a>
            		|
            		<a href="#" target="_top">Order</a>
				<% } %>

		</div>
		<!-- div#headerTop -->


		<div id="headerMid" class="dFlex">
			<div id="headerLogoArea">
				<a href="../index.jsp" target="_top"> <img src="../images/logo-saruwa.png"
					alt="logo" style="width: 150px;">
				</a>
			</div>
			<!-- div#headerLogoArea -->

			<div id="headerSearchArea">
				<input type="text" id="headerSearchInput">
				<button type="button" id="headerSearchButton">search</button>
			</div>
			<!-- div#headerSearchArea -->
		</div>
		<!-- div#headerMid -->

		<nav id="headerGnbArea">
			<ul id="gnbMainMenu" class="dFlex">
				<li class="gnbMainLi"><a href="/product/productList.jsp?gnbParam=store">?????????</a>
					<ul class="gnbSubMenu">
						<li class="gnbSubLi"><a href="">????????????&#47;???&#47;??????</a></li>
						<li class="gnbSubLi"><a href="">??????&#47;??????&#47;??????</a></li>
						<li class="gnbSubLi"><a href="">????????????</a></li>
						<li class="gnbSubLi"><a href="">??????&#47;??????</a></li>
						<li class="gnbSubLi"><a href="">?????????&#47;????????????</a></li>
						<li class="gnbSubLi"><a href="">??????&#47;??????&#47;???</a></li>
						<li class="gnbSubLi"><a href="">??????&#47;??????</a></li>
						<li class="gnbSubLi"><a href="">??????&#47;??????&#47;?????????</a></li>
						<li class="gnbSubLi"><a href="">?????????&#47;???</a></li>
						<li class="gnbSubLi"><a href="">??????&#47;??????&#47;?????????</a></li>
						<li class="gnbSubLi"><a href="">??????&#47;???</a></li>
						<li class="gnbSubLi"><a href="">????????? ??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">?????????</a></li>
					</ul>
				</li>
				<!-- gnbMainLi ????????? -->
				
				<li class="gnbMainLi"><a href="/recipe/recipeList.jsp?gnbParam=recipe">?????????</a>
					<ul class="gnbSubMenu">
						<li class="gnbSubLi"><a href="">????????????</a></li>
						<li class="gnbSubLi"><a href="">?????????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">????????????</a></li>
						<li class="gnbSubLi"><a href="">????????????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">??????</a></li>
						<li class="gnbSubLi"><a href="">?????????</a></li>
					</ul>
				</li>
				<!-- gnbMainLi ????????? -->
				
				<li class="gnbMainLi"><a href="#">????????????</a>
					<ul class="gnbSubMenu">
						<li class="gnbSubLi"><a href="/bbsFaq/faqList.jsp?gnbParam=community">?????? ?????? ??????</a></li>
						<li class="gnbSubLi"><a href="/bbsQna/qnaList.jsp">1:1 ?????? ?????????</a></li>
						<li class="gnbSubLi"><a href="/bbsFree/freeboardList.jsp">?????? ?????????</a></li>
					</ul>
				</li>
				<!-- gnbMainLi ???????????? -->
			</ul>
			<!-- gnbMainMenu -->
		</nav>
		<!-- nav#headerGnbArea -->
	</header>
	<!-- header#header-->
	<hr class="sepLine">
</body>
</html>