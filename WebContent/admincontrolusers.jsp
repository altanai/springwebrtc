<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
	response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Unified Communicator</title>
<link href="style.css" title="style" rel="stylesheet" type="text/css" />
<style>
fieldset {
	margin-top: 4%;
	border: 1px solid #ffffff;
	width: 50%;
	align: center;
}

h5 {
	color: #ffffff;
}

.button {
	border-top: 1px solid #96d1f8;
	background: #65a9d7;
	background: -webkit-gradient(linear, left top, left bottom, from(#c5cfd6),
		to(#65a9d7) );
	background: -webkit-linear-gradient(top, #c5cfd6, #65a9d7);
	background: -moz-linear-gradient(top, #c5cfd6, #65a9d7);
	background: -ms-linear-gradient(top, #c5cfd6, #65a9d7);
	background: -o-linear-gradient(top, #c5cfd6, #65a9d7);
	padding: 4px 8px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	-moz-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	text-shadow: rgba(0, 0, 0, .4) 0 1px 0;
	color: #0a010a;
	font-size: 15px;
	font-family: 'Lucida Grande', Helvetica, Arial, Sans-Serif;
	text-decoration: none;
	vertical-align: middle;
	margin-bottom: 5px;
	margin-top: 4%;
	width: 60px;
	height: 30px;
	font-family: 'Lucida Grande', Helvetica, Arial, Sans-Serif;
}

.button:hover {
	border-top-color: #2a5069;
	background: #2a5069;
	color: #ccc;
}

.button:active {
	border-top-color: #1b435e;
	background: #1b435e;
}
</style>
<script>
function redirect(){
	window.location.href= 'Login.jsp';
}
function validate()
{
	var a=user();
	var b=pass();
	return a && b;	
}
function user()
{
	var name=document.getElementById("username").value;	
	if (name==null || name=="")
	{
		document.getElementById("user-error").innerHTML="Please enter user name";
		return false;
	}	
	else
	{
		document.getElementById("user-error").innerHTML="";
		return true;
	}
}

function pass()
{
	var name=document.getElementById("password").value;
	
	if (name==null || name=="")
	{
		document.getElementById("pass-error").innerHTML="Please enter password";
		return false;
	}
	
	else
	{
		document.getElementById("pass-error").innerHTML="";
		return true;
	}
}
function removeUserCheck()
{
	var name=document.getElementById("username1").value;	
	if (name==null || name=="")
	{
		document.getElementById("user-error1").innerHTML="Please enter user name";
		return false;
	}	
	else
	{
		document.getElementById("user-error1").innerHTML="";
		return true;
	}
}
</script>
</head>
<body>
	<div class="header">
		<p>
			<img src="images/TCSLogo.jpg" /> Unified Communicator 
			<a class="header-anchor" style="cursor: pointer;" onclick="redirect();"><font color="#ffffff">Logout</font></a>
		</p>
	</div>
	<div style="width: 100%; height: 100%;">
		<div align="center">
			<fieldset>
				<legend>
					<h3	style="display: block; text-align: left; color: #0370ea; font-weight: bold;">
						Add User to Kamilio</h3>
				</legend>
				<form action="EnterServlet" method="post" id="enterform">
					<table align="center">
						<tr>
							<td><h5>Username&nbsp;&nbsp;&nbsp;</h5></td>
							<td><input type="text" name="username" id="username"
								placeholder="For eg.John"></td>
							<td>&nbsp;&nbsp;&nbsp;<label id="user-error" style="color:red;font-size:13px;"></label></td>
						</tr>
						<tr>
							<td><h5>Password</h5></td>
							<td><input type="password" name="password" id="password"></td>
							<td>&nbsp;&nbsp;&nbsp;<label id="pass-error" style="color:red;font-size:13px;"></label></td>
						</tr>
						<tr>
							<td colspan="3">
								<div align="center">
									<input type="submit" class="button" name="submit" onclick="return validate();">
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="action" id="action" value="adduser">
				</form>
			</fieldset>
	<br />
	<br />
	<br />
	<br />
			<fieldset>
				<legend>
					<h3	style="display: block; text-align: left; color: #0370ea; font-weight: bold;">
						Remove User from Kamilio</h3>
				</legend>
				<form action="EnterServlet" method="post" id="enterform">
					<table align="center">
						<tr>
							<td><h5>UserName&nbsp;&nbsp;&nbsp;</h5></td>
							<td><input type="text" name="username1" id="username1" placeholder="For eg.John"></td>
							<td>&nbsp;&nbsp;&nbsp;<label id="user-error1" style="color:red;font-size:13px;"></label></td>
						</tr>
						<tr>
							<td colspan="3">
								<div align="center">
									<input type="submit" class="button" style="margin-top: 6%;"
										name="submit" onclick="return removeUserCheck();">
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="action" id="action" value="removeuser">
				</form>
			</fieldset>
	<div style="width: 50%; height: 10%;margin-top:5%;" align="center">
	<%if(request.getAttribute("msg")!=null){ %>
	<label style="color: white;font-size:17px;"><%=request.getAttribute("msg")%></label>	
	<%} %>
	</div>
	</div>
	</div>
</body>
</html>