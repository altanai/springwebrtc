<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Call Log</title>
		<script src="<c:url value="resources/ajax/jquery.js"/>"></script>
		<script>
		function doAjaxPostCalllog() {  

			  var caller = $('#caller').val();
			  var callee = $('#callee').val();
			  var date = $('#date').val();

			  alert( " calllog ajax method called "+ caller + " " +callee +" "+ date);
			  $.ajax({  
			    type: "POST",  
			    url: "/sdnext/addcalllogajax.html",  
			    data:  "caller=" + caller + "&callee=" + callee + 
			    	  "&date=" + date ,

			    success: function(response){  
			      // we have the response  
			      $('#infocalllog').html(response);
			  
			    },  
			    error: function(e){  
			      alert('Error: ' + e);  
			    }  
			  });  
			}  
		</script>
	</head>
	<body>
		<h2>Add Call Log Data</h2>
		<form:form method="POST" action="/sdnext/savecalllog.html">
	   		<table>
			    <tr>
			        <td><form:label path="id">Call ID:</form:label></td>
			        <td><form:input path="id" value="${calllog.id}" readonly="true"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="caller">Caller Name:</form:label></td>
			        <td><form:input path="caller" value="${calllog.caller}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="callee">Callee Name:</form:label></td>
			        <td><form:input path="callee" value="${calllog.callee}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="date">Call Date:</form:label></td>
			        <td><form:input path="date" value="${calllog.date}"/></td>
			    </tr>
			    
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      	  <td><input type="button" value="Add CallLog" onclick="doAjaxPostCalllog()"></td>
		      </tr>
			</table> 
		</form:form>
		 <div id="infocalllog" style="color: green;"></div>
		
  <c:if test="${!empty calllogs}">
		<h2>List Call Logs</h2>
	<table align="left" border="1">
		<tr>
			<th>Call ID</th>
			<th>Caller Name</th>
			<th>Callee Name</th>
			<th>Call Date</th>
		</tr>

		<c:forEach items="${calllogs}" var="calllog">
			<tr>
				<td><c:out value="${calllog.id}"/></td>
				<td><c:out value="${calllog.caller}"/></td>
				<td><c:out value="${calllog.callee}"/></td>
				<td><c:out value="${calllog.date}"/></td>
				
			</tr>
		</c:forEach>
	</table>
</c:if>
	</body>
</html>