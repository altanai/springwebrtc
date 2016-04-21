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
		
   <c:if test="${!empty userdetails}">
		<h2>List Userdetails</h2>
	<table align="left" border="1">
		<tr>
			<th>private identity</th>
			<th>display name </th>
			<th>public identity </th>
			<th>password </th>
			<th>realm </th>
			<th>secret question </th>
			<th>secret answer  </th>
			<th>Actions on Row</th>
		</tr>

		<c:forEach items="${userdetails}" var="userdetail">
			<tr>
				<td><c:out value="${userdetail.privateIdentity}"/></td>
				<td><c:out value="${userdetail.displayName}"/></td>
				<td><c:out value="${userdetail.publicIdentity}"/></td>
				<td><c:out value="${userdetail.password}"/></td>
				<td><c:out value="${userdetail.realm}"/></td>
				<td><c:out value="${userdetail.secretQuestion}"/></td>
				<td><c:out value="${userdetail.secretAnswer}"/></td>
				<td align="center"><a href="edituserdetail.html?privateIdentity=${userdetail.privateIdentity}">Edit</a> | <a href="deleteuserdetail.html?privateIdentity=${userdetail.privateIdentity}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if> 


	</body>
</html>