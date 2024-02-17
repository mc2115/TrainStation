<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="3; URL=register.jsp">
<title>Registering...</title>
</head>

	<body>
	
		<%
			ApplicationDB db = new ApplicationDB();
	    	Connection con = db.getConnection();
	    	
			String username = request.getParameter("newUsernameBox").toLowerCase();
			String password = request.getParameter("newPasswordBox");
			String confPass = request.getParameter("confPasswordBox");
			boolean adminCheck;
			boolean cusrepCheck;
			
			try{
				adminCheck = request.getParameter("adminCheck").equals("true");
			} catch (NullPointerException e) {
				adminCheck = false;
			}
			
			try{
				cusrepCheck = request.getParameter("cusrepCheck").equals("true");
			} catch (NullPointerException e) {
				cusrepCheck = false;
			}
			
			String fname = request.getParameter("fnameBox");
			String lname = request.getParameter("lnameBox");
			String email = request.getParameter("emailBox");
			
			if(password.equals(confPass))
			{
				//Adds to database
				String query = "INSERT INTO userinfo (username, `password`, admin_user, customer_rep, last_name, first_name, email) VALUES (?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, username);
		        ps.setString(2, password);
		        ps.setBoolean(3, adminCheck);
		        ps.setBoolean(4, cusrepCheck);
		        ps.setString(5, lname);
		        ps.setString(6, fname);
		        ps.setString(7, email);
		        ps.executeUpdate();
		        
				out.print("Account registered, you may return to the log in page.");
			}
			else
			{
				//Reports passwords don't match error
				out.print("Passwords do not match, please try again.");
			}
			
			con.close();
		%>
	
	</body>

</html>