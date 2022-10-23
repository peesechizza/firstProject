<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="pBean" class="pack_Product.ProductBean" scope="page"/>
<!-- productContent.jsp에서 DB자료 반환값으로 session을 만들때 pBean이다/ -->
<jsp:useBean id="upBean" class="pack_Product.ProductBean" scope="page"/>jsp
<!-- 수정시 입력값을 전달받아 초기화시키기위해 생성 -->
<jsp:setProperty property="*" name="upBean"/>
<%-- 전달된 입력값과 매개변수 name 속성값이 Bean이랑 맞으면 초기화된다. --%>
<%
request.setCharacterEncoding("UTF-8");


String nowPage = request.getParameter("nowPage");

//검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝
%>

<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" scope="page"/>

<%
int exeCnt = pMgr.updateContent(upBean);


if (exeCnt > 0) {
String url = "/product/productContent.jsp?nowPage="+nowPage;
		 url += "&pNum="+upBean.getpNum();
		 url += "&keyField="+keyField;
		 url += "&keyWord="+keyWord;
%>
	
	 <script>
	 	location.href="<%=url%>";
	 </script>
<%		
} else {
%>		
	<script>
		alert("DB처리중 오류가 발생했습니다.\n문제가 계속되면 관리자에게 연락바랍니다.");
		history.back();
	</script>

<%
}	
%>
