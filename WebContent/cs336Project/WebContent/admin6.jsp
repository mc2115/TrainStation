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

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		//Make an insert statement for the Sells table:
		String select = "SELECT r.transit_line_name, COUNT(r.transit_line_name) as activity FROM Reservations r GROUP BY r.transit_line_name order by activity DESC limit 5";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		result = ps.executeQuery();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		//con.close();

		//out.print("Sum succeeded!");
		
			//Make an HTML table to show the results in:
		out.print("<table>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Line Name");
		//out.print("PARAM:"+param+":END");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Activity");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current month name:
			out.print(result.getString("transit_line_name"));
			out.print("</td>");
			out.print("<td>");
			//Print out current revenue:
			out.print(result.getString("activity"));
			out.print("</td>");
			out.print("</tr>");

		}
		out.print("</table>");

		con.close();			
			} catch (Exception ex) {
		out.print(ex);
		out.print("table failed :(");
	}
		%>
		
	<form method="post" action="adminPanel.jsp">
		<input type="submit" value="Back to Admin Controls">
	</form>
</body>
</html>