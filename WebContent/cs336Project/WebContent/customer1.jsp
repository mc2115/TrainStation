<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="3; URL=customer2.jsp">
<title>Insert title here</title>
</head>
<body>
	<%
	 ResultSet result;
	 ResultSet result2;
	 ResultSet result3;
	 ResultSet result4;
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String param = request.getParameter("param");
		String param2 = request.getParameter("param2");
		String input1 = request.getParameter("input1");
		String input2 = request.getParameter("input2");
		String input3 = request.getParameter("input3");
		
	    
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String select = "select stop_num, total_stops from Stops where transit_line_name='"+input1+"' AND station_ID="+input2;		
		//Make an insert statement for the Sells table:
		PreparedStatement ps = con.prepareStatement(select);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		int start=0;
		int stops=0;	
		result = ps.executeQuery();
		while (result.next()) {
		start=(result.getInt("stop_num"));
		stops=(result.getInt("total_stops"));
		}
		Statement stmt2 = con.createStatement();
		String select2 = "select stop_num, departure from Stops where transit_line_name='"+input1+"' AND station_ID="+input3;		
		//Make an insert statement for the Sells table:
		PreparedStatement ps2 = con.prepareStatement(select2);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		result2 = ps2.executeQuery();
		int end=0;
		String departure="";
		while (result2.next()) {
		end=(result2.getInt("stop_num"));
		departure=result2.getString("departure");
		}
		Statement stmt3 = con.createStatement();
		String select3 = "select fare, train_ID from Has_Schedule where transit_line_name='"+input1+"' AND stops="+stops;		
		//Make an insert statement for the Sells table:
		PreparedStatement ps3 = con.prepareStatement(select3);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		result3 = ps3.executeQuery();
		double fare=0;
		String train="";
		while (result3.next()) {
		fare=(result3.getInt("fare"));
		train=result3.getString("train_ID");
		}
		
		double price=0;
		if (param2.equals("true")){
			if (param.equals("child")) price=2*0.75*fare*(end-start)/stops;
			else if (param.equals("senior")) price=2*0.65*fare*(end-start)/stops;
			else if (param.equals("disabled")) price=2*0.5*fare*(end-start)/stops;
			else price=2*fare*(end-start)/stops;
		}
		else{
			if (param.equals("child")) price=0.75*fare*(end-start)/stops;
			else if (param.equals("senior")) price=0.65*fare*(end-start)/stops;
			else if (param.equals("disabled")) price=0.5*fare*(end-start)/stops;
			else price=fare*(end-start)/stops;		
		}
		Statement stmt4 = con.createStatement();
		String select4 = "select MAX(reserve_number) as num from Reservations";		
		//Make an insert statement for the Sells table:
		PreparedStatement ps4 = con.prepareStatement(select4);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		result4 = ps4.executeQuery();
		int reserve_number=0;
		while (result4.next()) {
		reserve_number=(result4.getInt("num"));
		}
		reserve_number=reserve_number+1;
		String select5 = "INSERT INTO Reservations\n"+ "VALUES ("+reserve_number+","+train+",NOW(),'"+departure+"','"+request.getSession().getAttribute("username")+"',"+price+","+input2+","+input3+",'"+input1+"',"+param2+")";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps5 = con.prepareStatement(select5);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		//Run the query against the DB
		ps5.executeUpdate();

			con.close();		
			} catch (Exception ex) {
		out.print(ex);
	}
		%>
</body>
</html>
