<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
    <link rel="stylesheet" href="<%=path%>/css/login.css">
</head>

<%
	if (user != null) {
%>
		<script>
			location.href = "/SportsBoard/main/baseball";
		</script>
<%		
	}
%>

<!-- 로그인 페이지 -->
<section id="login-page">
    <div class="login position-relative text-center pt-4">
        <h3><b>로그인</b></h3>
        <form action="<%= path %>/user/login" method="POST" class="form">
            <input type="text" name="id" class="form-control" placeholder="아이디" required>
            <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
            <button id="login-btn" class="btn btn-dark m-0">로그인</button>
        </form>
    </div>
</section>

<%@ include file="../footer.jsp"%>