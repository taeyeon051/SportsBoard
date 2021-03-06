<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.VideoVO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<head>
	<link rel="stylesheet" href="<%=path%>/css/main.css">
	<script src="<%=path%>/js/main.js"></script>
</head>

<script>
	const urlParams = new URLSearchParams(window.location.search);
	if (urlParams.get('type') == null) location.href = "/SportsBoard/main?type=home";
</script>

<%
	ArrayList<BoardVO> viewsList = (ArrayList) request.getAttribute("viewsList");
	ArrayList<BoardVO> latestList = (ArrayList) request.getAttribute("latestList");
	ArrayList<VideoVO> videoList = (ArrayList) request.getAttribute("videoList");
	String boardPath = path + "/board/view?type=";
	
	String teamList = (String) request.getAttribute("teamList");
	String playerList = (String) request.getAttribute("playerList");
%>

<!-- 메인 영역 -->
<section id="main" class="d-flex justify-content-between pt-4 pb-3 mb-3">
	<div id="main-box" class="position-relative overflow-hidden">
		<% if (viewsList != null && viewsList.size() > 0) { %>
			<a href="<%= boardPath %><%= viewsList.get(0).getwType() %>&id=<%= viewsList.get(0).getwCode() %>">					
				<div id="photo" style="display: none;">
					<%= viewsList.get(0).getContent() %>
					<div class="text text-white w-100 position-absolute overflow-hidden">
						<%= viewsList.get(0).getTitle() %>
					</div>
				</div> 
			</a>
		<% } else if (latestList != null && latestList.size() > 0) { %>
			<a href="<%= boardPath %><%= latestList.get(0).getwType() %>&id=<%= latestList.get(0).getwCode() %>">					
				<div id="photo" style="display: none;">
					<%= latestList.get(0).getContent() %>
					<div class="text text-white w-100 position-absolute overflow-hidden">
						<%= latestList.get(0).getTitle() %>
					</div>
				</div>
			</a>
		<% } %>
	</div>
	<div class="ranking">
		<div class="ranking-header mx-auto my-3 text-center">많이 본 글</div>
		<ol>
			<%
				int i = 1;
				if (viewsList != null && viewsList.size() > 0) {
					for (BoardVO data : viewsList) {
			%>
					<li>
						<b class="rank"><%= i %></b>
						<a href="<%= boardPath %><%= data.getwType() %>&id=<%= data.getwCode() %>"><%= data.getTitle() %></a>
					</li>
				<%
						i++;
					}
				%>
			<% } %>
		</ol>
	</div>
	<div class="latest">
		<div class="latest-header mx-auto my-3 text-center">최신 글</div>
		<ul>
			<%
				if (latestList != null && latestList.size() > 0) {
					for (BoardVO data : latestList) {
			%>
						<li>
							<a href="<%= boardPath %><%= data.getwType() %>&id=<%= data.getwCode() %>"><%= data.getTitle() %></a>
						</li>
				<% } %>
			<% } %>
		</ul>
	</div>
</section>

<!-- 하이라이트 영상 영역 -->
<section id="highlight" class="position-relative mb-5">
	<h5 class="fw-bold">하이라이트 영상</h5>
	<a href="<%= path %>/board/video/list?type=<%= type %>" class="more-view-btn position-absolute">더보기 <i class="fas fa-angle-right"></i></a>
	<div class="videos d-flex mt-3">
		<% if (videoList != null && videoList.size() > 0) { %>
			<% for (VideoVO data : videoList) { %>
				<a href="<%= path %>/board/video/view?type=<%= type %>&id=<%= data.getvCode() %>" class="video">
					<div class="video-image">
						<img src="<%= data.getImageSrc() %>" alt="video-image">
						<div class="play-icon"><i class="fas fa-play text-white"></i></div>
						<div class="video-time"><%= data.getVideoTime() %></div>
					</div>
					<div class="video-text">
						<div class="video-title"><%= data.getTitle() %></div>
						<div class="video-info mt-2">
							<div class="video-num d-flex">
								<span class="video-num-icon">▷</span>
								<div class="video-num-time">
									<%
										DecimalFormat df = new DecimalFormat("###,###");
										int val = data.getViews();
									%>
									<b><%= df.format(val) %></b> · <%= data.getvDate() %>
								</div>
							</div>
						</div>
					</div>
				</a>
			<% } %>
		<% } else { %>
			<h3 class="w-100 h-100 d-flex justify-content-center align-items-center">하이라이트 영상이 없습니다.</h3>
		<% } %>
	</div>
</section>

<%
	if (!type.equals("home")) {
		if (!type.equals("golf") && !type.equals("basketball") && !type.equals("volleyball")) {
%>
			<!-- 팀별 글 -->
			<section id="teams">
				<div class="header mb-3 d-flex position-relative">
					<h5 class="fw-bold me-3">
						화제의 팀 <span id="tex-btn"><i class="far fa-question-circle" style="cursor: pointer"></i></span>
					</h5>
					<div class="ex-box">
						<div class="inner">
							<div class="close-exbox">×</div>
							<p class="mb-0">최신 업데이트된 팀/선수의 콘텐츠가 노출됩니다.</p>
						</div>
					</div>
					<div class="teams">
						<ul class="d-flex">
							<li data-idx="0" class="selected">KT</li>
							<li data-idx="1">LG</li>
							<li data-idx="2">삼성</li>
							<li data-idx="3">두산</li>
							<li data-idx="4">키움</li>
							<li data-idx="5">SSG</li>
							<li data-idx="6">NC</li>
							<li data-idx="7">롯데</li>
							<li data-idx="8">KIA</li>
							<li data-idx="9">한화</li>
						</ul>
					</div>
				</div>
				<div class="team-news-list"></div>
			</section>
		<% } %>
	
	<!-- 선수별 글 -->
	<section id="players">
		<div class="header mb-3 d-flex position-relative">
			<h5 class="fw-bold me-3">
				화제의 선수 <span id="pex-btn"><i class="far fa-question-circle" style="cursor: pointer"></i></span>
			</h5>
			<div class="ex-box">
				<div class="inner">
					<div class="close-exbox">×</div>
					<p class="mb-0">최신 업데이트된 팀/선수의 콘텐츠가 노출됩니다.</p>
				</div>
			</div>
			<div class="players">
				<ul class="d-flex">
					<li class="selected">임기영</li>
					<li>장현식</li>
					<li>하주석</li>
					<li>황대인</li>
				</ul>
			</div>
		</div>
		<div class="player-news-list"></div>
	</section>
<% } %>

<script>
	const main = new Main("<%= teamList %>", "<%= playerList %>");
</script>

<%@ include file="footer.jsp"%>