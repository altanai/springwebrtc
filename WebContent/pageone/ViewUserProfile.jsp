<%@page import="com.tcs.webrtc.uploadmodule.bean.UserProfile"%>
<%@page import="java.util.ArrayList"%>

<%@include file="header.jsp" %>

    <section id="main">
<%
ArrayList<UserProfile> userlist = new ArrayList<UserProfile>();
userlist = (ArrayList) request.getAttribute("userlist");

UserProfile user=(UserProfile)request.getAttribute("user");
%>    
<h2 align="center">User Profile</h2>
<br/><br/>
	<table width="500px" align="center" border="0" bordercolor="blue">
		<tr>
		<td><img src="../CreateUserServlet?id=<%=userlist.get(0).getName()%>&action=getProfilePic" width="180" height="210"/></td>
		<td><%=userlist.get(0).getName() %></td>
		</tr>
		
		<tr>
		<td> Audio Track:
		</td>
		<td><a href="../CreateUserServlet?id=<%=userlist.get(0).getName()%>&action=audio" title="Click this link to download a copy of this Audio" target="_blank"> <%=user.getAudiofile() %></a>
		</td>
		</tr>
		
		<tr>
		<td> Video Track:
		</td>
		<td><a href="../CreateUserServlet?id=<%=userlist.get(0).getName()%>&action=video" title="Click this link to download a copy of this Video" target="_blank"><%=user.getVideofile() %></a>
		</td>
		</tr>
	</table>
     
      </section>

<%@include file="footer.jsp" %>