<%@page import="com.tcs.bean.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Unified Communicator</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <link rel="author" type="text/html" href="https://plus.google.com/100325991024054712503">
        <meta name="author" content="Pawan">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">       
               
        <style>
	        body{
	        background: #eee url('../img/modal-gloss.png') no-repeat -200px -80px;
	        }
            audio, video {
                -moz-transition: all 1s ease;
                -ms-transition: all 1s ease;                
                -o-transition: all 1s ease;
                -webkit-transition: all 1s ease;
                transition: all 1s ease;
                vertical-align: top;
            }
            input{
                border: 1px solid #d9d9d9;
                border-radius: 1px;              
                margin: .2em;
                margin-top:0em;
                padding:0em;
                width: 20%;                
            }
            select {
                border: 1px solid #d9d9d9;
                border-radius: 1px;
                height: 50px;
                margin-left: 1em;
                margin-right: -12px;
                padding: 1.1em;
               	padding-top:0em;
                vertical-align: 6px;                
            }
            .setup {
                border-bottom-left-radius: 2;
                border-top-left-radius: 2;                
                height: 47px;
                margin-left: -9px;
                margin-top: 1px;
                position: absolute;
            }
            p { padding: 1em; }
            #chat-output div, #file-progress div {
                border: 1px solid black;
                border-bottom: 0;
                padding: .1em .4em;
            }
            #chat-output, #file-progress {
                margin: 0 0 0 .4em;
                max-height: 12em;
                overflow: auto;
            }
            .data-box input {
                border: 1px solid black;
                font-family: inherit;
                font-size: 1em;
                margin: .1em .3em;
                margin-top:0em;
                outline: none;
                padding: .1em .2em;
                padding-top:0em;
                width: 97%;
            }   
        	fieldset legend{
				font-size: 18px;
				font-family: sans-serif;
				text-shadow: none;
				font-weight: bold;
			}
        </style>
        
       
        
        <!-- !-- -----------------------------------------Scriptlets---------------------------------- -->
	<%-- <%/* Login login2=new Login(); */
        	Login login2= new Login(); 
        	ArrayList<String> friendList= new ArrayList<String>(); 
        	ArrayList<String> notFriend=new ArrayList<String>();
        	%>
        	<% if(session.getAttribute("data")!=null){
        		login2= (Login)session.getAttribute("data");
        		friendList=login2.getPrivateIdentityFrd();
        		notFriend=login2.getPrivateIdentityNotFrd();
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
        	 --%>
        	
        	 <!-- Hidden fields for calling -->
	<input type="hidden" style="width: 100%; height: 100%" id="txtRealm"
		value="<%=login2.getRealm().toString()%>" autocomplete='off' />
	<input type="hidden" style="width: 100%; height: 100%"
		id="txtPrivateIdentity" value="<%=login2.getPublicIdentity().toString()%>" autocomplete='off' />
	<input type="hidden" style="width: 100%; height: 100%"
		id="txtPublicIdentity" value="<%=login2.getPrivateIdentity().toString()%>" autocomplete='off' />
	   <input type="hidden" style="width: 100%; height: 100%" id="txtPassword"
		value="<%=login2.getPassword().toString()%>" autocomplete='off' /> 
	<input type="hidden" style="width: 100%; height: 100%"
		id="txtDisplayName" value="<%=login2.getDisplayName().toString()%>" autocomplete='off' />
        
<!-- Javascript code --> 
        <script src="SIPml-api.js?svn=179" type="text/javascript"></script>
        <script>
       
        var oSipStack, oSipSessionRegister, oSipSessionCall, oSipSessionTransferCall;
        
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
       /*  window.onload = function () {
        	
        	sipRegister();
        }; */
        window.onbeforeunload = function sipPuru()
        {
        	
        	 oSipStack.stop();
            //sipUnRegister();
            return true;     //comment out 'return' to suppress prompt
        } 
     // sends SIP REGISTER request to login
        function sipRegister() {
            // catch exception for IE (DOM not ready)
           ///alert ("sip register func :");
            try {
            	//reading from file==============================
            	var request = new XMLHttpRequest();
            	request.open('GET', 'WebSocketIP.txt', false);
            	request.send();

            	var textFileContent = request.responseText;
            	var content=textFileContent.split("*");
            	//alert("content is"+content); 
            	var webIp=content[0];
            	var proxyIp=content[1];
            	
            	//======================================================
                /* btnRegister.disabled = true;
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

                // save credentials */
               /*  saveCredentials();
                window.localStorage.setItem('com.s.v.bool', "true"); */
                // update debug level to be sure new values will be used if the user haven't updated the page
                //SIPml.setDebugLevel((window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_debug') == "true") ? "error" : "info");

                // create SIP stack
                oSipStack = new SIPml.Stack({
                       /*  realm: txtRealm.value,
                        impi: txtPrivateIdentity.value,
                        impu: txtPublicIdentity.value,
                        password: txtPassword.value,
                        display_name: txtDisplayName.value, */
                       
                        realm: txtRealm.value,
                        impi: txtPrivateIdentity.value,
                        impu: txtPublicIdentity.value,
                        password: txtPassword.value,
                        display_name: txtDisplayName.value,
                       // websocket_proxy_url: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.websocket_server_url') : null),
                        websocket_proxy_url: webIp,
                      //  outbound_proxy_url: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.sip_outboundproxy_url') : null),
                        outbound_proxy_url: proxyIp,
                        ice_servers: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.ice_servers') : null),
                        enable_rtcweb_breaker: "true",
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
                oSipStack.start();
                   // txtRegStatus.innerHTML = '<b>Failed to start the SIP stack</b>';
               
               
            }
            catch (e) {
                txtRegStatus.innerHTML = "<b>2:" + e + "</b>";
            }
           // btnRegister.disabled = false;
        }

        // sends SIP REGISTER (expires=0) to logout
        function sipUnRegister() {
            if (oSipStack) {
                oSipStack.stop(); // shutdown all sessions
            }
        }
        
        function main(param)
     	{
    	 	if("empty".match(param))
    	 	{
    	 		friendslist= new Array(<%String[] arrFrnd=new String[login2.getPrivateIdentityFrd().size()];
    			arrFrnd=login2.getPrivateIdentityFrd().toArray(arrFrnd);
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
        main('empty');
        
        
      //presence
    	function sipPublis(s_type) {
    				 //alert("Your status has been published "); 
    				// alert("login name is"+login2.getPrivateIdentity());
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
    		var loggedInUser=txtPublicIdentity.value;
    		
    		var contentType = 'application/pidf+xml';
    		var content = '<?xml version="1.0" encoding="UTF-8"?>\n'
    				+ '<presence xmlns="urn:ietf:params:xml:ns:pidf">\n' +

    				'<tuple id="rr">\n' + '<status>\n' + '<basic>open</basic>\n'
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
    		//alert("inside subs friendlist");
    		//alert(friendslist);
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
                        //alert("inside cong regneww");
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
            case 'starting': default: break;
        }
    };
    
    function onSipEventSession(e /* SIPml.Session.Event */) {
        tsk_utils_log_info('==session event = ' + e.type);

        switch (e.type) {
        case 'i_notify': {
        	//alert("inside notify");
			console.info('NOTIFY content = ' + e.getContentString());
			console.info('NOTIFY content-type = ' + e.getContentType());

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
															//alert("contact uri is"+contactUri);
									
															infoArray=new Array(20);
															for(var i=0;i<infoArray.length;i++)
																{
																
																	infoArray[i]=new Array(20);
																	infoArray[i][0]=contactUri;
																	infoArray[i][1]="online";
																	document.getElementById(contactUri).src="images/online.png";
																	//alert("array is"+infoArray);
																
															}
															
																
																//infoArray[i][0]=contactUri;
																//document.getElementById("stat").value="online";
															
														
													}
														else{
															var i=0;
															infoArray[i]=new Array();
															infoArray[i][0]=contactUri;
															infoArray[i][1]="offline";
															document.getElementById(contactUri).src="images/offline.gif";
															
													
															
															//document.getElementById("stat").value="offline";
															


															
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
			break;
		}
        }
  	 }
        
        </script>
        <!--changes ends-->
        <script>
            document.createElement('article');
            document.createElement('footer');
            function check(){
            	
            }
        </script>
        <script src="scripts/RTCMultiConnection-v1.4.js"> </script>
    	</head>

    	<body onload="sipRegister();"> 
    	 	<button onclick="window.close();" style="float:right;">Exit</button>
    	
    	<br/>
    	<!-- Conferencing Details -->    
    	<fieldset>     
    	<legend><h2 style="display: block;text-align:left; font-size: 1em;"><span style="color:#0370ea;">Conferencing Details</span></h2></legend>     
        <section style="margin-top:10px;">        	
             	<select id="session" title="Session">              
                      <option selected>Select mode of Conferencing</option>         
                        <option>audio+video+data</option>						            
                        <option >audio+video</option>    
                        <option>audio+data</option>
                        <option>video+data</option>
                        <option>audio</option>
                        <option>video</option>
                        <option>data</option>                      
                </select>  
                <select id="direction" title="Direction">
                        <option selected>Select way of Conferencing</option>
                        <option>many-to-many</option>
                        <option>one-to-one</option>
                        <option>one-to-many</option>
                        <option>one-way</option>
                </select>	   
                <input type="text" id="session-name" placeholder="Create Conference Room" style="height:45px;text-align:center; margin-left:15px;margin-right:15px;margin-down:47px;">
                 <div style="max-height:250px;overflow:auto;float: right;width:290px;" id="frndDiv">	
	        		<h4 align="center"><span style="color:#088A08;margin:0%;">Select friends for conference</span></h4>			
				    <table border="1" style="width:100%;height:100%;" id="frndTable">		   
				     <%if(friendList!=null){	    	
				    	ArrayList<String> status=(ArrayList<String>)login2.getPresenceStatus();
				    	for(int i=0;i<friendList.size();i++)
				    	{
				    		String statusCheck=status.get(i);
			    	%>
				    <tr><td>
				     <input type="checkbox" name="members" value="<%=friendList.get(i)%>"/><%=friendList.get(i) %><br>
				    <!-- <input type="radio" name="friend" id="friend"  onclick="getFriend();"><font><br> -->
					</td>
					<td><%if("offline".equalsIgnoreCase(statusCheck)){ %><img id="<%=friendList.get(i) %>" src="images/offline.gif" style="width: 10px;height: 10px;"><% }else{%> <img id="<%=friendList.get(i) %>" src="images/online.png" style="width: 10px;height: 10px;"><%} %></td>
					
					</tr>
					<%} }%>
					</table>
					<button id="setup-new-session" class="setup" style="height:30px;margin-top:10px;margin-left:50px;">Click To Start Conferencing</button>
				</div>	
				
              
           </section>
           <!-- Conferencing Details ends-->  
                
           <!-- list of all available broadcasting rooms -->
           <table style="width: 60%;" id="rooms-list"></table>
                
           <!-- VideoConferencing Details -->     
           <!-- local/remote videos container -->
	        <h2 style="display: block;text-align:left; font-size: 1em;"><span style="color:#0370ea;">Video Conferencing</span></h2>
	        
	        
	        <div id="videos-container"></div>
	        </fieldset>
			<!-- VideoConferencing Details ends -->  
				
		  <!-- Messaging -->  
		 <br/><br/>
          <section class="experiment data-box">  
          <fieldset>
                <legend>              
                 <h2 style="display:block;text-align:left; font-size: 1em;"><span style="color:#0370ea;">Messaging And File Sharing</span></h2></legend>
                 <table style="width: 100%;">
                    <tr>
                        <td>
                          <h2 style="display: block; font-size: 1em; text-align:left;"><span style="color:#0370ea;">Text Chat</span></h2>
                            <div id="chat-output"></div>
                            <input type="text" id="chat-input" style="font-size: 1.2em;" placeholder="chat message" disabled>
                        </td>
                        <td>
                            <h2 style="display: block; font-size: 1em; text-align:left;"><span style="color:#0370ea;">Share Files </span></h2>
                            <input type="file" id="file"  disabled>
                            <div id="file-progress"></div>
                        </td>
                    </tr>
                </table>
            </fieldset>
           </section>
           <!-- Messaging ends -->  
            
            <script>
            var connection = new RTCMultiConnection();
                connection.session = {
                    audio: true,
                    video: true
                };
                connection.enableSessionReinitiation = false;
                connection.openSignalingChannel = function(config) {
                    var channel = config.channel || this.channel;
                   
                    var sender = Math.round(Math.random() * 999999999) + 999999999;
                    var websocket = new WebSocket('ws://54.215.209.44:8888');
                    websocket.channel = config.channel || this.channel;
                    websocket.onopen = function() {
                        websocket.push(JSON.stringify({
                            open: true,
                            channel: websocket.channel
                        }));
                        if (config.callback) config.callback(websocket);
                    };
                    websocket.onmessage = function(event) {
                        config.onmessage(JSON.parse(event.data));
                    };
                    websocket.push = websocket.send;
                    websocket.send = function(data) {
                        websocket.push(JSON.stringify({
                            data: data,
                            channel: websocket.channel
                        }));
                    };
                    //socket.on('message', config.onmessage);
                };

                var roomsList = document.getElementById('rooms-list'), sessions = { };
                connection.onNewSession = function(session) {
                    if (sessions[session.sessionid]) return;
                    sessions[session.sessionid] = session;

                    var tr = document.createElement('tr');
                    tr.innerHTML = '<td><strong>' + session.extra['session-name'] + '</strong> is an active session.</td>' +
                        '<td><button class="join">Join</button></td><td><button onclick="window.close();">Decline</button></td>';
                    roomsList.insertBefore(tr, roomsList.firstChild);

                    tr.querySelector('.join').setAttribute('data-sessionid', session.sessionid);
                    tr.querySelector('.join').onclick = function() {
                        this.disabled = true;

                        session = sessions[this.getAttribute('data-sessionid')];
                        if (!session) alert('No room to join.');

                        connection.join(session);
                    };
                };

                var videosContainer = document.getElementById('videos-container') || document.body;
                connection.onstream = function(e) {
                    videosContainer.insertBefore(e.mediaElement, videosContainer.firstChild);
                    rotateInCircle(e.mediaElement);
                };

                connection.onstreamended = function(e) {
                    if (e.mediaElement.parentNode) {
                        e.mediaElement.parentNode.removeChild(e.mediaElement);
                        scaleVideos();
                    }
                };

                var setupNewSession = document.getElementById('setup-new-session');
                setupNewSession.onclick = function() {
                 
                    var chkElem = document.getElementsByName("members");
                    var choice ="";
                    var confType=document.getElementById("session").value;
                
                    var confDirection=document.getElementById("direction").value;
                    var confTypeBool=false;
                    var confDirectionBool=false;
                    var confRoomProb=false;
                    var confRoom=document.getElementById("session-name").value;
                  
                   
                    if("".match(confRoom)){
                    	confRoomProb=true;
                    }
                    if(confType.match("Select mode of Conferencing")){
                    	confTypeBool=true;
                    }
                    if(confDirection.match("Select way of Conferencing")){
                    	confDirectionBool=true;
                    }
                    var check=false;
					var index=0;
                	for(var i=0; i< chkElem.length; i++)
                     {
                         if(chkElem[i].checked){
                        	 check=true;
                        	 if(index==0){
                        	 choice = choice + chkElem[i].value;
                        	 index++;
                        	 }
                        	 else
                        		choice = choice +"$"+chkElem[i].value;
                         }
                             
                     }
                	if(check && !confTypeBool && !confDirectionBool &&!confRoomProb){
                	setupNewSession.disabled = true;
                	var xmlHttpRequest=new XMLHttpRequest();
                	xmlHttpRequest.open("POST","ConferenceServlet?action=addConferenceDetails&members="+choice+"&conferenceName="+document.getElementById("session-name").value,true);
                	xmlHttpRequest.send();
                	xmlHttpRequest.onreadystatechange=function(){
                		if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
                			alert("Notifications have been sent");
                		}
                	};
                    var direction = document.getElementById('direction').value;
                    var _session = document.getElementById('session').value;
                    var splittedSession = _session.split('+');

                    var session = { };
                    for (var i = 0; i < splittedSession.length; i++) {
                        session[splittedSession[i]] = true;
                    }

                    var maxParticipantsAllowed = 256;

                    if (direction == 'one-to-one') maxParticipantsAllowed = 1;
                    if (direction == 'one-to-many') session.broadcast = true;
                    if (direction == 'one-way') session.oneway = true;

                    var sessionName = document.getElementById('session-name').value;
                    connection.extra = {
                        'session-name': sessionName || 'Anonymous'
                    };

                    connection.session = session;
                    connection.maxParticipantsAllowed = maxParticipantsAllowed;
                    connection.open();
                	}
                	else{
                		if(confTypeBool){
                			alert("Please select mode of conferencing");
                		}
                		else if(confDirectionBool){
                			alert("Please select a way of conferencing");
                		}
                		else if(confRoomProb){
                			alert("Please specify a conference name");
                		}
                		else if(!check){
                			alert("Please select contacts for conferencing");
                		}
                		
                	}
                };
                

                function rotateInCircle(video) {
                    video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(0deg)';
                    setTimeout(function() {
                        video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(360deg)';
                    }, 1000);
                    scaleVideos();
                }

                function scaleVideos() {
                    var videos = document.querySelectorAll('video'),
                        length = videos.length, video;
						
                    var minus = 130;
                    var windowHeight = 700;
                    var windowWidth = 600;
                    var windowAspectRatio = windowWidth / windowHeight;
                    var videoAspectRatio = 4 / 3;
                    var blockAspectRatio;
                    var tempVideoWidth = 0;
                    var maxVideoWidth = 0;

                    for (var i = length; i > 0; i--) {
                        blockAspectRatio = i * videoAspectRatio / Math.ceil(length / i);
                        if (blockAspectRatio <= windowAspectRatio) {
                            tempVideoWidth = videoAspectRatio * windowHeight / Math.ceil(length / i);
                        } else {
                            tempVideoWidth = windowWidth / i;
                        }
                        if (tempVideoWidth > maxVideoWidth)
                            maxVideoWidth = tempVideoWidth;
                    }
                    for (var i = 0; i < length; i++) {
                        video = videos[i];
                        if (video)
                            video.width = maxVideoWidth - minus;
                    }
                }

                window.onresize = scaleVideos;

                connection.onmessage = function(e) {
                    appendDIV(e.data);

                    console.debug(e.userid, 'posted', e.data);
                    console.log('latency:', e.latency, 'ms');
                };

                // on data connection gets open
                connection.onopen = function() {
                    if (document.getElementById('chat-input')) document.getElementById('chat-input').disabled = false;
                    if (document.getElementById('file')) document.getElementById('file').disabled = false;
                    if (document.getElementById('open-new-session')) document.getElementById('open-new-session').disabled = true;
                };

                // sending/receiving file(s)
                // connection.autoSaveToDisk = false;
                connection.onFileProgress = function(packets, uuid) {
                    appendDIV(uuid + ': ' + packets.remaining + '..', 'file', fileProgress);
                };

                connection.onFileSent = function(file) {
                    appendDIV(file.name + ' sent.', fileProgress);
                };

                connection.onFileReceived = function(fileName) {
                    appendDIV(fileName + ' received.', fileProgress);
                };

                document.getElementById('file').onchange = function() {
                    connection.send(this.files[0]);
                };

                var chatOutput = document.getElementById('chat-output'),
                    fileProgress = document.getElementById('file-progress');

                function appendDIV(data, parent) {
                    var div = document.createElement('div');
                    div.innerHTML = data;

                    if (!parent) chatOutput.insertBefore(div, chatOutput.firstChild);
                    else fileProgress.insertBefore(div, fileProgress.firstChild);

                    div.tabIndex = 0;
                    div.focus();

                    chatInput.focus();
                }

                var chatInput = document.getElementById('chat-input');
                chatInput.onkeypress = function(e) {
                    if (e.keyCode !== 13 || !this.value) return;
                    appendDIV(this.value);

                    // sending text message
                    connection.send(this.value);

                    this.value = '';
                    this.focus();
                };

                connection.connect();
            </script>
    </body>
</html>

