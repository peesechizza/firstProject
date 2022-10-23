<%@page import="java.util.Arrays"%>
<%@page import="pack_Admin.AdminBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adMgr" class="pack_Admin.AdminMgr"/>
<%
List<AdminBean> objList = adMgr.memberList();
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
 	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta charset="UTF-8">
		<title>회원 목록 페이지</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Admin.css">
		<script src="/source/jquery-3.6.0.min.js"></script>
		<script src="/script/admin_script.js"></script>		
</head>
<body>
	<div id="wrap">
		<main id="main">
			
			<h1>회원 목록 페이지</h1>
			
			<table id="memListTbl">
				<tbody>
					<tr>
						<th>no.</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>휴대폰 번호</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>선호음식</th>
						<th>가입시간</th>
						<th>정보수신제공동의</th>
						<th>삭제</th>
					</tr>
					<% 
					for(int i = 0; i < objList.size(); i++){
						AdminBean adBean = objList.get(i);
					%>
					
					<tr>
						<td><%=adBean.getuNum()%></td>
						<td><%=adBean.getuId()%></td>
						<td><%=adBean.getuPw() %></td>
						<td><%=adBean.getuName() %></td>
						<td><%=adBean.getuEmail() %></td>
						<td><%=adBean.getuPhone() %></td>
						<td><%=adBean.getZipcode() %></td>
						<td><%=adBean.getAddress() %></td>
						<td><%=Arrays.toString(adBean.getFaveFood())  %></td>
						<td><%=adBean.getJoinTM() %></td>
						<td><%=adBean.getSa() %></td>
						<td><button type="button" id="memDelBtn" value="<%= adBean.getuNum() %>">❌</button></td>
					</tr>
						
					<%	
					}
					%>
					
				</tbody>
			</table>
		</main>
		<form name="memDelFrm" id="memDelFrm"></form>
	</div>
</body>
</html>