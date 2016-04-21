<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link href="<c:url value="resources/metroui/css/login.css"/>" rel="stylesheet"  />
	<style>
  .error {
color: #ff0000;
font-style: italic;
     }
</style>
	<%-- <script src="<c:url value="resources/js/jquery.js"/>"></script> --%>
<%-- <script type="text/javascript">
	        var contexPath = "<%=request.getContextPath() %>";
</script>
<script src="<c:url value="/js/user.js"/>"></script> --%>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<%-- <script src="<c:url value="resources/metroui/scripts/jquery-1.6.1.min.js"/>" type="text/javascript"></script>
		
		<script src="<c:url value="resources/metroui/scripts/jquery-ui-1.10.3.custom.js"/>"></script>
			<script src="<c:url value="resources/js/jquery.js"/>"></script>
		
		<link type="text/css" href="<c:url value="resources/metroui/css/start/jquery-ui-1.10.3.custom.css"/>" rel="stylesheet" />

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" type="text/css" media="screen" rel="stylesheet"/> --%>
	 <!-- <script type="text/javascript">
		function doAjaxPostDetails() {  
			  // get the form values  
			  var privateIdentity = $('#privateIdentity').val();
			  var displayName = $('#displayName').val();
			  var publicIdentity= $('#publicIdentity').val();
			  var password= $('#password').val();
			  var realm= $('#realm').val();
			  var secretQuestion= $('#secretQuestion').val();
			  var secretAnswer= $('#secretAnswer').val();
			  
			  alert("name="+displayName+"privateIdentity="+privateIdentity+"publicIdentity"+publicIdentity+"realm"+realm+"password"+password+"secretQuestion"+secretQuestion+"secretAnswer"+secretAnswer)
			   
			  $.ajax({  
			    type: "POST",  
			    url:  "/sdnext/saveuserdetail.html",  
			    data: "privateIdentity=" + privateIdentity + "&displayName=" + displayName+"&publicIdentity="+publicIdentity+"&realm="+realm+"&password="+password+"&secretQuestion="+secretQuestion+"&secretAnswer="+secretAnswer,  
			    success: function(response){
			      // we have the response 
			      if(response.status == "SUCCESS"){
			    	  userInfo = "<ol>";
			    	  for(i =0 ; i < response.result.length ; i++){
			    		  userInfo += "<br><li><b>Name</b> : " + response.result[i].privateIdentity + 
			    		  ";<b> Education</b> : " + response.result[i].displayName;
			    	  }
			    	  userInfo += "</ol>";
			    	  $('#info').html("User has been added to the list successfully. " + userInfo);
			    	  $('#privateIdentity').val('');
				      $('#displayName').val('');
				      $('#error').hide('slow');
				      $('#info').show('slow');
			      }else{
			    	  errorInfo = "";
			    	  for(i =0 ; i < response.result.length ; i++){
			    		  errorInfo += "<br>" + (i + 1) +". " + response.result[i].code;
			    	  }
			    	  $('#error').html("Please correct following errors: " + errorInfo);
			    	  $('#info').hide('slow');
			    	  $('#error').show('slow');
			      }	      
			    },  
			    error: function(e){  
			      alert('Error: ' + e);  
			    }  
			  });  
			}
		
		</script>  -->
		<title>Spring MVC Form Handling</title>
	</head>
	<body>
	
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
			<a href="login.html">Login</a>
		<p><img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>">&nbsp;&nbsp;Unified Communicator</p>
	</div>
		<h1 align="center"> Registration</h1>
 <form:form method="POST" action="/sdnext/saveuserdetail.html">  
		
<%--  <form:form method="POST" commandName="userdetail">  --%>
	   		<table align="center">
	   		
			    <tr>
			        <td style="font-size:15px;"><form:label path="privateIdentity">Sipuri :</form:label></td>
			        <td style="font-size:15px;"><form:input path="privateIdentity" value="${userdetail.privateIdentity}" /></td>
			        <td style="font-size:15px;"><form:errors path="privateIdentity" cssClass="error" /></td>
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="displayName">Name  :</form:label></td>
			        <td style="font-size:15px;"><form:input path="displayName" value="${userdetail.displayName}"/></td>
			        <td style="font-size:15px;"><form:errors path="displayName" cssClass="error" /></td>
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="publicIdentity">Public identity :</form:label></td>
			        <td style="font-size:15px;"><form:input path="publicIdentity" value="${userdetail.publicIdentity}"/></td>
			        <td style="font-size:15px;"><form:errors path="publicIdentity" cssClass="error" /></td>
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="password">password :</form:label></td>
			        <td style="font-size:15px;"><form:input path="password" value="${userdetail.password}"/></td>
			        <td style="font-size:15px;"><form:errors path="password" cssClass="error" /></td>
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="realm">realm :</form:label></td>
			        <td style="font-size:15px;"><form:input path="realm" value="${userdetail.realm}"/></td>
			        <td style="font-size:15px;"><form:errors path="realm" cssClass="error" /></td>
			        
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="secretQuestion">secretQuestion :</form:label></td>
			        <td style="font-size:15px;"><form:input path="secretQuestion" value="${userdetail.secretQuestion}"/></td>
			        <td style="font-size:15px;"><form:errors path="secretQuestion" cssClass="error" /></td>
			    </tr>
			    <tr>
			        <td style="font-size:15px;"><form:label path="secretAnswer">secretAnswer :</form:label></td>
			        <td style="font-size:15px;"><form:input path="secretAnswer" value="${userdetail.secretAnswer}"/></td>
			        <td style="font-size:15px;"><form:errors path="secretAnswer" cssClass="error" /></td>
			    </tr>
			    <tr>
			      <td ><input type="submit" value="Submit"/></td>
			      <td ><input type="reset" value="Reset"/></td>
		      </tr>
		      <!-- <tr><td colspan="2"><input type="button" value="Add Users" onclick="doAjaxPostDetails()"><br/></td></tr>
			<tr><td colspan="2"><div id="info"   style="color: green;" ></div></td></tr> -->
			
			</table> 
		</form:form>
		
<%--   <c:if test="${!empty userdetails}">
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
</c:if> --%>


	</body>
</html>