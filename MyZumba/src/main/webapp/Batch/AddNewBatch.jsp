<%@ include file="../Layout/header.jsp" %>
<%@ include file="../Layout/adminNavbar.jsp" %>


<div class="container">

<form action="../controller/addBatchController.jsp">
	
	<div class="mb-3">
	<label class="form-label">Batch Name</label>
	<input class="form-control" type="text" name="batch_name">
	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Batch Description</label>
	<textarea class="form-control" rows="4" name="batch_description"></textarea>	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Batch Timing</label>
	<input class="form-control" type="text" name="batch_timing">	
	</div>
	
	<div class="mb-3">
	<label class="form-label">Batch StartDate</label>
	<input class="form-control" type="date" name="batch_startDate">	
	</div>
	
	<div class="mb-3">
	<button class="btn btn-primary" type="submit">Submit</button>
	</div>
	
</form>

</div>

</body>
</html>