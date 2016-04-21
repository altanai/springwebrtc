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
	</head>
	<%
	UserdetailBean login= new UserdetailBean(); 
	%>
	<%if(session.getAttribute("data")!=null && !((UserdetailBean)session.getAttribute("data")).getPrivateIdentity().equalsIgnoreCase("")){
		login= (UserdetailBean)session.getAttribute("data");
	}
	%>
	
	<body>
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
			<a href="adduserdetail.html">Register</a>
		<p><img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>">&nbsp;&nbsp;Unified Communicator</p>
	</div>
	
		<br/>
		<br/>
		<h1 align="center">Login </h1>
		<form:form method="GET" action="/sdnext/dologinvalidate.html">
		<%-- <div class="header">
			<!-- <a href="Registration.jsp">Register</a> -->
		<p><img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>">&nbsp;&nbsp;Unified Communicator</p>
	</div> --%>
	   		<table align="center">
			    <tr>
			        <td style="font-size:15px;"><form:label path="privateIdentity">Sipuri :</form:label></td>
			        <td style="font-size:15px;"><form:input path="privateIdentity" value="${userdetail.privateIdentity}" /></td>
			       <td style="font-size:15px;"><form:errors path="privateIdentity" cssClass="error" /></td>
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="password">password :</form:label></td>
			        <td style="font-size:15px;"><form:input path="password" value="${userdetail.password}"/></td>
			        <td style="font-size:15px;"><form:errors path="password" cssClass="error" /></td>
			    </tr>
			
			    <tr>
			      <td colspan="2" align="center"><input type="submit" value="Login"/></td>
		      </tr>
		      
			</table> 
		</form:form>
<div id="errordiv" style="color: red; font-size: 13px; margin-left: 35%;">${errorDetails.errorMsg}</div>
</body>

</html>