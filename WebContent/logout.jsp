<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="3; URL=index.jsp">
<title>Logout</title>
</head>
	<%
		request.getSession().setAttribute("username", null);
		out.print("Logging out...");
	%>
</html>