<!DOCTYPE html>
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html> <!--<![endif]-->

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WebRTC client </title>

    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery.fancybox-1.3.4.css" type="text/css" />

    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.6.1.min.js"><\/script>')</script>

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
                <li><a href="#main">Call Console</a></li>
                <li><a href="#services">Applications</a></li>
                <li><a href="#portfolio">Technologies</a></li>
                <li><a href="#about-us">phone Book</a></li>
                <li><a href="#styles">Styles</a></li>
                <li><a href="#contact">Contact Us</a></li>
            </ul>
        </nav>

    </header>
</div>

<!-- content-wrap -->
<div class="content-wrap">

    <!-- main -->
    <section id="main">

        <table><tr><td>
<h3>Registered Successfully</h3>
</td></tr>
<tr>
			<td><a href="login.html">Back To Login Page</a></td>
		</tr>
</table>

<form enctype="multipart/form-data" method="POST" name="createUserform" action="<%=request.getContextPath()%>/CreateUserServlet">
<table id="AddCustTable" align="center">

					<tr>
						<td>Name:</td>
						<td><input id="Name" type="text" name="name" title="Name should contain only alphabets and whitespaces." maxlength="40"/></td>
						<td id="NameError" style="color: red;"></td>
					</tr>
					<tr>
						<td style="vertical-align: top;">Address:</td>
						<td><textarea id="Address" name="address" cols="30" rows="5" title="Address should be of maximum 200 characters."></textarea></td>
						<td id="AddressError" style="color: red;vertical-align: top;"></td>
					</tr>
					<tr>
						<td>Contact Number:</td>
						<td><input id="Contact" type="text" name="contact" title="Contact number should contain only digits." maxlength="15"/></td>
						<td id="ContactError" style="color: red;"></td>
					</tr>
					<tr>
						<td>Profile-Pic:</td>
						<td><input style="padding: 2px 0px 2px 0px;" id="File" type="file" name="picture" title="The document should be a .jpg file."/></td>
						<td id="FileError" style="color: red;"></td>
					</tr>
					<tr>
						<td>Fav. Audio-track:</td>
						<td><input style="padding: 2px 0px 2px 0px;" id="File" type="file" name="audio" title="The document should be a .mp3 file."/></td>
						<td id="FileError" style="color: red;"></td>
					</tr>
					<tr>
						<td>Fav. Video:</td>
						<td><input style="padding: 2px 0px 2px 0px;" id="File" type="file" name="video" title="The document should be a .mp4 file."/></td>
						<td id="FileError" style="color: red;"></td>
					</tr>
					<tr>
						<td></td>
						<td><input style="padding: 3px;" type="submit" name="submit" value="Submit Details"/>
						<input style="padding: 3px;" type="reset" value="Reset" id="resetButton"/></td>
					</tr>
				</table>

</form>


        <div class="row no-bottom-margin">

            <section class="col">
                <h2></h2>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                <p> Tata Consultancy Services</p>
            </section>
            <section class="col mid">
                <h2></h2>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                <p>Proof of concept Demonstration </p>
            </section>

            <section class="col">
                <h2></h2>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                <p>WebRTC platform </p>
            </section>
        </div>

        <a class="back-to-top" href="#main">Back to Top</a>

      </section>

</div>

<!-- footer -->
<footer>
    <div class="footer-content">
        <ul class="footer-menu">
            <li><a href="#main">Home</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#portfolio">Portfolio</a></li>
            <li><a href="#about-us">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <!-- <li class="rss-feed"><a href="#">RSS Feed</a></li> -->
        </ul>

        <p class="footer-text">Tata Consultancy Services &nbsp;&nbsp;&nbsp; Designed by CNS Lab</a></p>
    </div>

</footer>

</body>
</html>
