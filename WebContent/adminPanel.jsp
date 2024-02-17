<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Controls</title>
</head>
	<form method="post" action="admin1.jsp">
        <input type="submit" value="Customer Representative Information">
    </form>
    
    <form method="post" action="admin2.jsp">
        <input type="submit" value="Sales Report per Month">
    </form>
    
    <br>
	<form method="get" action="admin3.jsp">
		<select name="param" size=1>
		<option value="transit_line_name">Transit line</option>
		<option value="passenger">Customer</option>
		</select>&nbsp;<br> <input type="submit" value="Reservation List">
	</form>
	
	<br>
    <form method="get" action="admin4.jsp">
		<select name="param" size=1>
		<option value="transit_line_name">Transit line</option>
		<option value="passenger">Customer</option>
		</select>&nbsp;<br> <input type="submit" value="Customer Revenue">
	</form>
	
    <form method="post" action="admin5.jsp">
        <input type="submit" value="Best Customer">
    </form>
    
    <form method="post" action="admin6.jsp">
        <input type="submit" value="Most active transit lines">
    </form>
    
    <form method="post" action="index.jsp">
        <input type="submit" value="Back to Main">
    </form>
</html>