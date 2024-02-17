<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="3; URL=rep2.jsp">
<title>Posting...</title>
</head>

	<body>
	
		<%
			ApplicationDB db = new ApplicationDB();
	    	Connection con = db.getConnection();
	    	
			String answer = request.getParameter("answerText");
			String username = (String)request.getSession().getAttribute("username");
			int ID = Integer.parseInt(request.getParameter("qIDBox"));
			
			String query = "update QandA " +
					"set answer = ?, answered = ? " +
					"where qID = ? and answer = \"\";";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, answer);
	        ps.setString(2, username);
	        ps.setInt(3, ID);
	        ps.executeUpdate();
	        
			out.print("Question answered, good work.");
			
			con.close();
		%>
	
	</body>

</html>