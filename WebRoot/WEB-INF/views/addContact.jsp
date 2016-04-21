<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phone book </title>
</head>
<body>
		<h2>Add Opensipuri Data</h2>
		<form:form method="POST" action="/sdnext/savecontact.html">
	   		<table>
			    <tr>
			        <td style="font-size:15px;"><form:label path="sipuri">Sipuri :</form:label></td>
			        <td style="font-size:15px;"><form:input path="sipuri" value="${contact.sipuri}" /></td>
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:hidden path="friend" />
			       <td style="font-size:15px;"><form:input type="hidden" path="friend" value="${contact.friend}" /></td> 
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="friend">Friend :</form:label></td>
			        <td style="font-size:15px;"><form:input path="friend" value=""/></td>
			    </tr>
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>
		
		
		<c:if test="${!empty contacts}">
		
		
		<h2>List Contacts</h2>
	<table align="left" border="1">
		<tr>
			<th>Sip Uri</th>
			<th>Friend</th>
		</tr>

		<c:forEach items="${contacts}" var="contact">
		<c:set var="friendlist" value="${fn:split(contact.friend, ',')}" />
		
            <c:forEach var="friend" items="${friendlist}"> 
			<tr>
				<td><c:out value="${contact.sipuri}"/></td>				
				<td><c:out value="${friend}"/></td>
				
				<%-- <td align="center"><a href="edit.html?id=${contact.sipuri}">Edit</a> | <a href="delete.html?id=${contact.sipuri}">Delete</a></td> --%>
			</tr>
			</c:forEach>
			
		</c:forEach>
	</table>
</c:if>

</body>
</html>