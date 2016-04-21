<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
function validate()
{	
	var a=display();
	var b=publicIdentityFunction();
	var c=privateIdentityFunction();
	var d=passwordFunction();
	var e=realmFunction();
	var f=imageUploadFunction();
	var g=answerFunction();
	return a && b && c && d && e &&  f && g;
}
	
function display()
{
	var name=document.getElementById("displayName").value;
	
	if (name==null || name=="")
	{
		document.getElementById("displayName-error").innerHTML="Please enter display name";
		return false;
	}
	else
	{
		document.getElementById("displayName-error").innerHTML="";
		return true;
	}
	
}
function publicIdentityFunction()
{
	var name=document.getElementById("publicIdentity").value;
	
	if (name==null || name=="")
	{
		document.getElementById("publicIdentity-error").innerHTML="Please enter public identity";
		return false;
	}
	else
	{
		document.getElementById("publicIdentity-error").innerHTML="";
		return true;
	}
	
}
function privateIdentityFunction()
{
	var name=document.getElementById("privateIdentity").value;
	
	if (name==null || name=="")
	{
		document.getElementById("privateIdentity-error").innerHTML="Please enter private identity";
		return false;
	}
	else
	{
		document.getElementById("privateIdentity-error").innerHTML="";
		return true;
	}
	
}

function passwordFunction()
{
	var name=document.getElementById("password").value;
	
	if (name==null || name=="")
	{
		document.getElementById("password-error").innerHTML="Please enter password";
		return false;
	}
	else
	{
		document.getElementById("password-error").innerHTML="";
		return true;
	}
	
}



function realmFunction()
{
	 var name=document.getElementById("realm").value;
	
	if (name==null || name=="")
	{
		document.getElementById("realm-error").innerHTML="Please enter realm";
		return false;
	}
	
	else
	{
		document.getElementById("realm-error").innerHTML="";
		return true;
	} 
	return false;
	
}
/* function secretQuestionFunction()
{
	var choice="";
	var count;
	var length=document.login-form.secretQuestion.length;
	for(count=0;count<length;count++)
	{

		if(document.login-form.secretQuestion[count].checked)
		{
			choice=document.login-form.secretQuestion[count].value;
			break;
		}
	}
	if(choice=="")
	{
		document.getElementById("secretQuestion-error").innerHTML="Not selected";
		return false;
	}
	else
	{
		
		document.getElementById("secretQuestion-error").innerHTML="";
		return true;
	}	 
	
} */



function answerFunction()
{
	var name=document.getElementById("secretAnswer").value;
	
	if (name==null || name=="")
	{
		document.getElementById("secretAnswer-error").innerHTML="Please enter secret answer";
		return false;
	}
	else
	{
		document.getElementById("secretAnswer-error").innerHTML="";
		return true;
	}
	
}

function imageUploadFunction()
{	var name=document.getElementById("userPic").value;

if (name==null || name=="")
{
	document.getElementById("uploadImage-error").innerHTML="Please upload image";
	return false;
}
else
{
	document.getElementById("uploadImage-error").innerHTML="";
	return true;
}

}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
<link rel="stylesheet" href="login.css">

<!-- Optimize for mobile devices -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body style="background-image:/DhirendraNath/WebContent/images/Background-5.jpg ">

	<!-- TOP BAR -->
	<div id="top-bar">
		<!-- <div class="page-full-width" align="right">
			<a href="#" class="round button dark ic-left-arrow image-left ">Register
				&nbsp; &nbsp;</a>
		</div> -->
	</div>
	<!-- end top-bar -->

			<div class="header-register">
			<a href="Registration.jsp" style="visibility: hidden;">Register</a>
		<p>	<img src="images/images.jpg">&nbsp;WebRTC</p><%-- <a href="<%=request.getContextPath() %>/Controller?action=logout"><font color="#ffffff">Logout</font></a> --%>
		
	</div> 
	 <div style="padding-bottom: 100px"></div> 

	<!-- MAIN CONTENT -->
	<div id="content">

		<form id="createUserProfile" method="post" action="<%=request.getContextPath()%>/CreateUserServlet1" enctype="multipart/form-data">
		<div id="register-heading" class="register-heading-class"><b>Registration Page</b></div>
		<div id="register-content" class="register-class">
			<table>
				<tr>
					<td><label class="forget-class">Display Name</label> </td>
					<td><input type="text" id="displayName" name="displayName" class="round full-width-input" onblur="display();"/></td>
					<td><span class="red-field" id="displayName-error"></span></td>
				</tr>
				<tr>
					<td><label class="forget-class">Public Identity</label></td>
					<td><input type="text" id="publicIdentity" name="publicIdentity" class="round full-width-input"/></td>
					<td><span class="red-field" id="publicIdentity-error"></span></td>
				</tr>
				<tr>
					<td><label class="forget-class">Private Identity</label></td> 
					<td><input type="text" id="privateIdentity" name="privateIdentity" class="round full-width-input"/></td>
					<td><span class="red-field" id="privateIdentity-error"></span></td>
				</tr>
				<tr>
					<td><label class="forget-class">Password</label></td>
					 <td><input type="password" id="password" name="password" class="round full-width-input"/></td>
					 <td><span class="red-field" id="password-error"></span></td>
				</tr>
				<tr>
					<td><label class="forget-class">Realm</label></td> 
					<td><input type="text" id="realm" name="realm" class="round full-width-input"/></td>
					<td><span class="red-field" id="realm-error"></span></td>
				</tr>
				<tr>
					<td><label class="forget-class">Secret Question</label></td> 
					<td><select id="secretQuestion" name="secretQuestion" class="round full-width-input">
					<option>What is your mother's maiden name?</option>
					<option>Which is your favourite book?</option>
					<option>Who is your favourite singer?</option>
					<option>What is the name of the place where you were born?</option>
					</select></td>  
					<td><span class="red-field" id="secretQuestion-error"></span></td>
				</tr>
				<tr>
					<td><label class="forget-class">Secret Answer</label></td>  
					<td><input type="text" id="secretAnswer" name="secretAnswer" class="round full-width-input"/></td> 
					<td><span class="red-field" id="secretAnswer-error"></span></td>
				</tr>
				<tr>
					<td><label class="forget-class">Upload Image</label></td> 
					<td><input type="file" name="userPic" id="userPic" class="round full-width-input"/></td>
					<td><span class="red-field" id="uploadImage-error"></span></td>
				</tr>
				
				<tr>
				<td><input type="reset" name="reset" value="Reset" onClick="window.location.reload();"  class="reset-button" style="width:60%; margin-left:5%"></td>
				<td><input type="submit" name="submit" value="Submit" class="submit-button" style="width:17%; margin-left:35%" onclick="return validate();"></td>
				</tr>
				
		</table>
				</div>
		
			<!-- <div class="information-box round"></div> -->
		</form>

	</div>
	<!-- end content -->

	<div style="padding-bottom: 80px"></div>

	<!-- FOOTER -->
	<div id="footer" class="footer-div">

		<p><label class="forget-class">&copy; Copyright 2012</label> <a href="#"><label class="forget-class">Tata Consultancy Services</label></a><label class="forget-class">. All rights reserved.</label></p>

	</div>
	<!-- end footer -->

</body>
</html>