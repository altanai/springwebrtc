<%@ include file="headerlogin.jsp" %>

    <!-- main -->
    <section id="main">
<form>
        <table>
	
		<tr>
			<th><h3>Your Password Is:</h3><br/><br/></th>
			
			<td>&nbsp;&nbsp;&nbsp;<%=request.getParameter("pass")%></td>
		</tr>	
					
		
		 <tr>
			<td><a href="login.jsp">Back To Registration Page</a></td>
		</tr>
	</table>

</form>

</section>
<!-- footer -->
<div id="footer-wrap"></div>
<%-- <%@ include file="footerlogin.jsp" %> --%>
