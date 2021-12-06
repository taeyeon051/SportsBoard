<%@page import="java.text.*"%>
<%@page import="vo.VideoVO"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/list.css">
</head>
<%
	ArrayList<VideoVO> videoList = (ArrayList) request.getAttribute("videoList");
	if (videoList.size() < 1 || videoList == null) {
%>
		<script>
			alert('해당 페이지에 게시된 영상이 없습니다.');
			history.back();
		</script>
<%
	}
%>

 <!-- 영상 목록 영역 -->
<section id="list" class="d-flex flex-column align-items-center my-5">
	<div id="video-list">
		<% for (VideoVO video : videoList) { %>
			<div class="video-box">
				<% String[] arr = video.getImageSrc().split("/"); %>
				<div class="video-image">
		            <img src="<%= video.getImageSrc() %>" alt="<%= arr[arr.length - 1] %>">
		            <div class="video-time"><%= video.getVideoTime() %></div>
		        </div>
		        <div class="video-text">
		            <h5 class="video-title">
		                <a href="/SportsBoard/board/videoView?type=<%= video.getvType() %>&id=<%= video.getvCode() %>"><%= video.getTitle() %></a>
		            </h5>
		            <div class="view-date">
		            	<%
		            		DecimalFormat df = new DecimalFormat("###,###");
		            		int val = video.getViews();
		            	%>
		                <div class="video-view">▷ <%= df.format(val) %></div>
		                <div class="video-date"><%= video.getvDate() %></div>
		            </div>
		        </div>
		    </div>
        <% } %>
	</div>
</section>

<%@ include file="../footer.jsp"%>