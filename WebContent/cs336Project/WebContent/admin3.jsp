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
		String param = request.getParameter("param");

		//Make an insert statement for the Sells table:
		String select = "SELECT * FROM Reservations r ORDER BY r."+ param;
		System.out.println("SELECT:"+select);
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(select);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//ps.setString(1, param);
		//Run the query against the DB
		result = ps.executeQuery();
		//out.print(param+ (param=="transit_line_name"));
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		//con.close();

		//out.print("Sum succeeded!");
		if ("transit_line_name".equals(param)){
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Line Name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Reservation Number");
			out.print("</td>");
			out.print("<td>");
			out.print("Reservation Date");
			out.print("</td>");
			out.print("<td>");
			out.print("Passenger Username");
			out.print("</td>");
			out.print("<td>");
			out.print("Fare");
			out.print("</td>");
			out.print("<td>");
			out.print("Origin");
			out.print("</td>");
			out.print("<td>");
			out.print("Destination");
			out.print("</td>");
			out.print("<td>");
			out.print("Round Trip");
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
				out.print(result.getString("reserve_number"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("reserve_date"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("passenger"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("fare"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("origin"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("destination"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("is_RoundTrip"));
				out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table>");
		}	
		else{
				//Make an HTML table to show the results in:
				out.print("<table>");
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print("Passenger Username");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print("Reservation Number");
				out.print("</td>");
				out.print("<td>");
				out.print("Reservation Date");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Fare");
				out.print("</td>");
				out.print("<td>");
				out.print("Origin");
				out.print("</td>");
				out.print("<td>");
				out.print("Destination");
				out.print("</td>");
				out.print("<td>");
				//print out column header
				out.print("Line Name");
				out.print("</td>");
				out.print("<td>");
				out.print("Round Trip");
				out.print("</td>");
				out.print("</tr>");

				//parse out the results
				while (result.next()) {
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current month name:
					out.print(result.getString("passenger"));
					out.print("</td>");
					
					out.print("<td>");
					//Print out current revenue:
					out.print(result.getString("reserve_number"));
					out.print("</td>");
					out.print("<td>");
					//Print out current month name:
					out.print(result.getString("reserve_date"));
					out.print("</td>");
					
					out.print("<td>");
					//Print out current month name:
					out.print(result.getString("fare"));
					out.print("</td>");
					out.print("<td>");
					//Print out current month name:
					out.print(result.getString("origin"));
					out.print("</td>");
					out.print("<td>");
					//Print out current month name:
					out.print(result.getString("destination"));
					out.print("</td>");
					out.print("<td>");
					//Print out current month name:
					out.print(result.getString("transit_line_name"));
					out.print("</td>");
					out.print("<td>");
					//Print out current month name:
					out.print(result.getString("is_RoundTrip"));
					out.print("</td>");
					
					out.print("</tr>");

				}
				out.print("</table>");
	   
		}
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