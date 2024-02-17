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
		String param = request.getParameter("param");
		String input = request.getParameter("input");
		//Get parameters from the HTML form at the HelloWorld.jsp
		//Make an insert statement for the Sells table:
		String select;
		if (param.equals("origin")){
			select = "SELECT * FROM Stops s WHERE s.transit_line_name IN (SELECT transit_line_name FROM Stops s2 WHERE s2.stop_num=1 AND s2.station_ID="+input+")";
		} else {
			select = "SELECT * FROM Stops s WHERE s.transit_line_name IN (SELECT transit_line_name FROM Stops s2 WHERE s2.stop_num=s2.total_stops AND s2.station_ID="+input+")";
		}
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
		out.print("</td>");
		out.print("<td>");
		out.print("Station");
		out.print("</td>");
		out.print("<td>");
		out.print("Stop Number");
		out.print("</td>");
		out.print("<td>");
		out.print("Initial Departure");
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
			out.print(result.getString("station_ID"));
			out.print("</td>");
			out.print("<td>");
			//Print out current month name:
			out.print(result.getString("stop_num"));
			out.print("</td>");
			out.print("<td>");
			//Print out current month name:
			out.print(result.getString("departure"));
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
		
	<form method="post" action="cusrepPanel.jsp">
		<input type="submit" value="Back to Customer Rep Menu">
	</form>
</body>
</html>