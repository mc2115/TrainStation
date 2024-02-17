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
		String reserve_number = request.getParameter("reserve_number");
		
		String input = request.getParameter("myInput");
		String input2 = request.getParameter("input2");
		
	    
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Make an insert statement for the Sells table:
		String select = "DELETE FROM Reservations WHERE reserve_number="+reserve_number+ " AND passenger='"+request.getSession().getAttribute("username")+"' and departure > NOW()";
		System.out.println("SELECT:"+select);
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		ps.executeUpdate(select);
		
		Statement stmt2 = con.createStatement();
		//Make an insert statement for the Sells table:
		String select2 = "SELECT u.last_name, u.first_name, u.email, e.ssn FROM Employees e, userinfo u where customer_rep=true AND e.username=u.username";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps2 = con.prepareStatement(select2);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		result = ps2.executeQuery();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		//con.close();

		//out.print("Sum succeeded!");
		
			//Make an HTML table to show the results in:
			out.print("Successful deletion");
			
			con.close();		
			} catch (Exception ex) {
		out.print(ex);
	}
		%>
		
	<form method="post" action="reserve.jsp">
		<input type="submit" value="Back to Reservation Menu">
	</form>
	
</body>
</html>
