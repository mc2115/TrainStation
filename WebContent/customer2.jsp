<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Server</title>
	</head>
				<form method="get" action="customer1.jsp">
					Line Name: <input name="input1" type="text">
					Start Stop: <input name="input2" type="text">
					Destination: <input name="input3" type="text">
					Is the passenger one of the following?
					<select name="param" size=1>
					<option value="child">Child</option>
					<option value="senior">Senior</option>
					<option value="disabled">Disabled</option>
					<option value="none">None</option>
					<select>
					Would you like a round trip?
					<select name="param2" size=1>
					<option value="true">Yes</option>
					<option value="false">No</option>
					</select>
			        <input type="submit" value="Create New Reservation">
			    </form>
	<body>
		<form method="post" action="reserve.jsp">
			<input type="submit" value="Back to Reservation Menu">
		</form>
	</body>
		
	
</html>