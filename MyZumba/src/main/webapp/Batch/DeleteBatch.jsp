<%@page import="com.example.dao.BatchDAO"%>
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
	
	int delete = dao.deleteBatch(Integer.parseInt(request.getParameter("id")));
	
	if(delete>0)
	{
		response.sendRedirect("../admin/adminBatch.jsp");
	}
	
%>
</body>
</html>