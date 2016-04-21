<%@page import="com.tcs.bean.Login"%>
<%@page import="com.tcs.bean.openLinkBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Unified Communicator</title>
<style>
input[type="text"]{
	width:200px;
}
</style>
<!-- <script>
function validate()
{
	var a=googleIdFunc();
	var b=FacebookIdFunc();
	var c=YahooIdFunc();
	var d=TwitterIdFunc();
	return a && b && c && d;
	
	}
function googleIdFunc()
{
	var name=document.getElementById("linkgoogle").value;
	
	if (name==null || name=="")
	{
		document.getElementById("googleId-error").innerHTML="Please enter google id";
		return false;
	}
	
	else
	{
		document.getElementById("googleId-error").innerHTML="";
		return true;
	}
}

function FacebookIdFunc()
{
	var name=document.getElementById("linkfacebook").value;
	
	if (name==null || name=="")
	{
		document.getElementById("facebookId-error").innerHTML="Please enter facebook id";
		return false;
	}
	
	else
	{
		document.getElementById("facebookId-error").innerHTML="";
		return true;
	}
}

function YahooIdFunc()
{
	var name=document.getElementById("linkyahoo").value;
	
	if (name==null || name=="")
	{
		document.getElementById("yahooId-error").innerHTML="Please enter yahoo id";
		return false;
	}
	
	else
	{
		document.getElementById("yahooId-error").innerHTML="";
		return true;
	}
}


function TwitterIdFunc()
{
	var name=document.getElementById("linktwitter").value;
	
	if (name==null || name=="")
	{
		document.getElementById("twitterId-error").innerHTML="Please enter twitter id";
		return false;
	}
	
	else
	{
		document.getElementById("twitterId-error").innerHTML="";
		return true;
	}
}
</script> -->
</head>
<body style="background: #eee">
<div align="center"><h2>Other Account Details</h2></div>
<%openLinkBean accounts=(openLinkBean)request.getAttribute("openLinkBean");%>
<form id="otherAccountForm" method="get" action="<%=request.getContextPath()%>/openLinkServlet">
<table align="center">
<tr>
	<td>SipUri:</td>
	<td><input type="hidden" id="linksipuri" name="linksipuri" value="<%=accounts.getSipuri()%>"/>
	<div class="round full-width-input"><%=accounts.getSipuri()%></div></td>
</tr>
<tr>
	<td>Google id:</td>
	<%if(accounts.getGoogleid()==null) {%>
	<td><input type="text" id="linkgoogle" name="linkgoogle" class="round full-width-input" value=""/></td>	
	<%}else{%>
	<td><input type="text" id="linkgoogle" name="linkgoogle" class="round full-width-input" value="<%=accounts.getGoogleid()%>"/></td>
	<%}%>
	<td><span class="red-field" id="googleId-error"></span></td>	
</tr>
<tr>
	<td>Facebook id:</td>
	<%if(accounts.getFacebookid()==null) {%>
	<td><input type="text" id="linkfacebook" name="linkfacebook" class="round full-width-input" value=""/></td>
	<%}else{%>
	<td><input type="text" id="linkfacebook" name="linkfacebook" class="round full-width-input" value="<%=accounts.getFacebookid()%>"/></td>
	<%}%>
	<td><span class="red-field" id="facebookId-error"></span></td>	
</tr>
<tr>
	<td>Yahoo id:</td>
	<%if(accounts.getYahooid()==null) {%>
		<td><input type="text" id="linkyahoo" name="linkyahoo" class="round full-width-input" value=""/></td>
	<%}else{%>
	<td><input type="text" id="linkyahoo" name="linkyahoo" class="round full-width-input" value="<%=accounts.getYahooid()%>"/></td>
	<%}%>
	<td><span class="red-field" id="yahooId-error"></span></td>	
</tr>
<tr style="display:none;">
	<td>Twitter id</td>
	<td><input type="text" id="linktwitter" name="linktwitter" class="round full-width-input" value="<%=accounts.getTwitterid()%>"/></td>
	<td><span class="red-field" id="twitterId-error"></span></td>	
</tr>
<tr>
	<td colspan="3" align="center">
	<input type="submit" name="submit" value="Submit" style="width:67px">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" name="reset" value="Reset" onClick="window.location.reload();" style="width:67px"></td>
</tr>
<%if(request.getAttribute("msg")!=null){ %>
<tr>
	<td colspan="2"><label><%=request.getAttribute("msg")%></label></td>	
</tr>
<%} %>
</table>
<input type="hidden" id="fromPage" name="fromPage" value="OpenLink">
</form>
</body>
</html>
