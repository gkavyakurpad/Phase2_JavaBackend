<%@page import="com.zumba.dao.ParticipantDAO"%>
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
		
	
		int edit = dao.editParticipant(Integer.parseInt(request.getParameter("participant_id")), 
				request.getParameter("participant_name"),request.getParameter("participant_email"),
				request.getParameter("participant_dob"));
		
		if(edit > 0)
		{
			response.sendRedirect("../admin/adminParticipants.jsp");
		}
	%>
</body>
</html>