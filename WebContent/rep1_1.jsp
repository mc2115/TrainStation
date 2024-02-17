<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	 ResultSet result;
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String param = request.getParameter("param");
		String input = request.getParameter("input");
		String input2 = request.getParameter("input2");
		String input3 = request.getParameter("input3");
		String input4 = request.getParameter("input4");
		
	    
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Make an insert statement for the Sells table:
		String select;
		if (param.equals("edit")) select = "UPDATE Stops SET station_ID= "+input4+" WHERE stop_num="+input3+" AND departure='"+input2+"' AND transit_line_name='"+input+"'";
		else select = "DELETE FROM Stops WHERE departure='"+input2+"' AND transit_line_name='"+input+"'";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		ps.executeUpdate(select);
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		//con.close();

		//out.print("Sum succeeded!");
		
			//Make an HTML table to show the results in:
			con.close();		
			} catch (Exception ex) {
		out.print(ex);
	}
		%>
</body>
</html>
