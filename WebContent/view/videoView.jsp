<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.VideoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/view.css">
    <script src="<%= path %>/js/delete.js"></script>
</head>
<% VideoVO vo = (VideoVO) request.getAttribute("video"); %>

<!-- 영상 영역 -->
<section id="video-view">
    <video controls autoplay>
    	<source src="<%= vo.getVideoSrc() %>" type="video/mp4">
    </video>
    <div class="video-text">
        <h5 class="video-title mb-3"><%= vo.getTitle() %></h5>
        <div class="d-flex justify-content-between align-items-center">
	        <div class="view-date d-flex">
	        	<%
					DecimalFormat df = new DecimalFormat("###,###");
					int val = vo.getViews();
				%>
	            <div class="video-view">▷ <%= df.format(val) %></div>
	            <div class="video-date"><%= vo.getvDate() %></div>
	        </div>
	        <% if (user != null && vo.getUploaderId().equals(user.getUserId())) { %>
				<button id="delete-btn" class="btn btn-dark">삭제</button>
			<% } %>
		</div>
    </div>
</section>

<script>
	const view = new Delete("<%= vo.getvCode() %>", "<%= vo.getUploaderId() %>", true);
</script>

<%@ include file="../footer.jsp"%>