<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Lines</title>
</head>

<body>

<table border ="1">
<caption>Train Schedules</caption>
<tr>
<td><b>Transit Line</b></td>
<td><b>Train ID</b></td>
<td><b>Origin</b></td>
<td><b>Destination</b></td>
<td><b>Departure</b></td>
<td><b>Arrival</b></td>
<td><b>Travel Time</b></td>
<td><b>Fare</b></td>
</tr>
<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
		
	String o = request.getParameter("originBox");
	String d = request.getParameter("destBox");
	String date = request.getParameter("dateBox");
	String sortType = request.getParameter("Sort By");
	
	String query = "select h.transit_line_name, h.train_ID, s.originStation, t.destStation, h.departure, h.arrival, h.travel_time, h.fare " +
			"from Has_Schedule h " + 
			"inner join (select s1.*, st1.station_name as originStation from Stops s1 inner join Stations st1 on s1.station_ID = st1.station_ID where s1.stop_num = 1) as s " +
			"on h.transit_line_name = s.transit_line_name " + 
			"inner join (select s2.*, st2.station_name as destStation from Stops s2 inner join Has_Schedule h1 on s2.transit_line_name = h1.transit_line_name inner join Stations st2 on s2.station_ID = st2.station_ID where s2.stop_num = h1.stops) as t " +
			"on h.transit_line_name = t.transit_line_name " +
			"where s.station_ID = ? and t.station_ID = ? and DATE(h.departure) = ? ";
	
	if(sortType.equals("A"))
	{
		query = query + "order by h.arrival asc;";
	}
	else if(sortType.equals("D"))
	{
		query = query + "order by h.departure asc;";
	}
	else
	{
		query = query + "order by h.fare asc;";
	}
			
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, o);
	ps.setString(2, d);
	ps.setString(3, date);
	
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{%>
	
	<tr>
	<td><%=rs.getString("transit_line_name") %></td>
	<td><%=rs.getString("train_ID") %></td>
	<td><%=rs.getString("originStation") %></td>
	<td><%=rs.getString("destStation") %></td>
	<td><%=rs.getString("departure") %></td>
	<td><%=rs.getString("arrival") %></td>
	<td><%=rs.getString("travel_time") %></td>
	<td><%=rs.getString("fare") %></td>
	</tr>
	
	<%}
%>
</table>

<form method="post" action="stops.jsp">
	<table>
		<tr>    
			<td>Train ID</td><td><input type="text" name="trainIDBox"></td>
		</tr>
		<tr>    
			<td>Transit Line</td><td><input type="text" name="transitLineBox"></td>
		</tr>
	</table>
	<input type="submit" value="View Stops">
</form>

<form method="post" action="search.jsp">
	<input type="submit" value="Back to Search">
</form>

</body>

</html>