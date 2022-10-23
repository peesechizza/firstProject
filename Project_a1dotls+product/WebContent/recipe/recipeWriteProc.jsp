<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="rMgr" class="pack_Recipe.RecipeMgr" scope="page" />
<%
rMgr.insertRecipe(request);
response.sendRedirect("/recipe/recipeList.jsp");
%>