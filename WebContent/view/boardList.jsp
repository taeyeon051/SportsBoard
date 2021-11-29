<%@page import="com.google.gson.Gson"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/list.css">
    <script src="<%= path %>/js/board.js"></script>
</head>
<%
	ArrayList<BoardVO> boardList = (ArrayList) request.getAttribute("boardList");
	String json = new Gson().toJson(boardList);
	
	String reqType = request.getParameter("type");
    int cnt = (int) request.getAttribute("cnt");
    int nowPage = Integer.parseInt(request.getParameter("p"));
    int start, end;
    end = (int) Math.ceil((double) nowPage / 10.0) * 10;
    start = end - 9;
%>

<!-- 글 목록 페이지 -->
<section id="list" class="d-flex flex-column align-items-center my-5">
	<div id="board-list"></div>

    <ul class="pagination mt-5 mx-auto">
        <% if (start > 1) { %>
        	<li class="page-item"><a href="<%= path %>/board/list?type=<%= reqType %>&p=<%= start - 1 %>" class="page-link">&laquo;</a></li>
		<% } %>
        
        <% if (cnt < 10) { %>
            <% for (int i = start; i <= cnt; i++) { %>
            	<li class="page-item <%= nowPage == i ? "active" : "" %>">
            		<a href="<%= path %>/board/list?type=<%= reqType %>&p=<%= i %>" class="page-link"><%= i %></a>
            	</li>
        	<% } %>
        <% } else { %>
        	<% for (int i = start; i <= end; i++) { %>
        		<% if (i <= cnt) { %>
    	        	<li class="page-item <%= nowPage == i ? "active" : "" %>">
	            		<a href="<%= path %>/board/list?type=<%= reqType %>&p=<%= i %>" class="page-link"><%= i %></a>
            		</li>
            	<% } %>
        	<% } %>
        <% } %>
        
        <% if (end < cnt) { %>
        	<li class="page-item"><a href="<%= path %>/board/list?type=<%= reqType %>&p=<%= end + 1 %>" class="page-link">&raquo;</a></li>
        <% } %>
    </ul>
</section>

<script>
	const board = new Board(<%= json %>);
</script>

<%@ include file="../footer.jsp"%>