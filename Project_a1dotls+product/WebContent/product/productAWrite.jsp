<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pack_Product.ProductBean"%>

<!--  ID값 가져오기 / 실시간 판매가 출력하기 / 사진 미리보기(증명사진처럼)-->
<jsp:useBean id="pMgr" class="pack_Product.ProductMgr" scope="page" />

<%
String uId = (String) session.getAttribute("uId_Session");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_Scss.css" />
<title>상품 글쓰기</title>
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_Template.js"></script>
<script src="/script/find_script.js"></script>
<script src="/script/script_product.js"></script>
</head>
<body>
	<!--  헤더 템플릿 -->
	<%@ include file="/common/headerTmp.jsp"%>
	<!--  헤더 템플릿 -->

	<main id="main" class="dFlex">

		<div id="lnb">
			<!--  메인 LNB 템플릿 시작 -->

			<%@ include file="/common/mainLnbTmp.jsp"%>
			<!--  메인 LNB 템플릿 끝 -->
		</div>

		<!-- contents 영역 시작 -->
		<div id="productWrite" class="Class_ProductWrite">

			<form action="/product/productAWriteProc.jsp"
				enctype="multipart/form-data" method="post" id="pWriteFrm">

				<div id="Title">
					<input type="text" name="pName" id="pName" placeholder="상품명을 적으세요" />
					<input type="hidden" name="uId" value="<%=uId%>" />
				</div>
				<hr />
				<table>
					<tbody>
						<tr>
							<td><label for="pCode">상품 코드</label></td>
							<td><input type="text" name="pCode" id="pCode" /></td>
						</tr>
						<tr>
							<td><label for="pQuan">상품 수량</label></td>
							<td><input type="number" name="pQuan" id="pQuan" /></td>
						</tr>
						<tr>
							<td><label for="pOrigPrice">원가</label></td>
							<td><input type="number" name="pOrigPrice" id="pOrigPrice" />원</td>
						</tr>
						<tr>
							<td><label for="pDiscountR">할인율</label></td>
							<td><input type="number" name="pDiscountR" id="pDiscountR" />%</td>
						</tr>
						<tr>
							<td><label for="pSellPrice">판매가</label></td>
							<td><input type="number" id="pSellPrice" name="pSellPrice"></td>
						</tr>
						<tr>
							<td><label for="pOrigImg">이미지 등록</label></td>
							<td><input type="file" name="pOrigImg" id="pOrigImg" /></td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="selectCtgArea">
									<div id="selectCtgArea">
										<select name="pDivi" id="pDivi">
											<option value=""> - </option>
											<option value="2">베이커리/떡/간식</option>
											<option value="3">반찬/냉장/김치</option>
											<option value="4">건강식품</option>
											<option value="5">정육/계란</option>
											<option value="6">간편식/조리식품</option>
											<option value="7">음료/커피/차</option>
											<option value="8">채소/과일</option>
											<option value="9">면류/장류/조미료</option>
											<option value="10">과일청/잼</option>
											<option value="11">수산/해산/건어물</option>
											<option value="12">견과/쌀</option>
											<option value="13">영유아 전용</option>
											<option value="14">비건</option>
											<option value="15">전통주</option>
										</select>
									</div>
								</div> <!-- div#pDivi -->
							</td>
						</tr>
					</tbody>
				</table>



				<div id="productContent">
					<textarea name="pContent" id="pContent" cols="100" rows="30"
						placeholder="상세설명을 적어주세요"></textarea>
				</div>


				<div id="btnArea" style="width: 900px">
					<button type="reset">모두삭제</button>
					<button type="submit">등록하기</button>
					<button type="button" onclick="out()">나가기</button>
				</div>

			</form>

		</div>
		<!-- contents 영역 끝 -->
	</main>
	<!--  footer 템플릿 -->
	<%@ include file="/common/footerTmp.jsp"%>
	<!--  footer템플릿 -->
</body>
</html>