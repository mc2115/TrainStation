<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Server</title>
	</head>
	
	<body>
	<%
		if(request.getSession().getAttribute("username") == null)
		{ %>
			Log in or click Sign Up to register:
			<br>
				<form method="post" action="login.jsp">
					<table>
						<tr>    
							<td>Username</td><td><input type="text" name="usernameBox"></td>
						</tr>
						<tr>
							<td>Password</td><td><input type="password" name="passwordBox"></td>
						</tr>
					</table>
					<input type="submit" value="Login">
				</form>
			<br>
			
			<br>
			<form method="post" action="register.jsp">
				
				<input type="submit" value="Sign Up">
			</form>
		<br>
		<% }
		else
		{ %>
			<p> Successfully logged in user: <%out.print((String)request.getSession().getAttribute("username"));%> </p>
				<br>
					<form method="post" action="search.jsp">
				        <input type="submit" value="Search">
				    </form>
				<br>    
				    <form method="post" action="reserve.jsp">
				        <input type="submit" value="Reserve">
				    </form>
			    <br>	
			    	<form method="post" action="questions.jsp">
				        <input type="submit" value="Questions">
				    </form>
			    <br>			    
		    
			    <% if((Boolean)request.getSession().getAttribute("admin_user")) 
			    { %>
				    <form method="post" action="adminPanel.jsp">
				        <input type="submit" value="Admin">
				    </form>
			    <% } %>
			    
			    <br>
			    
			    <% if((Boolean)request.getSession().getAttribute("customer_rep")) 
			    { %>
				    <form method="post" action="cusrepPanel.jsp">
				        <input type="submit" value="Customer Rep">
				    </form>
			    <% } %>
			    
			    <br>
			    
				    <form method="post" action="logout.jsp">
				        <input type="submit" value="Logout">
				    </form>
				    
		    	<br>
		<% } %>
		
	
	</body>
</html>