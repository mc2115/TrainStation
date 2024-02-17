<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservations</title>
</head>
	<br>
	    <form method="post" action="customer2.jsp">
	        <input type="submit" value="Create New Reservation">
	    </form>
  		<br>
	    <form method="post" action="customer3.jsp">
	        <input type="submit" value="Cancel Existing Reservation">
	    </form>
   	<br>
	    <form method="get" action="customer4.jsp">

	        <select name="param" size=1>
	        <option value=">">Current</option>
	        <option value="<">Past</option>
	        </select>&nbsp;<br> <input type="submit" value="View Past/Current Reservations">

        </form>
    
    <br>
    
    <form method="post" action="index.jsp">
		<input type="submit" value="Back to Main">
	</form>
   
</html>