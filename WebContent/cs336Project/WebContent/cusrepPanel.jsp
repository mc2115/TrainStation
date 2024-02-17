<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Representative Controls</title>
</head>
	<form method="post" action="rep1.jsp">
        <input type="submit" value="Edit and Delete Information for Train Schedules">
    </form>
    
    <form method="post" action="rep2.jsp">
        <input type="submit" value="Reply to questions">
    </form>
    
    <form method="get" action="rep3.jsp">	
    Find Schedules for Station: <input name="input" type="text">	
    Choose Station Type:		    
    <select name="param" size=1>
		<option value="origin">Origin</option>
		<option value="destination">Destination</option>
    	<input type="submit" value="Get Schedules">
    </form>
    
    <form method="post" action="rep4.jsp">
	    Date: <input name="input" type="text">	
	    Line Name: <input name="input2" type="text">	
	    <input type="submit" value="Get Customers">
    </form>
    
    <form method="post" action="index.jsp">
        <input type="submit" value="Back to Main">
    </form>
    
</html>