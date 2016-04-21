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
		<h2>Add Message Log Data</h2>
		<form:form method="POST" action="/sdnext/save.html">
	   		<table>
			    <tr>
			        <td><form:label path="id">Message ID:</form:label></td>
			        <td><form:input path="id" value="${messagelog.id}" readonly="true"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="name">Sender Name:</form:label></td>
			        <td><form:input path="name" value="${messagelog.sendername}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="age">Receiver Name:</form:label></td>
			        <td><form:input path="age" value="${messagelog.receivername}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="salary">Message Date:</form:label></td>
			        <td><form:input path="salary" value="${messagelog.messagedate}"/></td>
			    </tr>
			    
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>
		
  <c:if test="${!empty messagelogs}">
		<h2>List Message Logs</h2>
	<table align="left" border="1">
		<tr>
			<th>Message ID</th>
			<th>Sender Name</th>
			<th>Receiver Name</th>
			<th>Message Date</th>
		</tr>

		<c:forEach items="${messagelogs}" var="employee">
			<tr>
				<td><c:out value="${messagelog.id}"/></td>
				<td><c:out value="${messagelog.sendername}"/></td>
				<td><c:out value="${messagelog.receivername}"/></td>
				<td><c:out value="${messagelog.messagedate}"/></td>
				
				<td align="center"><a href="edit.html?id=${messagelog.id}">Edit</a> | <a href="delete.html?id=${messagelog.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
	</body>
</html>