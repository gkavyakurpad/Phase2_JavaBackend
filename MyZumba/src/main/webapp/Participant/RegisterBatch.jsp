<%@page import="com.example.dao.ParticipantDAO"%>
<%@page import="com.example.model.ParticipantBatchModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Participant Batch</title>
</head>
<body>
<%

//Get the cookies from the request
Cookie[] cookies = request.getCookies();

int userId = -1; // Initialize to a default value

//Check if cookies exist
if (cookies != null) {
 for (Cookie cookie : cookies) {
     if (cookie.getName().equals("userId")) { // Replace "userId" with your actual cookie name
         // Retrieve the value of the "userId" cookie and convert it to an integer
         userId = Integer.parseInt(cookie.getValue());
         break; // Exit the loop once the cookie is found
     }
 }
}

ParticipantBatchModel pb = new ParticipantBatchModel();
ParticipantDAO dao = new ParticipantDAO();

pb.setBatch_id(Integer.parseInt(request.getParameter("id")));
pb.setParticipant_id(userId); // Set the user ID obtained from the cookie

if(dao.insertIntoParticipantBatch(pb) >0)
{%>
	<h2>Thank you for registering <a href="../loginParticipant.jsp">Click here</a> To Log Out</h2>
<% }

%>
</body>
</html>