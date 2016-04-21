<%@page import="com.tcs.bean.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tcs.dao.SipCallLogDao"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>My Dashboard</title>
<link href="http://code.google.com//apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css">
<link href="assets/css/bootstrap.css" title="style" rel="stylesheet" type="text/css" />
<link href="style.css" title="style" rel="stylesheet" type="text/css" /> 
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/metro/blue/jtable.css" /> --%>
<link rel="stylesheet" href="reveal.css">
<script src="scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
<script src="scripts/jquery.masonry.min.js" type="text/javascript"></script>
<script src="scripts/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="scripts/MetroJs.lt.js" type="text/javascript"></script>
<script src="scripts/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/hoverintent.js" type="text/javascript"	charset="utf-8"></script>
<script src="scripts/jquery.jplayer.min.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/organictabs.jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/javascript.js" type="text/javascript"></script>
<script src="scripts/mediaplayer.js" type="text/javascript"></script>
<script src="SIPml-api.js?svn=179" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
<script type="text/javascript" src="scripts/jquery.reveal.js"></script>
<script>
    var arr;
    var latitude;
    var longitude;
    var map;
    var serverip;
    var user;

	function initialize() {
		var mapOptions = {
	    zoom: 6,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	    };
	    map = new google.maps.Map(document.getElementById('map-canvas'),
	      mapOptions);
	
	  	// Try HTML5 geolocation
	  	if(navigator.geolocation) {
	    
		  navigator.geolocation.getCurrentPosition(function(position) {
			  latitude=position.coords.latitude;
			  longitude=position.coords.longitude;
			  
		  var pos = new google.maps.LatLng(position.coords.latitude,
	                                       position.coords.longitude);
		  
	      var infowindow = new google.maps.InfoWindow({
	        map: map,
	        position: pos,
	        content: 'current location'
	      });
	
	      map.setCenter(pos);
	    }, function() {
	      handleNoGeolocation(true);
	    });
 	 } else {
    // Browser doesn't support Geolocation
    	handleNoGeolocation(false);
  		}
	}

	function handleNoGeolocation(errorFlag) {
	  if (errorFlag) {
	    var content = 'Error: The Geolocation service failed.';
	  } else {
	    var content = 'Error: Your browser doesn\'t support geolocation.';
	  }

	  var options = {
	    map: map,
	    position: new google.maps.LatLng(60, 105),
	    content: content
	  };
	  var infowindow = new google.maps.InfoWindow(options);
	  map.setCenter(options.position);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	/*var arr2;
	var arr;//Array Variable declared globally
	 
	function receiveMessageFromServer()
	{
		if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
			{
			document.getElementById("serverReply").innerHTML=xmlHttpRequest.responseText;
			document.getElementById("HangUp").disabled=true;
			document.getElementById("CALL").disabled=false;
			}} */
	
</script>   

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
		body {
			font-family: "HelveticaNeue", "Helvetica-Neue", "Helvetica", "Arial",
				sans-serif;
			}
		
		.big-link {
			display: block;
			margin-top: 100px;
			text-align: center;
			font-size: 70px;
			color: #06f;
		}
		.full-screen{
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .normal-screen{
            position: relative;
        }
        .call-options {
          padding: 5px;
          background-color: #f0f0f0;
          border: 1px solid #eee;
          border: 1px solid rgba(0, 0, 0, 0.08);
          -webkit-border-radius: 4px;
          -moz-border-radius: 4px;
          border-radius: 4px;
          -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          -webkit-transition-property: opacity;
          -moz-transition-property: opacity; 
          -o-transition-property: opacity; 
          -webkit-transition-duration: 2s;
          -moz-transition-duration: 2s;
          -o-transition-duration: 2s;
        }
        .tab-video,
        .div-video{
            width: 100%; 
            height: 0px; 
            -webkit-transition-property: height;
            -moz-transition-property: height;
            -o-transition-property: height;
            -webkit-transition-duration: 2s;
            -moz-transition-duration: 2s;
            -o-transition-duration: 2s;
        }
        .label-align {
            display: block;
            padding-left: 15px;
            text-indent: -15px;
        }
        .input-align {
            width: 13px;
            height: 13px;
            padding: 0;
            margin:0;
            vertical-align: bottom;
            position: relative;
            top: -1px;
            *overflow: hidden;
        }
        .glass-panel{
            z-index: 99;
            position: fixed;
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            top: 0;
            left: 0;
            opacity: 0.8;
            background-color: Gray;
        }
        .div-keypad {
            z-index: 100;
            position: fixed;
            -moz-transition-property: left top;
            -o-transition-property: left top;
            -webkit-transition-duration: 2s;
            -moz-transition-duration: 2s;
            -o-transition-duration: 2s;
        }
        
</style>
<style type="text/css">
		.table1 td{ padding-top:2px;text-align:left;font-size: 12px;color: black;}
		.table1 th{background: #B8B8B8;padding-top:5px;text-align:left;font-size: 16px;color: black;font-style: bold;}
		.table1 tr.odd td{ background:#f8f8f8; }
		.table1 tr:hover td{ background:#B8B8B8 ; }
		.pg-normal1{
		color: black;
		font-weight: normal;
		font-size:12px;
		text-decoration: none;
		cursor: pointer;
		}
		.pg-selected1 {
		color: black;
		font-weight: bold;
		font-size:12px;
		text-decoration: underline;
		cursor: pointer;
		}
</style>
<script type="text/javascript">
		function Pager(tableName, itemsPerPage) {
		this.tableName = tableName;
		this.itemsPerPage = itemsPerPage;
		this.currentPage = 1;
		this.pages = 0;
		this.inited = false;
		
		this.showRecords = function(from, to) {
		var rows = document.getElementById(tableName).rows;
		// i starts from 1 to skip table header row
		for (var i = 1; i < rows.length; i++) {
		if (i < from || i > to)
		rows[i].style.display = 'none';
		else
		rows[i].style.display = '';
		}
		}
		
		this.showPage = function(pageNumber) {
		if (! this.inited) {
		alert("not inited");
		return;
		}
		
		var oldPageAnchor = document.getElementById('pg'+this.currentPage);
		oldPageAnchor.className = 'pg-normal1';
		
		this.currentPage = pageNumber;
		var newPageAnchor = document.getElementById('pg'+this.currentPage);
		newPageAnchor.className = 'pg-selected1';
		
		var from = (pageNumber - 1) * itemsPerPage + 1;
		var to = from + itemsPerPage - 1;
		this.showRecords(from, to);
		}
		
		this.prev = function() {
		if (this.currentPage > 1)
		this.showPage(this.currentPage - 1);
		}
		
		this.next = function() {
		if (this.currentPage < this.pages) {
		this.showPage(this.currentPage + 1);
		}
		}
		
		this.init = function() {
		var rows = document.getElementById(tableName).rows;
		var records = (rows.length - 1);
		this.pages = Math.ceil(records / itemsPerPage);
		this.inited = true;
		}
		
		this.showPageNav = function(pagerName, positionId) {
		if (! this.inited) {
		alert("not inited");
		return;
		}
		var element = document.getElementById(positionId);
		
		var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal1">&lt;&lt;Prev &nbsp;&nbsp;&nbsp;</span>';
		for (var page = 1; page <= this.pages; page++)
		pagerHtml += '<span id="pg' + page + '" class="pg-normal1" onclick="' + pagerName + '.showPage(' + page + ');"></span> ';
		pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal1"> Next&gt;&gt;</span>';
		
		element.innerHTML = pagerHtml;
		}
		}
</script>
<!-- !-- -----------------------------------------Scriptlets---------------------------------- -->
	<%/* Login login2=new Login(); */
	Login login1= new Login(); 
	ArrayList<String> friendList= new ArrayList<String>(); 
	ArrayList<String> notFriend=new ArrayList<String>();
	%>
	<% if(session.getAttribute("data")!=null){
		login1= (Login)session.getAttribute("data");
		friendList=login1.getPrivateIdentityFrd();
		notFriend=login1.getPrivateIdentityNotFrd();
		System.out.println("DisplayName "+login1.getDisplayName());
		System.out.println("PrivateIdentity "+login1.getPrivateIdentity());
		System.out.println("PublicIdentity "+login1.getPublicIdentity());
		System.out.println("Realm "+login1.getRealm());
		if(friendList!=null){
			for(String currentfrnd: friendList){
				System.out.println("Dash---");
				System.out.println(currentfrnd);				
			}
			for(String currentNotFrd:notFriend)
			{
				System.out.println("  "+currentNotFrd);				
			}
		}
		}
		else{
			response.sendRedirect("Login.jsp");
		}
	%>
<!-- Javascript code -->
<script type="text/javascript">
	var arr;  //Array Variable declared globally
	var xmlHttpRequest;
	var xmlHttpRequest1;
	var xmlHttpRequest2;
	if(window.XMLHttpRequest)
	{
	xmlHttpRequest=new XMLHttpRequest();
	xmlHttpRequest1=new XMLHttpRequest();
	xmlHttpRequest2=new XMLHttpRequest();
	}
	else if(window.ActiveXObject)
	{
	xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequest1=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequest2=new ActiveXObject(MICROSOFT.XMLHTTP);
	}
    var sTransferNumber;
    var oRingTone, oRingbackTone;
    var oSipStack, oSipSessionRegister, oSipSessionCall, oSipSessionTransferCall;
    var videoRemote, videoLocal, audioRemote;
    var bFullScreen = false;
    var oNotifICall;
    var oReadyStateTimer;
    var bDisableVideo = false;
    var viewVideoLocal, viewVideoRemote; // <video> (webrtc) or <div> (webrtc4all)
    var oConfigCall;
    var oConfigMsg;
    var oSipSessionMessage;
    var oSipPublish;
    var subscribeSession;
    var oConfigSub;
    var infoArray=new Array(20);
    var r;
   	var to=new Array();
    var friendslist = new Array();
    var friends = new Array();
    var chkURI=new Array();
    var xmlHttpRequest;
    
    var msgId=0;
    var extraContent;
    var addInt;
    var finalMsg;
    var mainCont;
	
    C = 
    {
        divKeyPadWidth: 220
    };

    window.onload = function () {
        if(window.console) {
            window.console.info("location=" + window.location);
        }
        videoLocal = document.getElementById("video_local");
        videoRemote = document.getElementById("video_remote");
        audioRemote = document.getElementById("audio_remote");

        document.onkeyup = onKeyUp;
        document.body.onkeyup = onKeyUp;
        divCallCtrl.onmousemove = onDivCallCtrlMouseMove;

        // set debug level
        SIPml.setDebugLevel((window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_debug') == "true") ? "error" : "info");

        loadCredentials();
        loadCallOptions();

        // Initialize call button
        uiBtnCallSetText("Call");

        oReadyStateTimer = setInterval(function () {
            if (document.readyState === "complete") {
                clearInterval(oReadyStateTimer);
                // initialize SIPML5
                SIPml.init(postInit);
            }
        },
        500);
		dummyRegister();
		//alert("in b4 getpic");
		document.getElementById("userImage").src='<%=request.getContextPath()%>/Controller?id=<%=login1.getPrivateIdentity()%>&action=getProfilePic';
		document.getElementById("userImage1").src='<%=request.getContextPath()%>/Controller?id=<%=login1.getPrivateIdentity()%>&action=getProfilePic';
		document.getElementById("userImage3").src='<%=request.getContextPath()%>/Controller?id=<%=login1.getPrivateIdentity()%>&action=getProfilePic';
        if (uRIContactPage.value!="null"){
           // alert("changing");
        	txtPhoneNumber.value=uRIContactPage.value;
        	uRIContactPage.value="null";
        	//alert("entering sip call");
        	setTimeout(function(){sipCall("call-audiovideo"); },1000);        
        }
    };

    window.onbeforeunload = function saveAllData()
    {
        sipUnRegister();
        //return true;       //comment out 'return' to suppress prompt
    }
    
    
    //read server ip from file
   var ip;
   function readip()
   {
	   var pathOfFileToRead = "presentation_server_config.txt";
	   ip = FileHelper.readStringFromFileAtPath
	   	(
	   		pathOfFileToRead
	   	);
   } 

   function FileHelper()
   {
	   	FileHelper.readStringFromFileAtPath = function(pathOfFileToReadFrom)
	   	{
	   		var request = new XMLHttpRequest();
	   		request.open("GET", pathOfFileToReadFrom, false);
	   		request.send(null);
	   		var returnValue = request.responseText;
	   		return returnValue;
	   	}
	   	readip();
	    // alert("ip "+ip);
   }
   
   function sendDataToDiv(from,message)
	{
		$(document).ready(function(){
			var text=$('<div class="chat" style="color:gray">'+from+' : '+ message+ '</div>');
			$('.chatbox').append(text);
			$(text).gemoticon();
			});
	}
   
    //fetch buddy list
    function main()
 	{
	 	 var pathOfFileToRead = "friend.txt";
	 	var contentsOfFileAsString = FileHelper.readStringFromFileAtPath(pathOfFileToRead);
	 	friendslist=contentsOfFileAsString; 
 		alert("frined list "+ friendslist);
    	
	 } 
     
    function FileHelper()
    {
    	FileHelper.readStringFromFileAtPath = function(pathOfFileToReadFrom)
    	{
    		var request = new XMLHttpRequest();
    		request.open("GET", pathOfFileToReadFrom, false);
    		request.send(null);
    		//var returnValue = request.responseText;
    		friends = request.responseText.split("\n");
    		//return returnValue;
    		return friends;
    	}
    }
    main();
   // alert("friend "+friends);
    
    function postInit() {
        // check webrtc4all version
        if (SIPml.isWebRtc4AllSupported() && SIPml.isWebRtc4AllPluginOutdated()) {            
            if (confirm("Your WebRtc4all extension is outdated ("+SIPml.getWebRtc4AllVersion()+"). A new version with critical bug fix is available. Do you want to install it?\nIMPORTANT: You must restart your browser after the installation.")) {
                window.location = 'http://code.google.com/p/webrtc4all/downloads/list';
                return;
            }
        }

        // check for WebRTC support
        if (!SIPml.isWebRtcSupported()) {
            // is it chrome?
            if (SIPml.getNavigatorFriendlyName() == 'chrome') {
                    if (confirm("You're using an old Chrome version or WebRTC is not enabled.\nDo you want to see how to enable WebRTC?")) {
                        window.location = 'http://www.webrtc.org/running-the-demos';
                    }
                    else {
                        window.location = "index.html";
                    }
                    return;
            }
                
            // for now the plugins (WebRTC4all only works on Windows)
            if (SIPml.getSystemFriendlyName() == 'windows') {
                // Internet explorer
                if (SIPml.getNavigatorFriendlyName() == 'ie') {
                    // Check for IE version 
                    if (parseFloat(SIPml.getNavigatorVersion()) < 9.0) {
                        if (confirm("You are using an old IE version. You need at least version 9. Would you like to update IE?")) {
                            window.location = 'http://windows.microsoft.com/en-us/internet-explorer/products/ie/home';
                        }
                        else {
                            window.location = "index.html";
                        }
                    }

                    // check for WebRTC4all extension
                    if (!SIPml.isWebRtc4AllSupported()) {
                        if (confirm("webrtc4all extension is not installed. Do you want to install it?\nIMPORTANT: You must restart your browser after the installation.")) {
                            window.location = 'http://code.google.com/p/webrtc4all/downloads/list';
                        }
                        else {
                            // Must do nothing: give the user the chance to accept the extension
                            // window.location = "index.html";
                        }
                    }
                    // break page loading ('window.location' won't stop JS execution)
                    if (!SIPml.isWebRtc4AllSupported()) {
                        return;
                    }
                }
                else if (SIPml.getNavigatorFriendlyName() == "safari" || SIPml.getNavigatorFriendlyName() == "firefox" || SIPml.getNavigatorFriendlyName() == "opera") {
                    if (confirm("Your browser don't support WebRTC.\nDo you want to install WebRTC4all extension to enjoy audio/video calls?\nIMPORTANT: You must restart your browser after the installation.")) {
                        window.location = 'http://code.google.com/p/webrtc4all/downloads/list';
                    }
                    else {
                        window.location = "index.html";
                    }
                    return;
                }
            }
            // OSX, Unix, Android, iOS...
            else {
                if (confirm('WebRTC not supported on your browser.\nDo you want to download a WebRTC-capable browser?')) {
                    window.location = 'https://www.google.com/intl/en/chrome/browser/';
                }
                else {
                    window.location = "index.html";
                }
                return;
            }
        }

        // checks for WebSocket support
        if (!SIPml.isWebSocketSupported() && !SIPml.isWebRtc4AllSupported()) {
            if (confirm('Your browser don\'t support WebSockets.\nDo you want to download a WebSocket-capable browser?')) {
                window.location = 'https://www.google.com/intl/en/chrome/browser/';
            }
            else {
                window.location = "index.html";
            }
            return;
        }

        // FIXME: displays must be per session

        // attachs video displays
        if (SIPml.isWebRtc4AllSupported()) {
            viewVideoLocal = document.getElementById("divVideoLocal");
            viewVideoRemote = document.getElementById("divVideoRemote");
            WebRtc4all_SetDisplays(viewVideoLocal, viewVideoRemote); // FIXME: move to SIPml.* API
        }
        else{
            viewVideoLocal = videoLocal;
            viewVideoRemote = videoRemote;
        }

        if (!SIPml.isWebRtc4AllSupported() && !SIPml.isWebRtcSupported()) {
            if (confirm('Your browser don\'t support WebRTC.\naudio/video calls will be disabled.\nDo you want to download a WebRTC-capable browser?')) {
                window.location = 'https://www.google.com/intl/en/chrome/browser/';
            }
        }
        
        btnRegister.disabled = false;
        document.body.style.cursor = 'default';
        oConfigCall = {
            audio_remote: audioRemote,
            video_local: viewVideoLocal,
            video_remote: viewVideoRemote,
            bandwidth: { audio:undefined, video:undefined },
            video_size: { minWidth:undefined, minHeight:undefined, maxWidth:undefined, maxHeight:undefined },
            events_listener: { events: '*', listener: onSipEventSession },
            sip_caps: [
                            { name: '+g.oma.sip-im' },
                            { name: '+sip.ice' },
                            { name: 'language', value: '\"en,fr\"' }
                        ]
        };
    }


    function loadCallOptions() {
        if (window.localStorage) {
            var s_value;
            if ((s_value = window.localStorage.getItem('org.doubango.call.phone_number'))) txtPhoneNumber.value = s_value;
            bDisableVideo = (window.localStorage.getItem('org.doubango.expert.disable_video') == "true");

            txtCallStatus.innerHTML = '<i>Video ' + (bDisableVideo ? 'disabled' : 'enabled') + '</i>';
        }
    }

    function saveCallOptions() {
        if (window.localStorage) {
            window.localStorage.setItem('org.doubango.call.phone_number', txtPhoneNumber.value);
            window.localStorage.setItem('org.doubango.expert.disable_video', bDisableVideo ? "true" : "false");
        }
    }

    function loadCredentials() {
       /*  if (window.localStorage) {
            // IE retuns 'null' if not defined
            var s_value;
            if ((s_value = window.localStorage.getItem('org.doubango.identity.display_name'))) txtDisplayName.value = s_value;
            if ((s_value = window.localStorage.getItem('org.doubango.identity.impi'))) txtPrivateIdentity.value = s_value;
            if ((s_value = window.localStorage.getItem('org.doubango.identity.impu'))) txtPublicIdentity.value = s_value;
            if ((s_value = window.localStorage.getItem('org.doubango.identity.password'))) txtPassword.value = s_value;
            if ((s_value = window.localStorage.getItem('org.doubango.identity.realm'))) txtRealm.value = s_value;
        }
        else {
            /*txtDisplayName.value = "005";
            txtPrivateIdentity.value = "005";
            txtPublicIdentity.value = "sip:005@192.168.0.28";
            txtPassword.value = "005";
            txtRealm.value = "192.168.0.28";
            txtPhoneNumber.value = "005";
        } */
    };

    function saveCredentials() {
        
    	if (window.localStorage) {
        	
            window.localStorage.setItem('org.doubango.identity.display_name', txtDisplayName.value);
            window.localStorage.setItem('org.doubango.identity.impi', txtPrivateIdentity.value);
            window.localStorage.setItem('org.doubango.identity.impu', txtPublicIdentity.value);
            window.localStorage.setItem('org.doubango.identity.password', txtPassword.value);
            window.localStorage.setItem('org.doubango.identity.realm', txtRealm.value);
            
          //  alert ("save credentails func :"+ txtPublicIdentity.value );
        }
    };

    // sends SIP REGISTER request to login
    function sipRegister() {
        // catch exception for IE (DOM not ready)
       // alert ("sip register func :"+ txtPublicIdentity.value );
        try {
            btnRegister.disabled = true;
            if (!txtRealm.value || !txtPrivateIdentity.value || !txtPublicIdentity.value) {
                txtRegStatus.innerHTML = '<b>Please fill madatory fields (*)</b>';
                btnRegister.disabled = false;
                return;
            }
            var o_impu = tsip_uri.prototype.Parse(txtPublicIdentity.value);
            if (!o_impu || !o_impu.s_user_name || !o_impu.s_host) {
                txtRegStatus.innerHTML = "<b>[" + txtPublicIdentity.value + "] is not a valid Public identity</b>";
                btnRegister.disabled = false;
                return;
            }

            // enable notifications if not already done
            if (window.webkitNotifications && window.webkitNotifications.checkPermission() != 0) {
                window.webkitNotifications.requestPermission();
            }

            // save credentials
            saveCredentials();
            window.localStorage.setItem('com.s.v.bool', "true");
            // update debug level to be sure new values will be used if the user haven't updated the page
            SIPml.setDebugLevel((window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_debug') == "true") ? "error" : "info");

            // create SIP stack
            oSipStack = new SIPml.Stack({
                    realm: txtRealm.value,
                    impi: txtPrivateIdentity.value,
                    impu: txtPublicIdentity.value,
                    password: txtPassword.value,
                    display_name: txtDisplayName.value,
                    websocket_proxy_url: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.websocket_server_url') : null),
                    outbound_proxy_url: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.sip_outboundproxy_url') : null),
                    ice_servers: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.ice_servers') : null),
                    enable_rtcweb_breaker: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.enable_rtcweb_breaker') == "true" : false),
                    events_listener: { events: '*', listener: onSipEventStack },
                    enable_early_ims: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.disable_early_ims') != "true" : true), // Must be true unless you're using a real IMS network
                    enable_media_stream_cache: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.enable_media_caching') == "true" : false),
                    bandwidth: (window.localStorage ? tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.bandwidth')) : null), // could be redefined a session-level
                    video_size: (window.localStorage ? tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.video_size')) : null), // could be redefined a session-level
                    sip_headers: [
                            { name: 'User-Agent', value: 'IM-client/OMA1.0 sipML5-v1.2013.08.10B' },
                            { name: 'Organization', value: 'TCS' }
                    ]
                }
            );
            if (oSipStack.start() != 0) {
                txtRegStatus.innerHTML = '<b>Failed to start the SIP stack</b>';
            }
            else return;
        }
        catch (e) {
            txtRegStatus.innerHTML = "<b>2:" + e + "</b>";
        }
        btnRegister.disabled = false;
    }

    // sends SIP REGISTER (expires=0) to logout
    function sipUnRegister() {
        if (oSipStack) {
            oSipStack.stop(); // shutdown all sessions
        }
    }
    
    function chatValidation(){
    	chatField.innerHTML="";
    	
		var desturi=document.getElementById("uri").value;
		desturi.trim();
		if(desturi===""){
			chatField.innerHTML="URI Cant Be Empty";
			desturi.focus;
			return;
		}		
 	}
    
    function msgValidation(){
    	chatField.innerHTML="";
    	var content=document.getElementById("msg").value;
		if(content===""){
			chatField.innerHTML="Msg Box Cant Be Empty";
			return;
		}
    }
    
    function enterpressalert(e){
    	 if(e.keyCode===13){
    		 sipIM("message");
    	 }
     }
    
    function sipIM(s_type){ 		
 	 oConfigMsg = {
             
             events_listener: { events: '*', listener: onSipEventSession },
             sip_caps: [
                             { name: '+g.oma.sip-im' },
                             { name: '+sip.ice' },
                             { name: 'language', value: '\"en,fr\"' }
                         ]
         };
 		var uri=document.getElementById("uri").value;
 		var desturi="sip:"+uri+"@tcs.com";
 		
 		//alert("dest"+desturi); 
 		var content=document.getElementById("msg").value;
 		
 		document.getElementById("msg").value="";
 		/* alert("content is"+content); */
 		
 		document.getElementById("textArea").value +="me : "+ content+"\n" ;
 		document.getElementById("textArea").scrollTop =    document.getElementById("textArea").scrollHeight;	
 		/* if (oSipStack && !oSipSessionMessage && !tsk_string_is_null_or_empty(txtPhoneNumber.value)) { */
 		oSipSessionMessage = oSipStack.newSession(s_type,oConfigMsg);
 		//to send message
 		/* alert("send1");  */
 		
 		extraContent="[{trxnid}]";
 		addInt=extraContent+msgId;
 		msgId++;
 		finalMsg=content+addInt;
 		 
 		oSipSessionMessage.send(desturi,finalMsg, 'text/plain;charset=utf8');
 		/* } 
 			else 
 				{
 				 alert("inside else");
 				oSipSessionMessage.send(desturi, content, 'text/plain;charset=utf8');

 			} */
 	}
    
  //presence
	function sipPublis(s_type) {
				alert("inside publish");
		oSipPublish = oSipStack.newSession('publish', {
			expires : 200,
			sip_headers : [ {
				name : 'Event',
				value : 'presence'
			} ],
			sip_caps : [ {
				name : '+g.oma.sip-im'
			}, {
				name : '+sip.ice'
			}, {
				name : 'language',
				value : '\"en,fr\"'
			} ],
			events_listener : {
				events : '*',
				listener : onSipEventSession
			}
		});
		var contentType = 'application/pidf+xml';
		var content = '<?xml version="1.0" encoding="UTF-8"?>\n'
				+ '<presence xmlns="urn:ietf:params:xml:ns:pidf">\n' +

				'<tuple id="bob">\n' + '<status>\n' + '<basic>open</basic>\n'
				+ '<contact>sip:bob@tcs.com</contact>\n'
				+ '<note>online</note></status>\n' + '</tuple>\n'
				+ '</presence>';
		oSipPublish.publish(content, contentType);
	}	
	//presence ends
	main();
	
	//subscribe
	function sipSubscribe() {
		 for(var i=0;i<friendslist.length;i++)
			 {
			 	//alert("inside 2345");
				oConfigSub = {
					expires : 200,
					events_listener : {
						events : '*',
						listener : onSipEventSession
					},
					sip_headers : [ {
						name : 'Event',
						value : 'presence'
					}, // only notify for 'presence' events
					{
						name : 'Accept',
						value : 'application/pidf+xml'
					} // supported content types (COMMA-sparated)
					],
					sip_caps : [ {
						name : '+g.oma.sip-im'
					}, {
						name : '+sip.ice'
					}, {
						name : 'language',
						value : '\"en,fr\"'
					} ]
		
				};
		
				subscribeSession = oSipStack.newSession("subscribe", oConfigSub);
						
				// start watching for entity's presence status (You may track event type 'connected' to be sure that the request has been accepted by the server)
		
					to[i]=friendslist[i];
					subscribeSession.subscribe(to[i]);
					//alert("after subs");
			}
	}	
	//subscribe ends
    
    // makes a call (SIP INVITE)
    function sipCall(s_type) {
		arr=new Array(); 
		arr[arr.length]=document.getElementById("txtPublicIdentity").value;
		arr[arr.length]=document.getElementById("txtPhoneNumber").value;
		var startTime=new Date();
		arr[arr.length]=startTime.getTime();
        if (oSipStack && !oSipSessionCall && !tsk_string_is_null_or_empty(txtPhoneNumber.value)) {
            if(s_type == 'call-screenshare') {
                if(!SIPml.isScreenShareSupported()) {
                
                    return;
                }
               //changed from https to http 
                if (!location.protocol.match('http')){
                    if (confirm("Screen sharing requires https://. Do you want to be redirected?")) {
                        sipUnRegister();
                        window.location = 'https://ns313841.ovh.net/call.htm';
                    }
                    return;
                }
                
            }
            btnCall.disabled = true;
            btnHangUp.disabled = false;

            if(window.localStorage) {
                oConfigCall.bandwidth = tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.bandwidth')); // already defined at stack-level but redifined to use latest values
                oConfigCall.video_size = tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.video_size')); // already defined at stack-level but redifined to use latest values
            }
            
            // create call session
            oSipSessionCall = oSipStack.newSession(s_type, oConfigCall);
            // make call
            if (oSipSessionCall.call(txtPhoneNumber.value) != 0) {
                oSipSessionCall = null;
                txtCallStatus.value = 'Failed to make call';
                btnCall.disabled = false;
                btnHangUp.disabled = true;
                return;
            }
            saveCallOptions();
        }
        else if (oSipSessionCall) {
            txtCallStatus.innerHTML = '<i>Connecting...</i>';
            oSipSessionCall.accept(oConfigCall);
        }
    }

    // transfers the call
    function sipTransfer() {
        if (oSipSessionCall) {
            var s_destination = prompt('Enter destination number', '');
            if (!tsk_string_is_null_or_empty(s_destination)) {
                btnTransfer.disabled = true;
                if (oSipSessionCall.transfer(s_destination) != 0) {
                    txtCallStatus.innerHTML = '<i>Call transfer failed</i>';
                    btnTransfer.disabled = false;
                    return;
                }
                txtCallStatus.innerHTML = '<i>Transfering the call...</i>';
            }
        }
    }
    
    // holds or resumes the call
    function sipToggleHoldResume() {
        if (oSipSessionCall) {
            var i_ret;
            btnHoldResume.disabled = true;
            txtCallStatus.innerHTML = oSipSessionCall.bHeld ? '<i>Resuming the call...</i>' : '<i>Holding the call...</i>';
            i_ret = oSipSessionCall.bHeld ? oSipSessionCall.resume() : oSipSessionCall.hold();
            if (i_ret != 0) {
                txtCallStatus.innerHTML = '<i>Hold / Resume failed</i>';
                btnHoldResume.disabled = false;
                return;
            }
        }
    }

    // terminates the call (SIP BYE or CANCEL)
    function sipHangUp() {
    	var endTime=new Date();
    	arr[arr.length]=endTime.getTime();
    	sendDataToUpload();   	
    	
    	if (oSipSessionCall) {
            txtCallStatus.innerHTML = '<i>Terminating the call...</i>';
            oSipSessionCall.hangup({events_listener: { events: '*', listener: onSipEventSession }});
         
        }
    }
    
   	function sipSendDTMF(c){
        if(oSipSessionCall && c){
            if(oSipSessionCall.dtmf(c) == 0){
                try { dtmfTone.play(); } catch(e){ }
            }
        }
    }

    function startRingTone() {
        try { ringtone.play(); }
        catch (e) { }
    }

    function stopRingTone() {
        try { ringtone.pause(); }
        catch (e) { }
    }

    function startRingbackTone() {
        try { ringbacktone.play(); }
        catch (e) { }
    }

    function stopRingbackTone() {
        try { ringbacktone.pause(); }
        catch (e) { }
    }

    function toggleFullScreen() {
        if (videoRemote.webkitSupportsFullscreen) {
            fullScreen(!videoRemote.webkitDisplayingFullscreen);
        }
        else {
            fullScreen(!bFullScreen);
        }
    }

    function openKeyPad(){
        divKeyPad.style.visibility = 'visible';
        divKeyPad.style.left = ((document.body.clientWidth - C.divKeyPadWidth) >> 1) + 'px';
        divKeyPad.style.top = '70px';
        divGlassPanel.style.visibility = 'visible';
    }

    function closeKeyPad(){
        divKeyPad.style.left = '0px';
        divKeyPad.style.top = '0px';
        divKeyPad.style.visibility = 'hidden';
        divGlassPanel.style.visibility = 'hidden';
    }

    function fullScreen(b_fs) {
        bFullScreen = b_fs;
        if (tsk_utils_have_webrtc4native() && bFullScreen && videoRemote.webkitSupportsFullscreen) {
            if (bFullScreen) {
                videoRemote.webkitEnterFullScreen();
            }
            else {
                videoRemote.webkitExitFullscreen();
            }
        }
        else {
            if (tsk_utils_have_webrtc4npapi()) {
                try { if(window.__o_display_remote) window.__o_display_remote.setFullScreen(b_fs); }
                catch (e) { divVideo.setAttribute("class", b_fs ? "full-screen" : "normal-screen"); }
            }
            else {
                divVideo.setAttribute("class", b_fs ? "full-screen" : "normal-screen");
            }
        }
    }

    function showNotifICall(s_number) {
        // permission already asked when we registered
        if (window.webkitNotifications && window.webkitNotifications.checkPermission() == 0) {
            if (oNotifICall) {
                oNotifICall.cancel();
            }
            oNotifICall = window.webkitNotifications.createNotification('Call Notification', 'Incoming call from ' + s_number);
            oNotifICall.onclose = function () { oNotifICall = null; };
            oNotifICall.show();
        }
    }

    function onKeyUp(evt) {
        evt = (evt || window.event);
        if (evt.keyCode == 27) {
            fullScreen(false);
        }
        else if (evt.ctrlKey && evt.shiftKey) { // CTRL + SHIFT
            if (evt.keyCode == 65 || evt.keyCode == 86) { // A (65) or V (86)
                bDisableVideo = (evt.keyCode == 65);
                txtCallStatus.innerHTML = '<i>Video ' + (bDisableVideo ? 'disabled' : 'enabled') + '</i>';
                window.localStorage.setItem('org.doubango.expert.disable_video', bDisableVideo);
            }
        }
    }

    function onDivCallCtrlMouseMove(evt) {
        try { // IE: DOM not ready
            if (tsk_utils_have_stream()) {
                btnCall.disabled = (!tsk_utils_have_stream() || !oSipSessionRegister || !oSipSessionRegister.is_connected());
                document.getElementById("divCallCtrl").onmousemove = null; // unsubscribe
            }
        }
        catch (e) { }
    }

    function uiOnConnectionEvent(b_connected, b_connecting) { // should be enum: connecting, connected, terminating, terminated
        btnRegister.disabled = b_connected || b_connecting;
        btnUnRegister.disabled = !b_connected && !b_connecting;
        btnCall.disabled = !(b_connected && tsk_utils_have_webrtc() && tsk_utils_have_stream());
        btnHangUp.disabled = !oSipSessionCall;
    }

    function uiVideoDisplayEvent(b_local, b_added) {
        var o_elt_video = b_local ? videoLocal : videoRemote;

        if (b_added) {
            if (SIPml.isWebRtc4AllSupported()) {
                if (b_local){ if(window.__o_display_local) window.__o_display_local.style.visibility = "visible"; }
                else { if(window.__o_display_remote) window.__o_display_remote.style.visibility = "visible"; }
                   
            }
            else {
                o_elt_video.style.opacity = 1;
            }
            uiVideoDisplayShowHide(true);
        }
        else {
            if (SIPml.isWebRtc4AllSupported()) {
                if (b_local){ if(window.__o_display_local) window.__o_display_local.style.visibility = "hidden"; }
                else { if(window.__o_display_remote) window.__o_display_remote.style.visibility = "hidden"; }
            }
            else{
                o_elt_video.style.opacity = 0;
            }
            fullScreen(false);
        }
    }

    function uiVideoDisplayShowHide(b_show) {
        if (b_show) {
            tdVideo.style.height = '340px';
            divVideo.style.height = navigator.appName == 'Microsoft Internet Explorer' ? '100%' : '340px';
        }
        else {
            tdVideo.style.height = '0px';
            divVideo.style.height = '0px';
        }
        btnFullScreen.disabled = !b_show;
    }

    function uiDisableCallOptions() {
        if(window.localStorage) {
            window.localStorage.setItem('org.doubango.expert.disable_callbtn_options', 'true');
            uiBtnCallSetText('Call');
            //alert('Use expert view to enable the options again (/!\\requires re-loading the page)');
        }
    }

    function uiBtnCallSetText(s_text) {
    	 switch(s_text) {
         case "Call":
             {
                 var bDisableCallBtnOptions = (window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_callbtn_options') == "true");
                 btnCall.value = btnCall.innerHTML = bDisableCallBtnOptions ? 'Call' : 'Call <span id="spanCaret" class="caret">';
                 //btnCall.setAttribute("class", bDisableCallBtnOptions ? "btn btn-primary dropdown-toggle" : "btn btn-primary dropdown-toggle");
                 //btnCall.onclick = bDisableCallBtnOptions ? function(){ sipCall(bDisableVideo ? 'call-audio' : 'call-audiovideo'); } : null;
                 
                 //btnCall.onclick = function(){if (ulCallOptions.style.visibility =="hidden"){ulCallOptions.style.visibility ="visible"}else{ulCallOptions.style.visibility ="hidden"}};
                  //ulCallOptions.style.visibility = bDisableCallBtnOptions ? "hidden" : "visible";
                                	 
                 if(!bDisableCallBtnOptions && ulCallOptions.parentNode == divBtnCallGroup){
                   //  divBtnCallGroup.appendChild(ulCallOptions);
                 }
                 else if(bDisableCallBtnOptions && ulCallOptions.parentNode != divBtnCallGroup) {
                   //  document.body.appendChild(ulCallOptions);
                 //    ulCallOptions.style.visibility = bDisableCallBtnOptions ? "hidden" : "visible";
                 }
                 
                 break;
             }
         default:
             {
                 btnCall.value = btnCall.innerHTML = s_text;
                 btnCall.setAttribute("class", "btn btn-primary dropdown-toggle");
                 btnCall.onclick = function(){ sipCall(bDisableVideo ? 'call-audio' : 'call-audiovideo'); };
                 ulCallOptions.style.visibility = "hidden";
                 if(ulCallOptions.parentNode == divBtnCallGroup){
                     document.body.appendChild(ulCallOptions);
                 }
                 break;
             }
     	}
    }

    function uiCallTerminated(s_description){    	
        uiBtnCallSetText("Call");
        btnHangUp.value = 'HangUp';
        btnHoldResume.value = 'hold';
        btnCall.disabled = false;
        btnHangUp.disabled = true;
        oSipSessionCall = null;
        stopRingbackTone();
        stopRingTone();
        txtCallStatus.innerHTML = "<i>" + s_description + "</i>";
        uiVideoDisplayShowHide(false);
        divCallOptions.style.opacity = 0;

        if (oNotifICall) {
            oNotifICall.cancel();
            oNotifICall = null;
        }
        uiVideoDisplayEvent(true, false);
        uiVideoDisplayEvent(false, false);
        setTimeout(function () { if (!oSipSessionCall) txtCallStatus.innerHTML = ''; }, 2500);
        
    }
    
    function sendDataToUpload() //This function makes use of AJAX To Call the Servlet
    {
    	//alert("SipCallLogServlet?caller="+arr[0]+"&callee="+arr[1]+"&startTime="+arr[2]+"&endTime="+arr[3]);
    	xmlHttpRequest.open("POST", "http://localhost:8016/FinalUI10/SipCallLogServlet?caller="+arr[0]+"&callee="+arr[1]+"&startTime="+arr[2]+"&endTime="+arr[3], true);
    	xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
    	xmlHttpRequest.send();
    }
    
    function shareMyLocation(){
    	user = document.getElementById("user").value;
    	arr=new Array();
    	arr[arr.length]=user;
        arr[arr.length]=latitude;
    	arr[arr.length]=longitude;
    	//alert("latitude"+latitude+" longitude"+longitude);    	
    	
    	var DateTime=new Date();
    	arr[arr.length]=DateTime.getDate() + "/" + (DateTime.getMonth() + 1) + "/" + DateTime.getFullYear().toString().substr(2,2);
    	arr[arr.length]= DateTime.getHours() + ':' + DateTime.getMinutes() + ':'+ DateTime.getSeconds();
    	
    	sendDataToUploadGeo();
    }
    
    function sendDataToUploadGeo() //This function makes use of AJAX To Call the Servlet
    {
    	//serverip="10.1.5.30";
    	//alert( "server ip "+ serverip );
    	xmlHttpRequest.open("POST", "GeolocationstoreServlet?action=shareMyLoc&sipuri="+arr[0]+"&latitude="+arr[1]+"&longitude="+arr[2]+"&date="+arr[4]+"&time="+arr[3], true);
    	xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
    	xmlHttpRequest.send();    	
    }
    
   //send data    
	function eraseResponseMessage()	{
		document.getElementById("serverReply").innerHTML="";
	}
   
	function receiveMessageFromServer()
	{
		if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
			{
				document.getElementById("serverReply").innerHTML=xmlHttpRequest.responseText;
			}
	}
	//send data end
	
	function setVisibility(){
		 if(ulCallOptions.style.visibility === "hidden")			 
			 ulCallOptions.style.visibility = "visible";
		 else
			 ulCallOptions.style.visibility = "hidden";
	}
	    
    // Callback function for SIP Stacks
    function onSipEventStack(e /*SIPml.Stack.Event*/) {
        tsk_utils_log_info('==stack event = ' + e.type);
        //alert("event type is"+e.type);
        switch (e.type) {
            case 'started':
                {
                    // catch exception for IE (DOM not ready)
                    try {
                        // LogIn (REGISTER) as soon as the stack finish starting
                        oSipSessionRegister = this.newSession('register', {
                            expires: 200,
                            events_listener: { events: '*', listener: onSipEventSession },
                            sip_caps: [
                                        { name: '+g.oma.sip-im', value: null },
                                        { name: '+audio', value: null },
                                        { name: 'language', value: '\"en,fr\"' }
                                ]
                        });
                        oSipSessionRegister.register();
                    }
                    catch (e) {
                        txtRegStatus.value = txtRegStatus.innerHTML = "<b>1:" + e + "</b>";
                        btnRegister.disabled = false;
                    }
                    break;
                }
            case 'stopping': case 'stopped': case 'failed_to_start': case 'failed_to_stop':
                {
                    var bFailure = (e.type == 'failed_to_start') || (e.type == 'failed_to_stop');
                    oSipStack = null;
                    oSipSessionRegister = null;
                    oSipSessionCall = null;

                    uiOnConnectionEvent(false, false);

                    stopRingbackTone();
                    stopRingTone();

                    uiVideoDisplayShowHide(false);
                    divCallOptions.style.opacity = 0;

                    txtCallStatus.innerHTML = '';
                    txtRegStatus.innerHTML = bFailure ? "<i>Disconnected: <b>" + e.description + "</b></i>" : "<i>Disconnected</i>";
                    break;
                }
                
            case 'i_new_message':
			{
            	if(oSipSessionMessage){
            			/* alert("session established"); */
            			oSipSessionMessage=e.newSession;
            		
            			oSipSessionMessage.accept();
            			var si=oSipSessionMessage.getRemoteUri();
            			/*alert("remote uri is"+si);*/
    					oSipSessionMessage.setConfiguration(oConfigMsg);
            			
    					var str = oSipSessionMessage.getRemoteFriendlyName();//Receiver's name
    					/* alert("SIpMSGS"+str); */
    					/*alert("new user is"+str);*/
    					var i=0;

    					 /* var sRemoteUri=str.slice(1,25); */
    					 var firstString=str.replace("<","");
    					 var sRemoteUri=firstString.replace(">","");
    					 
    					
    					 var doc=e.getContentString();
    					/*changes*/
    					mainCont=doc.split("[");
    					 var string2=str+doc;
    					/* alert("www"+string2);
    					 alert("uri is"+chkURI);*/
    					 for(k=0;k<chkURI.length;k++){
    						/* alert("inside new array");*/
    						 if(chkURI[k]===string2){
    							// alert("duplicate");
    							 return;
    						 }
    					 }
    					/* for(i=0;i<10;i++){
    						
    							 alert("inside if");
    							 if(chkURI[i]===string2){
    							 alert("duplicate");
    							 return;
    						 }
    					 }*/
    						
    								 /*alert("inside else");*/
    					if(chkURI.length<10){
    						//added    									
	    					chkURI.push(string2);
	    					var b="sip:";
	    		    		var c =b.concat(sRemoteUri);
	    					var a="@";
	    					var d=a.concat("tcs.com");
	    		    		/*  var d="@tcs.com"; */
	    		    		var f=c.concat(d);
	    		    		//alert("d"+d);                       
	    		    		/*document.getElementById("msg").value=doc;*/
	    		    		/*document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
	    		    		document.getElementById("textArea").scrollTop =    document.getElementById("textArea").scrollHeight;*/
	    		    							
	    		    		//Code to call jqurey function here 
	    		    		//sendDataToDiv(str,mainCont[0]);
	    		    		//document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
	    		            document.getElementById("uri").value =str;
	    		            document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
    					}
    					else
    					{
    						/*alert("inside splice");*/
    						chkURI.splice(0,1);
    						chkURI.push(string2);
        					var b="sip:";
        		    		var c =b.concat(sRemoteUri);
        					var a="@";
        					var d=a.concat("tcs.com");
        		    		<%--  var d="@"<%=request.getParameter("realm")%>; --%>
        		    		/*  var d="@tcs.com"; */
        		    		var f=c.concat(d);
        		    		//alert("realm "+document.getElementById("txtRealm"));                       
        		    		//sendDataToDiv(str,mainCont[0]);
        		    		//document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
        		    		document.getElementById("uri").value =str;
        		            document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
    					} 
    				}
            		else{            		
            		//alert("session start");
					oSipSessionMessage=e.newSession;
					oSipSessionMessage.accept();
					oSipSessionMessage.setConfiguration(oConfigMsg);
					 var str = (oSipSessionMessage.getRemoteFriendlyName() || 'unknown');
									
					 var firstString=str.replace("<","");
					 var sRemoteUri=firstString.replace(">","");
					 var doc=e.getContentString();
					 //alert("content is"+doc);
					 var fstring=str+doc;
					 chkURI.push(fstring);
					 var cont=doc.split("[");
					 /* chkMSG.push(doc); */
					 var b="sip:";
					 var c =b.concat(sRemoteUri);
					 var a="@";
					 var d=a.concat("tcs.com");
					 var f=c.concat(d);
					 /*document.getElementById("msg").value=doc;*/
					 //code for jqurey
					 document.getElementById("uri").value =str;
					 //document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
					 document.getElementById("textArea").value += str+" : "+cont[0]+ "\n" ;
					 //sendDataToDiv(str,cont[0]);
					 /*document.getElementById("msg").value=doc;*/	
			  	}
            		break;
			}
            case 'i_new_call':
                {
                    if (oSipSessionCall) {
                        // do not accept the incoming call if we're already 'in call'
                       // e.newSession.hangup(); // comment this line for multi-line support
                    }
                    else {
                    	//alert("incoming call");
                    	
                        oSipSessionCall = e.newSession;
                        // start listening for events
                        oSipSessionCall.setConfiguration(oConfigCall);

                        uiBtnCallSetText('Answer');
                        btnHangUp.value = 'Reject';
                        btnCall.disabled = false;
                        btnHangUp.disabled = false;

                        startRingTone(); 
                        customOpenModal('callModal');
                        var sRemoteNumber = (oSipSessionCall.getRemoteFriendlyName() || 'unknown');                        
                        txtCallStatus.innerHTML = "<i>Incoming call from [<b>" + sRemoteNumber + "</b>]</i>";
                        
                        showNotifICall(sRemoteNumber);
                    }
                    break;
                }

            case 'm_permission_requested':
                {
                    divGlassPanel.style.visibility = 'visible';
                    break;
                }
            case 'm_permission_accepted':
            case 'm_permission_refused':
                {
                    divGlassPanel.style.visibility = 'hidden';
                    if(e.type == 'm_permission_refused'){
                        uiCallTerminated('Media stream permission denied');
                    }
                    break;
                }

            case 'starting': default: break;
        }
    };

    function dummyUnregister(){
    	  window.localStorage.setItem('com.s.v.bool', "false");
    	  sipUnRegister();
    }
    
    function dummyRegister(){
      	if (window.localStorage.getItem('com.s.v.bool')=="true") {
      		setTimeout(function(){sipRegister();},700);     		
      	}      	
    }
    
    // Callback function for SIP sessions (INVITE, REGISTER, MESSAGE...)
    function onSipEventSession(e /* SIPml.Session.Event */) {
        tsk_utils_log_info('==session event = ' + e.type);

        switch (e.type) {
            case 'connecting': case 'connected':
                {
                    var bConnected = (e.type == 'connected');
                    
                    if (e.session == oSipSessionRegister) {
                        uiOnConnectionEvent(bConnected, !bConnected);
                        txtRegStatus.innerHTML = "<i>" + e.description + "</i>";
                    }
                    
                    else if (e.session == oSipSessionCall) {
                        btnHangUp.value = 'HangUp';
                        btnCall.disabled = true;
                        btnHangUp.disabled = false;
                        btnTransfer.disabled = false;

                        if (bConnected) {
                            stopRingbackTone();
                            stopRingTone();

                            if (oNotifICall) {
                                oNotifICall.cancel();
                                oNotifICall = null;
                            }
                        }

                        txtCallStatus.innerHTML = "<i>" + e.description + "</i>";
                        divCallOptions.style.opacity = bConnected ? 1 : 0;

                        if (SIPml.isWebRtc4AllSupported()) { // IE don't provide stream callback
                            uiVideoDisplayEvent(true, true);
                            uiVideoDisplayEvent(false, true);
                        }
                    }
                    break;
                } // 'connecting' | 'connected'
            case 'terminating': case 'terminated':
                {
                    if (e.session == oSipSessionRegister) {
                        uiOnConnectionEvent(false, false);

                        oSipSessionCall = null;
                        oSipSessionRegister = null;

                        txtRegStatus.innerHTML = "<i>" + e.description + "</i>";
                    }
                    else if (e.session == oSipSessionCall) {
                        uiCallTerminated(e.description);
                    }
                    break;
                } // 'terminating' | 'terminated'

            case 'i_notify': {
				//alert("inside notify"+e.getContentString());
				console.info('NOTIFY content = ' + e.getContentString());
				console.info('NOTIFY content-type = ' + e.getContentType());
	
				if (e.getContentType() == 'application/pidf+xml') {
					// alert("inside notifywww"); 
					if (window.DOMParser) {
						var parser = new DOMParser();
						var xmlDoc = parser ? parser.parseFromString(e
								.getContentString(), "text/xml") : null;
			
						var presenceNode = xmlDoc ? xmlDoc
								.getElementsByTagName("presence")[0] : null;
								/* alert("inside presence"+presenceNode); */
						if (presenceNode) {
							var entityUri = presenceNode.getAttribute("entity");
			
							/* alert("entity uri is" + entityUri); */
							var tupleNode = presenceNode
									.getElementsByTagName("tuple")[0];
								
							var statusNode = tupleNode
									.getElementsByTagName("status")[0];
			
							if (tupleNode) {
								var statusNode = tupleNode
										.getElementsByTagName("status")[0];
					
								var noteNode = tupleNode
										.getElementsByTagName("note")[0];
			
								      var check = noteNode.textContent;
								     // alert("check is"+check);
								
									    // check ip of currenty serer from file 
									 	//var pathOfFileToRead = "/home/altanai/altanaiwkspace/presentation_server_config.txt";
									    
										//alert (" server ip" + serverip );
									 //-----------
								alert("check is"+check);
								if (check ==="") {
									
									var i=0;
										infoArray[i]=new Array();
										infoArray[i][0]=entityUri;
										infoArray[i][1]="offline";
										
									     //alert("value of users is"+infoArray[i][0]);
										//alert("value of status"+infoArray[i][1]); 
										//alert("server ip "+ipcontentsOfFileAsString);
										xmlHttpRequest.open("POST", "PresenceServlet?friend1="+infoArray[i][0]+"&friend1status="+infoArray[i][1], true);
										xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
										xmlHttpRequest.send();
										i++;
			
								} 
								else {
									//alert("inside online"); 
								
									infoArray=new Array(20);
									for(i=0;i<infoArray.length;i++)
										{
										alert("i_notify");
										infoArray[i]=new Array(20);
										infoArray[i][0]=entityUri;
										infoArray[i][1]="online";
										
										xmlHttpRequest.open("POST", "PresenceServlet?friend1="+infoArray[i][0]+"&friend1status="+infoArray[i][1], true);
										xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
										xmlHttpRequest.send();
										}
									// alert("status is"+infoArray[0][1]);
									//alert("entity is"+infoArray[0][1]); 
								}
								
								
								if (statusNode) {
									var basicNode = statusNode
											.getElementsByTagName("basic")[0];
			
									if (basicNode) {
			
										console
												.info('Presence notification: Uri = '
														+ entityUri
														+ ' status = '
														+ basicNode.textContent);
									}
								}
							}
						}
					}
				}
				break;
			}
			  
            case 'm_stream_video_local_added':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(true, true);
                    }
                    break;
                }
            case 'm_stream_video_local_removed':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(true, false);
                    }
                    break;
                }
            case 'm_stream_video_remote_added':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(false, true);
                    }
                    break;
                }
            case 'm_stream_video_remote_removed':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(false, false);
                    }
                    break;
                }

            case 'm_stream_audio_local_added':
            case 'm_stream_audio_local_removed':
            case 'm_stream_audio_remote_added':
            case 'm_stream_audio_remote_removed':
                {
                    break;
                }

            case 'i_ect_new_call':
                {
                    oSipSessionTransferCall = e.session;
                    break;
                }

            case 'i_ao_request':
                {
                    if(e.session == oSipSessionCall){
                        var iSipResponseCode = e.getSipResponseCode();
                        if (iSipResponseCode == 180 || iSipResponseCode == 183) {
                            startRingbackTone();
                            txtCallStatus.innerHTML = '<i>Remote ringing...</i>';
                        }
                    }
                    break;
                }

            case 'm_early_media':
                {
                    if(e.session == oSipSessionCall){
                        stopRingbackTone();
                        stopRingTone();
                        txtCallStatus.innerHTML = '<i>Early media started</i>';
                    }
                    break;
                }

            case 'm_local_hold_ok':
                {
                    if(e.session == oSipSessionCall){
                        if (oSipSessionCall.bTransfering) {
                            oSipSessionCall.bTransfering = false;
                            // this.AVSession.TransferCall(this.transferUri);
                        }
                        btnHoldResume.value = 'Resume';
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Call placed on hold</i>';
                        oSipSessionCall.bHeld = true;
                    }
                    break;
                }
            case 'm_local_hold_nok':
                {
                    if(e.session == oSipSessionCall){
                        oSipSessionCall.bTransfering = false;
                        btnHoldResume.value = 'Hold';
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Failed to place remote party on hold</i>';
                    }
                    break;
                }
            case 'm_local_resume_ok':
                {
                    if(e.session == oSipSessionCall){
                        oSipSessionCall.bTransfering = false;
                        btnHoldResume.value = 'Hold';
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Call taken off hold</i>';
                        oSipSessionCall.bHeld = false;

                        if (SIPml.isWebRtc4AllSupported()) { // IE don't provide stream callback yet
                            uiVideoDisplayEvent(true, true);
                            uiVideoDisplayEvent(false, true);
                        }
                    }
                    break;
                }
            case 'm_local_resume_nok':
                {
                    if(e.session == oSipSessionCall){
                        oSipSessionCall.bTransfering = false;
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Failed to unhold call</i>';
                    }
                    break;
                }
            case 'm_remote_hold':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Placed on hold by remote party</i>';
                    }
                    break;
                }
            case 'm_remote_resume':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Taken off hold by remote party</i>';
                    }
                    break;
                }

            case 'o_ect_trying':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer in progress...</i>';
                    }
                    break;
                }
            case 'o_ect_accepted':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer accepted</i>';
                    }
                    break;
                }
            case 'o_ect_completed':
            case 'i_ect_completed':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer completed</i>';
                        btnTransfer.disabled = false;
                        if (oSipSessionTransferCall) {
                            oSipSessionCall = oSipSessionTransferCall;
                        }
                        oSipSessionTransferCall = null;
                    }
                    break;
                }
            case 'o_ect_failed':
            case 'i_ect_failed':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer failed</i>';
                        btnTransfer.disabled = false;
                    }
                    break;
                }
            case 'o_ect_notify':
            case 'i_ect_notify':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = "<i>Call Transfer: <b>" + e.getSipResponseCode() + " " + e.description + "</b></i>";
                        if (e.getSipResponseCode() >= 300) {
                            if (oSipSessionCall.bHeld) {
                                oSipSessionCall.resume();
                            }
                            btnTransfer.disabled = false;
                        }
                    }
                    break;
                }
            case 'i_ect_requested':
                {
                    if(e.session == oSipSessionCall){                        
                        var s_message = "Do you accept call transfer to [" + e.getTransferDestinationFriendlyName() + "]?";//FIXME
                        if (confirm(s_message)) {
                            txtCallStatus.innerHTML = "<i>Call transfer in progress...</i>";
                            oSipSessionCall.acceptTransfer();
                            break;
                        }
                        oSipSessionCall.rejectTransfer();
                    }
                    break;
                }
        	}
   	 }
