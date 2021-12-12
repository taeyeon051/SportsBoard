<%@page import="com.google.gson.Gson"%>
<%@page import="vo.BoardVO"%>
<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<BoardVO> blist = (ArrayList) request.getAttribute("blist");
	ArrayList<VideoVO> vlist = (ArrayList) request.getAttribute("vlist");
	
	String bjson = new Gson().toJson(blist);
	String vjson = new Gson().toJson(vlist);
%>


<div class="blist">
	<%= bjson %>
</div>
<div class="vlist">
	<%= vjson %>
</div>