            <!-- --facebook oauth -->
<!-- 
fb local : 144771182399738
channelUrl : '//localhost:8080/docWebrtc/Login.jsp',
fb cloud : 620855584647767
 channelUrl : '//ec2-54-215-209-44.us-west-1.compute.amazonaws.com:8080/docWebrtc/Login.jsp'
 -->
<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
  FB.init({
    appId      : '620855584647767', // App ID
    channelUrl : '//ec2-54-215-209-44.us-west-1.compute.amazonaws.com:8080/TCSWebRTCSolution/Login.jsp', // Channel File
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
      FB.api('/me', function(response) {  
      /* alert("logged in with facebook : "+ response.name ); */
      window.location.href = "facebooklogin?userName="+response.name;
    });
  }
</script>

<fb:login-button show-faces="true" width="400" max-rows="1"></fb:login-button>
<!-- ------end facebook oauth -->