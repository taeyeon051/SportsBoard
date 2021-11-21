<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String fileName = "";
	int size = 300 * 1024 * 1024;
	
	try {			
		String realPath = request.getServletContext().getRealPath("upload");
	
		File dir = new File(realPath);
		if (!dir.exists()) dir.mkdirs();
	
		MultipartRequest mr = null;
		mr = new MultipartRequest(request, realPath, size, "utf-8", new DefaultFileRenamePolicy());
	
		fileName = mr.getFilesystemName("file");
%>
		<%= fileName %>
<%
	} catch (Exception e) {	
		e.printStackTrace();
%>
		오류
<%
	}
%>