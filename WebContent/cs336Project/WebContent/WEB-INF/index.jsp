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
		else if ( ((boolean) (Boolean.valueOf(String.valueOf(request.getSession().getAttribute("admin_user"))))) == true){
		%>
			<p> Successfully logged in admin user: <%out.print((String)request.getSession().getAttribute("username"));%> </p>
			<br>
			    <form method="post" action="admin1.jsp">
			        <input type="submit" value="Customer Representative Information">
			    </form>
			    <form method="post" action="admin2.jsp">
			        <input type="submit" value="Sales Report per Month">
			    </form>
			    <br>
				<form method="get" action="admin3.jsp">
					<select name="param" size=1>
					<option value="transit_line_name">Transit line</option>
					<option value="passenger">Customer</option>
					</select>&nbsp;<br> <input type="submit" value="Reservation List">
				</form>
				<br>
			    <form method="get" action="admin4.jsp">
					<select name="param" size=1>
					<option value="transit_line_name">Transit line</option>
					<option value="passenger">Customer</option>
					</select>&nbsp;<br> <input type="submit" value="Customer Revenue">
				</form>
			    <form method="post" action="admin5.jsp">
			        <input type="submit" value="Best Customer">
			    </form>
			    <form method="post" action="admin6.jsp">
			        <input type="submit" value="Most active transit lines">
			    </form>
			    <form method="post" action="logout.jsp">
			        <input type="submit" value="Logout">
			    </form>
		    <br>
		<% 
		}
		else if ( ((boolean) (Boolean.valueOf(String.valueOf(request.getSession().getAttribute("customer_rep"))))) == true){
			%>
				<p> Successfully logged in customer_rep user: <%out.print((String)request.getSession().getAttribute("username"));%> </p>
				<br>
				    <form method="post" action="rep1.jsp">
				        <input type="submit" value="Edit and Delete Information for Train Schedules">
				    </form>
				    <form method="post" action="rep2.jsp">
				        <input type="submit" value="Reply to questions">
				    </form>
				    <form method="get" action="rep3.jsp">	
				    Find Schedules for Station: <input name="input" type="text">	
				    Choose Station Type:		    
				    <select name="param" size=1>
					<option value="origin">Origin</option>
					<option value="destination">Destination</option>
				    <input type="submit" value="Get Schedules">
				    </form>
				    <form method="post" action="rep4.jsp">
				    Date: <input name="input" type="text">	
				    Line Name: <input name="input2" type="text">	
				    <input type="submit" value="Get Customers">
				    </form>
				    <form method="get" action="logout.jsp">
				        <input type="submit" value="Logout">
				    </form>
			    <br>
			<% 
			}
		else
		{ %>
			<p> Successfully logged in user: <%out.print((String)request.getSession().getAttribute("username"));%> </p>
			<br>	
				<form method="post" action="search.jsp">
			        <input type="submit" value="Search">
			    </form>
		    <br>
		    <br>
			    <form method="post" action="customer2.jsp">

			        <input type="submit" value="Create New Reservation">
			    </form>
		    <br>
		    <br>
			    <form method="get" action="customer4.jsp">

					<select name="param" size=1>
					<option value=">">Current</option>
					<option value="<">Past</option>
					</select>&nbsp;<br> <input type="submit" value="Customer Revenue">

			    </form>
		    <br>

		    <br>
			    <form method="post" action="logout.jsp">
			        <input type="submit" value="Logout">
			    </form>
		    <br>
		<% } %>
		
	
	</body>
</html>