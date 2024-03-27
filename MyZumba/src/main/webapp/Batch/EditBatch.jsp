<%@page import="com.zumba.model.BatchModel"%>
<%@page import="com.zumba.dao.BatchDAO"%>
<%@ include file="../Layout/header.jsp" %>
<%@ include file="../Layout/adminNavbar.jsp" %>


<div class="container">

<form action="../controller/editBatchController.jsp">

	<%
		BatchDAO dao = new BatchDAO();
		BatchModel batch = new BatchModel();
		
		batch = dao.displayBatchById(Integer.parseInt(request.getParameter("id")));
	%>
	
	<div class="mb-3">
	<input type="hidden" type="text" value="<%= batch.getBatch_id() %>" name="batch_id">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Batch Name</label>
	<input class="form-control" type="text" value="<%= batch.getBatch_name() %>" name="batch_name">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Batch Description</label>
	<textarea class="form-control" rows="4" name="batch_description"><%= batch.getBatch_description() %></textarea>
	</div>
	
	<div class="mb-3">
	<label class="form-label">Batch Timing</label>
	<input class="form-control" type="date" value="<%= batch.getBatch_timing() %>" name="batch_timing">	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Batch Start Date</label>
	<input class="form-control" type="date" value="<%= batch.getBatch_startDate() %>" name="batch_startDate">	
	</div>
	
	<div class="mb-3">
	<button class="btn btn-primary" type="submit">Submit</button>
	</div>
	
</form>

</div>
</body>
</html>