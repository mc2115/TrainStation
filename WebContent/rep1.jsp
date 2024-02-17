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
		//Make an insert statement for the Sells table:
		String select = "SELECT * from Stops group by transit_line_name, departure";
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
			out.print("Start Station station_ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("transit_line_name");
			out.print("</td>");
			out.print("<td>");
			out.print("departure");
			out.print("</td>");
			out.print("<td>");
			out.print("total_stops");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("station_ID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current revenue:
				out.print(result.getString("transit_line_name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("departure"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("total_stops"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
			%><br>	
			<form method="get" action="rep1_1.jsp">
					Line Name: <input name="input" type="text">
					departure: <input name="input2" type="text">
					<select name="param" size=1>
					Choose what to do
					<option value="edit">Add/Edit</option>
					<option value="delete">Delete</option>
					Choose what station to modify
					Original station number: <input name="input3" type="text">
					New Station: <input name="input4" type="text">
					</select>&nbsp;<br> <input type="submit" value="Modify">					
				</form>
	   		<br><% 
			con.close();		
			} catch (Exception ex) {
		out.print(ex);
	}
		%>
</body>
</html>
