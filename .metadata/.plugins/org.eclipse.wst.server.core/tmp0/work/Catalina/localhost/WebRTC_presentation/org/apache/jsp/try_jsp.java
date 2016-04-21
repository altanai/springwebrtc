package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class try_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<script type = \"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("// Note: Like all Javascript password scripts, this is hopelessly insecure as the user can see \r\n");
      out.write("//the valid usernames/passwords and the redirect url simply with View Source.  \r\n");
      out.write("// And the user can obtain another three tries simply by refreshing the page.  \r\n");
      out.write("//So do not use for anything serious!\r\n");
      out.write("\r\n");
      out.write("var count = 2;\r\n");
      out.write("function validate() {\r\n");
      out.write("var un = document.myform.username.value;\r\n");
      out.write("var pw = document.myform.pword.value;\r\n");
      out.write("var valid = false;\r\n");
      out.write("\r\n");
      out.write("var unArray = [\"Philip\", \"George\", \"Sarah\", \"Michael\"];  // as many as you like - no comma after final entry\r\n");
      out.write("var pwArray = [\"Password1\", \"Password2\", \"Password3\", \"Password4\"];  // the corresponding passwords;\r\n");
      out.write("\r\n");
      out.write("for (var i=0; i <unArray.length; i++) {\r\n");
      out.write("if ((un == unArray[i]) && (pw == pwArray[i])) {\r\n");
      out.write("valid = true;\r\n");
      out.write("break;\r\n");
      out.write("}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("if (valid) {\r\n");
      out.write("alert (\"Login was successful\");\r\n");
      out.write("window.location = \"http://www.google.com\";\r\n");
      out.write("return false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("var t = \" tries\";\r\n");
      out.write("if (count == 1) {t = \" try\"}\r\n");
      out.write("\r\n");
      out.write("if (count >= 1) {\r\n");
      out.write("alert (\"Invalid username and/or password.  You have \" + count + t + \" left.\");\r\n");
      out.write("document.myform.username.value = \"\";\r\n");
      out.write("document.myform.pword.value = \"\";\r\n");
      out.write("setTimeout(\"document.myform.username.focus()\", 25);\r\n");
      out.write("setTimeout(\"document.myform.username.select()\", 25);\r\n");
      out.write("count --;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("else {\r\n");
      out.write("alert (\"Still incorrect! You have no more tries left!\");\r\n");
      out.write("document.myform.username.value = \"No more tries allowed!\";\r\n");
      out.write("document.myform.pword.value = \"\";\r\n");
      out.write("document.myform.username.disabled = true;\r\n");
      out.write("document.myform.pword.disabled = true;\r\n");
      out.write("return false;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<form name = \"myform\">\r\n");
      out.write("<p>ENTER USER NAME <input type=\"text\" name=\"username\"> ENTER PASSWORD <input type=\"password\" name=\"pword\">\r\n");
      out.write("<input type=\"button\" value=\"Check In\" name=\"Submit\" onclick= \"validate()\">\r\n");
      out.write("</p>\r\n");
      out.write("\r\n");
      out.write("</form>");
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
