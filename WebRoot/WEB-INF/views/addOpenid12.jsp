<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
		<script src="<c:url value="resources/ajax/jquery.js"/>"></script>
		<script type="text/javascript">
						function doAjaxPostOpenid() {  

							  var sipuri = $('#sipuri').val();
							  var facebook = $('#facebook').val();
							  var google = $('#google').val();
							  var yahoo = $('#yahoo').val();

							  alert( sipuri+ " "+ facebook +" "+ google+ " "+ yahoo);
							  
							  $.ajax({  
							    type: "POST",  
							    url: "/sdnext/addopenidajax.html",  
							    data: "sipuri=" + sipuri + "&facebook=" + facebook + 
							    	  "&google=" + google + "&yahoo=" + yahoo,  
	 
							    success: function(response){  
							      // we have the response  
							      $('#info').html(response);
							   		
							      	 $('#sipuri').val('');
							    	 $('#facebook').val('');
									 $('#google').val('');
							    	 $('#yahoo').val('');
							  
							    },  
							    error: function(e){  
							      alert('Error: ' + e);  
							    }  
							  });  
							}  
						</script>
	</head>
	<body>
		<h2>Add Opensipuri Data</h2>
		<form:form method="POST" action="/sdnext/saveopenid.html">
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
			 <td><input type="button" value="Add Users" onclick="doAjaxPostOpenid()"></td>
		      </tr>
			</table> 
			 <div id="info" style="color: green;"></div>
		</form:form>
		
<%--   <c:if test="${!empty openids}">
		<h2>List Openid</h2>
	<table align="left" border="1">
		<tr>
			<th>SIP URI</th>
			<th>Google </th>
			<th>Facebook </th>
			<th>Yahoo </th>
			<th>Actions on Row</th>
		</tr>

		<c:forEach items="${openids}" var="openid">
			<tr>
				<td><c:out value="${openid.sipuri}"/></td>
				<td><c:out value="${openid.google}"/></td>
				<td><c:out value="${openid.facebook}"/></td>
				<td><c:out value="${openid.yahoo}"/></td>
				<td align="center"><a href="editopenid.html?sipuri=${openid.sipuri}">Edit</a> | <a href="deleteopenid.html?sipuri=${openid.sipuri}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if> --%>


	</body>
</html>