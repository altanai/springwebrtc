<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout of WebRTC communication client</title>
<script>
function close_window() {
		alert("You have successfully logged out of Unified Communicator!");
	 	window.open('','_self','');
	    window.close();
	  
	}
</script>
</head>
<body onload="close_window();" style="background-color: black;">
<div>
	<h2 style="text-align: center;margin-top:20%;">
		<font style="color: white;">You have successfully logged out of Unified Communicator!</font>
	</h2>
</div>
</body>
</html>