<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- logout log 테이블에 흔적 남겨야함 --%>
<% session.invalidate(); %> 
<% response.sendRedirect("Home.jsp"); %>