<%@include file="header.jsp" %>


<jsp:include page="/phonebookLineServlet" />
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="presence.beanclass.presence"%>
<%@page import="phonebook.webrtc.UserProfile"%>
<%@page import="userprofile.beanclass.friend"%>
<%

%>
<%
    ArrayList<presence> list = new ArrayList<presence>();
    
	list = (ArrayList) request.getAttribute("registrationDetails");

%>
<%
ArrayList<UserProfile> users=(ArrayList<UserProfile>)request.getAttribute("List");
%>

 <!--<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="css/jquery.fancybox-1.3.4.css"
	type="text/css" /> -->
	<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script>
window.jQuery
|| document
		.write('<script src="js/jquery-1.6.1.min.js"><\/script>')
</script>
<script src="js/jquery.smoothscroll.js"></script>
<script src="js/jquery.nivo.slider.pack.js"></script>
<script src="js/jquery.easing-1.3.pack.js"></script>
<script src="js/jquery.fancybox-1.3.4.pack.js"></script>
<script src="js/init.js"></script> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','height=700,width=700');
	if (window.focus) {newwindow.focus()}
	return false;
}
function callUser(sipname){
	//alert("func called");
	
	var i = document.getElementById("myIframe");
	var str = i.src.toString();
	//alert("before value "+str);
	if(str.indexOf("&ToCallName=")!=-1){
		var n = str.indexOf("&ToCallName=");
		//alert(n);
		str = str.replace(str.substring(n,str.length),"");
		alert("after value "+str);	
				
	}
	
	//alert("after if value "+str);	
	i.src = str+"&ToCallName="+sipname; 
}
// -->
function refreshDiv(){
	if(window.XMLHttpRequest)
	{
	xmlHttpRequest=new XMLHttpRequest();
	}
else if(window.ActiveXObject)
	{
	xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
	}
	document.getElementById("serverReply").innerHTML="";
	if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
	{
	document.getElementById("serverReply").innerHTML=xmlHttpRequest.responseText;
	}
	
	alert("not sent");
	xmlHttpRequest.open("GET", "http://"+ip+":8080/WebRTC_presentation/phonebookLineServlet", true);
	xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
	xmlHttpRequest.send();
   alert("In function");
   var container = document.getElementById("myDiv");
   var content = container.innerHTML;
   //alert(content);
   container.innerHTML= content;
}

function eraseResponseMessage()
{
	document.getElementById("serverReply").innerHTML="";
}
function receiveMessageFromServer()
{
	if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
		{
		document.getElementById("serverReply").innerHTML=xmlHttpRequest.responseText;
		}
}

</script>
<div style="width:1000px">
 <!----------------------------------------------------- main ---------------------------->
    <section id="main">
	<div style="width:75%; float:left; ">			
        <table>

        <tr>
        <td><iframe src="../sipml5/callim.jsp?ip=<%=session.getAttribute("serverip")%>&name=<%=session.getAttribute("name")%>&privateIdentity=sip:<%=session.getAttribute("name")%>@tcs.com&realm=tcs.com" 
        id="myIframe" frameborder="0" width="700" height="700" align="left" scrolling="no"></iframe>           
        </td>
        </tr>
       </table>
       </div>
          
 <div id="myDiv" style="width:25%; float:right; overflow:scroll; height:675px;"> 
 
<!-- adding new frnds   --> 
 <form name="myForm" action="<%=request.getContextPath()%>/FriendListController?action=findFriendURI"  method="post">
        <table>
         <tr>  
      
        <td>
	       <!-- <button onclick="var ifr=document.getElementsByName('phonebookframe')[0]; ifr.src=ifr.src;"><img src="images/iconcycle.png"></button>
	        <button><img src="images/iconstar.png"></button>
	      <button onclick="pageone/friendList/friends.jsp"><img src="images/icongroup.png"></button>  --> 
          <input type="text" name="friendName" placeholder="sip:abc@tcs.com">&nbsp;&nbsp;&nbsp;
          </td>
          <td>
        <input type="submit" name="submit" value="Add Contact">
        </td>
        </tr>
	  
        </table>
</form> 
 <!--  end add new frnd    --> 
 
<table bgcolor="#D8E5FF">
<tr>
<td>
<table>
<tr>
<td>
<ul>
<%
						for (int i = 0; i < list.size(); i++) {
							
							if(!
									("sip:"+session.getAttribute("name")+"@tcs.com").
									equalsIgnoreCase(list.get(i).getFriendSipURI().toString())){
					%>
<li>
<table>
<tr style="width:70px">
<td>
<img src="http://<%=session.getAttribute("serverip")%>:8080/UploadPicsAudioVideo/CreateUserServlet?id=<%=list.get(i).getFriendSipURI().toString()%>&action=getProfilePic"  width="60" height="60" />
</td>
<td>
 
</td>
<td style="float:right;">
<%=list.get(i).getFriendName().toString()%></br>
<%=list.get(i).getFriendSipURI().toString()%>

</td>								
<tr style="float:left;width:100px">
<td>
									   <!-- Audio Call -->
									   
									  <!-- Video Call -->
			                            <a href="#" onClick='callUser("<%=list.get(i).getFriendName().toString()%>")'>
			                            <img src="./images/iconphone.png" /></a>
			                            
			                            &nbsp;
			                          <!-- Profile -->  
			                            <a href="http://<%=session.getAttribute("serverip")%>:8080/ViewPicsAudioVideo/CreateUserServlet?action=getUser&id=<%=list.get(i).getFriendSipURI().toString()%>"
			                            	 onclick="return popitup('http://<%=session.getAttribute("serverip")%>:8080/ViewPicsAudioVideo/CreateUserServlet?action=getUser&id=<%=list.get(i).getFriendSipURI().toString()%>')"
			                            	 ><img src="./images/iconbook.png"></a>
			                            
			                            &nbsp;
			                            <!-- Offline Message -->	 
			                            <a href="serviceofflinemessages.jsp" 
												onclick="window.open(this.href, 'mywin','left=20,top=20,width=500,height=500,toolbar=1,resizable=0'); return false;" >
											<img src="./images/iconmenu.png"></a>
			                            	 
			                            	 
			                            <% if (list.get(i).getPresence().toString().equalsIgnoreCase("online")) {%>
											<input type="submit" name="submit" style=" border-radius: 5px; height: 15px; background: green;" id="sub2" value="  ">
										<% } else if(list.get(i).getPresence().toString().equalsIgnoreCase("offline")) { %>
											<input type="submit" name="submit" style=" border-radius: 5px; height: 15px; background: red;" id="sub2" value="  ">
										<%} else { %>	
										    <input type="submit" name="submit" style=" border-radius: 5px; height: 15px; background: white;" id="sub2" value="  ">
										<%} %>
										</td>
</tr>
</table>
</li>
			<%
							}
				}
%>
</ul>

</td>
</tr>
</table>
</td>
</tr>
</table>
            </div> 
        </td>
        <td>
	        &nbsp;&nbsp;
	        <button onclick='alert("To Be Implemented");'><img src="images/iconcycle.png"></button>
	        <button><img src="images/iconstar.png"></button>
	        <button><img src="images/icongroup.png"></button>
        </td>
        </tr>
        
      </section>
</div>
      <!------------------------------------------ services -------------------------------------------->

 <section id="services" >
 
	<%@include file="services.jsp" %> 
	
   </section>


<%@include file="footer.jsp" %>