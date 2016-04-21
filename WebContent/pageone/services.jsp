     <!------------------------------------------ services -------------------------------------------->


     <%String s1=(String)session.getAttribute("themename");
System.out.println(s1);
String s;
if(s1==null||s1.equals("default"))
{
s="";
}
else
	s="_"+s1;
System.out.println(s);
%>

             <div class="row no-bottom-margin">
                <section class="col">
                    <h2><a href="conferencing1.jsp" target=newtab> Conferencing </a></h2>
                    <p><img class="align-left" alt="" src="images/services/webdesign<%=s %>.png"/> Video Conferencing </p>
                </section>
                <section class="col mid">
                  <h2><a href="../sipml5/expert.htm" target=newtab> Settings </a></h2>
                    <p><img class="align-left" alt="" src="images/services/webdevelopment<%=s %>.png" />Expert Settings</p>
                </section>

                <section class="col">
                 <!-- <h2><a href="http://localhost:8080/UploadPicsAudioVideo/CreateUserServlet?action=getUser&id=sip:<%=session.getAttribute("name")%>@tcs.com" target=newtab> Profile </a></h2>--> 
                    <h2><a href="../CreateUserServlet?action=getUser&id=sip:<%=session.getAttribute("name")%>@tcs.com" target=newtab> Profile </a></h2> 
                    <p><img class="align-left" alt="" src="images/services/seo-services<%=s %>.png" />Profile View</p>

                </section>
            </div>

            <div class="row">
                <section class="col">
                    <h2><a href="chatroom1.jsp" target=newtab>Chatroom </a></h2>
                    <p><img class="align-left" alt="" src="images/services/print-design<%=s %>.png" /> Group Chat Room</p>
                </section>
                
                <section class="col mid">     
                    <h2><a href="../analytics/graph.jsp" target=newtab> Analytics</a></h2>
                    <p><img class="align-left" alt="" src="images/services/seo-services<%=s %>.png" />History Trends and Graphical Representation </p>
                </section>

                <section class="col">
                
                    <h2><a href="filesharing1.jsp" target=newtab>File Sharing </a></h2>
                    <p><img class="align-left" alt="" src="images/services/newsletter<%=s %>.png" />Share Files </p>

                </section>
            </div>    