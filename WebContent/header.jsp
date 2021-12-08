 <%@ page session="true" %>
<%@page import="vo.UserVO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 경로
	String path = request.getContextPath();
	// 유저 정보
	UserVO user = (UserVO) session.getAttribute("user");
	// 스포츠 종류
	String type = request.getParameter("type") != null ? request.getParameter("type") : "";
	// 알림창
	String alert = (String) request.getAttribute("alert");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= path %>/css/style.css">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="<%= path %>/js/jquery-3.6.0.min.js"></script>
    <title>스포츠 게시판</title>
</head>

<body>

<%
	if (alert != null) {
%>	
		<script>
			alert('<%= alert %>');
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
        <h3 class="fw-bold mb-0"><a href="<%= path %>/main?type=home">스포츠 게시판</a></h3>
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
                <a href="<%= path %>/main?type=home" class="<%= type.equals("home") ? "selected" : "" %>">스포츠홈</a>
                <a href="<%= path %>/main?type=baseball" class="<%= type.equals("baseball") ? "selected" : "" %>">야구</a>
                <a href="<%= path %>/main?type=worldbaseball" class="<%= type.equals("worldbaseball") ? "selected" : "" %>">해외야구</a>
                <a href="<%= path %>/main?type=soccer" class="<%= type.equals("soccer") ? "selected" : "" %>">축구</a>
                <a href="<%= path %>/main?type=worldsoccer" class="<%= type.equals("worldsoccer") ? "selected" : "" %>">해외축구</a>
                <a href="<%= path %>/main?type=golf" class="<%= type.equals("golf") ? "selected" : "" %>">골프</a>
                <a href="<%= path %>/main?type=basketball" class="<%= type.equals("basketball") ? "selected" : "" %>">농구</a>
                <a href="<%= path %>/main?type=volleyball" class="<%= type.equals("volleyball") ? "selected" : "" %>">배구</a>
            </div>
        </div>

        <!-- 서브 메뉴 영역 -->
        <div id="submenu" class="d-flex">
            <a href="<%= path %>/board/list?type=<%= type %>&p=1" class="<%= request.getRequestURI().equals("/SportsBoard/view/boardList.jsp") ? "selected" : "" %>">글목록</a>
            <a href="<%= path %>/board/video/list?type=<%= type %>" class="<%= request.getRequestURI().equals("/SportsBoard/view/videoList.jsp") ? "selected" : "" %>">영상목록</a>
            <% if (user != null && !type.equals("home")) { %>
            	<a href="<%= path %>/board/write?type=<%= type %>" class="<%= request.getRequestURI().equals("/SportsBoard/view/write.jsp") ? "selected" : "" %>">글쓰기</a>
            	<a href="<%= path %>/board/upload?type=<%= type %>" class="<%= request.getRequestURI().equals("/SportsBoard/view/upload.jsp") ? "selected" : "" %>">영상올리기</a>
            <% } %>
        </div>