</script>
<script>
function openSettings(){
	window.location = "expert.htm";
}
</script>
</head>
<body >
	<div class="header">
		<p>	<img src="images/images.jpg"/>
			WebRTC
			<a href="<%=request.getContextPath() %>/Controller?action=logout"><font color="#ffffff">Logout</font></a>
		</p>
	</div>
		
	<center><div class="navbar">
		<input type="button" class="btn" value="Enable Calls" id="btnRegister"
			style="width: 100px;" onclick='sipRegister();' /> 			
		<input type="button" id="btnUnRegister" class="btn" style="width: 140px;"
			value="Go in Offline Mode" disabled onclick='dummyUnregister();' />
		<input type="button" class="btn" value="Publish My Status"
			style="width: 130px;" onclick='sipPublis("publish")' />
		<input type="button" class="btn" style="width: 100px;" value="Check Status"
			onclick='sipSubscribe()' /> 
		<input type="button" class="btn" style="width: 100px;" value="Settings"
			onclick='openSettings()' /> 
		<!-- <a href="expert.htm" target="_blank"><font style="padding-left: 20px;" size="4px" color="#ffffff">Settings</font></a> -->
	</div></center>

	 <div id="callModal" class="reveal-modal xlarge">
		<h2>CALL CONTROL BOX</h2>
		<a class="close-reveal-modal">&#215;</a>
		
		<div id="divCallCtrl" class="span7 well" style='display:table-cell; vertical-align:middle' style="background-color:#DDA0DD" >
			<table>
				<tr>
					<td><img id="userImage" style="width: 120px; height: 120px; margin-left: 7%; margin-top: 5%;"></td>
					<td><label style="margin-left: 9%; font-size: 15px;"><%=login1.getPrivateIdentity().toString()%></label></td>
				</tr>                        
            </table> 
            <label id="txtRegStatus" style="margin-left: 1.2%;padding-top: 1%;padding-bottom: 1%;"></label>
            <label style="width: 100%;" align="center" id="txtCallStatus"> </label>
            <table style='width: 100%;'>
                  <tr>                     
                       <td style="white-space:nowrap;">
                       <input type="text" style="width: 100%; height:100%" id="txtPhoneNumber" value="" />                       
                      </td>                         
                   </tr>
               
                   <tr>
                      <td colspan="1" align="right">
                          <div class="btn-toolbar"
								style="margin: 0; vertical-align: middle">
								<div id="divBtnCallGroup" class="btn-group open">
									<button id="btnCall" onclick="setVisibility();" class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown"
										value="Call &lt;span id=&quot;spanCaret&quot; class=&quot;caret&quot;&gt;">
										Call <span id="spanCaret" class="caret"></span>
									</button>
									
									<ul id="ulCallOptions" class="dropdown-menu"
										style="visibility: hidden;">
										<li><a href="#"
											onclick="sipCall(&quot;call-audio&quot;);">Audio</a></li>
										<li><a href="#"
											onclick="sipCall(&quot;call-audiovideo&quot;);">Video</a></li>		
									</ul>
								</div>
					
								<div class="btn-group">
									<input type="button" id="btnHangUp"
										style="margin: 0; vertical-align: middle; height: 100%;"
										class="btn btn-primary" value="HangUp" onclick="sipHangUp();"
										disabled="">
								</div>
								
							</div>                  
                         </td>               
					</tr>											
                    <tr>
                        <td id="tdVideo" class='tab-video'>
                            <div id="divVideo" class='div-video'>
                                <div id="divVideoRemote" style='border:1px solid #000; height:100%; width:100%'>
                                    <video class="video" width="100%" height="100%" id="video_remote" autoplay="autoplay" style="opacity: 0; 
                                        background-color: #000000; -webkit-transition-property: opacity; -webkit-transition-duration: 2s;">
                                    </video>
                                </div>
                                <div id="divVideoLocal" style='border:0px solid #000'>
                                    <video class="video" width="88px" height="72px" id="video_local" autoplay="autoplay" muted="true" style="opacity: 0;
                                        margin-top: -80px; margin-left: 5px; background-color: #000000; -webkit-transition-property: opacity;
                                        -webkit-transition-duration: 2s;">
                                    </video>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                       <td align='center'>
                            <div id='divCallOptions' class='call-options' style='opacity: 0; margin-top: 3px'>
                                <input type="button" class="btn" style="" id="btnFullScreen" value="FullScreen" disabled onclick='toggleFullScreen();' /> &nbsp;
                                <input type="button" class="btn" style="" id="btnHoldResume" value="Hold" onclick='sipToggleHoldResume();' /> &nbsp;
                                <input type="button" class="btn" style="" id="btnTransfer" value="Transfer" onclick='sipTransfer();' /> &nbsp;
                                <input type="button" class="btn" style="" id="btnKeyPad" value="KeyPad" onclick='openKeyPad();' />
                            </div>
                        </td>
                    </tr>
                </table>
        </div>
           
        <div id="divMsgCtrl" class="span6 well"  style="margin-left:65%;" style='display:table-cell;' style="background-color:#DDA0DD; position:fixed;">
 			  <table>			        
					<tr><td>  To      : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="uri" placeholder="Enter username eg: John" onblur="chatValidation();" />
					 		<label style="width: 100%;" align="center" id="chatField"></label></td>  
					</tr>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea id="textArea" disabled="disabled"  rows="6" cols="30" style="background-color:#FFFFFF;"></textarea></td></tr>	
					<tr><td><font color="#000000">Chat:</font>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="msg" placeholder="Press enter to submit" onKeyPress="enterpressalert(event)"/></td>
					</tr>
				</table>
		</div>
        <div id='divKeyPad' class='span2 well div-keypad' style="left:0px; top:0px; width:400; height:200; visibility:hidden">
        	<table style="width: 100%; height: 100%">
	            <tr><td><input type="button" style="width: 50px" class="btn" value="1" onclick="sipSendDTMF('1');"/><input type="button" style="width: 50px" class="btn" value="2" onclick="sipSendDTMF('2');"/><input type="button" style="width: 50px" class="btn" value="3" onclick="sipSendDTMF('3');"/></td></tr>
	            <tr><td><input type="button" style="width: 50px" class="btn" value="4" onclick="sipSendDTMF('4');"/><input type="button" style="width: 50px" class="btn" value="5" onclick="sipSendDTMF('5');"/><input type="button" style="width: 50px" class="btn" value="6" onclick="sipSendDTMF('6');"/></td></tr>
	            <tr><td><input type="button" style="width: 50px" class="btn" value="7" onclick="sipSendDTMF('7');"/><input type="button" style="width: 50px" class="btn" value="8" onclick="sipSendDTMF('8');"/><input type="button" style="width: 50px" class="btn" value="9" onclick="sipSendDTMF('9');"/></td></tr>
	            <tr><td><input type="button" style="width: 50px" class="btn" value="*" onclick="sipSendDTMF('*');"/><input type="button" style="width: 50px" class="btn" value="0" onclick="sipSendDTMF('0');"/><input type="button" style="width: 50px" class="btn" value="#" onclick="sipSendDTMF('#');"/></td></tr>
	            <tr><td colspan=3><input type="button" style="width: 100%" class="btn btn-medium btn-danger" value="close" onclick="closeKeyPad();" /></td></tr>
        	</table>
    	</div>    	
	</div>
	<!--callModal ends here  -->
		
	<!-- Hidden fields for calling -->
	<input type="hidden" style="width: 100%; height: 100%" id="txtRealm"
		value="<%=login1.getRealm().toString()%>" autocomplete='off' />
	<input type="hidden" style="width: 100%; height: 100%"
		id="txtPrivateIdentity" value="<%=login1.getPublicIdentity().toString()%>" autocomplete='off' />
	<input type="hidden" style="width: 100%; height: 100%"
		id="txtPublicIdentity" value="<%=login1.getPrivateIdentity().toString()%>" autocomplete='off' />
	   <input type="hidden" style="width: 100%; height: 100%" id="txtPassword"
		value="<%=login1.getPassword().toString()%>" autocomplete='off' /> 
	<input type="hidden" style="width: 100%; height: 100%"
		id="txtDisplayName" value="<%=login1.getDisplayName().toString()%>" autocomplete='off' />
	
	<div id="videoConferenceModal" class="reveal-modal">
		<h2>Video Conferencing</h2>
		<p> conferencing here</p>
		<a class="close-reveal-modal">&#215;</a>
    </div> 
    <!--videoConferenceModal ends here  -->
	
	<div id="callLogModal" class="reveal-modal">
		<h2>CALL LOGS CONTROL BOX</h2>		
		<a class="close-reveal-modal">&#215;</a>
		<% SipCallLogDao dao=new SipCallLogDao();
		 ArrayList<CallLogs> callLog=dao.viewAllLogs(login1);
		%>
		</br>
		<table width="75%" align="center" border="1" cellspacing="0" cellpadding="0" id="results" class="table1 table">
        <tr>
            <th>Caller</th>
            <th>Callee</th>
            <th>Day</th>
            <th>Start Time</th>
            <th>End Time</th>
        </tr>
        <%
        for(CallLogs call:callLog)
        { 
        %>
        <tr>
            <td><%=call.getCaller() %></td>
            <td><%=call.getCallee() %></td>
            <td><%=call.getDayOfCall()%></td>
            <td><%=call.getStartTime()%></td>
            <td><%=call.getEndTime()%></td>
        </tr>
        <%} %>
 		</table>  
 		</br>
 		<div id="pageNavPosition" align="center" style="padding-center:150px;"></div> 		
	</div>
	<!--callLogModal ends here  -->
	
	<div id="historyModal" class="reveal-modal">
		<h2>HISTORY BOX</h2>
		<p>history here...</p>
		<a class="close-reveal-modal">&#215;</a>
	</div>
	<!--callLogModal ends here  -->
	
	<script type="text/javascript">
		function viewprofile(){
			var friend=document.getElementById("friend").value;
			//alert("friend "+friend)
			window.location="<%=request.getContextPath()%>/Controller?action=viewfriend&friend="+friend+"";		
		}
		var xmlHttpRequest;
		if(window.XMLHttpRequest){
			xmlHttpRequest=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
			xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
		} 
		<%-- function getFriend(){
			alert($("#data").val());
			alert("In get Friend");
			var sipUri="";
			var friends = document.getElementsByName('friend');
			for(var i = 0; i < friends.length; i++){
			    if(friends[i].checked){
			    	sipUri = friends[i].value;
			    }
			}
			alert(sipUri);
			xmlHttpRequest.open("post","<%=request.getContextPath()%>/Controller?action=viewFriend&friend="+sipUri+"",true);
			xmlHttpRequest.onreadystatechange=responseFromServlet;
			xmlHttpRequest.send();			
		}
		 --%>
		
		 function getFriend(){
				
				//alert($("#data").val());
				//alert("In get Friend");
				var sipUri="";
				var friends = document.getElementsByName('friend');
				for(var i = 0; i < friends.length; i++){
				    if(friends[i].checked){
				    	sipUri = friends[i].value;
				    }
				   
				}
				if (sipUri==null || sipUri=="")
				{
					document.getElementById("user-error").innerHTML="Select from the given list";
					
				}
				else
					{
					document.getElementById("user-error").innerHTML="";
				//alert(sipUri);
				document.getElementById("displayDetails").style.display="";
				xmlHttpRequest.open("post","<%=request.getContextPath()%>/Controller?action=viewFriend&friend="+sipUri+"",true);
				xmlHttpRequest.onreadystatechange=responseFromServlet;
				xmlHttpRequest.send();
					}
				
			}
		
		function updateProfile()
		{
			//alert("in updateProfile()");
			var displayName=document.getElementById("displayName").value;
			var publicIdentity=document.getElementById("publicIdentity").value;
			var realm=document.getElementById("realm2").value;
			//alert(realm);
			var privateIdentity=document.getElementById("privateIdentity").value;
			xmlHttpRequest1.open("POST","<%=request.getContextPath()%>/Controller?action=updateProfile&displayName="+displayName+"&publicIdentity="+publicIdentity+"&realm="+realm+"&privateIdentity="+privateIdentity+"",true);
			xmlHttpRequest1.onreadystatechange=responseForUpdatedData;
			xmlHttpRequest1.send();		
		}
		function responseForUpdatedData()
		{
			//alert("In responseForUpdatedData");
			if(xmlHttpRequest1.readyState==4&&xmlHttpRequest1.status==200){
				 var JSONObject=new Object();
				 JSONObject=eval('('+xmlHttpRequest1.responseText+')');
				 //alert(JSONObject.recordUpdated.DisplayNameUpdated);
				 document.getElementById("displayName").value=JSONObject.recordUpdated.DisplayNameUpdated ; 
				 document.getElementById("publicIdentity").value=JSONObject.recordUpdated.PublicIdentityUpdated ; 
			
				 document.getElementById("realm2").value=JSONObject.recordUpdated.RealmUpdated ;
				 document.getElementById("spanId").value=JSONObject.recordUpdated.PublicIdentityUpdated ; 
			}
		}
		function responseFromServlet(){
			//alert("IN RESPONSE FROM SERVLET");
			//alert(xmlHttpRequest.readyState);
			if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
				 var JSONObject=new Object();
				 JSONObject=eval('('+xmlHttpRequest.responseText+')');
				 //alert(JSONObject.record.DisplayName);
				 document.getElementById("displayName1").value=JSONObject.record.DisplayName ; 
				 document.getElementById("publicIdentity1").value=JSONObject.record.PublicIdentity ; 
				 document.getElementById("privateIdentity1").value=JSONObject.record.PrivateIdentity ; 
				 document.getElementById("realm1").value=JSONObject.record.Realm ;
				 <%-- alert('<%=request.getContextPath()%>/Controller?id='+JSONObject.record.PrivateIdentity+'&action=getProfilePic'); --%>
				 document.getElementById("friendImage").src='<%=request.getContextPath()%>/Controller?id='+JSONObject.record.PrivateIdentity+'&action=getProfilePic';
				 //alert(document.getElementById("friendImage").src);  
			}
		}
		function addFriend()
		{
			//alert("In addFriend");
			var notFriend=document.getElementById("notfriend").value;
			var privateIdentity=document.getElementById("privateIdentity").value;
			var password=document.getElementById("txtPassword").value;
			//alert(notFriend);
			xmlHttpRequest.open("post","<%=request.getContextPath()%>/Controller?action=addFriend&notfriend="+notFriend+"&privateIdentity="+privateIdentity+"&password="+password+"",true);
			xmlHttpRequest.onreadystatechange=responseFromServlet;
			xmlHttpRequest.send();
		}
		function videoConf(){
			window.open('conferencing12.jsp','Popup','width=750,height=500');
		}	
		function openLink()
		{
			window.open('OpenLink.jsp', 'Popup', 'height:60px, width:20px');
		}
	</script>
	<script type="text/javascript">
	
