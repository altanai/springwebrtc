<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/Droptiles.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="js/jQueryEnhancement.js"></script>
<script type="text/javascript" src="js/jQuery.MouseWheel.js"></script>
<script type="text/javascript" src="js/jquery.kinetic.js"></script>
<script type="text/javascript" src="js/Knockout-2.1.0.js"></script>
<script type="text/javascript" src="js/knockout.sortable.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/Underscore.js"></script>
<script type="text/javascript" src="js/jQuery.hashchange.js"></script>
<script type="text/javascript" src="js/User.js"></script>
<script type="text/javascript" src="js/jquery.ui.touch-punch.min.js"></script>

<style type="text/css">
.container {
	margin-left: 100px;
}</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.dropdown-toggle').dropdown();
	});
</script>
<script type="text/ecmascript">
        
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-33406100-1']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

</script>
</head>
<body>

	<div class="metro appnavbar">
		<ul>
			<li><a class="backbutton" href="MyLogin.jsp"
				data-bind="click: closeApp"> <img src="img/Metro-Back-48.png" />
			</a></li>
			<li>
				<h1 class="start">Signup</h1>
			</li>
		</ul>
	</div>

	<div class="appnavbar_space"></div>

	<div id="body">
        <div class="container metro">
            <form class="metro-form" id="LoginForm">
                <div class="metro-form-control" style="width: 300px">
                    <label>Email</label>
                    <div class="metro-text-box">
                        <input name="username" type="text" />
                        <span class="helper"></span>
                    </div>
                </div>

                <div class="metro-form-control" style="width: 300px">
                    <label>First name</label>
                    <div class="metro-text-box">
                        <input name="firstname" type="text"/>
                        <span class="helper"></span>
                    </div>
                </div>

                <div class="metro-form-control" style="width: 300px">
                    <label>Last name</label>
                    <div class="metro-text-box">
                        <input name="lastname" type="text"/>
                        <span class="helper"></span>
                    </div>
                </div>

                <div class="metro-form-control" style="width: 300px">
                    <label>Password</label>
                    <div class="metro-text-box">
                        <input name="password" type="password" value="" />
                        <span class="helper"></span>
                    </div>
                </div>

                <div class="metro-form-control" style="width: 300px">
                    <label>Confirm Password</label>
                    <div class="metro-text-box">
                        <input name="confirm_password" type="password" value="" />
                        <span class="helper"></span>
                    </div>
                </div>

                <label class="metro-check">
                    <input type="checkbox" name="remember" checked>
                    <span>Remember Me</span>
                </label>
               <input type="submit"  ID="Signup_Button" OnClick="Signup_Button_Click" class="metro-button" Value="Signup" />
            
            </form>    
        </div>
        
    </div>

</body>
</html>