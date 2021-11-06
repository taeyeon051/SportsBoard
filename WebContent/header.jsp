<%@page import="vo.UserVO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>스포츠 게시판</title>
</head>

<body>
<%
	UserVO user = (UserVO) session.getAttribute("user");
	if (request.getAttribute("alert") != null) {
%>		
		<script>
			alert('<%= request.getAttribute("alert") %>');
		</script>
<%
	}
%>

    <div class="top-menu d-flex align-items-center">
        <div class="d-flex justify-content-end mx-auto">
        	<% if (user != null) { %>
        		<span class="user-name"><%= user.getUserName() %>님</span>
        		<a href="<%= path %>/user/logout" class="top-menu-btn">로그아웃</a>
      		<% } else { %>
            	<a href="<%= path %>/user/login" class="top-menu-btn">로그인</a>
            	<a href="<%= path %>/user/register" class="top-menu-btn">회원가입</a>
            <% } %>
        </div>
    </div>

    <!-- 헤더 영역 -->
    <header class="d-flex justify-content-between align-items-center mx-auto">
        <h3 class="fw-bold mb-0"><a href="<%= path %>/main/baseball">스포츠 게시판</a></h3>
        <div class="input-group">
            <input type="text" class="form-control" id="search" placeholder="통합검색">
            <button class="btn btn-dark">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </header>

    <div id="container">
        <!-- 메뉴 영역 -->
        <div id="menu">
            <div class="inner-menu h-100 mx-auto d-flex align-items-center">
                <a href="<%= path %>/main/baseball" class="selected">야구</a>
                <a href="<%= path %>/main/worldBaseball">해외야구</a>
                <a href="<%= path %>/main/soccer">축구</a>
                <a href="<%= path %>/main/worldSoccer">해외축구</a>
                <a href="<%= path %>/main/golf">골프</a>
                <a href="<%= path %>/main/basketball">농구</a>
                <a href="<%= path %>/main/volleyball">배구</a>
            </div>
        </div>

        <!-- 서브 메뉴 영역 -->
        <div id="submenu" class="d-flex">
            <a href="<%= path %>/list">글목록</a>
            <a href="<%= path %>/videoList">영상목록</a>
            <a href="<%= path %>/write">글쓰기</a>
            <a href="<%= path %>/upload.html">영상올리기</a>
        </div>