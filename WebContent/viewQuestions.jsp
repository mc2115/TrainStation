<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Questions</title>
</head>
	
<body>

	<table border ="1">
		<caption>All Questions</caption>
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
	

	<form method="post" action="index.jsp">
        <input type="submit" value="Back to Main">
    </form>
    
</body>
    
</html>