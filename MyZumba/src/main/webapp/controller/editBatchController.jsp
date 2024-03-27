<%@page import="com.zumba.dao.BatchDAO"%>
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
		BatchDAO dao = new BatchDAO();
		
	
		int edit = dao.editBatch(Integer.parseInt(request.getParameter("batch_id")), 
				request.getParameter("batch_name"),request.getParameter("batch_description"),
				request.getParameter("batch_timing"), request.getParameter("batch_startDate"));
		
		if(edit > 0)
		{
			response.sendRedirect("../admin/adminBatch.jsp");
		}
	%>

</body>
</html>