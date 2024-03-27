<%@page import="com.zumba.dao.ParticipantDAO"%>
<%@page import="com.zumba.model.ParticipantModel"%>
<%@ include file="../Layout/header.jsp" %>
<%@ include file="../Layout/adminNavbar.jsp" %>


<div class="container">

<form action="../controller/editParticipantController.jsp">

	<%
		ParticipantDAO dao = new ParticipantDAO();
		ParticipantModel participant = new ParticipantModel();
		
		participant = dao.displayParticipantById(Integer.parseInt(request.getParameter("id")));
	%>
	
	<div class="mb-3">
	<input type="hidden" type="text" value="<%= participant.getId() %>" name="participant_id">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Participant Name</label>
	<input class="form-control" type="text" value="<%= participant.getParticipant_name() %>" name="participant_name">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Participant Email</label>
	<input class="form-control" type="email" value="<%= participant.getParticipant_email() %>" name="participant_email">	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Participant DOB</label>
	<input class="form-control" type="date" value="<%= participant.getParticipant_dob() %>" name="participant_dob">	
	</div>
	
	<div class="mb-3">
	<button class="btn btn-primary" type="submit">Submit</button>
	</div>
	
</form>

</div>

</body>
</html>