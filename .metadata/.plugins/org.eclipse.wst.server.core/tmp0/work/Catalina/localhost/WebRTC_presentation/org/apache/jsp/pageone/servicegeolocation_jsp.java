package org.apache.jsp.pageone;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.tcs.css.ThemeSelector;

public final class servicegeolocation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.List<java.lang.String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<java.lang.String>(1);
    _jspx_dependants.add("/pageone/headerloginnew.jsp");
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

      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<!--[if IE 7 ]>    <html class=\"ie7 oldie\"> <![endif]-->\r\n");
      out.write("<!--[if IE 8 ]>    <html class=\"ie8 oldie\"> <![endif]-->\r\n");
      out.write("<!--[if IE 9 ]>    <html class=\"ie9\"> <![endif]-->\r\n");
      out.write("<!--[if (gt IE 9)|!(IE)]><!-->\r\n");
      out.write("<html>\r\n");
      out.write("<!--<![endif]-->\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<!-- themes selecetor code  -->\r\n");

	session.setAttribute("themename", "blue");
	ThemeSelector ts = new ThemeSelector();
	String theme = ts.getTheme(session.getAttribute("themename")
			.toString());

      out.write("\r\n");
      out.write("<!--  end themes selecetor code  -->\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\"\r\n");
      out.write("\tsrc=\"../Validations/JS/newregistration.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../Validations/JS/login.js\"></script>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("<meta charset=\"utf-8\" />\r\n");
      out.write("<meta name=\"description\" content=\"\">\r\n");
      out.write("<meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("<title>WebRTC client</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/");
      out.print(theme);
      out.write("\" type=\"text/css\"\r\n");
      out.write("\tmedia=\"screen\" />\r\n");
      out.write("<!--     <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"screen\" /> -->\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/nivo-slider.css\" type=\"text/css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/jquery.fancybox-1.3.4.css\"\r\n");
      out.write("\ttype=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("<!--[if lt IE 9]>\r\n");
      out.write("\t    <script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\twindow.jQuery\r\n");
      out.write("\t\t\t|| document\r\n");
      out.write("\t\t\t\t\t.write('<script src=\"js/jquery-1.6.1.min.js\"><\\/script>')\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<script src=\"js/jquery.smoothscroll.js\"></script>\r\n");
      out.write("<script src=\"js/jquery.nivo.slider.pack.js\"></script>\r\n");
      out.write("<script src=\"js/jquery.easing-1.3.pack.js\"></script>\r\n");
      out.write("<script src=\"js/jquery.fancybox-1.3.4.pack.js\"></script>\r\n");
      out.write("<script src=\"js/init.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<!-- header-wrap -->\r\n");
      out.write("\t<div id=\"header-wrap\">\r\n");
      out.write("\t\t<header>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<img src=\"images/tcs_logo.png\"\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<nav>\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t</nav>\r\n");
      out.write("\r\n");
      out.write("\t\t</header>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- content-wrap -->\r\n");
      out.write("\t<div class=\"content-wrap\">");
      out.write('\n');
      out.write('\n');
      out.write(' ');
      out.write("\n");
      out.write(" \n");
      out.write(" <br/><br/> <br/><br/>\n");
      out.write("         <iframe src=\"http://");
      out.print(session.getAttribute("serverip"));
      out.write(":8080/Geolocation/ViewUserServlet?user=sip:");
      out.print(session.getAttribute("name"));
      out.write("@tcs.com\"\n");
      out.write("        width=\"1000\" height=\"700\" align=\"left\" scrolling=\"no\"></iframe> \n");
      out.write("                     \n");
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
