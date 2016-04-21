<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>Communication Client</title>

<%-- <script src="<c:url value="resources/ajax/jquery.js"/>"></script> --%>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->

 <link href="http://code.google.com//apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css">
 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
 
<script src="<c:url value="resources/metroui/scripts/jquery-1.6.1.min.js"/>" type="text/javascript"></script>

<link href="<c:url value="resources/metroui/assets/css/bootstrap.css"/>" title="style" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/metroui/css/style.css"/>" title="style" rel="stylesheet" type="text/css" /> 
<link href="<c:url value="resources/metroui/css/reveal.css"/>" rel="stylesheet" />
<link type="text/css" href="<c:url value="resources/metroui/css/start/jquery-ui-1.10.3.custom.css"/>" rel="stylesheet" />

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" type="text/css" media="screen" rel="stylesheet"/>

<script src="<c:url value="resources/metroui/scripts/jquery.masonry.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="resources/metroui/scripts/jquery.easing.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="resources/metroui/scripts/MetroJs.lt.js"/>" type="text/javascript"></script>

<script src="<c:url value="resources/metroui/scripts/jquery.fancybox-1.3.4.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="resources/metroui/scripts/jquery.flexslider-min.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="resources/metroui/scripts/hoverintent.js"/>" type="text/javascript"	charset="utf-8"></script>
<script src="<c:url value="resources/metroui/scripts/jquery.jplayer.min.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="resources/metroui/scripts/organictabs.jquery.js"/>" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value="resources/metroui/scripts/javascript.js"/>" type="text/javascript" ></script>
<script src="<c:url value="resources/metroui/scripts/mediaplayer.js"/>" type="text/javascript"></script>
<script src="<c:url value="resources/release/SIPml-api.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="resources/metroui/scripts/jquery.reveal.js"/>"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="resources/metroui/css/ui.notify.css"/>" />
<script src="<c:url value="resources/metroui/scripts/jquery-ui-1.10.3.custom.js"/>"></script>
<script src="<c:url value="resources/metroui/scripts/jquery.notify.js"/>" type="text/javascript"></script>
<link href="<c:url value="resources/metroui/css/gemoticons.css"/>" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="<c:url value="resources/metroui/scripts/jquery.gemoticons.js"/>"></script>

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

