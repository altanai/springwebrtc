<!DOCTYPE html>
<%@page import="com.tcs.css.ThemeSelector"%>
<html> 

<head>
<!-- themes selecetor code  -->
<%session.setAttribute("themename", "blue");
ThemeSelector ts=new ThemeSelector();
String theme=ts.getTheme(session.getAttribute("themename").toString());%>
<!--  end themes selecetor code  -->
<script type="text/javascript" src="../Validations/JS/newregistration.js" ></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>WebRTC client </title>
 <link rel="stylesheet" href="css/<%=theme %>" type="text/css" media="screen" />
<!--     <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" /> -->
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
    
    
<!-- delete cookies  -->
<script>
var cookies = document.cookie.split(";");
for (var i = 0; i < cookies.length; i++){
  eraseCookie(cookies[i].split("=")[0]);
  }
</script>
<!-- ----end cookies deleted  -->


<!-- google oauth header section  -->
  <script type="text/javascript">
  (function() {
    var po = document.createElement('script');
    po.type = 'text/javascript'; po.async = true;
    po.src = 'https://plus.google.com/js/client:plusone.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();
  </script>
  <!-- JavaScript specific to this application that is not related to API
     calls -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>
<!--  end google oauth header section -->

</head>

<body>

<!-- header-wrap -->
<div id="header-wrap">
    <header>
<div><img src="images/tcs_logo.png"</div>
        <nav>
            <ul>
                <li><a href="login.jsp"></a>Goto Login page </li>
                <li><a href="#contact">Contact Us</a></li>
            </ul>
        </nav>

    </header>
</div>

<!-- content-wrap -->
<div class="content-wrap">

  <table>
  <col width="500">
  <col width="800">
    <th>Sign in </th>
    <th> New user account </th>
<tr>
<td>
    	     <!-- -----Sign in   -->
			<%@ include file="signin.jsp" %>
			<!-- end signin -->       
</td>
<td>          
    <!-- ------Register new user  -->
 			<%@ include file="../newaccountforms/registernewuserstep2.jsp" %>
<!-- end registration --> 
  
</td>
</tr>
</table>  
  
   
            <!-- --facebook oauth -->

<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
  FB.init({
    appId      : '144771182399738', // App ID
    channelUrl : '//10.1.5.29:8080/WebRTC_presentation/pageone/login.html', // Channel File
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
  });

  //----------------- event is fired for any authentication related change, such as login, logout or session refresh. 
  FB.Event.subscribe('auth.authResponseChange', function(response) {

    if (response.status === 'connected') {
      testAPI();
    } 
    
    else if (response.status === 'not_authorized') {
      FB.login();
    }
    
    else {
      FB.login();
    }
  });
  };

  //--------------------------------------------- Load the SDK asynchronously
  (function(d){
   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
  }(document));

//----------------------------------------fetch info 
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Good to see you, ' + response.name + '.');
      alert("logged in with facebook");
      window.location.href = "http://10.1.5.29:8080/WebRTC_presentation/facebooklogin?userName=alice";
    });
  }
</script>

<fb:login-button show-faces="true" width="200" max-rows="1"></fb:login-button>
<!-- ------end facebook oauth -->
         
             <br/><br/>
            
 <!-- ------google oauth  -->
 <form>
 <div id="gConnect">
    <button class="g-signin"
        data-scope="https://www.googleapis.com/auth/plus.login"
        data-requestvisibleactions="http://schemas.google.com/AddActivity"
        data-clientId="573069363965-n7isi7nlupu7h1p5um4405475urmund7.apps.googleusercontent.com"
        data-callback="onSignInCallback"
        data-theme="dark"
        data-cookiepolicy="single_host_origin">
    </button>
  </div>
  
  <div id="authOps" style="display:none">
    <h3>User is now signed in to the app using Google+</h3>
    <button id="disconnect" >Disconnect your Google account from this app</button>
    <div id="profile"></div>
    <div id="visiblePeople"></div>

    
  </div>
  <div id="loaderror">
Error
  </div>
  </form>
  
 </form>
 <!-- -end google oauth --> 
 <br/><br/>
            
        
