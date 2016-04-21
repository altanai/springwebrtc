<%@include file="header.jsp" %>


 <!----------------------------------------------------- main ---------------------------->
    <section id="main">

        <table>
        <tr>
        <td><iframe src="../sipml5/callim.jsp?ip=<%=session.getAttribute("serverip")%>&name=<%=session.getAttribute("name")%>&privateIdentity=sip:<%=session.getAttribute("name")%>@tcs.com&realm=tcs.com" 
        id="myIframe" frameborder="0" width="700" height="700" align="left" scrolling="yes"></iframe>           
        </td>
        <td><iframe src="../phonebookLineServlet" align="right" height="700" width="400" frameborder="0"></iframe> 
        </td>
        <tr>
        </table>
        
    </section>

 <!------------------------------------------ services -------------------------------------------->
      <section id="services" >

         <%@include file="services.jsp" %>

      </section>

<!------------------------------------------ Offline Messages ----------------------------------->
      <section id="styles" >

         <%@include file="mbook.jsp" %>

      </section>
      
<!------------------------------------------ Contact Us -------------------------------------------->
      <section id="contact" >

         <%@include file="contact.jsp" %>

      </section>


<%@include file="footer.jsp" %>