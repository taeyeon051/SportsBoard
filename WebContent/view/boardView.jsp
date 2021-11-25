<%@page import="com.google.gson.Gson"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/view.css">
</head>
<% BoardVO vo = (BoardVO) request.getAttribute("board"); %>

<!-- 글 영역 -->
<section id="view">
    <div class="view-header">
        <h3 class="view-title"><%= vo.getTitle() %></h3>
        <div class="view-date"><%= vo.getwDate() %></div>
    </div>
    <div class="view-body">
        <div class="view-content">
    	    <%= vo.getContent() %>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp"%>