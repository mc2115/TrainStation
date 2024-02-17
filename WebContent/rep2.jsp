<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answer Questions</title>
</head>
	
<body>

	<table border ="1">
		<caption>Unanswered Questions</caption>
		<tr>
		<td><b>Index</b></td>
		<td><b>Question</b></td>
		<td><b>Asked By</b></td>
		<td><b>Answer</b></td>
		<td><b>Answered By</b></td>
		</tr>
		<%
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			String query = "select q.qID, q.question, q.asked, q.answer, q.answered " +
					"from QandA q " +
					"where answer = \"\" " +
					"order by qID asc";
					
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{%>
			
			<tr>
			<td><%=rs.getString("qID") %></td>
			<td><%=rs.getString("question") %></td>
			<td><%=rs.getString("asked") %></td>
			<td><%=rs.getString("answer") %></td>
			<td><%=rs.getString("answered") %></td>
			</tr>
			
			<%}%>
	</table>
	
	<br>
	
	
	
	<br>

	Write answer here in 500 characters or less:
	
	<br>
	
	<form method="post" action="answerQuestion.jsp">
		<textarea name="answerText" cols="50" rows="10"></textarea>
		<br>
		<table>
			<tr>
				<td>Question Index</td><td><input type="text" name="qIDBox"></td>
			</tr>
		</table>
        <input type="submit" value="Post">
    </form>
	
	<br>

	<form method="post" action="cusrepPanel.jsp">
        <input type="submit" value="Back to Questions">
    </form>
    
</body>
    
</html>