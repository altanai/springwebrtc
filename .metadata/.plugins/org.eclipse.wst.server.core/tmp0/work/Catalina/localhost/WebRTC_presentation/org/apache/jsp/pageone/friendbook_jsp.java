package org.apache.jsp.pageone;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.sql.ResultSet;
import presence.beanclass.presence;
import phonebook.webrtc.UserProfile;
import userprofile.beanclass.friend;

public final class friendbook_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.List<java.lang.String> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.List<java.lang.String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/phonebookLineServlet", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" ");

    ArrayList<presence> list = new ArrayList<presence>();
    
	list = (ArrayList) request.getAttribute("registrationDetails");


      out.write('\r');
      out.write('\n');

ArrayList<UserProfile> users=(ArrayList<UserProfile>)request.getAttribute("List");

      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("<table bgcolor=\"#D8E5FF\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td>\r\n");
      out.write("<table>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t<td>\r\n");
      out.write("\t\t<ul>\r\n");
      out.write("              ");
  for (int i = 0; i < list.size(); i++) {
																
											if(!(session.getAttribute("privateIdentity")).
															equals(list.get(i).getFriendSipURI().toString())){
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<tr style=\"width:70px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"http://");
      out.print(session.getAttribute("serverip"));
      out.write(":8080/UploadPicsAudioVideo/CreateUserServlet?id=");
      out.print(list.get(i).getFriendSipURI().toString());
      out.write("&action=getProfilePic\"  width=\"60\" height=\"60\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td style=\"float:right;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<label id=\"friendname\">");
      out.print(list.get(i).getFriendName().toString());
      out.write("</label></br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<label id=\"friendsipuri");
      out.print(list.get(i).getFriendSipURI().toString());
      out.write('"');
      out.write('>');
      out.print(list.get(i).getFriendSipURI().toString());
      out.write("</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t   \r\n");
      out.write("\t\t\t\t\t\t\t\t\t   <tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<!-- Audio Call -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t   \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<!-- Video Call -->\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t            <a href=\"#\" onClick='callUser(\"");
      out.print(list.get(i).getFriendName().toString());
      out.write("\")'>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                            <img src=\"./images/iconphone.png\" /></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                            \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t               &nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t        <!-- Profile -->  \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t               <a href=\"servicefriendprofile.jsp\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                            \t onclick=\"return popitup('http://");
      out.print(session.getAttribute("serverip"));
      out.write(":8080/ViewPicsAudioVideo/CreateUserServlet?action=getUser&id=");
      out.print(list.get(i).getFriendSipURI().toString());
      out.write("')\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                            \t ><img src=\"./images/iconbook.png\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                            \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                  &nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t        <!-- Offline Message -->\t \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                 <a href=\"serviceofflinemessages.jsp\" \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tonclick=\"window.open(this.href, 'mywin','left=20,top=20,width=500,height=500,toolbar=1,resizable=0'); return false;\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"./images/iconmenu.png\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t               &nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t         <!-- Remove friend -->\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t    ");
      out.write("\t\t\t                            \t \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                 <a href=\"#\" onclick=\"dofriendremove('friendsipuri");
      out.print(list.get(i).getFriendSipURI().toString());
      out.write("');\"><img src=\"images/iconstar.png\" height=\"20px\" width=\"20px\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                            \t \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t                            ");
 if (list.get(i).getPresence().toString().equalsIgnoreCase("online")) {
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"submit\" name=\"submit\" style=\" border-radius: 5px; height: 15px; background: green;\" id=\"sub2\" value=\"  \">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
 } else if(list.get(i).getPresence().toString().equalsIgnoreCase("offline")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<input type=\"submit\" name=\"submit\" style=\" border-radius: 5px; height: 15px; background: red;\" id=\"sub2\" value=\"  \">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
} else { 
      out.write("\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t    <input type=\"submit\" name=\"submit\" style=\" border-radius: 5px; height: 15px; background: white;\" id=\"sub2\" value=\"  \">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t");

																}
													}
									
      out.write("\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t\r\n");
      out.write("\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
