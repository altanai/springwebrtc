<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
	</head>
	<body>
		<h2>Add Geolocation Data</h2>
		<form:form method="POST" action="/sdnext/savegeolocation.html">
	   		<table>
			    <tr>
			        <td><form:label path="sipuri">Sip Uri:</form:label></td>
			        <td><form:input path="sipuri" value="${geolocation.sipuri}" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="latitude">Latitude:</form:label></td>
			        <td><form:input path="latitude" value="${geolocation.latitude}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="longitude">Longitude:</form:label></td>
			        <td><form:input path="longitude" value="${geolocation.longitude}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="date">Date:</form:label></td>
			        <td><form:input path="date" value="${geolocation.date}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="time">Time:</form:label></td>
                    <td><form:input path="time" value="${geolocation.time}"/></td>
			    </tr> 
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>
		
<%--   <c:if test="${!empty geolocations}">
		<h2>List Geolocations</h2>
	<table align="left" border="1">
		<tr>
			<th>Sip Uri</th>
			<th>Latitude</th>
			<th>Longitude</th>
			<th>Date</th>
			<th>Time</th>
			<th>Actions on Row</th>
		</tr>

		<c:forEach items="${geolocations}" var="geolocation">
			<tr>				
				<td><c:out value="${geolocation.sipuri}"/></td>
				<td><c:out value="${geolocation.latitude}"/></td>
				<td><c:out value="${geolocation.longitude}"/></td>
				<td><c:out value="${geolocation.date}"/></td>
				<td><c:out value="${geolocation.time}"/></td> 
				
				<td align="center"><a href="editgeolocation.html?id=${geolocation.sipuri}">Edit</a> | <a href="deletegeolocation.html?id=${geolocation.sipuri}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if> --%>
	</body>
</html>