var timer=setInterval(function(){
		
		var privateIdentity=document.getElementById("privateIdentity").value;
		var password=document.getElementById("txtPassword").value;
		xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?

action=getFreshData&privateIdentity="+privateIdentity+"&password="+password,false);
		xmlHttpRequest2.onreadystatechange=responseFromServletForRefresh;
		xmlHttpRequest2.send();
		
	},10000);
	
	function responseFromServletForRefresh(){
		
		if(xmlHttpRequest2.readyState==4&&xmlHttpRequest2.status==200)
		{
			document.getElementById("frndDiv").innerHTML=""; // dynamo woh div h jisme tumahri lists display ho rhin h
			document.getElementById("notFrndDiv").innerHTML="";
			var heading=$('<h6 style="margin-left: 20%">People in your phone book</h6>')
			var heading1=$('<h6 style="margin-left: 20%">People you may know</h6>')
			heading.appendTo('#frndDiv');
			heading1.appendTo('#notFrndDiv');
			var table=$('<table id="frndTable" class="table1 table"></table>');
			var jsonResponseFromServer=eval('('+xmlHttpRequest2.responseText+')');
			var i=0;
			$.each(jsonResponseFromServer.Friends, function(key, val) {
				 var tr=$('<tr></tr>');
				 i++;
				
				$.each(val, function(k, v){
					
					if(k.match("NAME")){
						$('<td><input type="radio" name="friend" id="friends'+i+'" value="'+v+'">'+v+'</td>').appendTo(tr);
					}
					else{
						if("offline".match(v)){
							$('<td><img src="images/offline.gif" style="width: 10px;height: 10px;"</td>').appendTo(tr);
						}
						else
							{
							$('<td><img src="images/online.png" style="width: 10px;height: 10px;"</td>').appendTo(tr);
							}
					}
		    	});
				tr.appendTo(table);
			});
			table.appendTo('#frndDiv');
			
			
			
			var j=0;
			var table1=$('<table id="notFrndTable" class="table1 table"></table>');
			$.each(jsonResponseFromServer.NotFriends,function(key,val)
					{
					var tr=$('<tr></tr>');
					 j++;
					$.each(val, function(k, v){
					$('<td><input type="radio" name="notfriend" 

id="friends'+j+'" value="'+v+'">'+v+'</td>').appendTo(tr);
		    	});
				tr.appendTo(table1);
					});
			table1.appendTo('#notFrndDiv');
		} 
	 }	
	
	
	
	 function addToFriendList()
	 {
		
		 //alert(xmlHttpRequest2);
			//alert("In addFriend");
			 var notFriend1=document.getElementsByName("notfriend");
			// alert("Hell");
			for(var i = 0; i < notFriend1.length; i++){
			    if(notFriend1[i].checked){
			    	friend = notFriend1[i].value;
			 
			    }
			} 
		   	//alert(friend);
			var privateIdentity=document.getElementById("privateIdentity").value;
			//alert(privateIdentity);
			var password=document.getElementById("txtPassword").value;
			//alert(password);
			xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?action=addFriend&privateIdentity="+privateIdentity+"&friendPrivateIdentity="+friend+"&password="+password+"",false);
			xmlHttpRequest2.onreadystatechange=responseFromServletForAddFrd;
			xmlHttpRequest2.send();
			
	} 
		 function responseFromServletForAddFrd(){
			 
				if(xmlHttpRequest2.readyState==4&&xmlHttpRequest2.status==200)
				{
					document.getElementById("frndDiv").innerHTML=""; // dynamo woh div h jisme tumahri lists display ho rhin h
					document.getElementById("notFrndDiv").innerHTML="";
					var heading=$('<h6 style="margin-left: 20%">People in your phone book</h6>')
					var heading1=$('<h6 style="margin-left: 20%">People you may know</h6>')
					heading.appendTo('#frndDiv');
					heading1.appendTo('#notFrndDiv');
					var table=$('<table id="frndTable" class="table1 table"></table>');
					var jsonResponseFromServer=eval('('+xmlHttpRequest2.responseText+')');
					var i=0;
					$.each(jsonResponseFromServer.Friends, function(key, val) {
						 var tr=$('<tr></tr>');
						 i++;
						
						$.each(val, function(k, v){
							
							if(k.match("NAME")){
								$('<td><input type="radio" name="friend" id="friends'+i+'" value="'+v+'">'+v+'</td>').appendTo(tr);
							}
							else{
								if("offline".match(v)){
									$('<td><img src="images/offline.gif" style="width: 10px;height: 10px;"</td>').appendTo(tr);
								}
								else
									{
									$('<td><img src="images/online.png" style="width: 10px;height: 10px;"</td>').appendTo(tr);
									}
							}
				    	});
						tr.appendTo(table);
					});
					table.appendTo('#frndDiv');
					
					
					
					var j=0;
					var table1=$('<table id="notFrndTable" class="table1 table"></table>');
					$.each(jsonResponseFromServer.NotFriends,function(key,val)
							{
							var tr=$('<tr></tr>');
							 j++;
							$.each(val, function(k, v){
							$('<td><input type="radio" name="notfriend" id="friends'+j+'" value="'+v+'">'+v+'</td>').appendTo(tr);
				    	});
						tr.appendTo(table1);
							});
					table1.appendTo('#notFrndDiv');
				} 
			 }
	
	</script>
	<script type="text/javascript">
		 function callFunc()
		 {
			 var id="";
			 var sipUri="";
				var friends = document.getElementsByName('friend');
				for(var i = 0; i < friends.length; i++)
				{
				    if(friends[i].checked)
				    {
				    	sipUri = friends[i].value;
				    }				   
				}
				if (sipUri==null || sipUri=="")
				{
					document.getElementById("user-error").innerHTML="Select from the given list";					
				}
				else
				{
					document.getElementById("user-error").innerHTML="";
					document.getElementById("txtPhoneNumber").value=sipUri;
					customOpenModal('callModal');		
				}
		 }
		 function messageFunc()
		 {
			 var id="";
			 var sipUri="";
				var friends = document.getElementsByName('friend');
				for(var i = 0; i < friends.length; i++)
				{
				    if(friends[i].checked)
				    {
				    	sipUri = friends[i].value;
				    }
				   
				}
				if (sipUri==null || sipUri=="")
				{
					document.getElementById("user-error").innerHTML="Select from the given list";
					
				}
				else
					{
					document.getElementById("user-error").innerHTML="";
					document.getElementById("uri").value=sipUri;
					customOpenModal('callModal');
				
					}
		 }
		 function showHide(){
			 
		 }
	</script>
		
	<div id="userProfile" class="reveal-modal">
	<h2>YOUR PROFILE</h2>
	<a class="close-reveal-modal">&#215;</a>
		<fieldset>
			<div style="height: 100%;width: 100%;" align="center">
				<table style="height: 80%;width: 60%; margin-top:20px;">
				<tr><td style="color:#000000;font-size: 13px;">Profile Picture</td>
				<td><img id="userImage3" style="width: 120px; height: 100px;margin-bottom: 10px;"></td>
				</tr>
				<tr><td style="color:#000000;font-size: 13px;">Display Name</td>
					<td><input type="text" id="displayName" name="displayName" value=<%=login1.getDisplayName()%> class="round full-width-input"/></td>
				</tr>
				<tr><td style="color:#000000;font-size: 13px;">Public Identity</td>
					<td><input type="text" id="publicIdentity" name="publicIdentity" value=<%=login1.getPublicIdentity()%> class="round full-width-input"/></td>
				</tr>
				<tr><td style="color:#000000;font-size: 13px;">Private Identity</td>
					<td><input type="text" id="privateIdentity" name="privateIdentity" value=<%=login1.getPrivateIdentity() %> class="round full-width-input" readonly="readonly"/></td>
				</tr>
				<tr><td style="color:#000000;font-size: 13px;">Realm</td>
					<td> <input type="text" id="realm2" name="realm" value=<%=login1.getRealm() %>	class="round full-width-input"/></td>
				</tr>
				</table>
			</div>
			<div style="margin-top: 5%;height: 100%;width: 100%;" align="center">
				<input type="submit" name="updateProfile" value="UpdateProfile" onclick="updateProfile();" class="button"/>
			</div>
				<div style="margin-top: 5%;height: 100%;width: 100%;" align="center">
						<a onclick="openLink();">Link other accounts</a></div>
		</fieldset><br/>
	</div>
	<!--userProfile ends here  -->
	
	<div id="friendList" class="reveal-modal" >
	<h2>PHONE BOOK</h2>	
	<a class="close-reveal-modal">&#215;</a>
	<div style="width: 45%; float: left;margin-top:20px;">
	<div style="height:45%;max-height:10%;">
		
		<div style="height: 4%;">&nbsp;&nbsp;&nbsp;<span style="color: red;" id="user-error"></span></div>
		<div style="height: 70%;padding-top:2%;overflow: auto;" id="frndDiv">
		<h6 style="margin-left: 20%;height: 6%">People in your phone book</h6>
		    <table class="table1 table" border="1" id="frndTable">
		   
		     <%if(friendList!=null){
	    	/*   for(String curentFriend: friendList){
	    	System.out.println(curentFriend); */
	    	ArrayList<String> status=(ArrayList<String>)login1.getPresenceStatus();
	    	for(int i=0;i<friendList.size();i++)
	    	{
	    		String statusCheck=status.get(i);
	    	
	  
	    	%>
	    <tr><td>
	    <input type="radio" name="friend" id="friend" value="<%=friendList.get(i)%>"><font><%=friendList.get(i) %><br>
		</td>
		<td><%if("offline".equalsIgnoreCase(statusCheck)) %><img src="images/offline.gif" style="width: 10px;height: 10px;"><%else %><img src="images/online.png" style="width: 10px;height: 10px;"></td>
		</tr>
		<%} }%>

		</table>
			</div>
			</div>
				<div style="height:50%; margin-top: 5%" id="notFrndDiv">
			<h6 style="margin-left: 20%">People you may know</h6>
			 <table class="table1 table" id="notFrndTable">
		    <%if(notFriend!=null){
		    for(String currentNotFriend: notFriend){
		    	//System.out.println(currentNotFriend);
		    	%>
		    <tr><td>
		    <input type="radio" name="notfriend" id="notfriend" value="<%=currentNotFriend%>"><%=currentNotFriend %><br>
			</td>
			</tr>
			<%} }%>
			</table>		
		</div>
		</div>
		
		<div style="width: 50%; margin-left:5%; float: right ;margin-top:20px;">
		<div style="height: 30%;">
		<button style="width: 50px; margin-right: 5px;" id="call" class="button" onclick="callFunc();">Call</button>
		<button style="width: 60px; margin-right: 5px;" id="message" class="button" onclick="messageFunc();">Message</button>
		<button style="width: 50px; margin-right: 5px;"id="view" onclick="getFriend();" class="button">View</button>
		<button style="width: 50px; margin-right: 5px;" id="add" onclick="addToFriendList();" class="button">Add </button>
		</div>
		<div style="height: 65%;display: none" id="displayDetails">
			<table style="margin-top:5%;">
				<tr><td><label for="login-username">Name</label></td>
		    	    <td><input type="text" id="displayName1" name="displayName1"  class="round full-width-input" readonly="readonly"/></td>		
				</tr>
				<tr><td><label for="login-username">PublicIdentity</label></td>
					<td><input type="text" id="publicIdentity1" name="publicIdentity1"  class="round full-width-input" readonly="readonly" /></td>
				</tr>
				<tr><td><label for="login-username">PrivateIdentity</label></td>
				<td><input type="text" id="privateIdentity1" name="privateIdentity1"  class="round full-width-input" readonly="readonly"/></td>
				</tr>
				<tr><td><label for="login-username">Realm</label></td>
				<td><input type="text" id="realm1" name="realm1" class="round full-width-input" readonly="readonly"/></td>
				</tr>		
				<tr><td>Profile Pic:</td><td><img id="friendImage"  style="width:100px;height: 80px;"></td>
				</tr>
			</table>
		</div>
	</div>		
	</div>
	<!-- friendList ends here -->	
	
	
	<div id="geoLocationModal" class="reveal-modal xlarge">
		<h2>GEOLOCATION BOX</h2>
		<a class="close-reveal-modal">&#215;</a>
		<table align="center" style="padding-top:15px;">
			<tr>
				<td align="center" style="padding-right:15px;">
				<input type="radio" name="showLoc" value="Show My Location" checked="checked">Show My Location<br/></td>
				<td align="center" style="padding-right:15px;">
				<input type="radio" name="showLoc" value="Show Friends' Location">Show Friends' Location</td>
			</tr>		
		</table>
		<div id="shareMyLoc" style="display:block;">
			<table align="center" style="padding-top:15px;">
				<tr>
				<td align="center" style="padding-right:15px;"><input type="button" class="btn" id="shareGeoLoc" onclick="shareMyLocation();" value="Share my location"/></td>
				<td style="padding-right:15px;"><input type="text" value=<%=login1.getPrivateIdentity().toString()%> id="user" name="user"> </td>					
				<%-- <td><input type="text" value=<%=session.getAttribute("serverip")%> id="serverip" name="serverip" style="display:none"> </td> --%>
				<!-- <td><a onclick="showHide();"><font style="font-size: 15px;">View Location of Friends</font> </a></td></tr> -->
			</table> 			
		</div>
		<div style="width: 100%; height:80%;" id="map-canvas"></div>
		<div style="width: 100%; height:80%;display:none;" id="friendMap">
			<%-- <jsp:include page="/geolocationtogether.jsp" /> --%>	</div>
		<h3 align="center" id="serverReply"></h3>	
	</div> 
	<!-- geolocationModal ends here -->	
		
	<div id="offline-message-modal" class="reveal-modal">
		<h2>Offline Messages</h2>
		<a class="close-reveal-modal">&#215;</a>
		<section id="main">
		<form id="offlineMessageForm" method="post" action="<%=request.getContextPath()%>/messageServlet">
			<div align="center" style="margin-top: 20px;">
			    <table>
				    <tr>
						<td style="float:left; color: black; font-size: 15px;">To : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					    <td><div><input type="text" name="sipurireceiver" id="sipurireceiver"/></div></td>
					</tr>
				    <tr>
						<td style="float:left; color: black; font-size: 15px;">Message :</td>
						<td><div> <textarea id="message" name="message" rows="6" cols="30" style="background-color:white;"></textarea></div></td>
				     </tr>
			     </table>
			 </div>
			 <div align="center" style="margin-top: 20px;">
				<table>
					<tr>
					<td style="float:left; color: black; font-size: 15px;">Send Message via Gmail :</td>
					<td><input type="submit" name="submit" value="Send_to_gmail"></td>
					<td><img src="images/gmailIcon.jpg" width="40" height="40"></td>
					</tr>
					<tr>
					<td style="float:left; color: black; font-size: 15px;">Send Message via Facebook :</td> 
					<td><input type="submit" name="submit" value="Send_to_facebook"></td>
					<td><img src="images/facebookIcon2.png" width="40" height="40"></td>
					</tr>
					<tr>
					<td style="float:left; color: black; font-size: 15px;">Send Message via Yahoo :</td> 
					<td><input type="submit" name="submit" value="Send_to_yahoo"></td>
					<td><img src="images/yahooIcon.png" width="40" height="40"></td>
					</tr>
					<!-- Send Message via Twitter : <input type="submit" name="submit" value="Send_to_twitter">
					<img src="socialmediaimages/1382539984_social_8.png" width="40" height="40"></input>  -->
				</table>
			</div>
		</form>
		</section>
		<div style="width: 100%; height:80%;" id="map-canvas"></div>
		<h3 align="center" id="serverReply"></h3>	
	</div> 
	<!-- offlineMessages ends here -->	

	<div id="bodypat">
		<section id="container">

			<!-- BEGIN HEADER -->
			<header class="clearfix">
				<!-- BEGIN LOGO -->
				<!-- END LOGO -->
			</header>
			<!-- END HEADER -->

			<!-- BEGIN MAIN PAGE CONTENT -->
			<br /> <br /> <br />

			<div id="loader"></div>
			<!-- loader image for AJAX -->

			<section id="mainpage-mos">
				<!-- BEGIN TILE CONTENT -->
				<section id="content-mos" class="centered clearfix">
				
					<!-- Tile 1 -->
					<a href="#" data-reveal-id="userProfile" data-animation="fade">
						<div class="tile large live" data-stops="0" data-speed="3000"
							data-delay="0" data-direction="horizontal" data-stack="true">
							<div class="live-front">
								<img id="userImage1" class="live-img"/>
							</div>
							<span class="tile-cat red" id="spanId">Welcome 				
							<!-- -----------------------------------------------Profile Name to be integrated------------------------------------------------------------ -->	
							<%=login1.getPublicIdentity().toString()%></span>
							<!-- --------------------------------------------------------end---------------------------------  -->
						</div>
					</a>

					<!-- Tile 2 -->
					<a href="#" onclick="return videoConf();" data-animation="fade">
						<div class="tile medium live" data-mode="flip-list" data-stops="0,75%,100%"
							data-speed="750" data-delay="1500">
							<div class="live-front blue">
								<img class="live-img" src="images/VideoConf.png" alt="No image found" />
							</div>
							<div class="live-back blue">
								<div class="fliptile"><p>Video Conference & Group Chat</p></div>
							</div>
						</div>
					</a>
					
					<!--Tile 3 -->
					<a href="#" data-reveal-id="callLogModal" data-animation="fade">
						<div class="tile medium live" data-mode="flip" data-stops="0,75%,100%"
							data-speed="750" data-delay="1500">
							<div class="live-front mango">
								<img class="live-img" src="images/CalLog.png"
									alt="No image found" />
							</div>
							<div class="live-back mango">
								<div class="fliptile"><p>Call Logs</p></div>
							</div>
						</div>
					</a>

					<!-- Tile 4 -->
					<a href="#" data-reveal-id="analyticsModal">
						<div class="tile medium live" data-stops="0,0%,0%"
							data-speed="750" data-delay="1500">
							<div class="live-front white">
								<img class="live-img" src="images/TCSLogo.jpg"
									alt="No image found" />
							</div>
						</div>
					</a> 

					<!-- Tile 5 -->
					<a href="#" data-reveal-id="geoLocationModal" data-animation="fade">
						<div class="tile medium live" data-stops="0,75%,100%"
							data-speed="750" data-delay="1500">
							<div class="live-front red">
								<img class="live-img" src="images/Geolocation.png"
									alt="No image found" />
							</div>
							<div class="live-back red">
								<div class="fliptile"><p>Geolocation</p></div>
							</div>
						</div>
					</a>


					<!-- Tile 6 -->
					<a href="#" data-reveal-id="callModal" data-animation="fade">
						<div class="tile medium live" data-stops="0,75%,100%"
							data-speed="750" data-delay="1500">
							<div class="live-front green">
								<img class="live-img" src="images/Call.png"
									alt="No image found" />
							</div>
							<div class="live-back green">
								<div class="fliptile"><p>Call & Message</p></div>
							</div>
						</div>
					</a>

					<!-- Tile 7 -->
					 <a href="#" data-reveal-id="offline-message-modal" data-animation="fade">
						<div class="tile medium live" data-stops="0,75%,100%"
							data-speed="750" data-delay="1500">
							<div class="live-front purple">
								<img class="live-img" src="images/messaging1.jpg"
									alt="No image found" />
							</div>
							<div class="live-back purple">
								<div class="fliptile"><p>Offline Messages</p></div>
							</div>
						</div>
					</a>

					<!-- Tile 8 -->
					<a href="#" data-reveal-id="friendList" data-animation="fade">
						<div class="tile medium live" data-mode="flip" data-stops="100%"
							data-speed="750" data-delay="4000">
							<div class="live-front green">
								<img class="live-img" src="images/Contacts.png"
									alt="No image found" />
							</div>
							<div class="live-back green">
								<div class="fliptile"><p>Contacts</p></div>
							</div>
						</div>
					</a>
					<!-- END TILE CONTENT -->
				</section>
				<!-- end #content-mos -->

				<!-- BEGIN AJAX PAGINATION -->
				<div class="clearfix ajax-pagination">
					<a href="index2.html" class="next"></a>
				</div>
				<!-- END AJAX PAGINATION -->
			</section>
			<!-- end #mainpage-mos -->


			<!-- END MAIN PAGE CONTENT -->

			<!-- BEGIN FOOTER -->
			<div id="footer" style="width:100%;align:center;margin-top:5%;">
				<p style="color:#ffffff;"><label>&copy; Copyright 2013 Tata Consultancy Services. All rights reserved.</label></p>
			</div> <!-- end footer -->
			<!-- <footer class="clearfix">
				<small>Tata Consultancy Services</small>
			</footer> -->
			<!-- END FOOTER -->
		</section>
		<!-- end #container -->
	</div><!--bodypat ends here -->
	
	<script type="text/javascript"><!--
		var pager = new Pager('results', 5);
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');
		pager.showPage(1);
	//--></script>

	<!-- Audios -->
	<audio id="audio_remote" autoplay="autoplay"></audio>
	<audio id="ringtone" loop src="sounds/ringtone.wav"></audio>
	<audio id="ringbacktone" loop src="sounds/ringbacktone.wav"></audio>
	<audio id="dtmfTone" src="sounds/dtmf.wav"></audio>

</body>
</html>
