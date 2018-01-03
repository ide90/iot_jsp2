<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	String sessionMsg = (String)session.getAttribute("msg");
	String applicationMsg = (String)application.getAttribute("msg");
	out.println(sessionMsg+"<br>");
	out.println(applicationMsg);
	%>