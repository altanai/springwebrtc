<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function validate()
{
	var a=user();
	var b=pass();
	return a && b;
	
	}
function user()
{
	var name=document.getElementById("userName").value;
	
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

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="login.css">
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
</head>
<body style="background-image:/DhirendraNath/WebContent/images/Background-5.jpg ">
<div style="padding-bottom: 100px"></div>
	<!-- BEGIN HEADER -->
			<!-- <header class="clearfix">
				BEGIN LOGO
				END LOGO
			</header> -->
			<!-- END HEADER -->
	<!-- TOP BAR -->
	<div id="top-bar">		
		
	</div> <!-- end top-bar -->
	
	
			<div class="header">
			<a href="Registration.jsp">Register</a>
		<p>	<img src="images/images.jpg">&nbsp;WebRTC</p><%-- <a href="<%=request.getContextPath() %>/Controller?action=logout"><font color="#ffffff">Logout</font></a> --%>
		
	</div> 
	
	<!-- MAIN CONTENT -->
	<div class="content">
	<div id="message" class="message-class" style="display: none;">You have successfully registered.. Please log in to continue..</div>
	<div id="pic-div" class="pic-class"><img src="images/LoginInCaps.jpg"/></div>
	
		<form action="Controller" method="post" id="login-form">	
		 <input type="hidden" name="action" value="login"> 
		
		 <div id="login-content" class="login-class">
			<table>
			<tr>
					<td><label class="user-class">Username</label></td>
					<td><input type="text" name="userName" id="userName"/></td>
					<td><span class="red-field" id="user-error"></span></td>					
			</tr>	
				<tr>
				
					<td><label class="pass-class">Password</label></td>
					<td><input type="password" name="password" id="password"/></td>
					<td><span class="red-field" id="pass-error"></span></td>	
			</tr>	
			<tr>
				<td><a href="ForgetPassword.jsp" class="forget-class">Forgot Password?</a></td>
				 
			</tr>	
			
			<tr>
				<td><input type="reset" name="reset" value="Reset"  onClick="window.location.reload();" class="reset-button" style="width:90%"></td>
				<td><input type="submit" name="submit" value="Submit" class="submit-button" style="width:50%" onclick="return validate();"></td> 
			</tr>	
			<!-- <div class="information-box round"></div> -->
			</table>
			</div>
		</form>
		
	</div> <!-- end content -->
	
	
	<div style="padding-bottom: 80px"></div>	
	
	<!-- FOOTER -->
	<div id="footer" class="footer-div">

		<p><label class="forget-class">&copy; Copyright 2012</label> <a href="#"><label class="forget-class">Tata Consultancy Services</label></a><label class="forget-class">. All rights reserved.</label></p>		
	
	</div> <!-- end footer -->

</body>
</html>