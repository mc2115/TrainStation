<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="3; URL=index.jsp">
<title>Logging In</title>
</head>

	<body>
	
		<%
			ApplicationDB db = new ApplicationDB();
	    	Connection con = db.getConnection();
	    	
			String username = request.getParameter("usernameBox").toLowerCase();
			String password = request.getParameter("passwordBox");
			
			String query = "SELECT username, `password`, admin_user, customer_rep FROM userinfo WHERE username = ? AND `password` = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
		    ps.setString(2, password);
		    
		    ResultSet rs = ps.executeQuery();
		    
		    boolean found = false;
		    
		    while(rs.next())
		    {
		    	String returned = rs.getString("username");
		   		Boolean isAdmin = rs.getBoolean("admin_user"); 
		   		Boolean isCusrep = rs.getBoolean("customer_rep"); 
		   		
			    if(username.equals(returned))
			    {
			    	request.getSession().setAttribute("username", username);
			    	request.getSession().setAttribute("admin_user", isAdmin);
			    	request.getSession().setAttribute("customer_rep", isCusrep);
			    	out.print("Logging in...");
			    	found = true;
			    	break;
			    }
		    }
		    
		    if(!found)
		    	out.print("Username and password did not match, please try again.");
		    
			con.close();
		%>
	
	</body>
	
</html>