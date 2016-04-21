<%@include file="header.jsp" %>


 <!----------------------------------------------------- main ---------------------------->
    <section id="main">
				
        <table>

        <tr>
        <td><iframe src="../sipml5/callim.jsp?ip=<%=session.getAttribute("serverip")%>&name=<%=session.getAttribute("name")%>&privateIdentity=sip:<%=session.getAttribute("name")%>@tcs.com&realm=tcs.com" 
        id="myIframe" frameborder="0" width="700" height="700" align="left" scrolling="no"></iframe>           
        </td>
        <td>
          <iframe frameborder="2" name="phonebookframe" src="../phonebookLineServlet" align="right" height="700" width="400" frameborder="1" ></iframe> 
        </td>
        <tr>
        
        <tr>
        <td></td>
        <td>
	        &nbsp;&nbsp;
	        <button onclick="var ifr=document.getElementsByName('phonebookframe')[0]; ifr.src=ifr.src;"><img src="images/iconcycle.png"></button>
	        <button><img src="images/iconstar.png"></button>
	        <button><img src="images/icongroup.png"></button>
        </td>
        </tr>
        
        </table>         
      </section>

      <!------------------------------------------ services -------------------------------------------->

 <section id="services" >
 
	<%@include file="services.jsp" %> 
	
   </section>


<%@include file="footer.jsp" %>