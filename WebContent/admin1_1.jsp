<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="3; URL=admin1.jsp">
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
		String param2 = request.getParameter("param2");
		String input = request.getParameter("myInput");
		String input2 = request.getParameter("input2");
		
	    
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Make an insert statement for the Sells table:
		String select;
		if (param2.equals("edit")) select = "UPDATE userinfo u, Employees e SET u."+param+"= '"+input2+"' WHERE  e.ssn='"+input+"' AND u.username=e.username";
		else select = "UPDATE userinfo u, Employees e SET u."+param+"=NULL WHERE  e.ssn='"+input+"' AND u.username=e.username";
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
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("last name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("first name");
			out.print("</td>");
			out.print("<td>");
			//print out column header
			out.print("email");
			out.print("</td>");
			out.print("<td>");
			//print out column header
			out.print("ssn");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("last_name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current revenue:
				out.print(result.getString("first_name"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("email"));
				out.print("</td>");
				out.print("<td>");
				//Print out current month name:
				out.print(result.getString("ssn"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
			%><br>	
			<form method="get" action="admin1_1.jsp">
					SSN: <input name="myInput" type="text">
					Change value into: <input name="input2" type="text">
					<select name="param" size=1>
					<option value="first_name">First Name</option>
					<option value="last_name">Last Name</option>
					<option value="email">email</option>					
					</select>&nbsp;<br> <input type="submit" value="Modify">
					
				</form>
	   		<br><% 
			con.close();	
			con.close();		
			} catch (Exception ex) {
		out.print(ex);
	}
		%>
		
	<form method="post" action="adminPanel.jsp">
		<input type="submit" value="Back to Admin Controls">
	</form>
	
</body>
</html>
