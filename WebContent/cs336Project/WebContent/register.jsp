<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>

<body>
	<br>
		<form method="post" action="regUser.jsp">
			<table>
				<tr>    
					<td>New Username</td><td><input type="text" name="newUsernameBox"></td>
				</tr>
				<tr>
					<td>New Password</td><td><input type="password" name="newPasswordBox"></td>
				</tr>
				<tr>
					<td>Confirm Password</td><td><input type="password" name="confPasswordBox"></td>
				</tr>
				<tr>
					<td>First Name</td><td><input type="fname" name="fnameBox"></td>
				</tr>
				<tr>
					<td>Last Name</td><td><input type="lname" name="lnameBox"></td>
				</tr>
				<tr>
					<td>Email</td><td><input type="email" name="emailBox"></td>
				</tr>
				<tr>
					<td>Admin</td><td><input type="checkbox" name="adminCheck" value="true"> </td>
				</tr>
				<tr>
					<td>Customer Rep</td><td><input type="checkbox" name="cusrepCheck" value="true"> </td>
				</tr>
				
			</table>
			<input type="submit" value="Register">
		</form>
	<br>
	
	<br>
		<form method="post" action="index.jsp">
		
			<input type="submit" value="Return to Log In">
		</form>
	<br>
</body>

</html>