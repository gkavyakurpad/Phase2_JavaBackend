<%@page import="com.example.dao.ParticipantDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	ParticipantDAO dao = new ParticipantDAO();
	
	int delete = dao.deleteParticipant(Integer.parseInt(request.getParameter("id")));
	
	if(delete>0)
	{
		response.sendRedirect("../admin/adminParticipants.jsp");
	}
	
%>
</body>
</html>