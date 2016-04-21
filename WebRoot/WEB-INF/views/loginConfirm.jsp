<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
		
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link href="<c:url value="resources/metroui/css/login.css"/>" rel="stylesheet"  />
	</head>
	<body>
	<div style="padding-bottom: 100px"></div>

	<div id="top-bar">		
		
	</div> <!-- end top-bar -->
		
			<div class="header">
			<a href="adduserdetail.html">Register</a>
		<p><img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>">&nbsp;&nbsp;Unified Communicator</p>
	</div>
	
		<br/>
		<br/>
<!-- MAIN CONTENT -->
	<div class="content">
	<div id="pic-div" class="pic-class"><b>Warning</b></div>
		<form action="LoginController" method="post" id="login-form">
		<form:input path="privateIdentity" value="${userdetail.privateIdentity}" type="hidden" />
		<form:input path="password" value="${userdetail.password}" type="hidden"/>	
		 <div id="login-content" class="login-class">
			<table>
			<tr>
			<td><label class="user-class">You are already logged in from another system. This may be due to abrupt termination of browser or system shutdown.
			Your calls & messages may get dropped for sometime. Do you still want to continue?</label></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="Yes" class="reset-button">
				&nbsp;<input type="submit" name="submit" value="No"  class="submit-button"></td>
			</tr>	
			</table>
			<br/>
			</div>
		</form>
		
	</div> <!-- end content -->

</body>
</html>