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
	<title>MainPage</title>
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="/style/style_Test.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/index_script.js"></script>
</head>
<body>
		<!-- 헤더템플릿 -->
		<jsp:include page="/common/headerTmp.jsp"/>
		<!-- <iframe src="/common/headerTmp.jsp" frameborder="0" scrolling="no"></iframe> -->
		<!-- 헤더템플릿 -->
	
	<div id="wrap" class="mainWrap">
		<main id="main">
			<div id="slideshowArea">
	              <div id="slideFrame">	                
	                	<a href="#" data-no="1">   
	                		<img src="/images/슬라이드이미지1.jpg" alt="슬라이드1">
	                		<span class="slideTxt">
	                			아침에 가볍게 먹기 좋은 샐러드
	                		</span>
	                	</a>
	                	
	                	<a href="#" data-no="2">
	                		<img src="/images/슬라이드이미지2.jpg" alt="슬라이드2" >
	                		<span class="slideTxt">
	                			집에서 할 수 있는 간단 요리 
	                		</span>
	                	</a>
	                	
	                	<a href="#" data-no="3">  
	                		<img src="/images/슬라이드이미지3.jpg" alt="슬라이드3" >
	                		<span class="slideTxt">
	                			쌀쌀할 때 생각나는 뜨끈한 국물
	                		</span>
	                	</a>
	                
	                </div>
	                <!-- div#slideFrame -->
	                
	            </div>
	            <!-- div#slideshowArea, 슬라이드 쇼 끝 -->
			
			<div id="contents">
			
				<div id="product">
					<h1>Best 상품</h1>
					
					<div id="productContents" class="dFlex">
						<div class="items">
							<img src="/images/상품이미지1.png" alt="상품이미지1" width="400">
							<p>갈비탕</p>
							<span>12,000 원</span>
						</div>
						<div class="items">
							<img src="/images/상품이미지2.png" alt="상품이미지2" width="400">
							<p>샐러드 3종</p>
							<span>5,900 원 ~ </span>
						</div>
						<div class="items">
							<img src="/images/상품이미지3.png" alt="상품이미지3" width="400">
							<p>버섯 불고기</p>
							<span>12,600 원</span>
						</div>
					</div>	
						
					
				</div>
				<!-- div#product -->
				
				<div id="recipe">
					<h1>이 달의 레시피</h1>
					
					<div id="recipeContents" class="dFlex">
						<div class="items">
							<img src="/images/레시피이미지1.png" alt="레시피이미지1" width="400">
							<p>바질 토마토 에그인헬</p>
						</div>
						<div class="items">
							<img src="/images/레시피이미지2.png" alt="레시피이미지2" width="400">
							<p>모츠나베</p>
						</div>
						<div class="items">
							<img src="/images/레시피이미지3.png" alt="레시피이미지3" width="400">
							<p>들깨 전복죽</p>
						</div>
					</div>	
				</div>
				<!-- div#recipe -->
			
			</div>
			<!-- div#contents -->
		</main>
	</div>
	
		<!-- 푸터템플릿 -->
		<iframe src="/common/footerTmp.jsp" frameborder="0" scrolling="no" id="iframeFooter"></iframe>
		<!-- 푸터템플릿 -->	
</body>
</html>
