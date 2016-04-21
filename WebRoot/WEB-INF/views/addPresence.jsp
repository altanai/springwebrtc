<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Presence</title>
</head>
<body>
		<h2>Add Presence Data</h2>
		<form:form method="POST" action="/sdnext/savepresence.html">
	   		<table>
			    <tr>
			        <td><form:label path="sipuri">Sipuri :</form:label></td>
			        <td><form:input path="sipuri" value="${presence.sipuri}" /></td>
			    </tr>
			   
			    <tr>
			        <td><form:label path="status">Status :</form:label></td>
			        <td><form:input path="status" value="${presence.status}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="loggedin">Loggedin :</form:label></td>
			        <td><form:input path="loggedin" value="${presence.loggedin}"/></td>
			    </tr>
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>
		
		
		<c:if test="${!empty presences}">
		
		
		<h2>List Presences</h2>
	<table align="left" border="1">
		<tr>
			<th>Sip Uri</th>
			<th>Status</th>
			<th>Loggein</th>
		</tr>

		<c:forEach items="${presences}" var="presence">  

			<tr>
				<td><c:out value="${presence.sipuri}"/></td>				
				<td><c:out value="${presence.status}"/></td>
				<td><c:out value="${presence.loggedin}"/></td>
				
				<%-- <td align="center"><a href="edit.html?id=${contact.sipuri}">Edit</a> | <a href="delete.html?id=${contact.sipuri}">Delete</a></td> --%>
			</tr>
			</c:forEach>
			
	</table>
</c:if>

</body>
</html>