<br/><br/>        
            

        <div class="row no-bottom-margin">

            <section class="col">
            <h2></h2>
                <p> Tata Consultancy Services</p>
            </section>
            <section class="col mid">
                <h2></h2>

                <p>Proof Of Concept Demonstration</p>
            </section>

            <section class="col">
                <h2></h2>

                <p>WebRTC platform </p>
            </section>
        </div>



      </section>

</div>


<!-- footer -->
<footer>
    <div class="footer-content">


        <p class="footer-text">Tata Consultancy Services &nbsp;&nbsp;&nbsp; Designed by CNS Lab</a></p>
    </div>

</footer>

</body>
<!--  google oauth bottom section  -->

<script type="text/javascript">

var helper = (function() {
  var BASE_API_PATH = 'plus/v1/';

  return {
    /**
     * Hides the sign in button and starts the post-authorization operations.
     *
     * @param {Object} authResult An Object which contains the access token and
     *   other authentication information.
     */
    onSignInCallback: function(authResult) {
      gapi.client.load('plus','v1', function(){
        $('#authResult').html('Auth Result:<br/>');
        for (var field in authResult) {
          $('#authResult').append(' ' + field + ': ' +
              authResult[field] + '<br/>');
        }
        if (authResult['access_token']) {
          $('#authOps').show('slow');
          $('#gConnect').hide();
          goTo();
       helper.profile();
          helper.people();
         
          
        } else if (authResult['error']) {
          // There was an error, which means the user is not signed in.
          // As an example, you can handle by writing to the console:
          console.log('There was an error: ' + authResult['error']);
          $('#authResult').append('Logged out');
          $('#authOps').hide('slow');
          $('#gConnect').show();
        }
        console.log('authResult', authResult);
      });
    },

    /**
     * Calls the OAuth2 endpoint to disconnect the app for the user.
     */
    disconnect: function() {
      // Revoke the access token.
      $.ajax({
        type: 'GET',
        url: 'https://accounts.google.com/o/oauth2/revoke?token=' +
            gapi.auth.getToken().access_token,
        async: false,
        contentType: 'application/json',
        dataType: 'jsonp',
        success: function(result) {
          console.log('revoke response: ' + result);
          $('#authOps').hide();
          $('#profile').empty();
          $('#visiblePeople').empty();
          $('#authResult').empty();
          $('#gConnect').show();
        },
        error: function(e) {
          console.log(e);
        }
      });
    },

    /**
     * Gets and renders the list of people visible to this app.
     */
    people: function() {
      var request = gapi.client.plus.people.list({
        'userId': 'me',
        'collection': 'visible'
      });
      request.execute(function(people) {
        $('#visiblePeople').empty();
        $('#visiblePeople').append('Number of people visible to this app: ' +
            people.totalItems + '<br/>');
        for (var personIndex in people.items) {
          person = people.items[personIndex];
          $('#visiblePeople').append('<img src="' + person.image.url + '">');
        }
      });
    },

    /**
     * Gets and renders the currently signed in user's profile data.
     */
    profile: function(){
      var request = gapi.client.plus.people.get( {'userId' : 'me'} );
      request.execute( function(profile) {
        $('#profile').empty();
        if (profile.error) {
          $('#profile').append(profile.error);
          return;
        }
        $('#profile').append(
            $('<p><img src=\"' + profile.image.url + '\"></p>'));
        $('#profile').append(
            $('<p>Hello ' + profile.displayName + '!<br />Tagline: ' +
            profile.tagline + '<br />About: ' + profile.aboutMe + '</p>'));
        if (profile.cover && profile.coverPhoto) {
          $('#profile').append(
              $('<p><img src=\"' + profile.cover.coverPhoto.url + '\"></p>'));
        }
      });
    }
  };
})();

/**
 * jQuery initialization
 */
$(document).ready(function() {
  $('#disconnect').click(helper.disconnect);
  $('#loaderror').hide();
  if ($('[data-clientid="573069363965-n7isi7nlupu7h1p5um4405475urmund7.apps.googleusercontent.com"]').length > 0) {
     
  }
});

/**
 * Calls the helper method that handles the authentication flow.
 *
 * @param {Object} authResult An Object which contains the access token and
 *   other authentication information.
 */
function onSignInCallback(authResult) {
  helper.onSignInCallback(authResult);  
}

</script>

<!--  end googfle oauth bottom section  -->

</html>