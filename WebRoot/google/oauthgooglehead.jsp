  <style type="text/css">
  html, body { margin: 0; padding:0;}
  #signin-button {
   padding: 5px;
  }
  #oauth2-results pre { margin: 0; padding:0; width: 600px;}
  .hide { display: none;}
  .show { display: block;}
  </style>

  <script src="https://apis.google.com/js/client:platform.js" type="text/javascript"></script>
  <script type="text/javascript">
var loginFinished = function(authResult)
{
  if (authResult)
  {
    console.log(authResult);
  }

  gapi.client.load('oauth2', 'v2', function()
  {
    gapi.client.oauth2.userinfo.get()
      .execute(function(resp)
      {
        // Shows user email
        console.log(resp.email);
        window.location = "googlelogin?userName="+resp.email;
      });
  });

};

var options = {
  'callback': loginFinished,
  'approvalprompt': 'force',
  'clientid': '987957478561-su09b73pof5qod6qe15f4f45dj729gr8.apps.googleusercontent.com',
  'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email',
  'requestvisibleactions': 'http://schemas.google.com/CommentActivity http://schemas.google.com/ReviewActivity',
  'cookiepolicy': 'single_host_origin'
};

var renderBtn = function()
{
  gapi.signin.render('renderMe', options);
}
  </script>