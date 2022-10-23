<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 글쓰기</title>
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
		<!-- nav#lnbMenu -->

		<main id="main">
			<h1>FAQ 등록</h1>
			<!-- <hr class="sepLine"> -->
			
			<table id="faqWriteTable">
				<tbody>
					<tr>
						<td>제목</td>
						<td><input type="text" id="faqTitleInput"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="" id="faqContentInput" rows="20"></textarea>
						</td>
					</tr>
					<tr >
						<td colspan="2"><a href="/bbsFaq/faqWriteProc.jsp"><button
									type="button" class="listButtonStyle">등록하기</button></a> <a
							href="/bbsFaq/faqList.jsp"><button type="button"
									class="listButtonStyle">목록보기</button></a></td>
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