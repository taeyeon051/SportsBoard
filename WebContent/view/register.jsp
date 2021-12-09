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
			location.href = "<%= path %>/main/baseball";
		</script>
<%		
	}
%>

<!-- 회원가입 페이지 -->
<section id="register-page">
	<div class="register position-relative text-center pt-4">
		<h3><b>회원가입</b></h3>
        <form action="<%= path %>/user/register" method="POST" class="form">
        	<input type="text" name="id" class="form-control" placeholder="아이디" required>
            <input type="text" name="name" class="form-control" placeholder="이름" required>
            <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
            <input type="password" name="passwordc" class="form-control" placeholder="비밀번호 확인" required>
            <button id="register-btn" class="btn btn-dark m-0">회원가입</button>
		</form>
	</div>
</section>

<%@ include file="../footer.jsp"%>