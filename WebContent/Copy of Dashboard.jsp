<%@page import="com.tcs.bean.*" %>
<%@page import="java.util.*"%>
<%@page import="com.tcs.dao.SipCallLogDao"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%/* Login login2=new Login(); */
	Login login1= new Login(); 
	ArrayList<String> friendList= new ArrayList<String>(); 
	ArrayList<String> notFriend=new ArrayList<String>();
	%>
	<% if(session.getAttribute("data")!=null && !((Login)session.getAttribute("data")).getPrivateIdentity().equalsIgnoreCase("")){
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
			response.sendRedirect("Login.jsp");return;
		}
	%>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>Communication Client</title>
<link href="http://code.google.com//apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css">
<link href="assets/css/bootstrap.css" title="style" rel="stylesheet" type="text/css" />
<link href="style.css" title="style" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" href="reveal.css">
<link type="text/css" href="assets/css/jquery.ui.chatbox.css" rel="stylesheet" />
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" type="text/css" media="screen" />

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
<link type="text/css" rel="stylesheet" href="css/ui.notify.css" />
<link rel="stylesheet" type="text/css" href="css/start/jquery-ui-1.10.3.custom.css"/>
<script src="scripts/jquery-ui-1.10.3.custom.js"></script>
<script src="scripts/jquery.notify.js" type="text/javascript"></script>
<link href="css/gemoticons.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="scripts/jquery.gemoticons.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.chatbox.js"></script>
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
		/* alert("not inited"); */
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
		/* alert("not inited"); */
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
	
	<script language="javascript">
	document.onmousedown=disableclick;
	status="Right Click Disabled";
	function disableclick(event)
	{
  		if(event.button==2)
  		 {
     		alert(status);
     		return false;    
  		 }
	}
