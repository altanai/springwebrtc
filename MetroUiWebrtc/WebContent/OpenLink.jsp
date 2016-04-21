<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form id="otherAccountForm" method="post" action="<%=request.getContextPath()%>/openLinkServlet">
<table>
<!-- <tr>
	<td>Name</td>
	<td><input type="text" id="linkname" name="linkname" class="round full-width-input"/></td>
</tr> -->

<tr>
	<td>Sipuri</td>
	<td><input type="text" id="linksipuri" name="linksipuri" class="round full-width-input"/></td>
</tr>

<tr>
	<td>Google id</td>
	<td><input type="text" id="linkgoogle" name="linkgoogle" class="round full-width-input"/></td>
</tr>

<tr>
	<td>Facebook id</td>
	<td><input type="text" id="linkfacebook" name="linkfacebook" class="round full-width-input"/></td>
</tr>

<tr>
	<td>Yahoo id</td>
	<td><input type="text" id="linkyahoo" name="linkyahoo" class="round full-width-input"/></td>
</tr>

<tr>
	<td>Twitter id</td>
	<td><input type="text" id="linktwitter" name="linktwitter" class="round full-width-input"/></td>
</tr>

<tr>
				<td><input type="submit" name="submit" value="SUBMIT" class="submit-button" style="width:80%"></td>
				<td><input type="reset" name="reset" value="RESET" onClick="window.location.reload();"  class="reset-button" style="width:80%; margin-left:90px"></td>
</tr>

</table>
</form>
</body>
</html>