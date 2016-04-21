<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Communication Client</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <link rel="author" type="text/html" href="https://plus.google.com/100325991024054712503">
        <meta name="author" content="Pawan">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <script src="<c:url value="resources/metroui/scripts/jquery-1.6.1.min.js"/>" type="text/javascript"></script>
        <style>
	        body{
	        background: #eee;
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
	 <!-- <script type="text/javascript">     
        var timer=setInterval(function(){
        	var xmlHttpRequest1=new XMLHttpRequest();
    		xmlHttpRequest1.open("POST","ConferenceServlet?action=checkSession",true);
    		xmlHttpRequest1.send();
    		xmlHttpRequest1.onreadystatechange=function(){
    			if(xmlHttpRequest1.readyState==4&&xmlHttpRequest1.status==200){
    				if(xmlHttpRequest1.responseText.match("FALSE")){
    					window.location.href="Last.jsp";
    				}
    			}
    		};
			},5000);
        </script>  -->
	
        	
        	
    <!-- Hidden fields for calling -->
	
	
		<input type="hidden" id="hostUser" value="${contact.sipuri}">
		<%-- <td><c:out value="${contact.sipuri}"/></td>	 --%>
	   <input type="hidden"  id="txtPassword" value="bob"/> 
	
        
	<!-- Java script code --> 
              <!--changes ends-->
        <script>
        
            document.createElement('article');
            document.createElement('footer');
        </script>
        <script src="<c:url value="resources/metroui/scripts/RTCMultiConnection-v1.4.js"/>"> </script>
		<%-- <script type="text/javascript">
			var xmlHttpRequest2=new XMLHttpRequest();
			function getLatestFriends(){
			var privateIdentity=document.getElementById("txtPublicIdentity").value;
			var password=document.getElementById("txtPassword").value;
			xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?action=getFreshData&privateIdentity="+privateIdentity+"&password="+password,true);
			xmlHttpRequest2.onreadystatechange=responseFromServletForRefresh;
			xmlHttpRequest2.send();
			}

			function responseFromServletForRefresh(){
			
			if(xmlHttpRequest2.readyState==4&&xmlHttpRequest2.status==200)
			{
				document.getElementById("frndDiv").innerHTML=""; // dynamo woh div h jisme tumahri lists display ho rhin h
			
			
				var table=$('<table id="frndTable" border="1" style="width:100%;"></table>');
				var jsonResponseFromServer=eval('('+xmlHttpRequest2.responseText+')');
				var i=0;
				$.each(jsonResponseFromServer.Friends, function(key, val) {
					 var tr=$('<tr></tr>');
					 i++;
					
					$.each(val, function(k, v){
						
						if(k.match("NAME")){
							$('<td><input type="checkbox"  name="members" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
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
				} 
		 }	
			var timer=setInterval(function(){
				 var checkedElements = document.getElementsByName("members");
				 var flag=false;	
				 for(var i=0; i< checkedElements.length; i++)
                    {	
                        if(checkedElements[i].checked){
                        flag=true;
                        }
                        }
                if(!flag){        
				var privateIdentity=document.getElementById("txtPublicIdentity").value;
				var password=document.getElementById("txtPassword").value;
				xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?action=getFreshData&privateIdentity="+privateIdentity+"&password="+password,false);
				xmlHttpRequest2.onreadystatechange=responseFromServletForRefresh;
				xmlHttpRequest2.send();}
				},20000);
			
			</script> --%>
    	</head>

    	<body><!--  onload="getLatestFriends()" --> 
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
                 <div style="float: right;width:290px;">	
	        			<h4 align="center"><span style="color:#088A08;margin:0%;">Select friends for conference</span></h4>	
	        		
	        		
	        		<div style="float: right;width:290px; max-height:160px; overflow: auto;" id="frndDiv">
				   <!--  <table border="1" style="width:100%;" id="frndTable">	 -->
	   
				  <c:if test="${!empty contacts}">
	<table align="left" border="1">

		<c:forEach items="${contacts}" var="contact">
		<c:set var="friendlist" value="${fn:split(contact.friend, ',')}" />
		
<c:forEach var="friend" items="${friendlist}"> 
   

			<tr>
	<td><c:out value="${contact.sipuri}"/></td>	
	<input type="hidden" value="${contact.sipuri}" id="hostUser"/>
		 <td><input type="checkbox" name="members" value="${friend}"/><c:out value="${friend}"/></td>
	<%-- 	<td><c:out value="${friend}"/></td> --%>
				
				<%-- <td align="center"><a href="edit.html?id=${contact.sipuri}">Edit</a> | <a href="delete.html?id=${contact.sipuri}">Delete</a></td> --%>
			</tr>
			</c:forEach>
			
		</c:forEach>
	</table>
</c:if>
					<!-- </table>  -->
					
				</div>	
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
			<div style="float: right;width:290px;height:40px; margin-right: 60px;">
					<button id="setup-new-session" class="setup" style="margin-top:10px;height:30px;margin-left:50px;">Click To Start Conferencing</button>
					<button id="inviteNewMember" class="setup" style="margin-top:10px;height:30px;margin-left:50px; display: none;" onclick="inviteNewMem();">Invite New Members</button>
					</div>	
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
                            <input type="file" id="file" disabled>
                            <!-- For indicator -->
                            <div>
                            <div id="progressBar" style="display:none;width:300px;margin:5px;padding:2px;background-color:white;border:1px solid black;text-align:center">
                            	<div style="width:0px;height:15px;background-color:green;" id="indicator"> 
                            		<div style="margin: 0 auto;font-weight: bold;" id="percentage"></div>                     		
                            	</div>
                            </div>
                             <div id="file-status" style="margin:5px;"></div>
                            </div>
                            <div id="file-progress" style="display:none;"></div>                          
                        </td>
                    </tr>
                </table>
            </fieldset>
           </section>
           <!-- Messaging ends -->  
    
            <script>
            var alreadyAddedMem =new Array();
            var connection = new RTCMultiConnection();
                connection.session = {
                    audio: true,
                    video: true
                };
                connection.enableSessionReinitiation = false;
                connection.openSignalingChannel = function(config) {
                    var channel = config.channel || this.channel;
                    var sender = Math.round(Math.random() * 999999999) + 999999999;
                    var websocket = new WebSocket('ws://14.96.130.114:8888');
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
                        '<td><button class="join">Join</button></td><td><button onclick="window.close();">Terminate</button></td>';
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
                	for(var j=0; j< chkElem.length; j++)
                     {	
                         if(chkElem[j].checked){
                        	 check=true;
                         }
                             
                     }
                	if(check && !confTypeBool && !confDirectionBool &&!confRoomProb){
                		
     					var index=0;
     					
                     	for(var i=0; i< chkElem.length; i++)
                          {	
                              if(chkElem[i].checked){
                             
                             	 chkElem[i].disabled=true;
                            	 chkElem[i].checked=false;
                            	 alreadyAddedMem[alreadyAddedMem.length]=chkElem[i].value;
                            	 if(index==0){
                            		
                            	 choice = choice + chkElem[i].value;
                            	 index++;
                            	 }
                            	 else
                            		choice = choice +"$"+chkElem[i].value;
                              }
                                  
                          }
                		
                	setupNewSession.style.display = "none";
                	document.getElementById("inviteNewMember").style.display = "";
                	/*  var xmlHttpRequest=new XMLHttpRequest();
                	xmlHttpRequest.open("POST","/sdnext/addConference/members/"+choice+"/conferenceName/"+document.getElementById("session-name").value+"/hostName/"+document.getElementById("hostUser").value,true);
                	xmlHttpRequest.send();
                	xmlHttpRequest.onreadystatechange=function(){
                		if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
                			alert("Notifications have been sent");
                			document.getElementById("session-name").disabled=true;
                			document.getElementById("session").disabled=true;
                			document.getElementById("direction").disabled=true;
                		}
                	};   */
                	alert("rupali"+$("#hostUser").val());
                	 $.ajax({
                		type:"POST",
                		url:"/sdnext/addConference.html",
                		data:{members:choice,conferenceName:$("#session-name").val(),hostName:$("#hostUser").val()},
                		success:function(data){
                			alert("Notifications have been sent");
                		}
                	}); 
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
               
			/* 	function inviteNewMem(){
					 	var check=false;
						var index=0;
						var choice="";
						 var chkElem = document.getElementsByName("members");
	                	for(var i=0; i< chkElem.length; i++)
	                     {	
	                         if(chkElem[i].checked){
	                        	 check=true;
	                        	
	                        	 chkElem[i].disabled=true;
	                        	 chkElem[i].checked=false;
	                        	 if(index==0){
	                        		
	                        	 choice = choice + chkElem[i].value;
	                        	 index++;
	                        	 }
	                        	 else
	                        		choice = choice +"$"+chkElem[i].value;
	                         }
	                             
	                     }
	                	if(check){
	                		var xmlHttpRequest=new XMLHttpRequest();
	                		xmlHttpRequest.open("POST","ConferenceServlet?action=addConferenceDetails&members="+choice+"&conferenceName="+document.getElementById("session-name").value,true);
	                		xmlHttpRequest.send();
	                		xmlHttpRequest.onreadystatechange=function(){
	                			if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
	                				alert("Invite to new members has been sent.");
	                			}
	                		};
						}
	                	else{
	                		alert("Please select new members to invite.");
	                	}
				} */
				
				
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
                        if (video){
                            video.width = maxVideoWidth - minus;
                        	video.height =250;
                        } 
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
                    if (document.getElementById('file')) {
                    	document.getElementById('file').disabled = false;
                    	document.getElementById('progressBar').style.display = "block";
                    }                    
                    if (document.getElementById('open-new-session')) document.getElementById('open-new-session').disabled = true;
                };

                // sending/receiving file(s)
                // connection.autoSaveToDisk = false;
                connection.onFileProgress = function(packets, uuid) {
                    appendDIV(uuid + ': ' + packets.remaining + '..', 'file', fileProgress);
                    var x = document.getElementById("indicator");
                    var percent=(((packets.length-packets.remaining)/packets.length)*100);
                    x.style.width=Math.round(percent)+"%";
                    document.getElementById("percentage").innerHTML=Math.round(percent)+"%";
                };

                connection.onFileSent = function(file) {
                    appendDIV(file.name + ' sent.', fileProgress);
                    document.getElementById("file-status").innerHTML=file.name + ' sent successfully';
                };

                connection.onFileReceived = function(fileName) {
                    appendDIV(fileName + ' received.', fileProgress);
                    document.getElementById("file-status").innerHTML=fileName + ' received successfully';
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

