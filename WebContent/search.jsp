<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Lines</title>
</head>

<body>
To search for transit lines, please input all necessary information below.
<br>

<form method="post" action="result.jsp">
	<table>
		<tr>    
			<td>Origin Station</td><td><input type="text" name="originBox"></td>
		</tr>
		<tr>    
			<td>Destination Station</td><td><input type="text" name="destBox"></td>
		</tr>
		<tr>    
			<td>Departure Date (YYYY-MM-DD)</td><td><input type="text" name="dateBox"></td>
		</tr>
	</table>
	
	<select name="Sort By">
		<option value="A">Arrival</option>
		<option value="D">Departure</option>
		<option value="F">Fare</option>
	</select>
	
	<input type="submit" value="Search">
</form>

<form method="post" action="index.jsp">
	<input type="submit" value="Back to Main">
</form>

</body>

</html>