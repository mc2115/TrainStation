<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Stops</title>
</head>

<body>

<table border ="1">
<caption>Train Stops</caption>
<tr>
<td><b>Stop#</b></td>
<td><b>Station</b></td>
<td><b>Station ID</b></td>
<td><b>City</b></td>
<td><b>State</b></td>
</tr>
<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
		
	int tID = Integer.parseInt(request.getParameter("trainIDBox"));
	String transitName = request.getParameter("transitLineBox");
	
	String query = "select p.stop_num, s.station_name, p.station_ID, s.city, s.state " +
			"from Stops p, Stations s, Has_Schedule h " +
			"where p.station_ID = s.station_ID and p.transit_line_name = ? and h.train_ID = ? and h.transit_line_name = p.transit_line_name;";
			
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, transitName);
	ps.setInt(2, tID);
	
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{%>
	
	<tr>
	<td><%=rs.getString("stop_num") %></td>
	<td><%=rs.getString("station_name") %></td>
	<td><%=rs.getString("station_ID") %></td>
	<td><%=rs.getString("city") %></td>
	<td><%=rs.getString("state") %></td>
	</tr>
	
	<%}
%>
</table>

<form method="post" action="search.jsp">
	<input type="submit" value="Back to Search">
</form>

</body>

</html>