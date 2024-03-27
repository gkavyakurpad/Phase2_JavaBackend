<%@page import="com.example.dao.ParticipantDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.ParticipantData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	ParticipantData participant = new ParticipantData();
	List<ParticipantData> participantData = new ArrayList<ParticipantData>();
	
	participant.setParticipant_name(request.getParameter("username"));
	participant.setParticipant_password(request.getParameter("password"));
	
	ParticipantDAO dao = new ParticipantDAO();
	participantData = dao.loginParticipant(participant.getParticipant_name(), participant.getParticipant_password());
	
	if(!participantData.isEmpty())
	{
		Cookie cookies1 = new Cookie("userId", String.valueOf(participantData.get(0).getParticipant_id()));
		
		response.addCookie(cookies1);
	
		 // Redirect to adminHome.jsp upon successful login
        response.sendRedirect("ParticipantHome.jsp");
	
%>

<% } else{ %>
<h1>Login Failed</h1>
<%} %>