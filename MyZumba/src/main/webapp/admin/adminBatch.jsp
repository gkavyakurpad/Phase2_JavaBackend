<%@page import="com.zumba.model.BatchModel"%>
<%@page import="java.util.List"%>
<%@page import="com.zumba.dao.BatchDAO"%>
<%@ include file="../Layout/header.jsp" %>
<%@ include file="../Layout/adminNavbar.jsp" %>

<div class="container">
	
	<div class="AdminWrapper">
		<div class="addData">
		
			<h2>Manage Batch</h2>
		
			<div class="addDataBtn">
				<a href="../Batch/AddNewBatch.jsp" class="btn btn-primary">Add New Batch</a>
			</div>
		
		</div>
		
		<div class="displayData">
			
			<table class="table table-bordered border table-hover">
			  <thead>
			    <tr>
			     
			      <th scope="col">Batch Name</th>
			      <th scope="col">Batch Description</th>
			      <th scope="col">Batch Timing</th>
			      <th scope="col">Batch Start Date</th>
			    </tr>
			  </thead>
			  <tbody>
			  
			  <%
			BatchDAO dao = new BatchDAO();
			List<BatchModel> list = dao.displayParticipant();
			
			if(list == null || list.isEmpty()){
				%>
				<tr>
					<p>No Record</p>
				</tr>
				<% 
			}else{
				for(BatchModel p:list)
				{%>
					
					<tr>
						<td><%=p.getBatch_name() %></td>
						<td><%=p.getBatch_description() %></td>
						<td><%=p.getBatch_timing() %></td>
						<td><%=p.getBatch_startDate() %></td>
						<td>
							<a href="../Batch/EditBatch.jsp?id=<%=p.getBatch_id()%>" class="btn btn-success">Edit</a>
							<a href="../Batch/DeleteBatch.jsp?id=<%=p.getBatch_id()%>" class="btn btn-danger">Delete</a>
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