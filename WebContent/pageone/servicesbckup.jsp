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
                  <h2><a href="widgets1.jsp">Widgets </a></h2>
                    <p><img class="align-left" alt="" src="images/services/seo-services<%=s %>.png" />Google Widgets Settings</p>

                </section>
            </div>

            <div class="row">
                <section class="col">
                    <h2><a href="chatroom1.jsp" target=newtab>Chatroom </a></h2>
                    <p><img class="align-left" alt="" src="images/services/print-design<%=s %>.png" /> Group Chat Room</p>
                </section>
                
                <section class="col mid">
                    <h2><a href="voicemail.jsp" target=newtab>Voice Mail</a></h2>
                    <p><img class="align-left" alt="" src="images/services/logo-design-and-branding<%=s %>.png" />Cloud sync phone book </p>
                </section>

                <section class="col">
                
                    <h2><a href="filesharing1.jsp" target=newtab>File Sharing </a></h2>
                    <p><img class="align-left" alt="" src="images/services/newsletter<%=s %>.png" />Share Files </p>

                </section>
                
            <div class="row">
                <section class="col">
                    <h2><a href="donotdisturbselect.jsp" target=newtab> Do Not Disturb</a></h2>
                    <p><img class="align-left" alt="" src="images/services/webdevelopment<%=s %>.png" /> Reject calls depending on the time of day and Caller-ID.</p>
                </section>
                
                <section class="col mid">
                    <h2><a href="subscribepublish.jsp?name=<%=session.getAttribute("name")%>&privateIdentity=sip:<%=session.getAttribute("name")%>@tcs.com&realm=tcs.com" target=newtab> Subscribe to status </a></h2>
                    <p><img class="align-left" alt="" src="images/services/logo-design-and-branding<%=s %>.png" /> Publish presence information and subscribe to others updates</p>
                </section>

                <section class="col">
                
                    <h2><a href="../analytics/graph.jsp" target=newtab> Analytics</a></h2>
                    <p><img class="align-left" alt="" src="images/services/seo-services<%=s %>.png" />History Trends and Graphical Representation </p>

                </section>
                
            </div>
             
              <div class="row no-bottom-margin">
                <section class="col">
                    <h2><a href="../CreateUserServlet?action=getUser&uri=sip:<%=session.getAttribute("name")%>@tcs.com"> Profile </a></h2>
                    <p><img class="align-left" alt="" src="images/services/webdevelopment<%=s %>.png">Add and view Profile details  </section>
                <section class="col mid">
                  <h2><a href="tunning.jsp"> Tunning </a></h2>
                    <p><img class="align-left" alt="" src="images/services/webdevelopment<%=s %>.png" />Transmission settings </p>
                </section>

                <section class="col">
                  <h2><a href="filter.jsp">Filter and snapshot</a></h2>
                    <p><img class="align-left" alt="" src="images/services/seo-services<%=s %>.png" />Applies filter and snapshot of stream </p>

                </section>
            </div>

