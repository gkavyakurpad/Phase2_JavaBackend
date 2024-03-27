<%@page import="com.zumba.model.BatchModel"%>
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
		BatchModel batch = new BatchModel();
		
		batch.setBatch_name(request.getParameter("batch_name"));
		batch.setBatch_description(request.getParameter("batch_description"));
		batch.setBatch_timing(request.getParameter("batch_timing"));
		batch.setBatch_startDate(request.getParameter("batch_startDate"));
		
		if(dao.insertIntoBatch(batch) >0)
		{
			response.sendRedirect("../admin/adminBatch.jsp");
		}
	%>
</body>
</html>