<!------------------------sip functions ------------ -->
<script type="text/javascript">
	
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
    
    var msgId=0;
    var extraContent;
    var addInt;
    var finalMsg;
    var mainCont;
  
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
	
		document.getElementById("loading").style.display="none";
        if (uRIContactPage.value!="null"){
          
        	txtPhoneNumber.value=uRIContactPage.value;
        	uRIContactPage.value="null";
        
        	setTimeout(function(){sipCall("call-audiovideo"); },1000);        
        }
        
    };

    
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
	} 
     
    function FileHelper()
    {
    }
    
    main('empty');
    
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

    function saveCredentials() {
        
    	if (window.localStorage) {
        	
            window.localStorage.setItem('org.doubango.identity.display_name', txtDisplayName.value);
            window.localStorage.setItem('org.doubango.identity.impi', txtPrivateIdentity.value);
            window.localStorage.setItem('org.doubango.identity.impu', txtPublicIdentity.value);
            window.localStorage.setItem('org.doubango.identity.password', txtPassword.value);
            window.localStorage.setItem('org.doubango.identity.realm', txtRealm.value);
        }
    };
     function settingsSave() {
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
 	    sendDataToDiv("me",content);
		document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
 		oSipSessionMessage = oSipStack.newSession(s_type,oConfigMsg); 		
 		extraContent="[{trxnid}]";
 		addInt=extraContent+msgId;
 		msgId++;
 		finalMsg=content+addInt;	 
 		oSipSessionMessage.send(desturi,finalMsg, 'text/plain;charset=utf8');
 		
 		}
 	}
    
  //presence
	function sipPublis(s_type) {
		alert("publish called ");
		oSipPublish = oSipStack.newSession('publish', {
			expires : 100,
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
	
	var publishTimer=setInterval(function(){
		 sipPublis("publish");
		},90000);
	//subscribe
	function sipSubscribe() {
		alert(" subscribe called ");
		for(var i=0;i<friendslist.length;i++)
			 {
			 	
				oConfigSub = {
					expires : 100,
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
                        //sipUnRegister();
                        //window.location = 'https://ns313841.ovh.net/call.htm';
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
        }
    }

    function uiBtnCallSetText(s_text) {
    	 switch(s_text) {
         case "Call":
             {
                 var bDisableCallBtnOptions = (window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_callbtn_options') == "true");
                 btnCall.value = btnCall.innerHTML = bDisableCallBtnOptions ? 'Call' : 'Call <span id="spanCaret" class="caret">';
                 if(!bDisableCallBtnOptions && ulCallOptions.parentNode == divBtnCallGroup){
               
                 }    
                 else if(bDisableCallBtnOptions && ulCallOptions.parentNode != divBtnCallGroup) {
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
    	
    	var DateTime=new Date();
    	arr[arr.length]=DateTime.getDate() + "/" + (DateTime.getMonth() + 1) + "/" + DateTime.getFullYear().toString().substr(2,2);
    	arr[arr.length]= DateTime.getHours() + ':' + DateTime.getMinutes() + ':'+ DateTime.getSeconds();
    	
    	sendDataToUploadGeo();
    }    
    
    function sendDataToUploadGeo() //This function makes use of AJAX To Call the Servlet
    {
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
    					oSipSessionMessage.setConfiguration(oConfigMsg);
    					var str = oSipSessionMessage.getRemoteFriendlyName();//Receiver's name
    					var i=0;
    					 var firstString=str.replace("<","");
    					 var sRemoteUri=firstString.replace(">","");  					 
      					 var doc=e.getContentString();

    					mainCont=doc.split("[");
    					 var string2=str+doc;
    					 for(k=0;k<chkURI.length;k++){
    						 if(chkURI[k]===string2){
    							 return;
    						 }
    					 }

    					if(chkURI.length<10){
    						//added    									
	    					chkURI.push(string2);
	    					var b="sip:";
	    		    		var c =b.concat(sRemoteUri);
	    					var a="@";
	    					var d=a.concat("tcs.com");
	    		    		var f=c.concat(d);
	    		    		//Code to call jqurey function here 
	    		    		sendDataToDiv(str,mainCont[0]);
	    		    		document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
	    		            document.getElementById("uri").value =str;
	    		           // document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
    					}
    					else
    					{
    						chkURI.splice(0,1);
    						chkURI.push(string2);
        					var b="sip:";
        		    		var c =b.concat(sRemoteUri);
        					var a="@";
        					var d=a.concat("tcs.com");
        		    		
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
					 var fstring=str+doc;
					 chkURI.push(fstring);
					 var cont=doc.split("[");
					 var b="sip:";
					 var c =b.concat(sRemoteUri);
					 var a="@";
					 var d=a.concat("tcs.com");
					 var f=c.concat(d);
					 //code for jqurey
					 document.getElementById("uri").value =str;
					 document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
					 //document.getElementById("textArea").value += str+" : "+cont[0]+ "\n" ;
					 sendDataToDiv(str,cont[0]);
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
                alert("i_notify called ");
				console.info('NOTIFY content = ' + e.getContentString());
				console.info('NOTIFY content-type = ' + e.getContentType());				
				
				if (e.getContentType() == 'application/pidf+xml') {
					if (window.DOMParser) {
						var parser = new DOMParser();
						var xmlDoc = parser ? parser.parseFromString(e
								.getContentString(), "text/xml") : null;
			
						var presenceNode = xmlDoc ? xmlDoc
								.getElementsByTagName("presence")[0] : null;
						if (presenceNode) {
							var entityUri = presenceNode.getAttribute("entity");
			
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
																userStatus="online";
																doAjaxPostPresence(contactUri,userStatus );
														    }
															else{
																userStatus="offline";
																doAjaxPostPresence(contactUri,userStatus );
															}
												console.info('Presence notification: Uri = '
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
    
    function doAjaxPostPresence(sipuri , status ) {  

		  var sipuri = sipuri;
		  var status = status;

		  alert( sipuri+ " "+ status);
		  
		  $.ajax({  
		    type: "POST",  
		    url: "/sdnext/addpresenceajax.html",  
		    data:  "sipuri=" + sipuri + "&status=" + status ,

		    success: function(response){  
		    // we have the response  
		    //  $('#infoopenid').html(response);  
		    },  
		    error: function(e){  
		      alert('Error: ' + e);  
		    }  
		  });  
		}  
    
</script>

<script type="text/javascript">
function create( template, vars, opts ){
	return $containerN.notify("create", template, vars, opts);
}	

	

var refreshId2 = setInterval(function(){
	$containerN = $("#containerNote").notify();	

		$.ajax({
			type:"POST",
			url:'getFreshNotifications.html',
			data:{userId:$("#txtPrivateIdentity").val()},
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


</script>

	<!-- Hidden fields for calling -->
	<input type="hidden" style="width:100%; height: 100%;" id="txtRealm" value="${userdetail.realm}" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPrivateIdentity" value="${userdetail.publicIdentity}" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPublicIdentity" value="${userdetail.privateIdentity}" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPassword"	value="${userdetail.password}" autocomplete='off' /> 
	<input type="hidden" style="width:100%; height: 100%;" id="txtDisplayName" value="${userdetail.displayName}" autocomplete="off" />

<!-------------------------------------------Scripts---------------------------------- -->

<!-- <script>
alert("User details fetched "+ document.getElementById(txtRealm).value+ " "+ document.getElementById(txtPrivateIdentity).value+" "+document.getElementById(txtPublicIdentity).value+" "+document.getElementById(txtPassword).value+" "+document.getElementById(txtDisplayName).value);
</script> -->

<script>

function videoConf(){
	window.open('https://localhost:8443/sdnext/conferencing.html','window','width:750,height:500');
}	

</script>

</head>
<body oncontextmenu="return false">
	<div class="header">	
		<p>	<img src="<c:url value="resources/metroui/images/TCSLogo.jpg"/>"/>
			Unified Communicator
			<a class="header-anchor" href="dologout.html" onclick="stopStack();"><font color="#ffffff">Logout</font></a>		
		</p>		
	</div>
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
		<h2>Instant Connect</h2>
		<a class="close-reveal-modal">&#215;</a>
						
						<div style="width:100%;height:100%;">	
							<div style="width:40%;height:100%;display:table-cell;float:left;">	
								<h6 style="margin-left:20%;">People in your phone book</h6>
								<div id="callContacts" class="span6 well" style="height:30%;overflow:auto;">
								<c:if test="${!empty contacts}">
	<table align="left" border="1">

		<c:forEach items="${contacts}" var="contact">
		<c:set var="friendlist" value="${fn:split(contact.friend, ',')}" />
		
<c:forEach var="friend" items="${friendlist}"> 
   

			<tr>	
			
				<td><c:out value="${friend}"/></td>
				
				<%-- <td align="center"><a href="edit.html?id=${contact.sipuri}">Edit</a> | <a href="delete.html?id=${contact.sipuri}">Delete</a></td> --%>
			</tr>
			</c:forEach>
			
		</c:forEach>
	</table>
</c:if>
								
								</div>
								<!-- <input type="button" onclick="incrementValue()" value="Increment Value" />
								<input type="hidden" id="number" value="0"/>
									<div id="notification" style="width:20px;height:15px;">
										<div id="number1" style="margin:0 auto;color:white;"></div>
									</div> -->
									
									
									
							      <div id="divMsgCtrl" class="span6 well" style='display:table-cell;' style=" background-color:#DDA0DD; position:fixed;">
							 		<table border ="0">
									<tr><td width="50px" style="color:black">To:</td><td><input type="text" style="width:100%;" id="uri" placeholder="Enter username eg: John"  /></td></tr>
									<tr><td width="50px"></td><td><div class="chatbox" id="sipMsgs" style="width: 150px;height: 100px;overflow: auto;border: 1px solid rgb(201, 197, 197);background-color: white;margin-bottom: 20px;"></div></td></tr>		
									<tr><td width="50px" style="color:black">Chat:</td><td><input type="text" style="width:100%;" id="msg" onKeyPress="enterpressalert(event)"/></td>
									<tr><td width="50px"></td><td><input type="button" value="Send" style="width:50px; margin-left: 30%;" class="btn btn-primary dropdown-toggle" onclick="sipIM("message");"/></td></tr>
									<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									</table>
								</div>
							</div>
								<div id="divCallCtrl" class="span7 well" style='display:table-cell; vertical-align:middle' style="background-color:#DDA0DD">
								<table>
									<tr>
										<td><img id="userImage" class="imagecall" src="User-Images/"></td>
										<td><label class="labelcall">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${userdetail.displayName}</label></td>
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
																<li id='liScreenShare'><a href="#"	onclick='sipCall("call-screenshare");'>Screen Share</a></li>	
															</ul>
															
															<!-- advertisment component -->	
																<script>
																$(document).ready(function() {
																    $("#ulCallOptions").click(function() {
																        $("#iframe1").show().delay(5000).hide(700);
																    });
																});
																</script>
															<!-- End advertisment compoenent -->	
															
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
						                        <!--  Advertisement  -->
						                      <!--    <iframe id="iframe1" style="display:none;"  width="700" height="450" src="http://localhost:8080/TCSWebRTCSolution_Test/CallServlet"></iframe> -->
						                           
						                     <iframe id="iframe1" style="display:none;"  width="700" height="450" src="http://localhost:8080/sdnext/advertisement.html"></iframe> 
						                           
						                            <!--  End Advertisement  -->
						                            
						                            
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
		
		</div>
	<!--callLogModal ends here  -->
	
	<div id="userProfile" class="reveal-modal xlarge">
	<h2>Your Profile</h2>
	<a class="close-reveal-modal">&#215;</a>
						<h2>Add Registration Userdetail Data</h2>
						<form:form method="POST" action="/sdnext/saveuserdetail.html">
					   		<table>
							    <tr>
							        <td><form:label path="privateIdentity">Sipuri :</form:label></td>
							        <td><form:input path="privateIdentity" value="${userdetail.privateIdentity}" /></td>
							    </tr>
							    <tr>
							        <td><form:label path="displayName">Name  :</form:label></td>
							        <td><form:input path="displayName" value="${userdetail.displayName}"/></td>
							    </tr>
							    <tr>
							        <td><form:label path="publicIdentity">Public identity :</form:label></td>
							        <td><form:input path="publicIdentity" value="${userdetail.publicIdentity}"/></td>
							    </tr>
							    <tr>
							        <td><form:label path="password">password :</form:label></td>
							        <td><form:input path="password" value="${userdetail.password}"/></td>
							    </tr>
							    <tr>
							        <td><form:label path="realm">realm :</form:label></td>
							        <td><form:input path="realm" value="${userdetail.realm}"/></td>
							    </tr>
							    <tr>
							        <td><form:label path="secretQuestion">secretQuestion :</form:label></td>
							        <td><form:input path="secretQuestion" value="${userdetail.secretQuestion}"/></td>
							    </tr>
							    <tr>
							        <td><form:label path="secretAnswer">secretAnswer :</form:label></td>
							        <td><form:input path="secretAnswer" value="${userdetail.secretAnswer}"/></td>
							    </tr>
							    <tr>
							      <td colspan="2"><input type="submit" value="Submit"/></td>
						      </tr>
							</table> 
						</form:form>
						<input type="file" id="profilePic" name="profilePic">
						<button onclick="updateProfilePic()">UpdatePic</button>
						
							
						<script type="text/javascript">
						function doAjaxPostOpenid() {  

							  var sipuri = $('#sipuri').val();
							  var facebook = $('#facebook').val();
							  var google = $('#google').val();
							  var yahoo = $('#yahoo').val();

							  alert( sipuri+ " "+ facebook +" "+ google+ " "+ yahoo);
							  
							  $.ajax({  
							    type: "POST",  
							    url: "/sdnext/addopenidajax.html",  
							    data:  "sipuri=" + sipuri + "&facebook=" + facebook + 
							    	  "&google=" + google + "&yahoo=" + yahoo ,
	 
							    success: function(response){  
							      // we have the response  
							      $('#infoopenid').html(response);
							   		
							     /*  $('#sipuri').val('');
							    	 $('#facebook').val('');
									 $('#google').val('');
							    	 $('#yahoo').val(''); */
							  
							    },  
							    error: function(e){  
							      alert('Error: ' + e);  
							    }  
							  });  
							}  

						function updateProfilePic(){
							
						var file=document.getElementById("profilePic").files[0];
						var formData=new FormData();
						alert(file.name);
						formData.append("picFile",file);
							var xmlHttp=new  XMLHttpRequest();
							alert("xml Request");
							xmlHttp.open("POST","updateProfilePic.html",false);
							xmlHttp.onreadystatechange=function(){
								if(xmlHttp.readyState==4&&xmlHttp.status==200){
									alert("Profile-Pic updated");
									}
								}
							xmlHttp.send(formData);
							alert("XmlRequestSent");
							}
						</script>
						
						
						<h2>Add Opensipuri Data</h2>
						<form:form method="POST" action="/sdnext/saveopenid.html">
					   		<table>
							    <tr>
							        <td><form:label path="sipuri">Sipuri :</form:label></td>
							        <td><form:input path="sipuri" value="${openid.sipuri}" id="sipuri" /></td>
							    </tr>
							    <tr>
							        <td><form:label path="google">Google :</form:label></td>
							        <td><form:input path="google" value="${openid.google}" id="google"/></td>
							    </tr>
							    <tr>
							        <td><form:label path="facebook">Facebook :</form:label></td>
							        <td><form:input path="facebook" value="${openid.facebook}" id="facebook"/></td>
							    </tr>
							    <tr>
							        <td><form:label path="yahoo">yahoo :</form:label></td>
							        <td><form:input path="yahoo" value="${openid.yahoo}" id="yahoo"/></td>
							    </tr>
							    <tr>
							      <td><input type="button" value="Add Users" onclick="doAjaxPostOpenid()"></td>
							      <td colspan="2"><input type="submit" value="Submit"/></td>
						      </tr>
							</table> 
						</form:form>
			           <div id="infoopenid" style="color: green;"></div>
						
	</div>
	<!--userProfile ends here  -->
	
<div id="friendList" class="reveal-modal-contacts" >
    <h2>Your Contacts</h2>    
    <a class="close-reveal-modal">&#215;</a>
    <div style="width: 45%; float: left;margin-top:20px;">
            <div style="height:45%;max-height:10%;">        
                <div style="height: 4%;">&nbsp;&nbsp;&nbsp;<span style="color: red;" id="user-error"></span></div>
                <h6 style="margin-left:20%;height:6%;margin-bottom:10px;">People in your phone book</h6>
                <div style="padding-top:2%;max-height:130px;overflow:auto;" id="frndDiv">    
    
<script type="text/javascript">

function addToFriendList()
{
        var notFriend1=$('#notfriend').val();
            var sipuri=$('#privateIdentity').val();
            /* alert (" contact data "+ sipuri+"" + notFriend1); */
            $.ajax({  
                type: "POST",  
                url: "/sdnext/savecontact.html",  
                data: "sipuri=" + sipuri + "&friend=" + notFriend1,  
                success: function(response){                                   
                  $('#infocontact').html(response);
                       
              $('#notfriend').val('');
              
                },  
                error: function(e){  
                  alert('Error: ' + e);  
                }
              })
        }
    
        function removeFrnd(){
             var sipuri=$('#privateIdentity').val();
             var friend=$('#friend').val();
            /*  alert (" contact data "+ sipuri+"" + friend); */
                $.ajax({  
                    type: "POST",  
                    url: "/sdnext/deletecontact.html",  
                    data: "sipuri=" + sipuri + "&friend=" + friend,  
                    success: function(response){                                   
                      $('#infocontact').html(response);
                           
                  $('#friend').val('');
                  
                    },  
                    error: function(e){  
                      alert('Error: ' + e);  
                    }
                  })
                }
        function showDetail(){
            
             var friend=$("input:radio[name=friend]:checked").val();
            /*  alert (" show data "+friend); */
                $.ajax({  
                    type: "POST",  
                    url: "/sdnext/showuserdetail.html",  
                    data: "friend=" + friend,  
                    success: function(response){ 
                        $("#displayDetails").css('display','');
                           var jsonObject=new Object();
                           jsonObject=eval('('+response+')');
                        document.getElementById("displayName1").value=jsonObject.JsonFriend.displayName ; 
                        document.getElementById("publicIdentity1").value=jsonObject.JsonFriend.publicIdentity ; 
                        document.getElementById("privateIdentity1").value=jsonObject.JsonFriend.privateIdentity ; 
                        document.getElementById("realm1").value=jsonObject.JsonFriend.realm ;    
                    },  
                    error: function(e){  
                      alert('Error: ' + e);  
                    }
                  });
                }
        
        
            </script>
        
    <c:if test="${!empty contacts}">
        
    <table align="left" border="1"  style="color:black;">
    

        <c:forEach items="${contacts}" var="contact">
        
        

            <tr>
            <td>            
                <input type="radio" name="friend" id="friend" value="${contact.friend}" onclick="showDetail();" ><font><c:out value="${contact.friend}"/></font><br>
            </td>                
            </tr>
            </c:forEach>
            
        
    </table>
</c:if>
</div>                
            </div>
<h6 style="margin-left: 20%;margin-bottom:10px;margin-top:20px;">People you may know</h6>
            <div style="margin-top: 5%;max-height:130px;overflow:auto;" id="notFrndDiv">                
                     <c:if test="${!empty userdetailsnotfriend}">
        
    <table align="left" border="1"  style="color:black;">
            <c:forEach items="${userdetailsnotfriend}" var="userdetail">
                <tr>
            <td>
                <input type="radio" name="notfriend" id="notfriend" value="${userdetail.privateIdentity}" ><font><c:out value="${userdetail.privateIdentity}"/></font><br>
                </td>                
            </tr>
            </c:forEach>
            
    </table>
</c:if>     
            </div>
            </div>                
        
     <div style="height: 30%;">
            <button style="width: 50px; margin-right: 5px;" id="call" class="button" onclick="callFunc();">Call</button>
            <!-- <button style="width: 60px; margin-right: 5px;" id="message" class="button" onclick="messageFunc();">Message</button> -->
            <button style="width: 50px; margin-right: 5px;"id="removeFrnd" onclick="removeFrnd();"  class="button">Remove</button>
            <button style="width: 50px; margin-right: 5px;" id="add" onclick="addToFriendList();" class="button">Add </button>
    
    
<div style="height: 65%;display:none;" id="displayDetails">
                <table style="margin-top:5%;">
                    <tr><td><label>Name: </label></td>
                        <td><input style="border: none;" type="text" id="displayName1" name="displayName1"  class="round full-width-input" readonly="readonly"/></td>        
                    </tr>
                    <tr><td><label >PublicIdentity: </label></td>
                        <td><input style="border: none;" type="text" id="publicIdentity1" name="publicIdentity1"  class="round full-width-input" readonly="readonly" /></td>
                    </tr>
                    <tr><td><label >PrivateIdentity: </label></td>
                    <td><input style="border: none;" type="text" id="privateIdentity1" name="privateIdentity1"  class="round full-width-input" readonly="readonly"/></td>
                    </tr>
                    <tr><td><label>Realm: </label></td>
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
		
		<script type="text/javascript">
						function doAjaxPostGeolocations() {  
							  // get the form values  
	
							  var sipuri = $('#sipuri').val();
							  var latitude = $('#latitude').val();
							  var longitude = $('#longitude').val();
							  var date = $('#date').val();
							  var time = $('#time').val();
							  alert (" contact data "+ sipuri+""+ latitude+""+longitude)
							  
							  $.ajax({  
							    type: "POST",  
							    url: "/sdnext/addgeolocationajax.html",  
							    data: "sipuri=" + sipuri + "&latitude=" + latitude+
							    "&longitude="+ longitude+"&date="+date+"&time="+time,  
							    success: function(response){  
							      // we have the response  
							      $('#infogeolocation').html(response);
	
							  
							    },  
							    error: function(e){  
							      alert('Error: ' + e);  
							    }  
							  });  
							}  
						</script>
						
				
					<h2>Add Geolocation Data</h2>
					
					<form:form method="POST" action="/sdnext/savegeolocation.html">
	   		<table>
			    <tr>
			        <td><form:label path="sipuri">Sip Uri:</form:label></td>
			        <td><form:input path="sipuri" value="${geolocation.sipuri}" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="latitude">Latitude:</form:label></td>
			        <td><form:input path="latitude" value="${geolocation.latitude}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="longitude">Longitude:</form:label></td>
			        <td><form:input path="longitude" value="${geolocation.longitude}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="date">Date:</form:label></td>
			        <td><form:input path="date" value="${geolocation.date}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="time">Time:</form:label></td>
                    <td><form:input path="time" value="${geolocation.time}"/></td>
			    </tr> 
			    
			    <tr>
			    <td><input type="button" value="Add Contact" onclick="doAjaxPostGeolocations()"></td>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>
				<div id="infogeolocation" style="color: green;"></div> 
				
				<script type="text/javascript"> 
				
			    $(function() { 
				initialize(); 	
			    });   
			    
			    function initialize() {
			    	  var t = [];
			          var x = [];
			          var y = [];
			          var h = [];  			    
			   	    		
			        var map_options = {
			            center: new google.maps.LatLng(28.459497000000237,77.02663799999976),
			            zoom: 14,
			            mapTypeId: google.maps.MapTypeId.ROADMAP
			        };
			
			        var google_map = new google.maps.Map(document.getElementById("map_canvas"), map_options);
			
			        var info_window = new google.maps.InfoWindow({
			            content: 'loading',
			        });
			        var i = 0;
					for ( item in t ) {
						 var m = new google.maps.Marker({
				                map:       google_map,
				                animation: google.maps.Animation.DROP,
				                title:     t[i],
				                position:  new google.maps.LatLng(x[i],y[i]),
				                html:      h[i],
				            });
				
				            google.maps.event.addListener(m, 'click', function() {
				                info_window.setContent(this.html);
				                info_window.open(google_map, this);
				            });
				            i++;
				        };		           
			    };
				</script> 					
		
		
			<div id="map_canvas" style="width:80%;height:50%;">Google Map</div> 	
				
				
				
	</div> 
	<!-- geolocationModal ends here --> 
		
		<div id="offline-message-modal" class="reveal-modal-offline">
		<h2>Offline Messages</h2>
		<a class="close-reveal-modal">&#215;</a>
						
						
						<!-- <script type="text/javascript">
						function doAjaxPostOpenid() {  

							  var sipuri = $('#sipuri').val();
							  var facebook = $('#facebook').val();
							  var google = $('#google').val();
							  var yahoo = $('#yahoo').val();

							  alert( sipuri+ " "+ facebook +" "+ google+ " "+ yahoo);
							  
							  $.ajax({  
							    type: "POST",  
							    url: "/sdnext/addopenidajax.html",  
							    data:  "sipuri=" + sipuri + "&facebook=" + facebook + 
							    	  "&google=" + google + "&yahoo=" + yahoo ,
	 
							    success: function(response){  
							      // we have the response  
							      $('#infoopenid').html(response);
							   		
							     /*  $('#sipuri').val('');
							    	 $('#facebook').val('');
									 $('#google').val('');
							    	 $('#yahoo').val(''); */
							  
							    },  
							    error: function(e){  
							      alert('Error: ' + e);  
							    }  
							  });  
							}  
						</script> -->
						
						<script>
						function sendtogmail() {  

							  var sipuri = $('#sipurireceiver').val();
							  var message = $('#message1').val();
							 

							  alert( sipuri+ " "+ message );
							  
							  $.ajax({  
							    type: "POST",  
							    url: "/sdnext/offlinemailgmail.html",  
								data:{sipuri:$("#sipurireceiver").val(),message:$("#message1").val()},
		                		success:function(data){
		                			alert("Message has been sent");
		                		},
					
							  });  
							}  
						
						</script>
						
						<section id="main">
			<div align="center" style="margin-top: 20px;">
			     <table class="profiletable">
				    <tr>
						<td  style="color: black;">To:</td>
					    <td><input type="text" name="sipurireceiver" id="sipurireceiver" placeholder="Please enter the sip uri."/></td>
					    <td></td>
					</tr>
				    <tr>
						<td  style="color: black;vertical-align: top;">Message:</td>
						<td><textarea id="message1" name="message1" rows="6" cols="30" style="background-color:white;" placeholder="Please enter the mesage to send."></textarea></td>
						<td></td>
				    </tr>
				 </table>
				 <table>
				 <tr><td><br/><br/></td></tr>
					<tr>
						<td><button name="submit" class="button" value="Send_to_gmail" onclick="sendtogmail();">
						<img src="<c:url value="resources/metroui/images/gmailIcon.jpg"/>" width="40" height="40"></button>
						&nbsp;&nbsp;
						<td><button name="submit" class="button" value="Send_to_facebook" onclick="sendtofacebook();">
						<img src="<c:url value="resources/metroui/images/facebookIcon2.png"/>" width="40" height="40"></button>
						&nbsp;&nbsp;
						<td><button name="submit" class="button" value="Send_to_yahoo" onclick="sendtoyahoo();">
						<img src="<c:url value="resources/metroui/images/yahooIcon.png"/>" width="40" height="40"></button>
						</td>
					</tr>
				</table>				
			</div>
			<div align="center" style="margin-top: 30px;">
				<!-- <table>
					<tr>
					<td><a onclick="openLinkFacebook();">Import contacts from Facebook</a></td ><td width="10%"></td>
					<td><a onclick="google();">Import contacts from Google</a></td>
					</tr>
				</table>	 -->			
			</div>
		</section>
						
	</div>
	<!-- offlineMessages ends here -->
	
	
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
						</span>
						</div>
					</a>

					<!-- Tile 2 -->
			<a href="#" onclick="return videoConf();" data-animation="fade"> 
					<div class="tile medium live" data-stops="0,60%,100%" data-speed="750" data-delay="2500">
							<div class="live-front blue">
								<img class="live-img" src="<c:url value="resources/metroui/images/VideoConf.png"/>" alt="No image found" />
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
								<img class="live-img" src="<c:url value="resources/metroui/images/CallLog.png"/>" alt="No image found" />
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
								<img class="live-img" src="<c:url value="resources/metroui/images/CenterTile.jpg"/>"	alt="No image found" />
							</div>
						</div>
					</a> 

					<!-- Tile 5 -->
					<a href="#" data-reveal-id="geoLocationModal" data-animation="fade">
						<div class="tile medium live" data-stops="0,75%,100%" data-speed="750" data-delay="1500">
							<div class="live-front red">
								<img class="live-img" src="<c:url value="resources/metroui/images/Geolocation.png"/>"
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
								<img class="live-img" src="<c:url value="resources/metroui/images/Call.png"/>"
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
								<img class="live-img" src="<c:url value="resources/metroui/images/messaging1.jpg"/>"
									alt="No image found" />
							</div>
							<div class="live-back purple">
								<div class="fliptile"><p>Offline Messages</p></div>
							</div>
						</div>
					</a>

					<!-- Tile 8 -->
					<a href="#" data-reveal-id="friendList" data-animation="fade">
						<div class="tile medium live" data-stops="100%"
							data-speed="1000" data-delay="4000">
							<div class="live-front green">
								<img class="live-img" src="<c:url value="resources/metroui/images/Contacts.png"/>"
									alt="No image found" />
							</div>
							<div class="live-back green">
								<div class="fliptile"><p>Contacts</p></div>
							</div>
						</div>
					</a>
					
					
					
					<!-- Tile 9 -->
					<!-- <a href="#" onclick="openVoicemail();" data-animation="fade">
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
					</a> -->
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
	
	

	<!-- Audios -->
	<audio id="audio_remote" autoplay="autoplay"></audio>
	<audio id="ringtone" loop src="<c:url value="resources/metroui/sounds/ringtone.wav"/>"></audio>
	<audio id="ringbacktone" loop src="<c:url value="resources/metroui/sounds/ringbacktone.wav"/>"></audio>
	<audio id="dtmfTone" src="<c:url value="resources/metroui/sounds/dtmf.wav"/>"></audio>
	
<!-- expert script  -->	
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
                        <input type="text" style="width: 100%; height: 100%" id="txtWebsocketServerUrl" value="ws://14.96.153.177:443"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">SIP outbound Proxy URL<sup><a href="#aSIPOutboundProxyURL">[3]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtSIPOutboundProxyUrl" value="udp://14.96.153.177:5060"  />
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
    
 <!--  notification block  --> 
<div id="containerNote" style="display:none;z-index:2000000">
<div id="withIcon">
	<a class="ui-notify-close ui-notify-cross" href="#">x</a>
			<div style="float:left;margin:0 10px 0 0"><img src="images/info.png" alt="warning" style="width: 64px;height: 64px" /></div>
			<h1 >!{title}</h1>
			<p>!{text}</p> 	
</div>
</div>

</body>
</html>
