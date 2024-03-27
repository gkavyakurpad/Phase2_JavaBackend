<%@page import="com.zumba.model.ParticipantModel"%>
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
		ParticipantModel participant = new ParticipantModel();
		
		participant.setParticipant_name(request.getParameter("participant_name"));
		participant.setParticipant_email(request.getParameter("participant_email"));
		participant.setParticipant_dob(request.getParameter("participant_dob"));
		participant.setParticipant_password(request.getParameter("participant_password"));
		
		if(dao.insertIntoParticipant(participant) >0)
		{
			response.sendRedirect("../admin/adminParticipants.jsp");
		}
	%>

</body>
</html>