package org.apache.jsp.pageone;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.tcs.css.ThemeSelector;

public final class addmoredetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.List<java.lang.String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<java.lang.String>(2);
    _jspx_dependants.add("/pageone/headerlogin.jsp");
    _jspx_dependants.add("/pageone/../newaccountforms/registernewuserstep2.jsp");
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

      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<!--[if IE 7 ]>    <html class=\"ie7 oldie\"> <![endif]-->\n");
      out.write("<!--[if IE 8 ]>    <html class=\"ie8 oldie\"> <![endif]-->\n");
      out.write("<!--[if IE 9 ]>    <html class=\"ie9\"> <![endif]-->\n");
      out.write("<!--[if (gt IE 9)|!(IE)]><!--> <html> <!--<![endif]-->\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("<!-- themes selecetor code  -->\n");
session.setAttribute("themename", "blue");
ThemeSelector ts=new ThemeSelector();
String theme=ts.getTheme(session.getAttribute("themename").toString());
      out.write("\n");
      out.write("<!--  end themes selecetor code  -->\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\" src=\"../Validations/JS/newregistration.js\" ></script>\n");
      out.write("<script type=\"text/javascript\" src=\"../Validations/JS/login.js\" ></script>\n");
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
      out.write("\n");
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
      out.write("    <script>\n");
      out.write("   /*  function login(){\n");
      out.write("    \tvar x=document.getElementById(\"userName\").f1.value;\n");
      out.write("    var y=document.getElementById(\"password\").f1.value;\n");
      out.write("    \tif(x==0||y==0){\n");
      out.write("    \t\talert(\"invalid Username or Password\");\n");
      out.write("    \t}\n");
      out.write("    } */\n");
      out.write("    \n");
      out.write("    </script>\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<!-- header-wrap -->\n");
      out.write("<div id=\"header-wrap\">\n");
      out.write("    <header>\n");
      out.write("    \n");
      out.write("<div><img src=\"images/tcs_logo.png\" </div>\n");
      out.write("        <nav>\n");
      out.write("            <!--  <ul>\n");
      out.write("              <li><a href=\"#main\"></a></li>\n");
      out.write("                <li><a href=\"#services\"></a></li>\n");
      out.write("                <li><a href=\"#portfolio\"></a></li>\n");
      out.write("                <li><a href=\"#about-us\"></a></li>\n");
      out.write("                <li><a href=\"#styles\"></a></li>\n");
      out.write("                <li><a href=\"contact.jsp\">Contact Us</a></li>\n");
      out.write("            </ul>-->\n");
      out.write("            \n");
      out.write("<form  onsubmit=\"login();\" method=\"post\" action=\"../loginServlet\" id=\"loginform\">\n");
      out.write("<table align=\"right\">\n");
      out.write("                   <tr>\n");
      out.write("                    <td> Username : \n");
      out.write("                    <input name=\"userName\" type=\"text\" id=\"userName\" />\n");
      out.write("                    </td>                 \n");
      out.write("                    <td>Password : \n");
      out.write("                    <input name=\"password\" type=\"password\" id=\"password1\" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                  </td>\n");
      out.write("<td  align=\"right\">\n");
      out.write("\t\t\t\t\t<input type=\"submit\"  value=\"Login\" class=\"button\">\n");
      out.write("         \t\t\t<!-- <input type=\"reset\" value=\"Reset\" class=\"button\"> -->\n");
      out.write("         \t\t\t</td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t");
      out.write("\n");
      out.write("\t\t\t\t\t<td  colspan=\"2\" align=\"right\"><a href=\"forgotPassword.jsp\">Forgot Password</a><br/></td>\n");
      out.write("\t\t\t\t\t<!--  <td><a href=\"../sipml5/expert.htm\" target=newtab> Settings </a><br/></td>-->\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("    </table>\n");
      out.write("                </form>\n");
      out.write("            \n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("    </header>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- content-wrap -->\n");
      out.write("<div class=\"content-wrap\">");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- main -->\n");
      out.write("    <section id=\"main\" class=\"clearfix\">\n");
      out.write("\n");
      out.write("<table>\n");
      out.write("  <col width=\"800\">\n");
      out.write("  <col width=\"800\">\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("<td>          \n");
      out.write("\t\t\t <!-- ------Register new user  -->\n");
      out.write("\t\t\t");
      out.write("\n");
      out.write("        <table >\n");
      out.write("        \n");
      out.write("        <tr>\n");
      out.write("        \t<td>Registered Successfully , You can add more details <a href=\"login.html\">Back To Login Page</a></td>\n");
      out.write("        </tr>\n");
      out.write("\t\t\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t<h2>Upload Profile Pic</h2>\n");
      out.write("\t\t\t\t<form enctype=\"multipart/form-data\" method=\"POST\" onsubmit=\"return validateMoreDetails();\" name=\"createUserform\" action=\"../CreateUserServlet\">\n");
      out.write("\t\t\t\t<table id=\"AddCustTable\" align=\"center\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Name:</td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input id=\"Name\" type=\"text\" name=\"userid\" title=\"Id should contain only digits only.\" maxlength=\"40\" value=");
      out.print(request.getParameter("displayName"));
      out.write(" /></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td id=\"NameError\" style=\"color: red;\"></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td ></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Sip Uri:</td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input id=\"Name\" type=\"text\" name=\"name\" title=\"Name should contain only alphabets and whitespaces.\" maxlength=\"40\" value=");
      out.print(request.getParameter("privateIdentity"));
      out.write(" /></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td id=\"NameError\" style=\"color: red;\"></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td style=\"vertical-align: top;\">Address:</td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><textarea id=\"Address\" name=\"address\" cols=\"30\" rows=\"5\" title=\"Address should be of maximum 200 characters.\" onblur=\"checkForAddress('Address')\"></textarea></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td id=\"addressError\" style=\"color: red;vertical-align: top;\"></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Contact Number:</td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input id=\"Contact\" type=\"text\" name=\"contact\" title=\"Contact number should contain only digits.\" maxlength=\"15\" onblur=\"checkContactNumber('Contact')\"/></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td id=\"contactError\" style=\"color: red;\"></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td>Profile-Pic:</td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input style=\"padding: 2px 0px 2px 0px;\" id=\"picture\" type=\"file\" name=\"picture\" title=\"The document should be a .jpg file.\" onchange=\"checkUploadedPic('picture')\"/></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td id=\"imageError\" style=\"color: red;\"></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t<tr> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t\t<td>Fav. Audio-track:</td> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t\t<td><input style=\"padding: 2px 0px 2px 0px;\" id=\"audio\" type=\"file\" name=\"audio\" title=\"The document should be a .mp3 file.\" onchange=\"checkUploadedAudio('audio')\"/></td> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t\t<td id=\"audioError\" style=\"color: red;\"></td> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t</tr> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t<tr> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t\t<td>Fav. Video:</td> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t\t<td><input style=\"padding: 2px 0px 2px 0px;\" id=\"video\" type=\"file\" name=\"video\" title=\"The document should be a .mp4 file.\" onchange=\"checkUploadedVideo('video')\"/></td> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t\t<td id=\"videoError\" style=\"color: red;\"></td> -->\n");
      out.write("\t\t\t\t<!-- \t\t\t\t\t</tr> -->\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td><input style=\"padding: 3px;\" type=\"submit\" name=\"submit\" value=\"Submit Details\"/>\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input style=\"padding: 3px;\" type=\"reset\" value=\"Reset\" id=\"resetButton\"/></td>\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<br/>");
      out.write("\n");
      out.write("\t\t\t<!-- end registration --> \n");
      out.write("  \n");
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</table>      \n");
      out.write("      \n");
      out.write("\n");
      out.write("<!-- footer -->\n");
      out.write("\n");
      out.write("<div id=\"footer-wrap\"></div>");
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
