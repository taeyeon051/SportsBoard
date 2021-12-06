<%@page import="vo.VideoVO"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/list.css">
    <script src="<%= path %>/js/videoList.js"></script>
</head>
<%
	ArrayList<VideoVO> videoList = (ArrayList) request.getAttribute("videoList");
	String json = new Gson().toJson(videoList);
%>

 <!-- 영상 목록 영역 -->
<section id="list" class="d-flex flex-column align-items-center my-5">
	<div id="video-list"></div>
</section>

<script>
	const videoList = new VideoList(<%= json %>);
</script>

<%@ include file="../footer.jsp"%>