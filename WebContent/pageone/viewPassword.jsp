<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="login.webrtc.login"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="login.userlogin.forgotPasswordServlet"%>
<%
	ArrayList<login> list = new ArrayList<login>();
	list = (ArrayList) request.getAttribute("password");
%>
<!DOCTYPE html>
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html>
<!--<![endif]-->

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="description" content="">
<meta name="author" content="">

<title>WebRTC client</title>

<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="css/jquery.fancybox-1.3.4.css"
	type="text/css" />

<!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="js/jquery-1.6.1.min.js"><\/script>')
</script>

<script src="js/jquery.smoothscroll.js"></script>
<script src="js/jquery.nivo.slider.pack.js"></script>
<script src="js/jquery.easing-1.3.pack.js"></script>
<script src="js/jquery.fancybox-1.3.4.pack.js"></script>
<script src="js/init.js"></script>

</head>

<body>

<!-- header-wrap -->
<div id="header-wrap">
    <header>
<div><img src="images/tcs_logo.png"</div>
        <nav>
            <ul>
                <li><a href="login.jsp">Goto Login page</a></li>
                <li><a href="#contact">Contact Us</a></li>
            </ul>
        </nav>

    </header>
</div>

<!-- content-wrap -->
<div class="content-wrap">

    <!-- main -->
    <section id="main">
<form>
        <table>
	
		<tr>
			<th><h3>Your Password Is:</h3><br/><br/></th>
			
			<td>&nbsp;&nbsp;&nbsp;<%=request.getParameter("pass")%></td>
		</tr>	
					
		
		<tr>
			<td><a href="login.jsp">Back To Login Page</a></td>
		</tr>
	</table>

</form>
        <div class="row no-bottom-margin">

            <section class="col">
                <h2></h2>
<br/><br/><br/><br/><br/><br/><br/>
                <p> Tata Consultancy Services</p>
            </section>
            <section class="col mid">
                <h2></h2>
<br/><br/><br/><br/><br/><br/><br/>
                <p>Proof of concept Demonstration </p>
            </section>

            <section class="col">
                <h2></h2>
<br/><br/><br/><br/><br/><br/><br/>
                <p>WebRTC platform </p>
            </section>
        </div>

        <a class="back-to-top" href="#main">Back to Top</a>

      </section>

</div>
<br/><br/>
<!-- footer -->
<footer>
    <div class="footer-content">
        <ul class="footer-menu">
            <li><a href="login.jsp">Home</a></li>
            <li><a href="#contact">Contact</a></li>
            <!-- <li class="rss-feed"><a href="#">RSS Feed</a></li> -->
        </ul>

        <p class="footer-text">Tata Consultancy Services &nbsp;&nbsp;&nbsp; Designed by CNS Lab</a></p>
    </div>

</footer>

</body>
</html>
