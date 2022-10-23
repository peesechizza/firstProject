<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="mMgr" class="pack_Member.MemberMgr" scope="page" /> --%>
<%
String uId = (String)session.getAttribute("uId_Session");
/* String uName = mMgr.getMemberName(uId); */
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
 	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta charset="UTF-8">
		<title>레시피 글쓰기</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Recipe.css">
		<script src="/source/jquery-3.6.0.min.js"></script>
		<script src="/script/recipe_script.js"></script>		
</head>
<body>

	<!-- 헤더템플릿 -->
	<header id="header" class="infoModHeader">
		<jsp:include page="/common/headerTmp.jsp"/>		
	</header>
	<!-- <iframe src="/common/headerTmp.jsp" frameborder="0" scrolling="no"></iframe> -->
	<!-- 헤더템플릿 -->
	
	<div id="wrap" class="rWriteWrap dFlex">

		<nav id="lnbMenu">
			<jsp:include page="/common/mainLnbTmp.jsp" />
			<!-- <iframe src="/common/mainLnbTmp.jsp" frameborder="0" scrolling="no" id="iframeLNB"></iframe> -->
		</nav>
		
		<main id="main">
			<div id="contents" class="recipeWrite">
				<h3>글쓰기</h3>
				<form name="writeFrm" enctype="multipart/form-data" 
						  method="post" id="writeFrm">
				
					<table>
						<tbody>
							<tr>
								<td class="req">아이디</td>  <!-- td.req 필수입력 -->
								<td>
									<%=uId%>
									<input type="hidden" name="uId" value="<%=uId%>">
								</td>
							</tr>
							<tr>
								<td class="req">제목</td> <!-- td.req 필수입력 -->
								<td>
									<input type="text" name="rTitle" maxlength="50" id="rTitle">
								</td>
							</tr>
							<tr>
								<td class="req">분류</td> <!-- td.req 필수입력 -->
								<td>
    								<select id="rDivi" name="rDivi" class="frmDropMenu">
    									<option value=""> - 선택 - </option>
    									<option>메인요리</option>
    									<option>밑반찬</option>
    									<option>간식</option>
    									<option>간단요리</option>
    									<option>초대요리</option>
    									<option>채식</option>
    									<option>한식</option>
    									<option>양식</option>
    									<option>일식</option>
    									<option>중식</option>
    									<option>퓨전</option>
    									<option>분식</option>
    									<option>안주</option>
    									<option>베이킹</option>
    								</select>
								</td>
							</tr>
							<tr>
								<td class="contentTD">내용</td>
								<td>
									<textarea name="rContent" id="rContent" cols="60" wrap="hard"></textarea>
								</td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td>
									<span class="spanFile">
										<input type="file" name="rFileName" id="rFileName">
									</span>	
								</td>
							</tr>
							<tr>
								<td>내용타입</td>
								<td>
									<label>
										<input type="radio" name="contentType" value="HTML">									
										<span>HTML</span>	
									</label>
									<label>
										<input type="radio" name="contentType" value="TEXT" checked>
										<span>TEXT</span>
									</label>
								</td>
							</tr>
						</tbody>
						<tfoot>
				
							<tr>
								<td colspan="2">
									<button type="button" id="regBtn">등록</button>
									<button type="reset">다시쓰기</button>
									<button type="button" id="listBtn">리스트</button>
								</td>
							</tr>
						</tfoot>
					</table>
					<%-- <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"> --%>								
				</form>
			</div>
		</main>
	
	</div>
	
</body>
</html>