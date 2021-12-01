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

<!-- 글 쓰기 페이지 -->
<section id="write">
    <div class="write-header mt-5 mb-3 d-flex justify-content-between">
        <h3>글쓰기</h3>
        <div class="btns">
            <a href="<%= path %>/board/list?type=<%= request.getParameter("type") %>&p=1" class="btn btn-dark">목록</a>
            <button id="write-btn" class="btn btn-dark">작성</button>
        </div>
    </div>
    <div class="w-100 d-flex justify-content-between">
        <div class="write-area">
            <input type="text" id="title" name="title" class="form-control" placeholder="제목">
			<input type="color" id="color-input" hidden="hidden">
            <form id="img-form">
                <input type="file" name="file" id="form-file" accept="image/*" hidden="hidden">
            </form>
            <div class="form-button-box d-flex align-items-center mt-4">
                <button class="bld btn" data-property="bold">B</button>
                <button class="it btn" data-property="Italic">T</button>
                <button class="udl btn" data-property="Underline">U</button>
                <button class="strk btn" data-property="StrikeThrough">S</button>
                <button class="jstfl btn" data-property="justifyleft">
                    <i class="fas fa-align-left"></i>
                </button>
                <button class="jstfc btn" data-property="justifycenter">
                    <i class="fas fa-align-center"></i>
                </button>
                <button class="jstfr btn" data-property="justifyright">
                    <i class="fas fa-align-right"></i>
                </button>
                <button class="clr btn" data-property="foreColor">
                    <i class="fas fa-tint"></i>
                </button>
                <div class="form-image-box">
                    <button class="imgupload btn" id="form-image-add" data-property="image">
                        <i class="fas fa-file-image"></i>
                    </button>
                </div>
                <i id="ex-btn" class="ms-2 fs-6 far fa-question-circle"></i>
            </div>
            <div class="ex-box">
                <div class="inner">
                    <div class="close-exbox">×</div>
                    <p class="mb-0">이미지는 꼭 넣어야 합니다.</p>
                    <p class="mb-0">선수이름 앞,뒤에 /를 붙이면 넣으면 관련 선수에 표시됩니다.</p>
                    <p class="mb-0">ex) /이정후/</p>
                </div>
            </div>
            <div contenteditable="true" id="content" class="form-control mt-1" spellcheck="false"></div>
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

<script src="<%= path %>/js/write.js"></script>

<%@ include file="../footer.jsp"%>