<%@page import="com.example.model.BatchModel"%>
<%@page import="java.util.List"%>
<%@page import="com.example.dao.BatchDAO"%>
<%@ include file="../Layout/header.jsp" %>
<div class="container">
	
	<div class="AdminWrapper">
		<div class="addData">
		
			<h2>Registered Batch</h2>
		

		</div>
		
		<div class="displayData">
			
			<table class="table table-bordered border table-hover">
			  <thead>
			    <tr>
			     
			      <th scope="col">Batch Name</th>
			      <th scope="col">Batch Description</th>
			      <th scope="col">Batch Start Date</th>
			      <th scope="col">Batch Timing</th>
			      <th scope="col">Register</th>
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
						<td><%=p.getBatch_startDate() %></td>
						<td><%=p.getBatch_timing() %></td>			
						<td>
							<a href="../Participant/RegisterBatch.jsp?id=<%=p.getBatch_id()%>" class="btn btn-warning">Register</a>
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