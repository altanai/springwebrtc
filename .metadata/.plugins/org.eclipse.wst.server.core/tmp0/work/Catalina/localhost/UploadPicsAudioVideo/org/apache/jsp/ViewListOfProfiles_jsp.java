package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.tcs.webrtc.uploadmodule.bean.UserProfile;
import java.util.ArrayList;
import com.tcs.css.ThemeSelector;

public final class ViewListOfProfiles_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.List<java.lang.String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<java.lang.String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("<!-- themes selecetor code  -->\n");
session.setAttribute("themename", "blue");
ThemeSelector ts=new ThemeSelector();
String theme=ts.getTheme(session.getAttribute("themename").toString());
      out.write("\n");
      out.write("<!--  end themes selecetor code  -->\n");
      out.write("\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\"/>\n");
      out.write("    <meta charset=\"utf-8\"/>\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>WebRTC client </title>\n");
      out.write(" <link rel=\"stylesheet\" href=\"css/");
      out.print(theme );
      out.write("\" type=\"text/css\" media=\"screen\" />\n");
      out.write("<!--     <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"screen\" /> -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/nivo-slider.css\" type=\"text/css\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/jquery.fancybox-1.3.4.css\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("\t    <script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script>\n");
      out.write("    <![endif]-->\n");
      out.write("\n");
      out.write("    <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js\"></script>\n");
      out.write("    <script>window.jQuery || document.write('<script src=\"js/jquery-1.6.1.min.js\"><\\/script>')</script>\n");
      out.write("\n");
      out.write("    <script src=\"js/jquery.smoothscroll.js\"></script>\n");
      out.write("    <script src=\"js/jquery.nivo.slider.pack.js\"></script>\n");
      out.write("    <script src=\"js/jquery.easing-1.3.pack.js\"></script>\n");
      out.write("    <script src=\"js/jquery.fancybox-1.3.4.pack.js\"></script>\n");
      out.write("    <script src=\"js/init.js\"></script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<!-- header-wrap -->\n");
      out.write("<div id=\"header-wrap\">\n");
      out.write("    <header>\n");
      out.write("     \n");
      out.write("\t\t \n");
      out.write("\t\t   \n");
      out.write("<div><img src=\"images/tcs_logo.png\"</div>\n");
      out.write("\n");
      out.write("        <nav>\n");
      out.write("            ");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("    </header>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- content-wrap -->\n");
      out.write("<div class=\"content-wrap\">\n");
      out.write("\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <!----------------------------------------------------- main ---------------------------->\r\n");
      out.write("    <section id=\"main\">\r\n");

ArrayList<UserProfile> users=(ArrayList<UserProfile>)request.getAttribute("List");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<h3 align=\"center\">List of Users</h3>\r\n");
      out.write("<br/>\r\n");
      out.write("<br/>\r\n");
      out.write("<table align=\"center\" width=\"400px\" border=\"1\">\r\n");
      out.write("<tr><td>Name</td></tr>\r\n");
for(UserProfile profile:users){ 
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("<td><a href=\"");
      out.print(request.getContextPath() );
      out.write("/CreateUserServlet?action=getUser&id=");
      out.print(profile.getName() );
      out.write("\" title=\"Click this link to view complete profile\">");
      out.print(profile.getName() );
      out.write("</a>\r\n");
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</tr>\r\n");
} 
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("      </section>\r\n");
      out.write("\r\n");
      out.write(" <!------------------------------------------ services -------------------------------------------->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("<!-- footer -->\n");
      out.write("<footer>\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"footer-content\">\n");
      out.write("        <ul class=\"footer-menu\">\n");
      out.write("<!--             <li><a href=\"#main\">Home</a></li> -->\n");
      out.write("<!--             <li><a href=\"#services\">Services</a></li> -->\n");
      out.write("<!--             <li><a href=\"#portfolio\">Phone book</a></li> -->\n");
      out.write("<!--             <li><a href=\"mbook.jsp\">Message Book</a></li> -->\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("<!--         <p class=\"footer-text\">Tata Consultancy Services &nbsp;&nbsp;&nbsp; Designed by CNS Lab</a></p>\n");
      out.write(" -->    </div>\n");
      out.write("<img src=\"images/footer_bg_blue.png\">\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
