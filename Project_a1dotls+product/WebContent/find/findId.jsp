<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<title>Document</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_Test.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/find_script.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 로고 이미지 영역 -->
	<header id="header">
		<a href="../index.jsp" target="_top"> <img
			src="../images/logo-saruwa.png" alt="logo" style="width: 250px;"></a>
	</header>
	<!-- 로고 이미지 영역 -->
	<div id="wrap" class="findIdWrap">
		<main id="main">

			<form name="findIdFrm" id="findIdFrm">
				<div id="findArea">
					<table id="findIdTbl">
						<tbody>
							<tr>
								<td colspan="2">
									<input type="text" name="uName" id="uName" placeholder="이름을 입력해주세요.">							
								</td>
							</tr>
							<tr>
								
								<td colspan="2">
									<input type="text" name="uEmail" id="uEmail" placeholder="가입하신 이메일을 입력해주세요.">							
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">							
									<button type="button" id="findIdBtn">아이디 찾기</button>
								</td>
							</tr>						
						</tfoot>
					</table>
				</div>
			</form>
		</main>
	</div>

	<!-- 푸터 템플릿 영역 -->
	<footer id="footer" class="loginFooter">
		<iframe id="iframeFooter" src="/common/footerTmp.jsp" frameborder="0"
			scrolling="no"></iframe>
	</footer>
	<!-- 푸터 템플릿 영역 -->
</body>
</html>