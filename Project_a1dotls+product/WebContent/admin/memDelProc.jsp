<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="adMgr" class="pack_Admin.AdminMgr"/>

<%
int uNum = Integer.parseInt(request.getParameter("uNum"));
int rtnCnt = adMgr.memberDel(uNum);
%>