<%@page import="com.zumba.model.ParticipantModel"%>
<%@page import="java.util.List"%>
<%@page import="com.zumba.dao.ParticipantDAO"%>
<%@ include file="../Layout/header.jsp" %>
<%@ include file="../Layout/adminNavbar.jsp" %>

<div class="container">
	
	<div class="AdminWrapper">
		<div class="addData">
		
			<h2>Manage Participant</h2>
		
			<div class="addDataBtn">
				<a href="../Participant/AddNewParticipant.jsp" class="btn btn-primary">Add New Participant</a>
			</div>
		
		</div>
		
		<div class="displayData">
			
			<table class="table table-bordered border table-hover">
			  <thead>
			    <tr>
			     
			      <th scope="col">Participant Name</th>
			      <th scope="col">Participant Email</th>
			      <th scope="col">Participant DOB</th>
			      <th scope="col">Registration Date</th>
			    </tr>
			  </thead>
			  <tbody>
			  
			  <%
			ParticipantDAO dao = new ParticipantDAO();
			List<ParticipantModel> list = dao.displayParticipant();
			
			if(list == null || list.isEmpty()){
				%>
				<tr>
					<p>No Record</p>
				</tr>
				<% 
			}else{
				for(ParticipantModel p:list)
				{%>
					
					<tr>
						<td><%=p.getParticipant_name() %></td>
						<td><%=p.getParticipant_email() %></td>
						<td><%=p.getParticipant_dob() %></td>
						<td>
							<a href="../Participant/EditParticipant.jsp?id=<%=p.getId()%>" class="btn btn-warning">Edit</a>
							<a href="../Participant/DeleteParticipant.jsp?id=<%=p.getId()%>" class="btn btn-danger">Delete</a>
						</td>
					</tr>
						
				<% }
			}%>
			  </tbody>
			</table>
			
		</div>
	</div>
</div>

</body>
</html>