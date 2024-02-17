<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
</head>
	<form method="post" action="viewQuestions.jsp">
        <input type="submit" value="Browse Questions">
    </form>
    
    <form method="post" action="searchQuestions.jsp">
        <input type="submit" value="Question Look-up">
    </form>
    
    <form method="post" action="askQuestions.jsp">
        <input type="submit" value="Ask a Question">
    </form>
    
    <form method="post" action="index.jsp">
        <input type="submit" value="Back to Main">
    </form>
</html>