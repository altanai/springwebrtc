<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>Add Opensipuri Data</h2>
		<form:form method="POST" action="/sdnext/selfsaveopenid.html">
	   		<table>
			    <tr>
			        <td><form:label path="sipuri">Sipuri :</form:label></td>
			        <td><form:input path="sipuri" value="${openid.sipuri}" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="google">Google :</form:label></td>
			        <td><form:input path="google" value="${openid.google}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="facebook">Facebook :</form:label></td>
			        <td><form:input path="facebook" value="${openid.facebook}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="yahoo">yahoo :</form:label></td>
			        <td><form:input path="yahoo" value="${openid.yahoo}"/></td>
			    </tr>
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>

</body>
</html>