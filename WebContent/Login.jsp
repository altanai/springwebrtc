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
 function clear(){

	document.getElementById("userName").value="";
    document.getElementById("password").value="";
    document.getElementById("errordiv").innerHTML="";
    document.getElementById("user-error").value="";
    document.getElementById("pass-error").value="";
} 

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="login.css">
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
            $(document).ready(function() {
                $('#login-form').submit(function() {
                    $('#progress').show();
                });
            });
     </script>
     <style>
            #progress { 
                display: none;
                color: green; 
            }
     </style> 
<style type="text/css">
  html, body { margin: 0; padding:0;}
  #signin-button {
   padding: 5px;
  }
  #oauth2-results pre { margin: 0; padding:0; width: 600px;}
  .hide { display: none;}
  .show { display: block;}
</style>

<script src="https://apis.google.com/js/client:platform.js" type="text/javascript"></script>
<script type="text/javascript">
	var loginFinished = function(authResult)
	{
	  if (authResult)
	  {
	    console.log(authResult);
	  }
	
	  gapi.client.load('oauth2', 'v2', function()
	  {
	    gapi.client.oauth2.userinfo.get()
	      .execute(function(resp)
	      {
	        // Shows user email
	        console.log(resp.email);
	        window.location = "googlelogin?userName="+resp.email;
	      });
	  });

	};

	var options = {
	  'callback': loginFinished,
	  'approvalprompt': 'force',
	  'clientid': '987957478561-su09b73pof5qod6qe15f4f45dj729gr8.apps.googleusercontent.com',
	  'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email',
	  'requestvisibleactions': 'http://schemas.google.com/CommentActivity http://schemas.google.com/ReviewActivity',
	  'cookiepolicy': 'single_host_origin'
	};
	
	var renderBtn = function()
	{
	  gapi.signin.render('renderMe', options);
	}
</script>
<script type="text/javascript">
       window.history.forward();
       function noBack() { window.history.forward(); }
</script>          
</head>
<body style="background-image:/DhirendraNath/WebContent/images/Background-5.jpg " onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<!-- <body style="background-image:/DhirendraNath/WebContent/images/Background-5.jpg "> -->
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
		<p><img src="images/TCSLogo.jpg">&nbsp;&nbsp;Unified Communicator</p>
	</div> 
	
	<!-- MAIN CONTENT -->
	<div id="progress"><h1>Please wait while we redirect you to the home page...</h1></div>
	<div class="content">
	<div id="pic-div" class="pic-class"><b>Login Page</b></div>
		<form action="LoginController" method="post" id="login-form">	
		 <input type="hidden" name="action" value="login"> 
		
		 <div id="login-content" class="login-class">
			<table>
			<tr>
					<td><label class="user-class">Username</label></td>
					<td><input type="text" name="userName" id="userName" placeholder="eg- name@tcs.com"/></td>
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
				<td><input type="submit" name="submit" value="Login as User" class="reset-button" onclick="return validate();"></td>
				<td><input type="submit" name="submit" value="Login as Admin"  class="submit-button" onclick="return validate();"></td> 
			</tr>	
			</table>
			<br/>
			
				<!-- -----Sign in using fb 
			
	            <br/> 
			     <div id="renderMe"></div>  -->
			
				<!-- end signin --> 
				<%-- <td>
								onClick="window.location.reload()" 
			    	 <!-- -----Sign in using google mid part -->
			     <%@ include file="google/oauthgooglemid.jsp" %> 
				<!-- end signin --> 
			</td> --%>
			</tr>
			<!-- <div class="information-box round"></div> -->
			
			</div>
		</form>
		
	</div> <!-- end content -->
	<div id="errordiv" style="color: red; font-size: 14px; margin-left: 35%;"><%if(request.getAttribute("error")!=null) {%><%=request.getAttribute("error").toString()%><%} %></div>
	<%if(request.getAttribute("message")!=null && request.getAttribute("message").toString()!=""){%>
		<label id="message" style="color: green; font-size: 14px; margin-left: 35%;" class="message-class"><%=request.getAttribute("message")%></label>
	<%} %>
	
	<div style="padding-bottom: 80px"></div>	
	
	<!-- FOOTER -->
	<div id="footer" class="footer-div">

		<p><label class="forget-class">&copy; Copyright 2014</label> <a href="#"><label class="forget-class">Tata Consultancy Services</label></a><label class="forget-class">. All rights reserved.</label></p>		
	
	</div> <!-- end footer -->

</body>
</html>