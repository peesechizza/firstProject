<%@page import="java.text.DecimalFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pack_Product.ProductBean"%>


<%
//session 연결
String uId_Session = (String)session.getAttribute("uId_Session");
// String uId = (String)session.getAttribute("uId");
%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" scope="page" />


<%
request.setCharacterEncoding("UTF-8");
int prodNum = Integer.parseInt(request.getParameter("pNum"));

String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");

//목록으로 돌아가기 (현재 페이지)
String nowPage = request.getParameter("nowPage");

//조회수 증가
pMgr.upCount(prodNum);
//productList.jsp에서 클릭한 게시글번호 데이터 가져오기
ProductBean Pbean = pMgr.Pboard(prodNum);

int pNum = Pbean.getpNum();
String pCode = Pbean.getpCode();
String pName = Pbean.getpName();
int pOrigPrice = Pbean.getpOrigPrice();
int pDiscountR = Pbean.getpDiscountR();
int pDivi = Pbean.getpDivi();
int pSellPrice = Pbean.getpSellPrice();
int pQuan = Pbean.getpQuan();
String pTM = Pbean.getpTM();
String pSysImg = Pbean.getpSysImg();
int pReadCnt = Pbean.getpReadCnt();
String pContent = Pbean.getpContent();


//천단위구분
DecimalFormat DF = new DecimalFormat("###,###");

//세션 객체 만들어준다
session.setAttribute("Pbean", Pbean);

%>
<!-- 카테고리 /  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="#">
<title>상품 상세보기</title>
<link rel="stylesheet" href="/style/style_Scss.css" />
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_product.js"></script>
</head>
<body>

	<!--  헤더 템플릿 -->
	<%@ include file="/common/headerTmp.jsp"%>
	<!--  헤더 템플릿 -->

	<main id="main_Con" class="dFlex">
		<div id="lnb">
			<!--  메인 LNB 템플릿 시작 -->
			<%@ include file="/common/mainLnbTmp.jsp"%>
			<!--  메인 LNB 템플릿 끝 -->
		</div>

		<!-- contents 영역 시작 -->
		<div class="contentWrap">
		
	   <div id="contents" class="Class_ProductContent"> 
	   
		 <div class="productInfo">
		 
		  <h1 id="Title">
            <%=pName %>
		  </h1>

          <hr />
          <span>조회수 : <%=pReadCnt %></span>

          <table>
            <tbody>
             <tr>
                <td><label for="pDivi">분류</label></td>
                <td>
                  <div id="pDivi"><%=pDivi%></div>
                </td>
              </tr>
              <tr>
                <td><label for="pCode">상품 코드</label></td>
                <td>
                  <div id="pCode"><%=pCode %></div>
                </td>
              </tr>
              <tr>
                <td><label for="pQuan">남은 수량</label></td>
                <td>
                  <div id="pQuan"><%=pQuan %></div>
                </td>
              </tr>
              <%if(pDiscountR != 0){ %>
              <tr>
                  <td id="pDiscountR"><%=pDiscountR %>%</td>
                 <td>
                  <div id="pOrigPrice"> <%=DF.format(pOrigPrice) %> 원</div>
                  <%} %>
                </td>
              </tr>
              <tr>
                <td><label for="pSellPrice">판매가 ￦</label></td>
                <td>
                  <div id="pSellPrice"><%=DF.format(pSellPrice) %> 원</div>
                </td>
              </tr>
             </tbody>
          </table>
          <%if(uId_Session.equals("admin")) { %>
          <!-- 장바구니 (관리자 안보이게 (일단 관리자도 보이게끔)) -->
          <div id="btnArea">
          <button onclick='cartBtn(\""+pCode+"\",\""+pSellPrice+"\")'>담기</button>
          <button onclick='cartMove()'>장바구니 보기</button>
          </div>
         <%} %>
         </div>
		 <!-- div#productInfo -->
		 <div class="productInfo">
             <img src="/product/BBSUploadFile/<%=pSysImg %>" alt="" />
         </div>
		 <!-- div#productInfo -->       
          	
		</div>        
		<hr />
          <div id="productContent">
            <%=pContent %>
          </div>
          
          
			<div id="btnArea">
				<button type="button"
					onclick="location.href='/product/productList.jsp'">목록보기</button>
				<% if (uId_Session.equals("admin"))  {  %>
				<button type="button" id="DelContent">삭제</button>
				<button type="button" id="UpContent">수정</button>
				<%} %>
			</div>
			<!-- div#btnArea -->
			
			<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
				<input type="hidden" name="pNum" value="<%=pNum%>" id="pNum">
				
				<!-- 검색어전송 시작 -->
				<input type="hidden" id="pKeyField" value="<%=keyField%>">
				<input type="hidden" id="pKeyWord" value="<%=keyWord%>">
				<!-- 검색어전송 끝 -->
				
			
		</div>
		<!-- contents 영역 끝 -->
	</main>
	<!--  footer 템플릿 -->
	<%@ include file="/common/footerTmp.jsp"%>
	<!--  footer템플릿 -->
</body>
</html>