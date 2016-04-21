<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="com.tcs.bean.QuestionBean"%>
<%QuestionBean questionBean= new QuestionBean();String sipUri=""; 
			%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Your Password</title>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
<link rel="stylesheet" href="login.css">
<script>
function validation(){
	if(document.getElementById("password").value.match(document.getElementById("confirmpass").value)){
		return true; 
	}
	else{
		document.getElementById('message2').innerHTML="";
		 var _message = document.createTextNode("Password and confirm password do not match");
		    document.getElementById('message2').appendChild(_message); 
		    return false;
	}
}
function validate()
{
	
	var a=pass();
	var b=confirmPass();
	var z=validation();
	return a && b && z;
	
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

function confirmPass()
{
	var name=document.getElementById("confirmpass").value;
	
	if (name==null || name=="")
	{
		document.getElementById("confirmPass-error").innerHTML="Please enter confirm password";
		return false;
	}
	
	else
	{
		document.getElementById("confirmPass-error").innerHTML="";
		return true;
	}
}

</script>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/Controller" onsubmit="return validate();">
 <input type="hidden" name="action" value="passCheck"/> 
<input type="hidden" id="privateIdentity" name="privateIdentity" value="<%=request.getParameter("sipuri")%>">
<table>
<tr>
	<td><label style="font-size: 15px;">Sipuri:</label></td>
	<td><label style="font-size: 15px;"><%=request.getParameter("sipuri")%></label></td>
</tr>
<tr>
	<td><label style="font-size: 15px;">New Password:</label></td>
	<td><input type="password" id="password" name="password"/></td>
	<td><span class="red-field" id="pass-error"></span></td>	
</tr>
<tr>
	<td><label style="font-size: 15px;">Confirm Password:</label></td>
	<td><input type="password" id="confirmpass" name="confirmpass"/></td>
	<td><span class="red-field" id="confirmPass-error"></span></td>	
</tr>
<tr>
	<td><input type="submit" name="passsubmit" value="Submit" style="width:50%;" class="reset-button"/></td>
	<td><input type="reset" name="passreset" value="Reset" style="width:50%;" class="reset-button" onClick="window.location.reload()"/></td>
</tr>
</table>
<div id='message2' style="color: red; font-size: 15px;"></div>
</form>
<%-- <br>
<br>
<br>
<form method="post" action="<%=request.getContextPath()%>/sendPasswordViaMail">
<table>
<tr>
	<td style="font-size: 15px; color:green;">In case you do not want to change password and get your password via mail, click on "Send via mail" button below..</td>
</tr>
<tr>
	<td><input type="submit" name="mailsubmit" value="Send via mail" style="width:20%;" class="reset-button"/></td>
</tr>
</table>
</form> --%>
</body>
</html>