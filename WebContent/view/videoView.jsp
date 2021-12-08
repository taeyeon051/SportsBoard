<%@page import="vo.VideoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/view.css">
</head>
<% VideoVO vo = (VideoVO) request.getAttribute("video"); %>

<!-- 영상 영역 -->
<section id="video-view">
    <video src="<%= vo.getVideoSrc() %>" controls autoplay></video>
    <div class="video-text">
        <h5 class="video-title"><%= vo.getTitle() %></h5>
        <div class="view-date">
            <div class="video-view">▷ <%= vo.getViews() %></div>
            <div class="video-date"><%= vo.getvDate() %></div>
        </div>
    </div>
</section>

<script>
	console.log("<%= vo.getVideoSrc() %>");
</script>

<%@ include file="../footer.jsp"%>