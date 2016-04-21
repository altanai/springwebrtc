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


<script>
function close_window() {
		alert("You have successfully logged out of Unified Communicator!");
	 	window.open('','_self','');
	    window.close();
	  
	}
</script>

</head>
	<%
	UserdetailBean login= new UserdetailBean(); 
	%>
	<%if(session.getAttribute("data")!=null && !((UserdetailBean)session.getAttribute("data")).getPrivateIdentity().equalsIgnoreCase("")){
		login= (UserdetailBean)session.getAttribute("data");
	}
	%>
	
	<body onload="close_window();" style="background-color: black;">
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
			
		<p><img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>">&nbsp;&nbsp;Unified Communicator</p>
	</div>
	
		<br/>
		<br/>
		<div>
	<h2 style="text-align: center;margin-top:20%;">
		<font style="color: white;">You have successfully logged out of Unified Communicator!</font>
	</h2>
</div>
		<%-- 		<form:form method="GET" action="/sdnext/dologinvalidate.html">
		<div class="header">
			<!-- <a href="Registration.jsp">Register</a> -->
		<p><img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>">&nbsp;&nbsp;Unified Communicator</p>
	</div>
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
		</form:form> --%>
		
		<c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>

<div id="errordiv" style="color: red; font-size: 13px; margin-left: 35%;">${errorDetails.errorMsg}</div>
</body>

</html>