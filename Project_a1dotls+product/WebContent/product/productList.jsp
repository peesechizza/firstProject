<%@page import="pack_Product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 
 <jsp:useBean id="mMgr" class="pack_Member.MemberMgr" scope="page" />
 --%>
<%
String uId_Session = (String) session.getAttribute("uId_Session");
%>

<%@ page import="pack_Product.ProductBean, java.util.Vector"%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" scope="page" />

<%
request.setCharacterEncoding("UTF-8");

///////페이징 관련 속성 값 시작////////
int totalRecord = 0;
int numPerPage = 9;
int pagePerBlock = 9;
int totalPage = 0;
int totalBlock = 0;

int nowPage = 1;
int nowBlock = 1;

int start = 0;
int end = 9;

int listSize = 0;

String keyField = "";
String keyWord = "";

if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;
}

totalRecord = pMgr.getTotalCount(keyField, keyWord);

totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

Vector<ProductBean> pList = null;
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="#" />
<link rel="stylesheet" href="/style/style_Scss.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>상품 목록</title>
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_Template.js"></script>
<script src="/script/find_script.js"></script>
<script src="/script/script_product.js"></script>
</head>
<body>
	<!--  헤더 템플릿 -->
	<%@ include file="/common/headerTmp.jsp"%>
	<!--  헤더 템플릿 -->

	<main id="pListmain" class="dFlex">
		<div id="lnb">
			<!--  메인 LNB 템플릿 시작 -->
			<%@ include file="/common/mainLnbTmp.jsp"%>
			<!--  메인 LNB 템플릿 끝 -->
		</div>

		<!-- contents 영역 시작 -->
		<div id="prodWrap" class="prodWrap">

			<%
			String prnType = "";
			if (keyWord.equals("null") || keyWord.equals("")) {
				prnType = "전체 게시글";
			} else {
				prnType = "검색결과";
			}
			%>

			<div class="sildes"></div>
			<!-- div.sildes -->


			<div id="pageInfo" class="dFlex">
				<div><%=prnType%>
					:
					<%=totalRecord%>개
				</div>
				<div>
					페이지 :
					<%=nowPage + " / " + totalPage%></div>
			</div>
			<div class="prodListWrap">

				<%
				pList = pMgr.contentList(keyField, keyWord, start, end); // DB에서데이터 불러오기 
				listSize = pList.size();
				if (pList.isEmpty()) {
				%>

				<h2>상품이 없습니다</h2>

				<%
				} else {
				%>

				<%
				for (int i = 0; i < numPerPage; i++) {

					if (i == listSize)
						break;

					ProductBean Pbean = pList.get(i);

					int pNum = Pbean.getpNum();
					String pName = Pbean.getpName();
					int pDiscountR = Pbean.getpDiscountR();
					int pOrigPrice = Pbean.getpOrigPrice();
					int pSellPrice = Pbean.getpSellPrice();
					String pSysImg = Pbean.getpSysImg();
					int pReadCnt = Pbean.getpReadCnt();
				%>

				<div class="productItem"
					onclick="productContent('<%=pNum%>', '<%=nowPage%>')">
					<div id="pNum"><%=pNum%></div>
					<div class="pImg">
						<img src="/product/BBSUploadFile/<%=pSysImg%>" alt="">사진
					</div>

					<div id="pInfo" class="productTbl">

						<div id="pName">
							<%=pName%>
						</div>
						<div id="outline">
							<%
							if (uId_Session.equals("admin")) {
							%>
							<div class="cartBtn, col">
								<button>장바구니</button>
							</div>
							<%
							}
							%>

							<div class="col" id="pDiscountR"><%=pDiscountR%>%
							</div>

							<div class="col">
								<div id="pOrigPrice"><%=pOrigPrice%>원
								</div>
								<div id="pSellPrice"><%=pSellPrice%>원
								</div>
							</div>

						</div>

					</div>

				</div>
			</div>
			<!-- div.prodListWrap -->

			<div id="listBottom" class="listBottom">
				<%
				}
				}
				%>


				<table>
					<tbody>
						<tr id="listBtnArea">
							<td colspan="2">
								<div id="btnArea">
									<%
									if (uId_Session == null){
									%>
									
									<%
									} else if (uId_Session.equals("admin")) {
									%>
									<button type="button" id="writeBtn" class="listBtnStyle">글쓰기</button>
									<% } %>
							
								</div>
							</td>

							<td colspan="2">

								<form name="searchFrm" class="dFlex" id="searchFrm">

									<div>
										<select name="keyField" id="keyField">
											<option value="pName"
												<%if (keyField.equals("pName"))
	out.print("selected");%>>제목</option>
											<option value="pContent"
												<%if (keyField.equals("pContent"))
	out.print("selected");%>>내용</option>
										</select>
									</div>
									<div>
										<input type="text" name="keyWord" id="keyWord" size="20"
											maxlength="30" value="<%=keyWord%>">
									</div>
									<div id="btnArea">
										<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
									</div>

								</form> <input type="hidden" id="pKeyField" value="<%=keyField%>">
								<input type="hidden" id="pKeyWord" value="<%=keyWord%>">
								<!-- 검색결과 유지용 매개변수 데이터끝 -->

							</td>
						</tr>
						<!-- tr#listBtnArea -->



						<tr id="listPagingArea">

							<!-- 페이징 시작 -->
							<td colspan="5" id="pagingTd">
								<%
								int pageStart = (nowBlock - 1) * pagePerBlock + 1;

								int pageEnd = (nowBlock < totalBlock) ? pageStart + pagePerBlock - 1 : totalPage;

								if (totalPage != 0) {
								%> <%
 if (nowBlock > 1) { // 페이지 블럭이 2이상이면 => 2개이상의 블럭이 있어야 가능
 %> <span class="moveBlockArea"
								onclick="moveBlock('<%=nowBlock - 1%>', '<%=pagePerBlock%>', 'pb')">
									&lt; </span> <%
 } else {
 %> <span class="moveBlockArea"></span> <%
 }
 %> <!-- 페이지 나누기용 페이지 번호 출력 시작  --> <%
 for (int i = pageStart; i <= pageEnd; i++) {
 %> <%
 if (i == nowPage) { // 현재 사용자가 보고 있는 페이지
 %> <span class="nowPageNum"><%=i%></span> <%
 } else { // 현재 사용자가 보고 있지 않은 페이지
 %> <span class="pageNum" onclick="movePage('<%=i%>')"> <%=i%>
							</span> <%
 } // End If
 %> <%
 } // End For
 %> <!-- 페이지 나누기용 페이지 번호 출력 끝  --> <%
 if (totalBlock > nowBlock) { // 다음 블럭이 남아 있다면
 %> <span class="moveBlockArea"
								onclick="moveBlock('<%=nowBlock + 1%>', '<%=pagePerBlock%>', 'nb')">
									&gt; </span> <%
 } else {
 %> <span class="moveBlockArea"></span> <%
 }
 %> <%
 } else {
 out.print("<b>[ Paging Area ]</b>"); // End if
 }
 %>

							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<!-- div#listBottom.listBottom -->
		</div>
		<!-- div.prodWrap -->
		<!-- contents 영역 끝 -->
	</main>
	<!--  footer 템플릿 -->
	<%@ include file="/common/footerTmp.jsp"%>
	<!--  footer템플릿 -->
</body>
</html>
