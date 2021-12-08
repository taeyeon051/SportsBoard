<%@page import="com.google.gson.Gson"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/view.css">
	<script src="<%= path %>/js/delete.js"></script>
</head>
<%
	BoardVO vo = (BoardVO) request.getAttribute("board");
	if (vo == null) {
%>
	<script>
		alert('해당 아이디의 게시글이 없습니다.');
		history.back();
	</script>
<% } %>

<!-- 글 영역 -->
<section id="view">
    <div class="view-header">
        <h3 class="view-title"><%= vo.getTitle() %></h3>
        <div class="mt-3 d-flex">
	        <div class="view-date">
	        	<%= vo.getWriterName() %>
	        	&nbsp;&nbsp;
	        	입력 <%= vo.getwDate() %>
	        </div>
	        <div class="view-btns">
	        	<% if (user != null && vo.getWriterId().equals(user.getUserId())) { %>
	        		<a href="<%= path %>/board/modify?type=<%= type %>&id=<%= vo.getwCode() %>" class="btn btn-dark">수정</a>
	        		<button id="delete-btn" class="btn btn-dark">삭제</button>
	        	<% } %>
	        </div>
        </div>
    </div>
    <div class="view-body">
        <div class="view-content">
    	    <%= vo.getContent() %>
        </div>
    </div>
</section>

<script>
	const view = new Delete("<%= vo.getwCode() %>", "<%= vo.getWriterId() %>");
</script>

<%@ include file="../footer.jsp"%>