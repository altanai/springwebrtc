<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script>
	function redirect(){
		if(<%=request.getHeader("Referer")%>== null){

		window.location="http://ec2-54-215-209-44.us-west-1.compute.amazonaws.com:8080/TCSWebRTCSolution_Test/Login.jsp";
		}
	}
</script>
</head>
<body onload="redirect()">
</body>
</html>