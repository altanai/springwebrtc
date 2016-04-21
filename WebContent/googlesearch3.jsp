<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="css/style_blue.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Google search updates</title>
</head>
<body onLoad="javascript:document.goog.submit()" bgcolor="#E6E6FA">

<!-- Google CSE Search Box Begins  -->
<!-- Use of this code assumes agreement with the Google Custom Search Terms of Service. -->
<!-- The terms of service are available at https://www.google.com/cse/docs/tos.html -->

<form name="goog" id="cref" action="http://www.google.com/cse">
  <input type="hidden" name="cref" value="http://www.guha.com/cref_cse.xml" />
  <input type="text" name="q" size="40" value="<%=request.getParameter("sub") %>" />
  <input type="submit" name="sa" value="Search" />
</form>

<script type="text/javascript" src="'/cse'/brand'?form='cref" ></script>
<!-- Google CSE Search Box Ends -->
</body>
</html>