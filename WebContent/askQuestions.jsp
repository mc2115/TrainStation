<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask Questions</title>
</head>
	
<body>
	Please detail your question here in 500 characters or less:
	
	<br>
	
	
	
	<form method="post" action="postQuestion.jsp">
		<textarea name="questionText" cols="50" rows="10"></textarea>
		<br>
        <input type="submit" value="Post">
    </form>
	
	<br>

	<form method="post" action="questions.jsp">
        <input type="submit" value="Back to Questions">
    </form>
    
</body>
    
</html>