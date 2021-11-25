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
%>

<!-- 글 목록 페이지 -->
<section id="list" class="d-flex flex-column align-items-center my-5">
	<div id="board-list"></div>

    <ul class="pagination mt-5 mx-auto">
        <li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
        <li class="page-item active"><a href="#" class="page-link">1</a></li>
        <li class="page-item"><a href="#" class="page-link">2</a></li>
        <li class="page-item"><a href="#" class="page-link">3</a></li>
        <li class="page-item"><a href="#" class="page-link">4</a></li>
        <li class="page-item"><a href="#" class="page-link">5</a></li>
        <li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
    </ul>
</section>

<script>
	const board = new Board(<%= json %>);
</script>

<%@ include file="../footer.jsp"%>