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
							    url: "http://localhost:8080/sdnext/addopenidajax.html",  
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
			        <td>Sipuri :</td>
			        <td><input type="text" name="sipuri" id="sipuri" value="" /></td>
			    </tr>
			    <tr>
			        <td>Google :</td>
			        <td><input type="text" name="google" id="google"  value=""/></td>
			    </tr>
			    <tr>
			        <td>Facebook :</td>
			        <td><input type="text" name="facebook" id="facebook"  value=""/></td>
			    </tr>
			    <tr>
			        <td>yahoo :</td>
			        <td><input type="text" name="yahoo" id="yahoo"  value=""/></td>
			    </tr>
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
			      <td><input type="button" value="Add Users" onclick="doAjaxPostOpenid()"></td>
		      </tr>
			</table> 
			 <div id="info" style="color: green;"></div>
		</form:form>
	

	</body>
</html>