</script>
<!-- Javascript code -->
<script type="text/javascript">
	var arr;  //Array Variable declared globally
	var xmlHttpRequest;
	var xmlHttpRequest1;
	var xmlHttpRequest2;
	var xmlHttpRequestForRefresh;
	if(window.XMLHttpRequest)
	{
	xmlHttpRequest=new XMLHttpRequest();
	xmlHttpRequest1=new XMLHttpRequest();
	xmlHttpRequest2=new XMLHttpRequest();
	xmlHttpRequestForRefresh=new XMLHttpRequest(); 
	}
	else if(window.ActiveXObject)
	{
	xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequest1=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequest2=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequestForRefresh=new ActiveXObject(MICROSOFT.XMLHTTP);
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
   // window.open("expert.htm");
     var cbVideoDisable;
    var cbAVPFDisable;
    var txtWebsocketServerUrl;
    var txtSIPOutboundProxyUrl;
    var txtInfo; 
	
    C = 
    {
        divKeyPadWidth: 220
    };

    window.onload = function () {
        if(window.console) {
            window.console.info("location=" + window.location);
        }
        cbVideoDisable = document.getElementById("cbVideoDisable");
        cbRTCWebBreaker = document.getElementById("cbRTCWebBreaker");
        txtWebsocketServerUrl = document.getElementById("txtWebsocketServerUrl");
        txtSIPOutboundProxyUrl = document.getElementById("txtSIPOutboundProxyUrl");
        txtInfo = document.getElementById("txtInfo");
    
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
        settingsSave();
		//dummyRegister();
		//alert("in b4 getpic");
		document.getElementById("userImage").src='<%=request.getContextPath()%>/Controller?id=<%=login1.getPrivateIdentity()%>&action=getProfilePic';
		document.getElementById("userImage1").src='<%=request.getContextPath()%>/Controller?id=<%=login1.getPrivateIdentity()%>&action=getProfilePic';
		document.getElementById("userImage3").src='<%=request.getContextPath()%>/Controller?id=<%=login1.getPrivateIdentity()%>&action=getProfilePic';
		document.getElementById("loading").style.display="none";
        if (uRIContactPage.value!="null"){
           // alert("changing");
        	txtPhoneNumber.value=uRIContactPage.value;
        	uRIContactPage.value="null";
        	//alert("entering sip call");
        	setTimeout(function(){sipCall("call-audiovideo"); },1000);        
        }
        
    };

    /* window.onbeforeunload = function saveAllData()
    {
        sipUnRegister();
        //return true;       //comment out 'return' to suppress prompt
    }
     */
    window.onbeforeunload = function sipPuru()
    {    	
    	 oSipStack.stop();
        //sipUnRegister();
         return '';        //comment out 'return' to suppress prompt
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
	
			var text=$('<div class="chat" style="color:gray">'+from+' : '+ message+ '</div>');
			$('.chatbox').append(text);
			$(text).gemoticon();
	}
   
    //fetch buddy list
    function main(param)
 	{
	 	if("empty".match(param))
	 	{
	 		friendslist= new Array(<%String[] arrFrnd=new String[login1.getPrivateIdentityFrd().size()];
			arrFrnd=login1.getPrivateIdentityFrd().toArray(arrFrnd);
   			for(int i = 0; i < arrFrnd.length; i++)
   			{  
    			out.print("\""+arrFrnd[i]+"\""); 
     			if(i+1 < arrFrnd.length) 
     			{  
       				out.print(",");  
     			}  
   			}  %>);
	 	}
	 	else
	 		{
	 		friendslist=new Array();
	 		for(var k=0;k<param.length;k++)
	 			{
	 			friendslist[k]=param[k];
	 			}
	 		}
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
    	};
    }
    main('empty');
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
        sipRegister();
    	
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
     function settingsSave() {
    	/*  alert("jjjjjjj");
    	 alert("weburl"+txtWebsocketServerUrl.value); */
        window.localStorage.setItem('org.doubango.expert.disable_video', cbVideoDisable.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.enable_rtcweb_breaker', cbRTCWebBreaker.checked ? "true" : "false");
        if (!txtWebsocketServerUrl.disabled) {
            window.localStorage.setItem('org.doubango.expert.websocket_server_url', txtWebsocketServerUrl.value);
        }
        window.localStorage.setItem('org.doubango.expert.sip_outboundproxy_url', txtSIPOutboundProxyUrl.value);
        window.localStorage.setItem('org.doubango.expert.ice_servers', txtIceServers.value);
        window.localStorage.setItem('org.doubango.expert.bandwidth', txtBandwidth.value);
        window.localStorage.setItem('org.doubango.expert.video_size', txtSizeVideo.value);
        window.localStorage.setItem('org.doubango.expert.disable_early_ims', cbEarlyIMS.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.disable_debug', cbDebugMessages.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.enable_media_caching', cbCacheMediaStream.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.disable_callbtn_options', cbCallButtonOptions.checked ? "true" : "false");

    }

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
    
/*    function chatValidation(){
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
 */    
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
 		content=content.replace(/^\s+/, '').replace(/\s+$/, '');
 		if(content ===''){
 			return;
 		}
 		else{
 		document.getElementById("msg").value="";
 		/* alert("content is"+content); */
 		
 		/* document.getElementById("textArea").value +="me : "+ content+"\n" ;
 		document.getElementById("textArea").scrollTop =    document.getElementById("textArea").scrollHeight;	 */
 		sendDataToDiv("me",content);
		document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
 		/* if (oSipStack && !oSipSessionMessage && !tsk_string_is_null_or_empty(txtPhoneNumber.value)) { */
 		oSipSessionMessage = oSipStack.newSession(s_type,oConfigMsg);
 		//to send message
 		/* alert("send1");  */
 		
 		extraContent="[{trxnid}]";
 		addInt=extraContent+msgId;
 		msgId++;
 		finalMsg=content+addInt;
 		 
 		oSipSessionMessage.send(desturi,finalMsg, 'text/plain;charset=utf8');
 		
 		}
 	}
    
  //presence
	function sipPublis(s_type) {
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
		var loggedInUser=document.getElementById("txtPublicIdentity").value;
		
		var contentType = 'application/pidf+xml';
		var content = '<?xml version="1.0" encoding="UTF-8"?>\n'
				+ '<presence xmlns="urn:ietf:params:xml:ns:pidf">\n' +

				'<tuple id="a">\n' + '<status>\n' + '<basic>open</basic>\n'
				+ '<contact>'+loggedInUser+'</contact>\n'
				+ '<note>online</note></status>\n' + '</tuple>\n'
				+ '</presence>';
				
		oSipPublish.publish(content, contentType);
		sipSubscribe();
	}	
	//presence ends
	main('empty');
	
	//subscribe
	function sipSubscribe() {
		for(var i=0;i<friendslist.length;i++)
			 {
			 	
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
						
		
					to[i]=friendslist[i];
					subscribeSession.subscribe(to[i]);
			}
	}	
	//subscribe ends
    
    // makes a call (SIP INVITE)
    function sipCall(s_type) {		
	   /*  alert("making call"); */
		document.getElementById("ulCallOptions").style.visibility="hidden";
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
/*                 alert("Local Storage");
 */            	//oConfigCall.bandwidth = tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.bandwidth')); // already defined at stack-level but redifined to use latest values
            
               // oConfigCall.video_size = tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.video_size')); // already defined at stack-level but redifined to use latest values
            }
            
            // create call session
            oSipSessionCall = oSipStack.newSession(s_type, oConfigCall);
            /* alert("Establishing COnnection"); */
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
    	if(arr[0]!=null && arr[1]!=null && arr[2]!=null && arr[3]!=null){
	    	xmlHttpRequest.open("POST", "SipCallLogServlet?caller="+arr[0]+"&callee="+arr[1]+"&startTime="+arr[2]+"&endTime="+arr[3], true);
	    	xmlHttpRequest.onreadystatechange=receiveMessageFromServerLogs;
	    	xmlHttpRequest.send();
    	}
    }
    function receiveMessageFromServerLogs()
	{
		if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
			{
			document.getElementById("displayLogs").innerHTML=""; //clear html
		
			var table=$('<table id="results" class="table1 table"><tr><th>Caller</th><th>Callee</th><th>Date</th><th>Start Time</th><th>End Time</th></tr></table>');
			var jsonResponseFromServerLogs=eval('('+xmlHttpRequest.responseText+')');
			var i=0;
			
			$.each(jsonResponseFromServerLogs.logs, function(key, val) {
				 var tr=$('<tr></tr>');
				 i++;		
				 var caller,callee,stime,etime,day;
				$.each(val, function(k, v){
							
					if(k.match("caller")){
						 caller=$('<td>'+ v+'</td>');
					}
					
					else if(k.match("callee")){
						 callee=$('<td>'+ v+'</td>');
					}
					else if(k.match("dayOfCall")){
						 day=$('<td>'+ v+'</td>');
					}
					else if(k.match("startTime")){
						 stime=$('<td>'+ v+'</td>');
					}
					else if(k.match("endTime")){
						 etime=$('<td>'+ v+'</td>');
					}	

		    	});
				callee.appendTo(tr);
				caller.appendTo(tr);
				day.appendTo(tr);
				stime.appendTo(tr);
				etime.appendTo(tr);
				tr.appendTo(table);
			});
			table.appendTo('#displayLogs');
			var pager = new Pager('results', 10);
			pager.init();
			pager.showPageNav('pager', 'pageNavPosition');
			pager.showPage(1);
			}
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
    	xmlHttpRequest.onreadystatechange=receiveMessageFromServerShare;
    	xmlHttpRequest.send();    	
    }
    function receiveMessageFromServerShare()
	{
		if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
			{
			 var JSONObject=new Object();
			 JSONObject=eval('('+xmlHttpRequest.responseText+')');
			 alert(JSONObject.recordUpdated.serverReply);
			}
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
                        sipPublis("publish");
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
	    		    		sendDataToDiv(str,mainCont[0]);
	    		    		document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
	    		            document.getElementById("uri").value =str;
	    		           // document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
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
        		    		sendDataToDiv(str,mainCont[0]);
        		    		document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
        		    		document.getElementById("uri").value =str;
        		           // document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
    					} 
    				}
            		else{            		
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
					 document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
					 //document.getElementById("textArea").value += str+" : "+cont[0]+ "\n" ;
					 sendDataToDiv(str,cont[0]);
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
				console.info('NOTIFY content = ' + e.getContentString());
				console.info('NOTIFY content-type = ' + e.getContentType());				
				//if(e.getContentType() ===null){
					//sipPublis("publish");				
				//}				
				//else{
				if (e.getContentType() == 'application/pidf+xml') {
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
									  var contactNode=tupleNode.getElementsByTagName ("contact")[0];
									  var contactUri=contactNode.textContent;
	
										if (statusNode) {
											
											var basicNode = statusNode
													.getElementsByTagName("basic")[0];

											if (basicNode) {
															var basicValue=basicNode.textContent;
															if(basicValue==="open"){
															infoArray=new Array(20);
															for(i=0;i<infoArray.length;i++)
																{
																
																	infoArray[i]=new Array(20);
																	infoArray[i][0]=contactUri;
																	infoArray[i][1]="online";
																xmlHttpRequest.open("POST", "PresenceServlet?friend1="+infoArray[i][0]+"&friend1status="+infoArray[i][1], true);
																xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
																xmlHttpRequest.send();
															}
														}
															else{

																var i=0;
																infoArray[i]=new Array();
																infoArray[i][0]=contactUri;
																infoArray[i][1]="offline";
																xmlHttpRequest.open("POST", "PresenceServlet?friend1="+infoArray[i][0]+"&friend1status="+infoArray[i][1], true);
																xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
																xmlHttpRequest.send();
																	i++;


																
															}
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
				//}
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

	<!-- Hidden fields for calling -->
	<input type="hidden" style="width:100%; height: 100%;" id="txtRealm" value="<%=login1.getRealm().toString()%>" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPrivateIdentity" value="<%=login1.getPublicIdentity().toString()%>" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPublicIdentity" value="<%=login1.getPrivateIdentity().toString()%>" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPassword"	value="<%=login1.getPassword().toString()%>" autocomplete='off' /> 
	<input type="hidden" style="width:100%; height: 100%;" id="txtDisplayName" value="<%=login1.getDisplayName().toString()%>" autocomplete="off" />

	<script type="text/javascript">
		<%-- function viewprofile(){
			var friend=document.getElementById("friend").value;
			//alert("friend "+friend)
			window.location="<%=request.getContextPath()%>/Controller?action=viewfriend&friend="+friend+"";		
		} --%>
		var xmlHttpRequest;
		var xmlHttpRequestGeo;
		if(window.XMLHttpRequest){
			xmlHttpRequest=new XMLHttpRequest();
			xmlHttpRequestGeo=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
			xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
			xmlHttpRequestGeo=new ActiveXObject(MICROSOFT.XMLHTTP);
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
			window.open('conferencing12.jsp','Popup','width:750,height:500');
		}	
		function openLink()
		{
			window.open('openLinkServlet?fromPage=Dashboard', 'Popup', 'height:60px, width:20px');
		}

		function openLinkFacebook()
		{
			window.open('fbfriends.jsp', 'Popup', 'height:60px, width:20px');
		}	
		function google()
		{
			window.open('GoogleContactsController?id=<%=login1.getPrivateIdentity().toString()%>', 'Popup', 'height:60px, width:20px');
		}
		/*Method will unshare the geolocation of the person */
		function unShareMyLocation(){
			var loc=document.getElementById("txtPublicIdentity").value;
			xmlHttpRequestGeo.open("POST", "GeolocationstoreServlet?action=unshareMyLoc&sipuri="+loc, true);
			xmlHttpRequestGeo.onreadystatechange=receiveMessageFromServerGeo;
			xmlHttpRequestGeo.send();   
		}
		function receiveMessageFromServerGeo()
		{
			if(xmlHttpRequestGeo.readyState==4&&xmlHttpRequestGeo.status==200)
				{
				 var JSONObject=new Object();
				 JSONObject=eval('('+xmlHttpRequestGeo.responseText+')');
				 alert(JSONObject.recordUpdated.serverReplyGeo);
				}
		}
	</script>
	<script type="text/javascript">
	 function removeFrnd()
	 {
	 		var sipUri="";
			var friends = document.getElementsByName('friend');
			var privateIdentity=document.getElementById('privateIdentity').value;
			var password=document.getElementById("txtPassword").value;
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
				document.getElementById("displayDetails").style.display="none";
				xmlHttpRequest2.open("post","<%=request.getContextPath()%>/Controller?action=delete&privateIdentity="+privateIdentity+"&friend="+sipUri+"&password="+password+"",true);
				xmlHttpRequest2.onreadystatechange=responseFromServletForAddFrd;
				xmlHttpRequest2.send();
			} 		 
	 } 	
	</script>	
	<script type="text/javascript">
		var freshListOfFriends=new Array();
		var timer=setInterval(function(){
		var privateIdentity=document.getElementById("privateIdentity").value;
		var password=document.getElementById("txtPassword").value;
		xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?action=getFreshData&privateIdentity="+privateIdentity+"&password="+password,false);
		xmlHttpRequest2.onreadystatechange=responseFromServletForRefresh;
		xmlHttpRequest2.send();
		},20000);

		function responseFromServletForRefresh(){
		
		if(xmlHttpRequest2.readyState==4&&xmlHttpRequest2.status==200)
		{
			document.getElementById("frndDiv").innerHTML=""; // dynamo woh div h jisme tumahri lists display ho rhin h
			document.getElementById("notFrndDiv").innerHTML="";
			freshListOfFriends=new Array();
			//var heading=$('<h6 style="margin-left: 20%">People in your phone book</h6>')
			//var heading1=$('<h6 style="margin-left: 20%">People you may know</h6>')
			//heading.appendTo('#frndDiv');
			//heading1.appendTo('#notFrndDiv');
			var table=$('<table id="frndTable" class="table1 table"></table>');
			var jsonResponseFromServer=eval('('+xmlHttpRequest2.responseText+')');
			var i=0;
			$.each(jsonResponseFromServer.Friends, function(key, val) {
				 var tr=$('<tr></tr>');
				 i++;
				
				$.each(val, function(k, v){
					
					if(k.match("NAME")){
						$('<td><input type="radio" onclick="getFriend();" name="friend" id="friends'+i+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
						freshListOfFriends[freshListOfFriends.length]=v;
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
					$('<td><input type="radio" name="notfriend" id="friends'+j+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
		    	});
				tr.appendTo(table1);
					});
			table1.appendTo('#notFrndDiv');
			main(freshListOfFriends);
			//alert('fjasuif');
			$('#callContacts').html($('#frndDiv').html());
			$('#ContactsOffline').html($('#frndDiv').html());
			} 
	 }	
	
	 function addToFriendList()
	 {
			var notFriend1=document.getElementsByName("notfriend");
			for(var i = 0; i < notFriend1.length; i++){
			    if(notFriend1[i].checked){
			    	friend = notFriend1[i].value;
			    }
			} 
			var privateIdentity=document.getElementById("privateIdentity").value;
			var password=document.getElementById("txtPassword").value;
			xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?action=addFriend&privateIdentity="+privateIdentity+"&friendPrivateIdentity="+friend+"&password="+password+"",false);
			xmlHttpRequest2.onreadystatechange=responseFromServletForAddFrd;
			xmlHttpRequest2.send();			
	 } 
	 
		 function responseFromServletForAddFrd(){
			 
				if(xmlHttpRequest2.readyState==4&&xmlHttpRequest2.status==200)
				{
					document.getElementById("frndDiv").innerHTML=""; // dynamo woh div h jisme tumahri lists display ho rhin h
					document.getElementById("notFrndDiv").innerHTML="";
					//var heading=$('<h6 style="margin-left: 20%">People in your phone book</h6>')
					//var heading1=$('<h6 style="margin-left: 20%">People you may know</h6>')
					//heading.appendTo('#frndDiv');
					//heading1.appendTo('#notFrndDiv');
					var table=$('<table id="frndTable" class="table1 table"></table>');
					var jsonResponseFromServer=eval('('+xmlHttpRequest2.responseText+')');
					var i=0;
					freshListOfFriends1=new Array();
					$.each(jsonResponseFromServer.Friends, function(key, val) {
						 var tr=$('<tr></tr>');
						 i++;
						
						$.each(val, function(k, v){
							
							if(k.match("NAME")){
								$('<td><input type="radio" name="friend" onclick="getFriend();" id="friends'+i+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
								freshListOfFriends1[freshListOfFriends1.length]=v;
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
							$('<td><input type="radio" name="notfriend" id="friends'+j+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
				    	});
						tr.appendTo(table1);
							});
					table1.appendTo('#notFrndDiv');
					main(freshListOfFriends1);
					sipSubscribe();
					$('#callContacts').html($('#frndDiv').html());
					$('#ContactsOffline').html($('#frndDiv').html());
				} 
			 }	
		 function getFriend(){
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
					document.getElementById("txtPhoneNumber").value=sipUri;
					document.getElementById("sipurireceiver").value=sipUri;
					var uriForMsg=sipUri.replace("sip:","");
					uriForMsg=uriForMsg.replace("@tcs.com","");
					document.getElementById("txtPhoneNumber").value=sipUri;
					document.getElementById("uri").value=uriForMsg;
					xmlHttpRequest.open("post","<%=request.getContextPath()%>/Controller?action=viewFriend&friend="+sipUri+"",true);
					xmlHttpRequest.onreadystatechange=responseFromServlet;
					xmlHttpRequest.send();
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
		 function showFrnd(){
			 var e= document.getElementById("friendMap");
		       if(e.style.opacity == 0){
		    	   document.getElementById("map-canvas").style.opacity=0;
		    	   //alert("-"+document.getElementById("map-canvas").style.height);
		    	   /* e.style.marginTop="-"+document.getElementById("map-canvas").style.height; */
		    	   document.getElementById("shareGeoLoc").style.display="none";
		    	   document.getElementById("user").style.display="none";
		    	   e.style.opacity = 1;
		       }		         
		 }
		 function hideFrnd(){
			 var e= document.getElementById("friendMap");
		       if(e.style.opacity == 1){
		    	   e.style.opacity = 0;
		    	   document.getElementById("shareGeoLoc").style.display="block";
		    	   document.getElementById("user").style.display="block";
			       /* e.style.marginTop="500px"; */
			       document.getElementById("map-canvas").style.opacity=1;
		       }
		 }		         
	</script> 
	<script type="text/javascript">
	var imageSrc="";
	var oldSrc="";
	var validImage=false;		
	$(function(){
			$("#profilePic").change(function(){
			var file = document.getElementById("profilePic").files[0];
			var fileName=document.getElementById("profilePic").files[0].name;
			var extension=fileName.split(".")[fileName.split(".").length-1];
			if("JPG".match(extension)||"jpg.".match(extension)||"png".match(extension)||"PNG".match(extension)||"gif".match(extension)||"GIF".match(extension))
				{
				validImage=true;
				}
			if(!validImage){
				alert("Please select a 'JPG' 'PNG' or 'GIF' image file.");
				$("#profilePic").focus();
			}else{
			var reader=new FileReader();
			reader.readAsDataURL(file);
			reader.onloadend=function(){
				var res=reader.result;
				imageSrc=res;
				$("#userImage3").attr("src",res);
			};
			}
		});
		
		$("#save").click(function(){
			var xmlHttpRequest;
			xmlHttpRequest=new XMLHttpRequest();
			var fileName=document.getElementById("profilePic").files[0].name;
			var privateIdentity=document.getElementById("txtPublicIdentity").value;
			xmlHttpRequest.open("POST", "TesterServlet?action=uploadFile&fileName="+fileName+"&privateIdentity="+privateIdentity, false);
			xmlHttpRequest.onreadystatechange=function(){
				if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
					{
					$("#userImage1").attr("src",imageSrc);
					$("#userImage").attr("src",imageSrc);
					}
			};
			var file = document.getElementById("profilePic").files[0];
			var formData = new FormData();
			formData.append("pPic", file);
			xmlHttpRequest.send(file);
		});
	});
	function updateProfile()
	{
		
		var displayName=document.getElementById("displayName").value;
		var publicIdentity=document.getElementById("publicIdentity").value;
		var realm=document.getElementById("realm2").value;
		var privateIdentity=document.getElementById("privateIdentity").value;
		xmlHttpRequest1.open("POST","<%=request.getContextPath()%>/Controller?action=updateProfile&displayName="+displayName+"&publicIdentity="+publicIdentity+"&realm="+realm+"&privateIdentity="+privateIdentity+"",true);
		xmlHttpRequest1.onreadystatechange=responseForUpdatedData;
		xmlHttpRequest1.send();		
	}
	
	function responseForUpdatedData()
	{
		if(xmlHttpRequest1.readyState==4&&xmlHttpRequest1.status==200){
			 var JSONObject=new Object();
			 JSONObject=eval('('+xmlHttpRequest1.responseText+')');
			 document.getElementById("displayName").value=JSONObject.recordUpdated.DisplayNameUpdated ; 
			 document.getElementById("publicIdentity").value=JSONObject.recordUpdated.PublicIdentityUpdated ; 
		
			 document.getElementById("realm2").value=JSONObject.recordUpdated.RealmUpdated ;
			 document.getElementById("spanId").value=JSONObject.recordUpdated.PublicIdentityUpdated ; 
			 document.getElementById("updateMsg").innerHTML="Profile has been updated";
			 var fileName=document.getElementById("profilePic").files[0].name;
			 var extension=fileName.split(".")[fileName.split(".").length-1];
			 if("JPG".match(extension)||"jpg.".match(extension)||"png".match(extension)||"PNG".match(extension)||"gif".match(extension)||"GIF".match(extension))
				{
				validImage=true;
				}
			if(!validImage){
				alert("Please select a 'JPG' 'PNG' or 'GIF' image file.");
				$("#profilePic").focus();
			}else{
				
			xmlHttpRequestPic=new XMLHttpRequest();
			var fileName=document.getElementById("profilePic").files[0].name;
			var privateIdentity=document.getElementById("txtPublicIdentity").value;
			xmlHttpRequestPic.open("POST", "TesterServlet?action=uploadFile&fileName="+fileName+"&privateIdentity="+privateIdentity, false);
			xmlHttpRequestPic.onreadystatechange=function(){
				if(xmlHttpRequestPic.readyState==4&&xmlHttpRequestPic.status==200)
					{
					var isTrue=xmlHttpRequestPic.responseText;
					if(isTrue.match("true")){
						$("#userImage1").attr("src",imageSrc);
						$("#userImage").attr("src",imageSrc); 
						document.getElementById("updateMsg").innerHTML="Profile-Pic has been updated";
					}
					}
			};
			var file = document.getElementById("profilePic").files[0];
			xmlHttpRequestPic.send(file);
		}}
	}	
	function insertPic()
	{
		document.getElementById("profilePic").style.visibility="visible";
	}
</script>
	<script type="text/javascript">
		$(function(){
			  $("#callContacts").html($("#frndDiv").html());
			  $("#ContactsOffline").html($("#frndDiv").html());
		});
		function stopStack(){
		oSipStack.stop();
		}
	</script>
	<script type="text/javascript">
		/*
			document ready.
		*/
		$(function()
		{
			/*
				declare gloabl box variable,
				so we can check if box is alreay open,
				when user click toggle button
			*/
			var box = null;
			
			/*
				we are now adding click hanlder for 
				toggle button.
			*/
			
			$("#toggle").click(function(event, ui)
			{
				/*
					now if box is not null,
					we are toggling chat box.
				*/
				if(box)
				{
					/*
						below code will hide the chatbox that 
						is active, when first clicked on toggle button
					*/
					box.chatbox("option", "boxManager").toggleBox();
				}
				else
				{
					/*
						if box variable is null then we will create
						chat-box.
					*/
					box = $("#chat_div").chatbox(
					{
						/*
							unique id for chat box
						*/
						id:"Runnable",
                        user:
						{
							key : "value"
						},
						/*
							Title for the chat box
						*/
						title : "Runnable User",
						/*
							messageSend as name suggest,
							this will called when message sent.
							and for demo we have appended sent message to our log div.
						*/
						messageSent : function(id, user, msg)
						{
							$("#log").append(id + " said: " + msg + "<br/>");
                            $("#chat_div").chatbox("option", "boxManager").addMsg(id, msg);
                        }
					});
				}
			});
		});
    </script> 
   <!--  <script>
    function incrementValue()
    {
    	alert("incrementVAlue");
        var value = parseInt(document.getElementById('number').value, 10);
        value = isNaN(value) ? 0 : value;
        value++;
        alert(value);
        document.getElementById('number1').innerHTML = value;
        document.getElementById('number').value = value;
    }
    </script> -->
</head>
<body oncontextmenu="return false">
	<div class="header">	
		<p>	<img src="images/TCSLogo.jpg"/>
			Unified Communicator
			<a class="header-anchor" href="<%=request.getContextPath() %>/Controller?action=logout" onclick="stopStack();"><font color="#ffffff">Logout</font></a>		
		</p>		
	</div>
	 <div id="loading" style="top:10%; width: 80%;height: 2%; color:white; margin-left:0%; font-size:6px; background-color: black; opacity:1;"><h1>Please wait while the page loads...</h1></div> 		
	<div class="navbar" align="center" style="display:none;">
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
	</div>
	
	  <div id="callModal" class="reveal-modal xxlarge">
		<h2 style="color:#088A08;">Instant Connect</h2>
		<a class="close-reveal-modal">&#215;</a>
		<div style="width:100%;height:100%;">	
		<div style="width:40%;height:100%;display:table-cell;float:left;">	
			<h6 style="margin-left:20%;">People in your phone book</h6>
			<div id="callContacts" class="span6 well" style="height:30%;overflow:auto;"></div>
			<!-- <input type="button" onclick="incrementValue()" value="Increment Value" />
			<input type="hidden" id="number" value="0"/>
				<div id="notification" style="width:20px;height:15px;">
					<div id="number1" style="margin:0 auto;color:white;"></div>
				</div> -->
		      <div id="divMsgCtrl" class="span6 well" style='display:table-cell;' style=" background-color:#DDA0DD; position:fixed;">
		 		<table border ="0">
				<tr><td width="50px" style="color:black">To:</td><td><input type="text" style="width:100%;" id="uri" placeholder="Enter username eg: John"  /></td></tr>
				<tr><td width="50px"></td><td><div class="chatbox" id="sipMsgs" style="width: 137px;height: 100px;overflow: auto;border: 1px solid rgb(201, 197, 197);background-color: white;margin-bottom: 20px;"></div></td></tr>		
				<tr><td width="50px" style="color:black">Chat:</td><td><input type="text" style="width:100%;" id="msg" onKeyPress="enterpressalert(event)"/></td>
				<tr><td width="50px"></td><td><input type="button" value="Send" style="width:50px; margin-left: 30%;" class="btn btn-primary dropdown-toggle" /></td></tr>
				<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				</table>
			</div>
		</div>
			<div id="divCallCtrl" class="span7 well" style='display:table-cell; vertical-align:middle' style="background-color:#DDA0DD">
			<table>
				<tr>
					<td><img id="userImage" class="imagecall"></td>
					<td><label class="labelcall" ><%=login1.getPrivateIdentity().toString()%></label></td>
				</tr>                    
            </table> 
	            <label id="txtRegStatus" style="margin-left: 1.2%;padding-top: 1%;padding-bottom: 1%; font-weight: bold;"></label>
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
											<li><a href="#"	onclick="sipCall(&quot;call-audio&quot;);">Audio</a></li>
											<li><a href="#"	onclick="sipCall(&quot;call-audiovideo&quot;);">Video</a></li>		
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
	                     <tr style="display:none;">
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
		</div>
	</div>
	<!--callModal ends here  -->
	
	<div id="callLogModal" class="reveal-modal-callLogs">
		<h2>Your Call Logs</h2>		
		<a class="close-reveal-modal">&#215;</a>
		<div id="displayLogs">
			<% String msg="";
			SipCallLogDao dao=new SipCallLogDao();
			CallLogs callLog=(CallLogs)(dao.viewAllLogs(login1));
			 if(callLog==null){
				msg="You do not have any call logs.";
			 }
			 else{
			 %>
			<br>
			<table id="results" class="table1 table">
	        <tr>
	            <th>Caller</th>
	            <th>Callee</th>
	            <th>Day</th>
	            <th>Start Time</th>
	            <th>End Time</th>
	        </tr>
	        <%
	       	 Iterator i1=callLog.getCaller1().iterator();
			 Iterator i2=callLog.getCallee1().iterator();
			 Iterator i3=callLog.getDayOfCall1().iterator();
			 Iterator i4=callLog.getStartTime1().iterator();
			 Iterator i5=callLog.getEndTime1().iterator();
			 while(i1.hasNext()&& i2.hasNext()&& i3.hasNext()&& i4.hasNext()&& i5.hasNext())
	        	{      %>
	        <tr>
	            <td><%=i1.next()%></td>
	            <td><%=i2.next()%></td>
	            <td><%=i3.next()%></td>
	            <td><%=i4.next()%></td>
	            <td><%=i5.next()%></td>
	        </tr>
	        <%}%>
	 		</table>
	 		<br/>	 		
 		</div>
		<div id="pageNavPosition" align="center" style="padding-center:150px;"></div> 	
		<%}%>
		<div style="margin-top:5%;" align="center"><span style="font-size:15px;"><%=msg%></span></div> 			
	</div>
	<!--callLogModal ends here  -->
	
	<div id="userProfile" class="reveal-modal">
	<h2>Your Profile</h2>
	<a class="close-reveal-modal">&#215;</a>
		<fieldset>
			<div style="height: 100%;width: 100%;" align="center">
				<table class="profiletable">
				<tr><td >Profile Picture</td>
				<td><img id="userImage3" title="Click to change the profile picture" style="margin-bottom: 10px;"></td>
				</tr>
				
				<tr><td></td>
				<td><input type="file" id="profilePic" ></td>
				</tr>
				<tr><td>Display Name</td>
					<td><input type="text" id="displayName" name="displayName" value=<%=login1.getDisplayName()%> class="round full-width-input"/></td>
				</tr>
				<tr><td >Public Identity</td>
					<td><input type="text" id="publicIdentity" name="publicIdentity" value=<%=login1.getPublicIdentity()%> class="round full-width-input"/></td>
				</tr>
				<tr><td >Private Identity</td>
					<td><input type="hidden" id="privateIdentity" name="privateIdentity" value=<%=login1.getPrivateIdentity() %> class="round full-width-input"/><label><%=login1.getPrivateIdentity() %></label> </td>
				</tr>
				<tr><td >Realm</td>
					<td> <input type="text" id="realm2" name="realm" value=<%=login1.getRealm() %>	class="round full-width-input"/></td>
				</tr>
				</table>
			</div>
			<div style="margin-top: 5%;height: 100%;width: 100%;" align="center">
			<div style="height: 4%; margin-bottom: 2px;">&nbsp;&nbsp;&nbsp;<span style="color: green; font-size: 15px;" id="updateMsg"></span></div>
			<div>
				<input type="submit" name="updateProfile" value="UpdateProfile" onclick="updateProfile();" class="button"/>
			</div>
			
			</div><br>
				<div style="height: 100%;width: 100%;" align="center">
						<a onclick="openLink();" style="font-size:15px;">Link other accounts</a></div>
		</fieldset><br/>
	</div>
	<!--userProfile ends here  -->
	
	<div id="friendList" class="reveal-modal-contacts" >
	<h2 style="color:#088A08;">Your Contacts</h2>	
	<a class="close-reveal-modal">&#215;</a>
	<div style="width: 45%; float: left;margin-top:20px;">
			<div style="height:45%;max-height:10%;">		
				<div style="height: 4%;">&nbsp;&nbsp;&nbsp;<span style="color: red;" id="user-error"></span></div>
				<h6 style="margin-left:20%;height:6%;margin-bottom:10px;">People in your phone book</h6>
				<div style="padding-top:2%;max-height:130px;overflow:auto;" id="frndDiv">				
				    <table border="1" id="frndTable" class="table1 table">		   
				     <%if(friendList!=null){	    	
				    	ArrayList<String> status=(ArrayList<String>)login1.getPresenceStatus();
				    	for(int i=0;i<friendList.size();i++)
				    	{
				    		String statusCheck=status.get(i);
			    	%>
			    <tr><td>
			    <input type="radio" name="friend" id="friend" value="<%=friendList.get(i)%>" onclick="getFriend();"><font><%=friendList.get(i).replace("sip:","")%></font><br>
				</td>
				<td><%if("offline".equalsIgnoreCase(statusCheck)) %><img src="images/.gif" style="width: 10px;height: 10px;"><%else %><img src="images/online.png" style="width: 10px;height: 10px;"></td>
				</tr>
				<%} }%>
				</table>
				</div>				
			</div>
			<h6 style="margin-left: 20%;margin-bottom:10px;margin-top:20px;">People you may know</h6>
			<div style="margin-top: 5%;max-height:130px;overflow:auto;" id="notFrndDiv">				
				<table class="table1 table" id="notFrndTable">
			    <%if(notFriend!=null){
			    for(String currentNotFriend: notFriend){
			    	%>
			    <tr><td>
			    <input type="radio" name="notfriend" id="notfriend" value="<%=currentNotFriend%>"><%=currentNotFriend.replace("sip:","") %><br>
				</td>
				</tr>
				<%} }%>
				</table>		
			</div>
		</div>
		<div style="width: 50%; margin-left:5%; float: right ;margin-top:20px;">
			<div style="height: 30%;">
			<button style="width: 50px; margin-right: 5px;" id="call" class="button" onclick="callFunc();">Call</button>
			<!-- <button style="width: 60px; margin-right: 5px;" id="message" class="button" onclick="messageFunc();">Message</button> -->
			<button style="width: 50px; margin-right: 5px;"id="removeFrnd" onclick="removeFrnd();"  class="button">Remove</button>
			<button style="width: 50px; margin-right: 5px;" id="add" onclick="addToFriendList();" class="button">Add </button>
			</div>
			<div style="height: 65%;display: none" id="displayDetails">
				<table style="margin-top:5%;">
					<tr><td><label for="login-username">Name</label></td>
			    	    <td><input style="border: none;" type="text" id="displayName1" name="displayName1"  class="round full-width-input" readonly="readonly"/></td>		
					</tr>
					<tr><td><label for="login-username">PublicIdentity</label></td>
						<td><input style="border: none;" type="text" id="publicIdentity1" name="publicIdentity1"  class="round full-width-input" readonly="readonly" /></td>
					</tr>
					<tr><td><label for="login-username">PrivateIdentity</label></td>
					<td><input style="border: none;" type="text" id="privateIdentity1" name="privateIdentity1"  class="round full-width-input" readonly="readonly"/></td>
					</tr>
					<tr><td><label for="login-username">Realm</label></td>
					<td><input style="border: none;" type="text" id="realm1" name="realm1" class="round full-width-input" readonly="readonly"/></td>
					</tr>		
					<tr><td></td><td><img id="friendImage"  style="width:100px;height: 100px;border-radius:10px "></td>
					</tr>
				</table>
			</div>
		</div>		
	</div>
	<!-- friendList ends here -->		
	
	<div id="geoLocationModal" class="reveal-modal xxlarge">
		<h2>Geolocation Box</h2>
		<a class="close-reveal-modal">&#215;</a>
		<div id="shareMyLoc">
			<table align="center" style="padding-top:15px;">
				<tr>
				<td><a onclick="showFrnd();" style="cursor: pointer;"><font style="font-size: 15px;padding-right:15px;">View Location of Friends</font></a></td>
				<td><a onclick="hideFrnd();" style="cursor: pointer;"><font style="font-size: 15px;">View My Location</font></a></td>
				<td style="padding-left:15px;"><input type="hidden" style="display:block;border: none;" value=<%=login1.getPrivateIdentity().toString()%> id="user" name="user" readonly="readonly"></td>
				<td align="center" style="display:block;padding-left:5px;"><input type="button" class="button" id="shareGeoLoc" onclick="shareMyLocation();" value="Share my location"/></td>
				<td style="padding-left:5px;"><input type="button" class="button" id="unshareGeoLoc" onclick="unShareMyLocation();" value="Unshare my location"/></td>	
				</tr>
			</table>		
		</div>
			<div style="width:90%; height:70%;opacity:1;position:absolute;z-index:1000px;" id="map-canvas"></div>
		<div style="width:100%; height:80%;opacity:0;position:relative;z-index:500px;" id="friendMap">
			 <%@include file="/geolocationtogether.jsp" %></div>
		<h3 align="center" id="serverReply" style="display: none;"></h3>	
	</div> 
	<!-- geolocationModal ends here -->	
		
	<div id="offline-message-modal" class="reveal-modal-offline">
		<h2>Offline Messages</h2>
		<a class="close-reveal-modal">&#215;</a>
		<section id="main">
			<div style="margin-top: 20px;float: right;width:55%;">
			     <table class="profiletable" style="width:100%;">
				    <tr>
						<td  style="color: black;">To:</td>
					    <td><input type="text" name="sipurireceiver" id="sipurireceiver"/></td>
					    <td></td>
					</tr>
				    <tr>
						<td  style="color: black;vertical-align: top;">Message:</td>
						<td><textarea id="message1" name="message1" rows="6" cols="30" style="background-color:white;" placeholder="Please enter your message here"></textarea></td>
						<td></td>
				    </tr>
				 </table>
				 <table style="margin:auto;">
				 <tr><td><br/><br/></td></tr>
					<tr>
						<td><button name="submit" class="button" value="Send_to_gmail" onclick="sendtogmail();">
						<img src="images/gmailIcon.jpg" width="40" height="40"></button>
						&nbsp;&nbsp;
						<td><button name="submit" class="button" value="Send_to_facebook" onclick="sendtofacebook();">
						<img src="images/facebookIcon2.png" width="40" height="40"></button>
						&nbsp;&nbsp;
						<td><button name="submit" class="button" value="Send_to_yahoo" onclick="sendtoyahoo();">
						<img src="images/yahooIcon.png" width="40" height="40"></button>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td colspan="3"><a style="cursor:pointer;" onclick="openLinkFacebook();">Import contacts from Facebook</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a style="cursor:pointer;" onclick="google();">Import contacts from Google</a></td>
					</tr>					
				</table>				
			</div>
			<h6 style="margin-left:10%;height:6%;margin-bottom:10px;">People in your phone book</h6>
			<div id="ContactsOffline" class="span6 well" style="height:30%; float:left; overflow:auto;"></div>
			<!-- <table>
					<tr>
					<td><a onclick="openLinkFacebook();">Import contacts from Facebook</a></td ><td width="10%"></td>
					<td><a onclick="google();">Import contacts from Google</a></td>
					</tr>
				</table>	 -->
			</section>			
			</div>
	<!-- offlineMessages ends here -->	
	
	<script type="text/javascript">
		var xmlHttpRequest6;
		if(window.XMLHttpRequest){
			xmlHttpRequest6=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
			xmlHttpRequest6=new ActiveXObject(MICROSOFT.XMLHTTP);
		} 
		function sendtoyahoo(){
			var message=document.getElementById("message1").value;
				xmlHttpRequest6.open("post","<%=request.getContextPath()%>/messageServlet?action=Send_to_yahoo&sipurireceiver="+document.getElementById("sipurireceiver").value+"&message="+message+" ",true);
				xmlHttpRequest6.onreadystatechange=responseFromServlet1;
				xmlHttpRequest6.send();
					}
		function responseFromServlet1(){
			if(xmlHttpRequest6.readyState==4&&xmlHttpRequest6.status==200){
				alert("Message has been send successfully.");
			}
		}
		function sendtogmail(){
			var message=document.getElementById("message1").value;
			xmlHttpRequest6.open("post","<%=request.getContextPath()%>/messageServlet?action=Send_to_gmail&sipurireceiver="+document.getElementById("sipurireceiver").value+"&message="+message+" ",true);
			xmlHttpRequest6.onreadystatechange=responseFromServlet2;
			xmlHttpRequest6.send();
		}
		function responseFromServlet2(){
				if(xmlHttpRequest6.readyState==4&&xmlHttpRequest6.status==200){
					alert("Message has been send successfully.");
				}
		}
		function sendtofacebook(){
			var message=document.getElementById("message1").value;
						xmlHttpRequest6.open("post","<%=request.getContextPath()%>/messageServlet?action=Send_to_facebook&sipurireceiver="+document.getElementById("sipurireceiver").value+"&message="+message+" ",true);
						xmlHttpRequest6.onreadystatechange=responseFromServlet5;
						xmlHttpRequest6.send();
							}
		function responseFromServlet5(){
					if(xmlHttpRequest6.readyState==4&&xmlHttpRequest6.status==200){
						alert("Message has been send successfully.");
					}
		}		
		</script>	

	<script type="text/javascript">
	function reloadCode(){
		$('#loadHere').append('<a class="close-reveal-modal">&#215;</a>').load('registernewuserstep2later.jsp');
	}
	</script>
		
	<div id="interestsModal" class="reveal-modal xlarge">
		<h2>Your Interests</h2>
		<a class="close-reveal-modal">&#215;</a>
		<div id="loadHere"></div>
	</div>			

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
						<div class="tile large live" data-stops="0" data-speed="3000" data-delay="0" data-direction="horizontal" data-stack="true">
							<div class="live-front">
								<img id="userImage1" class="live-img"/>
							</div>
							<span class="tile-cat red" id="spanId">Welcome 				
							<%=login1.getDisplayName().toString()%></span>
						</div>
					</a>

					<!-- Tile 2 -->
					<a href="#" onclick="return videoConf();" data-animation="fade">
						<div class="tile medium live" data-stops="0,60%,100%" data-speed="750" data-delay="2500">
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
						<div class="tile medium live" data-stops="0,75%,100%"
							data-speed="1800" data-delay="1500">
							<div class="live-front magenta">
								<img class="live-img" src="images/CallLog.png"
									alt="No image found" />
							</div>
							<div class="live-back magenta">
								<div class="fliptile"><p>Call Logs</p></div>
							</div>
						</div>
					</a>

					<!-- Tile 4 -->
					<a href="#">
						<div class="tile medium">
							<div class="live-front white">
								<img class="live-img" src="images/CenterTile.jpg"
									alt="No image found" />
							</div>
						</div>
					</a> 

					<!-- Tile 5 -->
					<a href="#" data-reveal-id="geoLocationModal" data-animation="fade">
						<div class="tile medium live" data-stops="0,75%,100%" data-speed="750" data-delay="1500">
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
							data-speed="750" data-delay="2500" data-direction="horizontal">
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
							data-speed="750" data-delay="1900">
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
						<div class="tile small live" data-stops="100%"
							data-speed="1000" data-delay="4000">
							<div class="live-front green">
								<img class="live-img" src="images/Contacts.png"
									alt="No image found" />
							</div>
							<div class="live-back green">
								<div class="fliptile"><p style="margin-top:40%">Contacts</p></div>
							</div>
						</div>
					</a>
					
					<script>
						function openSettings(){
							window.open('expert.htm','Popup','width=750,height=500');
						}
						function openVoicemail(){
							var id=document.getElementById('txtPublicIdentity').value;
							window.open('<%request.getContextPath();%>/../WebRTCVoiceMailUC/VoiceMailServlet?action=record&id='+id,'Popup','width=750,height=500');
						}
					</script>
					
					<!-- Tile 9 -->
					<a href="#" onclick="openVoicemail();" data-animation="fade">
						<div class="tile small live" data-stops="0,75%,100%"
							data-speed="750" data-delay="4000">
							<div class="live-front blue">
								<img class="live-img" src="images/VoiceMail.png"
									alt="No image found" />
							</div>
							<div class="live-back blue">
								<div class="fliptile"><p style="margin-top:40%">Voicemail</p></div>
							</div>
						</div>
					</a>
					<!-- END TILE CONTENT -->
				</section>				
			</section>
		
		<!-- <!-- Msg box  -->	
		<!-- <p>It will not work untill necessary scripts and stylesheets are properly loaded, check out the code.</p>
		<input type="button" name="toggle" id="toggle" value="toggle" />
		
		Chat box will be generated in this container
		<div id="chat_div" style="z-index: 23444400000000000000px;"></div>

		<hr />
		<div id="log"></div

			<!-- BEGIN FOOTER -->
			<div id="footer" style="width:100%;align:center;margin-top:5%;">
				<p style="color:#ffffff;"><label>&copy; Copyright 2014 Tata Consultancy Services. All rights reserved.</label></p>
			</div> <!-- end footer -->
			<!-- END FOOTER -->
		</section>
		<!-- end #container -->
	</div><!--bodypat ends here -->
	
	<script type="text/javascript"><!--
		var pager = new Pager('results', 10);
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');
		pager.showPage(1);
	//--></script>

	<!-- Audios -->
	<audio id="audio_remote" autoplay="autoplay"></audio>
	<audio id="ringtone" loop src="sounds/ringtone.wav"></audio>
	<audio id="ringbacktone" loop src="sounds/ringbacktone.wav"></audio>
	<audio id="dtmfTone" src="sounds/dtmf.wav"></audio>
	<!--  ---notification script--- -->
	<script type="text/javascript">
	
	function create( template, vars, opts ){
		return $containerN.notify("create", template, vars, opts);
	}	
	
	var refreshId2 = setInterval(function(){
		$containerN = $("#containerNote").notify();
		 
			$.ajax({
				type:"POST",
				url:'NotificationServlet',
				data:{userId:'<%=login1.getPrivateIdentity()%>',action:'getFreshNotifications'},
			 	success:function(data)
			 	{ 
			 		$("#containerNote").html('');
  		    		$.each(data.Notifications, function(key, val) {
			 			/*  if(val.TYPE.match("VOICEMAIL")){
			 				 create("withIcon", { title:'New VoiceMail Received!', text:val.DETAILS+' <a style="color:white;text-decoration:underline; cursor: pointer;"  id="'+val.ID+'" class="ui-notify-close" onclick="updateStatusVoiceMail(this);">Listen</a>', icon:'info.png' },{ 
					 			 expires:false
			 				});
			 				 } */
			 				  if(val.TYPE.match("CONFERENCE")){
			 					 create("withIcon", { title:'Conference Invite!', text:val.DETAILS+'  <a style="color:white;text-decoration:underline; cursor: pointer;"  id="'+val.ID+'" class="ui-notify-close" onclick="updateStatusConference(this);">Join</a> <a style="color:white;text-decoration:underline; cursor: pointer;"  id="'+val.ID+'" class="ui-notify-close" onclick="declineConference(this);">Decline</a>', icon:'info.png' },{ 
						 			 expires:false
				 				});
			 				 }
			 		}); 
			 	}
			});  
	    }, 10000);
	
	function updateStatusConference(data){
		 $.ajax({
			type:"POST",
			url:'NotificationServlet',
			data:{notificationId:data.id , action:'updateNotificationStatus'},
		 	success:function(response)
		 	{
		 		console.log(response);	
		 	}
		});
		 window.open("conferencing12.jsp","_blank","toolbar=yes, scrollbars=yes, resizable=yes, top=100, left=200, width=600, height=400");
		
	}
	function declineConference(data){
		 $.ajax({
			type:"POST",
			url:'NotificationServlet',
			data:{notificationId:data.id , action:'updateNotificationStatus'},
		 	success:function(response)
		 	{
		 		console.log(response);	
		 	}
		});
	}
	</script>
	<!--  ---notification script ends--- -->
	<!-- Notification div -->
<div id="containerNote" style="display:none;z-index:2000000">
<div id="withIcon">
	<a class="ui-notify-close ui-notify-cross" href="#">x</a>
			<div style="float:left;margin:0 10px 0 0"><img src="images/info.png" alt="warning" style="width: 64px;height: 64px" /></div>
			<h1 >!{title}</h1>
			<p>!{text}</p> 	
</div>
</div>
<!-- 	Notification div -->
<div class="container" style="display:none">
        <div class="span7 well">
            <label align="center" id="txtInfo"> </label>
            <h2> Expert settings</h2>
            <br />
            <table style='width: 100%'>
                <tr>
                    <td>
                        <label style="height: 100%">Disable Video:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbVideoDisable' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Enable RTCWeb Breaker<sup><a href="#aRTCWebBreaker">[1]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbRTCWebBreaker' checked="checked"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">WebSocket Server URL<sup><a href="#aWebSocketServerURL">[2]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtWebsocketServerUrl" value="ws://10.1.5.22:443"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">SIP outbound Proxy URL<sup><a href="#aSIPOutboundProxyURL">[3]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtSIPOutboundProxyUrl" value="tcp://10.1.5.22:5060"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">ICE Servers<sup><a href="#aIceServers">[4]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtIceServers" value=""  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Max bandwidth (kbps)<sup><a href="#aBandwidth">[5]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtBandwidth" value=""  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Video size<sup><a href="#aSizeVideo">[6]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtSizeVideo" value="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Disable 3GPP Early IMS<sup><a href="#aEarlyIMS">[7]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbEarlyIMS' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Disable debug messages<sup><a href="#aDebugMessages">[8]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbDebugMessages' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Cache the media stream<sup><a href="#aCacheMediaStream">[9]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbCacheMediaStream' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Disable Call button options<sup><a href="#aCallButtonOptions">[10]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbCallButtonOptions' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="button" class="btn-success" id="btnSave" value="Save" onclick='settingsSave();' />
                        &nbsp;
                        <input type="button" class="btn-danger" id="btnRevert" value="Revert" onclick='settingsRevert();' />
                    </td>
               </tr>

            </table>
        </div>
    </div> 
</body>
</html>
