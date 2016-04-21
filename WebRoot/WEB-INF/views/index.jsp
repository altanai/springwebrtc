<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.webrtc.bean.*"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
		
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link href="<c:url value="resources/metroui/css/login.css"/>" rel="stylesheet"  />

<style>
  .error {
color: #ff0000;
font-style: italic;
     }
</style>

<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>

</head>
	
	<body onload='document.f.j_username.focus();'>
	<div style="padding-bottom: 100px"></div>

	<div id="top-bar">		
		
	</div> <!-- end top-bar -->
		
			<div class="header">
			
		<p><img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>">&nbsp;&nbsp; Unified Communicator- Admin Console</p>
	</div>
	
		<br/>
		<br/>

<!--<h4>Spring3MVC with Hibernate3 CRUD Example using Annotations</h4>
    <h4>1. <a href="employees.html">List of Employees</a></h4>
    <h4>2. <a href="add.html">Add Employee</a></h4>
 -->   
 <h1> Admin console </h1>
 <table border="1" style="width:800px;">
 <tr>

 <td>  <h4>Dashobard
  <form action="dashboard.html" type="GET" >
    sipuri : <input type="text" id="sipuri" name="sipuri">
    private Identity : <input type="text" id="privateIdentity" name="privateIdentity">
    <input type="submit" value="Dashboard">
  </form>
</h4>
</td>

  <td>
   <h4>Advertisment 
    <a href="advertisement.html">Advertisement</a></h4></br>
    <h4>1.<a href="addAdvertisement.html">add Advertisement</a></h4>
  </td>
  
   <td>
  <h4>Other account 
  <form action="addopenid.html" type="GET" >
    sipuri : <input type="text" id="sipuri" name="sipuri"></br>
    <input type="submit" value="Other account">
  </form>
 <a href="openid.html"> All openid details  </a></h4>
   </td>
 </tr>

   <!--  <h4>1. <a href="dashboard.html">Empty dashboard</a></h4> 
    <h4>2. <a href="dashboard.html?sipuri=sip:bob@tcs.com&&privateIdentity=sip:bob@tcs.com">Bob dashboard</a></h4>
     <h4>2. <a href="dashboard.html?sipuri=sip:alice@tcs.com&&privateIdentity=sip:alice@tcs.com">Alice dashboard</a></h4>  
   -->  
 
    <tr>
    <td>
        <h4>User detail </h4>
   <form action="adduserdetail.html" type="GET" >
    <input type="text" id="PrivateIdentity" name="PrivateIdentity">
    <input type="submit" value="Dashboard">
  </form>
     <h4>3. <a href="userdetail.html"> All user details  </a></h4>
    <h4>4. <a href="login.html"> Login  </a></h4>
    </td>
    
     <td>
      <h4>Call.htm </h4>
 <form action="call.html" type="GET" >
    <input type="text" id="PrivateIdentity" name="PrivateIdentity"></br>
    <input type="submit" value="Call htm">
  </form>
<!--<h4>1. <a href="call.html?PrivateIdentity=sip:bob@tcs.com">bob call.htm </a></h4>
   <h4>2. <a href="call.html?PrivateIdentity=sip:alice@tcs.com">alice call.htm </a></h4>
  <h4>3. <a href="call.html?PrivateIdentity=sip:altanai@sip2sip.info">altanai sip2sip.info call.htm </a></h4>
  <h4>4. <a href="call.html?PrivateIdentity=sip:altanaibisht@sip2sip.info">altanaibisht sip2sip.info call.htm </a></h4>
  -->
    </td>
    
    <td>
    <h4>Geolocation </h4>
  <form action="addgeolocation.html" type="GET" >
  sipuri :  <input type="text" id="sipuri" name="sipuri">
    <input type="submit" value="Geolocation">
  </form>
  <h4>1.<a href="geolocationtogether.html"> Map </a></h4>
    </td>
    </tr>
    
  <tr>
  
  <td>
  <h4>Contacts</h4>
  <h4>1. <a href="addcontact.html?sipuri=sip:bob@tcs.com">Add Contact </a></h4>
  </td>
  
  <td>
    
  <h4>Presence</h4>
   <form action="addpresence.html" type="GET" >
    <input type="text" id="sipuri" name="sipuri"></br>
    <input type="submit" value="presence"></br>
  </form>
  <h4>2. <a href="addpresence.html">Add Presence </a></h4>
  </td>
  
  <td>
  </td>
  </tr>  


  
  <tr>
  <td>
  <h4>Conference
 <form action="conferencing12.html" type="GET" >
  sipuri :  <input type="text" id="sipuri" name="sipuri"></br>
    <input type="submit" value="Conference ">
  </form>
</h4>
  </td>
  
    <td>
     <h4>Call Logs</h4>
   <form action="addcalllog.html" type="GET" >
    caller :<input type="text" id="caller" name="caller"></br>
    callee :<input type="text" id="callee" name="callee"></br>
    date :<input type="text" id="date" name="date"></br>
    <input type="submit" value="Call logs">
  </form>
  </td>
  
    <td>
        <h4>Message Logs</h4>
   <form action="addmessagelogs.html" type="GET" >
    <input type="text" id="sipuri" name="sipuri"></br>
    <input type="submit" value="Message logs">
  </form> 
  </td>
  </tr>
  
  
   </table>


</body>

</html>