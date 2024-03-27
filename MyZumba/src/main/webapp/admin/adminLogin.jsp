<%@page import="com.zumba.dao.AdminLoginDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.zumba.model.AdminData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

	AdminData admin = new AdminData();
	List<AdminData> adminData = new ArrayList<AdminData>();
	
	admin.setUsername(request.getParameter("username"));
	admin.setPassword(request.getParameter("password"));
	
	AdminLoginDAO dao = new AdminLoginDAO();
	adminData = dao.loginAdmin(admin.getUsername(), admin.getPassword());
	
	if(!adminData.isEmpty())
	{
		Cookie cookies1 = new Cookie("keyName", adminData.get(0).getUsername());
		
		response.addCookie(cookies1);
	
		 // Redirect to adminHome.jsp upon successful login
        response.sendRedirect("adminHome.jsp");
	
%>

<% } else{ %>
<h1>Login Failed</h1>
<%} %>
	