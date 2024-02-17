<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="3; URL=questions.jsp">
<title>Posting...</title>
</head>

	<body>
	
		<%
			ApplicationDB db = new ApplicationDB();
	    	Connection con = db.getConnection();
	    	
			String question = request.getParameter("questionText");
			String username = (String)request.getSession().getAttribute("username");
			
			String query = "insert into QandA (question, answer, asked, answered) values(?, ?, ?, ?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, question);
	        ps.setString(2, "");
	        ps.setString(3, username);
	        ps.setString(4, "");
	        ps.executeUpdate();
	        
			out.print("Question submitted, we'll get back to you as soon as we can!");
			
			con.close();
		%>
	
	</body>

</html>