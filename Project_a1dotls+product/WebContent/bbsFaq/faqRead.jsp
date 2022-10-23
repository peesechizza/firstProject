<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 내용 보기</title>
</head>
<body>
	<header id="header">
		<%@ include file="/common/headerTmp.jsp"%>
	</header>

	<div id="wrap" class="dFlex">

		<nav id="lnbMenu">
			<%@ include file="/common/mainLnbTmp.jsp"%>
		</nav>
		<!-- nav#lnbMenu -->

		<main id="main">
			<h1>FAQ</h1>
			<hr class="sepLine">
			
			<table id="faqReadTable">
				<tbody>
					<tr>
						<td>제목</td>
						<td><%= %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><%= %></td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="/bbsFaq/faqList.jsp">
								<button type="button" class="listButtonStyle">목록보기</button>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</main>
		<!-- main#main -->
	</div>
	<!-- div#wrap -->
	<footer id="footer">
		<%@ include file="/common/footerTmp.jsp"%>
	</footer>
</body>
</html>