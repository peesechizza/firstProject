<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pack_BBS.BoardBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.List"%>

<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr" scope="page" />

<%
String uId_Session = (String) session.getAttribute("uId_Session");
Vector<BoardBean> vList = null;
request.setCharacterEncoding("UTF-8");

///////////// 페이징(Paging) 관련 속성 값 시작 /////////////

int totalRecord = 0; // 전체 데이터 수(DB에 저장된 row 개수)
int numPerPage = 5; // 페이지당 출력하는 데이터 수(=게시글 숫자)
int pagePerBlock = 5; // 블럭당 표시되는 페이지 수의 개수
int totalPage = 0; // 전체 페이지 수
int totalBlock = 0; // 전체 블록수

int nowPage = 1; // 현재 (사용자가 보고 있는) 페이지 번호
int nowBlock = 1; // 현재 (사용자가 보고 있는) 블럭

int start = 0; // DB에서 데이터를 불러올 때 시작하는 인덱스 번호
int end = 5; // 시작하는 인덱스 번호부터 반환하는(=출력하는) 데이터 개수 
// select * from T/N where... order by ... limit 5, 5;
// 데이터가 6개   1~5
//                  인덱스번호 5이므로 6번 자료를 의미  5개

int listSize = 0; // 1페이지에서 보여주는 데이터 수
//출력할 데이터의 개수 = 데이터 1개는 가로줄 1개

totalRecord = bMgr.getTotalCount(); // 전체 데이터 수

totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

///////////// 페이징(Paging) 관련 속성 값 끝 /////////////
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ List</title>
<link rel="stylesheet" href="/style/style_BBS.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_BBS.js"></script>
</head>
<body>
	<header id="header">
		<%@ include file="/common/headerTmp.jsp"%>
	</header>


	<div id="wrap" class="dFlex">

		<nav id="lnbMenu">
			<%@ include file="/common/mainLnbTmp.jsp"%>
		</nav>

		<main id="main">
			<h1>FAQ</h1>
			<!-- <hr class="sepLine"> -->
			<div id="contents" class="faqList">
				<table id="faqBoardList">
					<thead>
						<tr>
							<% if(uId_Session.equals("admin")) { %>
							<th class="faqListSelect">
								<input type="checkbox" name="faqListCheck" id="faqCheckAll">
							</th>
							<% } %>
							<th class="faqListNo">번호</th>
							<th class="faqListTitle">제목</th>
						</tr>
					</thead>
					<tbody>
						<%
						vList = bMgr.getBoardList(start, end); // DB에서 데이터 불러오기
						listSize = vList.size();

						if (vList.isEmpty()) {
							// 데이터가 없을 경우 출력 시작
							
							if(uId_Session.equals("admin")){ %>
						<tr>
							<td colspan="3"><%="게시물이 없습니다."%></td>
						</tr>
						<%
							} else { %>

						<tr>
							<td colspan="2"><%="게시물이 없습니다."%></td>
						</tr>

						<% } %>

						<%
						} else {
						// 데이터가 있을 경우 
						for (int i = 0; i < numPerPage; i++) {

							if (i == listSize)
								break;

							BoardBean bean = vList.get(i);

							int fNum = bean.getfNum();
							String fTitle = bean.getfTitle();
						%>
						<tr class="faqPrintTr" onclick="read('<%=fNum%>','<%=nowPage%>')">
							<% if(uId_Session.equals("admin")) { %>
							<td class="faqListSelect">
								<input type="checkbox" name="faqListCheck" class="faqDelCheck">
							</td>
							<% } %>
							<td class="faqListNo"><%=fNum%></td>
							<td class="faqListTitle"><%=fTitle%></td>
						</tr>
						<%
							}
						}
						%>
					</tbody>
					
					<%
					if (uId_Session.equals("admin")) {
					%>
					<tfoot>
						<tr class="listBtnArea">
							<td colspan="3">
							<a href="/bbsFaq/faqInsert.jsp?gnbParam=community">
									<button type="button" id="faqWriteButton" class="listButtonStyle">글쓰기</button>
							</a> 
							<a href="/bbsFaq/faqDelete.jsp">
									<button type="button" id="faqDeleteButton"  class="listButtonStyle">삭제하기</button>
							</a>
							</td>
						</tr>
					</tfoot>
					<%
					}
					%>
				</table>
				<!-- table#boardList -->
				
				<div id="pagingArea"> <!--  class="dFlex" -->
					<%
						int pageStart = (nowBlock - 1 ) * pagePerBlock + 1;
						int pageEnd = (nowBlock < totalBlock) ? pageStart + pagePerBlock - 1 :  totalPage;
						if(totalPage != 0){
							
							if(nowBlock > 1){ //페이지 블럭이 2개 이상 있고 현재 페이지 블럭이 첫번째 블럭이 아닐경우							
						%>
							<span class="moveBlockArea" onclick="moveBlock('<%=nowBlock%>','<%=pagePerBlock%>','prev')">&lt;</span>
						<%
							}
							// 페이지 나누기용 번호 출력 시작
							for(int i=pageStart;i<=pageEnd;i++){
								if(i==nowPage){
									%>
									<span class="nowPageNum"><%=i %></span>
									<%
								}else{
									%>
									<span class="pageNum" onclick="movePage(<%=i%>)"><%=i %> </span>
									<%
								}
							}
							// 페이지 나누기용 번호출력 시작
							
							if(totalBlock>nowBlock){ //페이지 블럭이 더 있을 경우
								%>
								<span class="moveBlockArea" onclick="moveBlock('<%=nowBlock%>','<%=pagePerBlock%>','next')">&gt;</span>
								<%
							}
						}
						%>
				</div>
				<!-- div#pagingArea -->
			</div>
			<!-- div#contents-->
		</main>

	</div>
	<!-- div#wrap -->

	<footer id="footer">
		<%@ include file="/common/footerTmp.jsp"%>
	</footer>
</body>
</html>