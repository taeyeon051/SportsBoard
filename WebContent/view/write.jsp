<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/write.css">
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

<!-- 글 쓰기 영역 -->
<section id="write">
    <div class="write-header mt-5 mb-3 d-flex justify-content-between">
        <h3>글쓰기</h3>
        <div class="btns">
            <button class="btn btn-dark">목록</button>
            <button class="btn btn-dark">작성</button>
        </div>
    </div>
    <div class="w-100 d-flex justify-content-between">
        <div class="write-area">
            <input type="text" id="title" name="title" class="form-control" placeholder="제목">
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
                <i id="ex-btn" class="ms-2 fs-6 far fa-exclamation-circle"></i>
            </div>
            <div class="ex-box">
                <div class="inner">
                    <div class="close-exbox">×</div>
                    <p class="mb-0">이미지는 꼭 넣어야 하며 한장만 가능합니다.</p>
                    <p class="mb-0">선수이름 앞에 #을 붙이면 관련 선수 선택에 표시됩니다.</p>
                </div>
            </div>
            <div contenteditable="true" id="content" class="form-control" spellcheck="false"></div>
        </div>
        <div class="select-area">
            <h5 class="fw-bold text-center">관련 팀 선택</h5>
            <div class="team-list w-100 mt-2 btn-group-vertical">
                <button class="btn btn-outline-dark active">KT</button>
                <button class="btn btn-outline-dark">LG</button>
                <button class="btn btn-outline-dark">삼성</button>
                <button class="btn btn-outline-dark">두산</button>
                <button class="btn btn-outline-dark">키움</button>
                <button class="btn btn-outline-dark">SSG</button>
                <button class="btn btn-outline-dark">NC</button>
                <button class="btn btn-outline-dark">롯데</button>
                <button class="btn btn-outline-dark">KIA</button>
                <button class="btn btn-outline-dark">한화</button>
            </div>
            <h5 class="fw-bold text-center mt-5">관련 선수 선택</h5>
            <div class="player-list w-100 mt-2 btn-group-vertical">
                <button class="btn btn-outline-dark">이정후</button>
                <button class="btn btn-outline-dark">김혜성</button>
            </div>
        </div>
    </div>
</section>

<script src="<%= path %>/js/write.js"></script>

<%@ include file="../footer.jsp"%>