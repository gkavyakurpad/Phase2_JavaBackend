<%@ include file="../Layout/header.jsp" %>
<%@ include file="../Layout/adminNavbar.jsp" %>


<div class="container">

<form action="../controller/addParticipantController.jsp">
	
	<div class="mb-3">
	<label class="form-label">Participant Name</label>
	<input class="form-control" type="text" name="participant_name">
	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Participant Email</label>
	<input class="form-control" type="email" name="participant_email">	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Participant DOB</label>
	<input class="form-control" type="date" name="participant_dob">	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Participant Password</label>
	<input class="form-control" type="text" name="participant_password">	
	</div>
	
	<div class="mb-3">
	<button class="btn btn-primary" type="submit">Submit</button>
	</div>
	
</form>

</div>

</body>
</html>