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
    <% if (teamList.size() > 0 && (teamList.contains("LA 다저스") || teamList.contains("첼시 FC"))) { %>
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
        <h3>영상올리기 <i id="ex-btn" class="fs-5 far fa-question-circle"></i></h3>
        <div class="btns">
            <button class="btn btn-dark">목록</button>
            <button class="btn btn-dark">업로드</button>
        </div>
        <div class="upload ex-box">
            <div class="inner">
                <div class="close-exbox">×</div>
                <p class="mb-0">썸네일 이미지는 꼭 넣어야 하며 한장만 가능합니다.</p>
                <p class="mb-0">선수이름 앞에 #을 붙이면 관련 선수 선택에 표시됩니다.</p>
            </div>
        </div>
    </div>
    <div class="w-100 d-flex justify-content-between">
        <div class="write-area">
            <input type="text" id="title" name="title" class="form-control mt-1" placeholder="제목">
            <h5 class="mt-4 fw-bold">영상 선택</h5>
            <input type="file" class="form-control" id="video-file">
            <div class="thumbnail d-flex flex-column align-items-center">
                <h5 class="w-100 mt-4 fw-bold">썸네일 사진 선택</h5>
                <input type="file" class="form-control" id="">
                <div class="thumbnail-image mt-3"></div>
            </div>
        </div>
  		<div class="select-area">
        	<% if (isTeamList) { %>
            	<h5 class="fw-bold text-center">관련 팀 선택</h5>
            	<div class="team-list w-100 mt-2 <%= teamList.contains("LA 다저스") ? "" : "btn-group-vertical" %>">
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

<%@ include file="../footer.jsp"%>