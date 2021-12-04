<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	boolean isTeamList = false;
	ArrayList<String> teamList = (ArrayList) request.getAttribute("teamList");
	if (teamList.size() > 0) isTeamList = true; 
%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/write.css">
    <% if (type.contains("world")) { %>
		<link rel="stylesheet" href="<%=path%>/css/wb.css">
    <% } %>
</head>

<%	
	if (user == null) {
%>
		<script>
			location.href = "/SportsBoard/user/login";
		</script>
<%		
	}
%>

<!-- 영상 업로드 영역 -->
<section id="write">
    <div class="write-header position-relative mt-5 mb-3 d-flex justify-content-between">
        <h3>영상올리기 <span id="ex-btn"><i class="fs-5 far fa-question-circle"></i></span></h3>
        <div class="btns">
            <button class="btn btn-dark">목록</button>
            <button class="btn btn-dark">업로드</button>
        </div>
        <div class="upload ex-box">
            <div class="inner">
                <div class="close-exbox">×</div>
                <p class="mb-0">썸네일 이미지는 꼭 넣어야 하며 한장만 가능합니다.</p>
				<p class="mb-0">선수이름 앞,뒤에 /를 붙이면 넣으면 관련 선수에 표시됩니다.</p>
				<p class="mb-0">ex) /이정후/</p>
            </div>
        </div>
    </div>
    <div class="w-100 d-flex justify-content-between">
        <div class="write-area">
            <input type="text" id="title" class="form-control mt-1" placeholder="제목">
            <h5 class="mt-4 fw-bold">영상 선택</h5>
            <input type="file" class="form-control" id="video-file" accept=".mp4">
            <div class="thumbnail d-flex flex-column align-items-center">
                <h5 class="w-100 mt-4 fw-bold">썸네일 사진 선택</h5>
                <form id="img-form" class="w-100">
                    <input type="file" class="form-control" id="thumbnail-image" accept="image/*">
                </form>
                <div class="thumbnail-image mt-3"></div>
            </div>
        </div>
  		<div class="select-area">
        	<% if (isTeamList) { %>
            	<h5 class="fw-bold text-center">관련 팀 선택</h5>
            	<div class="team-list w-100 mt-2 <%= type.contains("world") ? "" : "btn-group-vertical" %>">
            		<% for (String data : teamList) { %>
            			<span class="btn btn-outline-dark"><%= data %></span>	
            		<% } %>
            	</div>
            <% } %>
            <h5 class="fw-bold text-center <%= isTeamList ? "mt-5" : "" %>">관련 선수</h5>
            <ul class="player-list w-100 mt-2 list-group text-center"></ul>
        </div>
    </div>
</section>

<script src="<%= path %>/js/video.js"></script>

<%@ include file="../footer.jsp"%>