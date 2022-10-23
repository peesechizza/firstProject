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
				<li class="gnbMainLi"><a href="/product/productList.jsp?gnbParam=store">스토어</a>
					<ul class="gnbSubMenu">
						<li class="gnbSubLi"><a href="">베이커리&#47;떡&#47;간식</a></li>
						<li class="gnbSubLi"><a href="">반찬&#47;냉장&#47;김치</a></li>
						<li class="gnbSubLi"><a href="">건강식품</a></li>
						<li class="gnbSubLi"><a href="">정육&#47;계란</a></li>
						<li class="gnbSubLi"><a href="">간편식&#47;조리식품</a></li>
						<li class="gnbSubLi"><a href="">음료&#47;커피&#47;차</a></li>
						<li class="gnbSubLi"><a href="">채소&#47;과일</a></li>
						<li class="gnbSubLi"><a href="">면류&#47;장류&#47;조미료</a></li>
						<li class="gnbSubLi"><a href="">과일청&#47;잼</a></li>
						<li class="gnbSubLi"><a href="">수산&#47;해산&#47;건어물</a></li>
						<li class="gnbSubLi"><a href="">견과&#47;쌀</a></li>
						<li class="gnbSubLi"><a href="">영유아 전용</a></li>
						<li class="gnbSubLi"><a href="">비건</a></li>
						<li class="gnbSubLi"><a href="">전통주</a></li>
					</ul>
				</li>
				<!-- gnbMainLi 스토어 -->
				
				<li class="gnbMainLi"><a href="/recipe/recipeList.jsp?gnbParam=recipe">레시피</a>
					<ul class="gnbSubMenu">
						<li class="gnbSubLi"><a href="">메인요리</a></li>
						<li class="gnbSubLi"><a href="">밑반찬</a></li>
						<li class="gnbSubLi"><a href="">간식</a></li>
						<li class="gnbSubLi"><a href="">간단요리</a></li>
						<li class="gnbSubLi"><a href="">초대요리</a></li>
						<li class="gnbSubLi"><a href="">채식</a></li>
						<li class="gnbSubLi"><a href="">한식</a></li>
						<li class="gnbSubLi"><a href="">양식</a></li>
						<li class="gnbSubLi"><a href="">일식</a></li>
						<li class="gnbSubLi"><a href="">중식</a></li>
						<li class="gnbSubLi"><a href="">퓨전</a></li>
						<li class="gnbSubLi"><a href="">분식</a></li>
						<li class="gnbSubLi"><a href="">안주</a></li>
						<li class="gnbSubLi"><a href="">베이킹</a></li>
					</ul>
				</li>
				<!-- gnbMainLi 레시피 -->
				
				<li class="gnbMainLi"><a href="#">커뮤니티</a>
					<ul class="gnbSubMenu">
						<li class="gnbSubLi"><a href="/bbsFaq/faqList.jsp?gnbParam=community">자주 묻는 질문</a></li>
						<li class="gnbSubLi"><a href="/bbsQna/qnaList.jsp">1:1 문의 게시판</a></li>
						<li class="gnbSubLi"><a href="/bbsFree/freeboardList.jsp">자유 게시판</a></li>
					</ul>
				</li>
				<!-- gnbMainLi 커뮤니티 -->
			</ul>
			<!-- gnbMainMenu -->
		</nav>
		<!-- nav#headerGnbArea -->
	</header>
	<!-- header#header-->
	<hr class="sepLine">
</body>
</html>