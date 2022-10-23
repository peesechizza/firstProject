<%@page import="pack_Recipe.RecipeBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String) session.getAttribute("uId_Session");
%>
<jsp:useBean id="rBean" class="pack_Recipe.RecipeBean" />
<jsp:useBean id="rMgr" class="pack_Recipe.RecipeMgr" />
<%
int totalRecord = 0; // 전체 데이터 수(DB에 저장된 row 개수)
int numPerPage = 6; // 페이지당 출력하는 데이터 수(=게시글 숫자)
int pagePerBlock = 5; // 블럭당 표시되는 페이지 수의 개수
int totalPage = 0; // 전체 페이지 수
int totalBlock = 0; // 전체 블록수

int nowPage = 1; // 현재 (사용자가 보고 있는) 페이지 번호
int nowBlock = 1; // 현재 (사용자가 보고 있는) 블럭

int start = 0; // DB에서 데이터를 불러올 때 시작하는 인덱스 번호
int end = 6; // 시작하는 인덱스 번호부터 반환하는(=출력하는) 데이터 개수 

int listSize = 0;

String keyField = ""; // DB의 컬럼명
String keyWord = ""; // DB의 검색어

if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;
}

totalRecord = rMgr.getTotalCount(keyField, keyWord);

totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

Vector<RecipeBean> objList = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<title>레시피</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_Recipe.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/recipe_script.js"></script>
</head>
<body>

	<!-- 헤더템플릿 -->
	<header id="header" class="infoModHeader">
		<jsp:include page="/common/headerTmp.jsp" />
	</header>
	<!-- <iframe src="/common/headerTmp.jsp" frameborder="0" scrolling="no"></iframe> -->
	<!-- 헤더템플릿 -->


	<div id="wrap" class="rListWrap dFlex">

		<nav id="lnbMenu">
			<jsp:include page="/common/mainLnbTmp.jsp" />
			<!-- <iframe src="/common/mainLnbTmp.jsp" frameborder="0" scrolling="no" id="iframeLNB"></iframe> -->
		</nav>

		<main id="main">
			<h3>카테고리명</h3>
			<div id="contents" class="recipeList">
				<%
				String prnType = "";
				if (keyWord.equals("null") || keyWord.equals("")) {
					prnType = "총";
				} else {
					prnType = "검색 결과";
				}
				%>

				<div id="pageInfo">
					<span><%=prnType%> : <%=totalRecord%> 개</span>
					<%-- <span>페이지 :  <%=nowPage + " / " + totalPage%></span>   --%>
				</div>

				<div id="recipeArea" class="dFlex">
					<%
					objList = rMgr.getRecipeList(keyField, keyWord, start, end);
					listSize = objList.size();

					if (objList.isEmpty()) {
					%>

					<div class="recipeItem">
						<!-- 				<div class="itemImg"> -->
						<%="게시물이 없습니다."%>
						<!-- 				</div> div.itemImg 레시피 이미지
						
						<div class="itemContent">
						
						</div> div.itemContent 레시피 내용 -->

					</div>
					<!-- div#recipeItem 레시피  -->


					<%
					} else {
					%>

					<%
					for (int i = 0; i < numPerPage; i++) {

						if (i == listSize)
							break;

						rBean = objList.get(i);

						/* String rDivi = rBean.getrDivi(); */
						int rNum = rBean.getrNum();
						String rTitle = rBean.getrTitle();
						String rFileName = rBean.getrFileName();
					%>

					<div class="recipeItem">
						<div class="itemImg">
							<img src="/recipe/recipeImg/<%=rFileName%>"
								onclick="read('<%=rNum%>', '<%=nowPage%>')">
						</div>
						<!-- div.itemImg 레시피 이미지 -->

						<div class="itemContent">
							<h4><%=rTitle%></h4>
						</div>
						<!-- div.itemContent 레시피 내용 -->

					</div>
					<!-- div#recipeItem 레시피  -->


					<%
					} // end for  데이터가 있을 경우 출력 끝
					} // end if
					%>
				</div>
				<!-- div#recipeArea -->
			</div>
			<!-- div#contents 레시피 목록 구역 -->

			<div id="listBtnArea" class="dFlex">
				<%
				if (uId_Session == null) {
				%>
				<button type="button" id="loginAlertBtn" class="listBtnStyle">글쓰기</button>
				<%
				} else {
				%>
				<button type="button" id="writeBtn" class="listBtnStyle">글쓰기</button>
				<%
				}
				%>

				<form name="searchFrm" class="dFlex" id="searchFrm">
					<div>
						<select name="keyField" id="keyField">
							<option value="subject"
								<%if (keyField.equals("rTitle"))
									out.print("selected");%>>
									제 목</option>
							<option value="uName"
								<%if (keyField.equals("uId"))
									out.print("selected");%>>아이디</option>
						</select>
					</div>
					<div>
						<input type="text" name="keyWord" id="keyWord" id="keyWord"
							size="20" maxlength="30" value="<%=keyWord%>">
					</div>
					<div>
						<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
					</div>
				</form>

				<!-- 검색결과 유지용 매개변수 데이터시작 -->
				<input type="hidden" id="pKeyField" value="<%=keyField%>"> <input
					type="hidden" id="pKeyWord" value="<%=keyWord%>">
				<!-- 검색결과 유지용 매개변수 데이터끝 -->

			</div>
			<!-- div#listBtnArea -->

			<div id="listPagingArea">

				<!-- 페이징(= 페이지 나누기) 시작 -->
				<div id="pagingDiv">
					<%
					int pageStart = (nowBlock - 1) * pagePerBlock + 1;
					int pageEnd = (nowBlock < totalBlock) ? pageStart + pagePerBlock - 1 : totalPage;
					if (totalPage != 0) {
					%>

					<%
					if (nowBlock > 1) {
					%>
					<span class="moveBlockArea"
						onclick="moveBlock('<%=nowBlock - 1%>', '<%=pagePerBlock%>', 'pb')">
						&lt; </span>
					<%
					} else {
					%>
					<span class="moveBlockArea"></span>
					<%
					}
					%>

					<!-- 페이지 나누기용 페이지 번호 출력 시작  -->
					<%
					for (int i = pageStart; i <= pageEnd; i++) {
					%>
					<%
					if (i == nowPage) { // 현재 사용자가 보고 있는 페이지
					%>
					<span class="nowPageNum"><%=i%></span>
					<%
					} else { // 현재 사용자가 보고 있지 않은 페이지
					%>
					<span class="pageNum" onclick="movePage('<%=i%>')"> <%=i%>
					</span>
					<%
					} // End If
					%>

					<%
					} // End For
					%>
					<!-- 페이지 나누기용 페이지 번호 출력 끝  -->

					<%
					if (totalBlock > nowBlock) { // 다음 블럭이 남아 있다면
					%>
					<span class="moveBlockArea"
						onclick="moveBlock('<%=nowBlock + 1%>', '<%=pagePerBlock%>', 'nb')">
						&gt; </span>
					<%
					} else {
					%>
					<span class="moveBlockArea"></span>
					<%
					}
					%>
					<%
					} else {
					out.print("<b>[ Paging Area ]</b>"); // End if
					}
					%>

				</div>
			</div>

		</main>
	</div>

	<footer id="footer">
		<!-- 푸터템플릿 영역 -->
	</footer>
</body>
</html>