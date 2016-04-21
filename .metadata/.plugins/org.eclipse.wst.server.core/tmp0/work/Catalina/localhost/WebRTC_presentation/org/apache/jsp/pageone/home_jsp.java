package org.apache.jsp.pageone;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.tcs.css.ThemeSelector;
import java.util.ArrayList;
import java.sql.ResultSet;
import presence.beanclass.presence;
import phonebook.webrtc.UserProfile;
import userprofile.beanclass.friend;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.List<java.lang.String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<java.lang.String>(2);
    _jspx_dependants.add("/pageone/header.jsp");
    _jspx_dependants.add("/pageone/services.jsp");
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
      out.write("     <link rel=\"stylesheet\" href=\"vaibhav.css\" type=\"text/css\" />\n");
      out.write("    \n");
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
      out.write("\n");
      out.write("<script>\n");
      out.write("var name=session.getAttribute(\"name\");\n");
      out.write("var privateIdentity=");
      out.print(session.getAttribute("privateIdentity"));
      out.write(";\n");
      out.write("var realm=");
      out.print(session.getAttribute("releam"));
      out.write(";\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<script>\n");

	if(session.getAttribute("name")==null)
		response.sendRedirect("login.jsp");	

      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    function noBack() { window.history.forward(); }\n");
      out.write("    noBack();\n");
      out.write("    window.onload = noBack;\n");
      out.write("    window.onpageshow = function (evt) { if (evt.persisted) noBack(); }\n");
      out.write("    window.onunload = function () { void (0); }\n");
      out.write("    \n");
      out.write("</script>\n");
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
      out.write("        <div style=\"float:right;margin-top:40px;\">\n");
      out.write("            <ul id=\"nava\">\n");
      out.write("            <li><a href=\"home.jsp#main\">Home</a></li>\n");
      out.write("            <li><a href=\"home.jsp#services\">Services</a></li>\n");
      out.write("              <li><a href=\"../sipml5/expert.htm\" target=newtab>Settings</a></li>  \n");
      out.write("<!--             <li><a href=\"mbook.jsp\">Message Book</a>6</li> -->\n");
      out.write("<!--              <li><a href=\"#portfolio\"></a></li> -->\n");
      out.write("<!--              <li><a href=\"#about-us\"></a></li> -->\n");
      out.write("<!--              <li><a href=\"home.jsp#styles\">Offline Messages</a></li>\n");
      out.write("                <li><a href=\"home.jsp#contact\">Contact Us</a></li> --><!-- \n");
      out.write("           <li>\n");
      out.write("\t\t\t<a href=\"#\" title=\"this is a tooltip\">Notifications</a>\n");
      out.write("\t\t\t<ul>\n");
      out.write("\t\t\t\t<li><a href=\"#\"><table><tr><td><img width=\"60\" height=\"60\" src=\"images/cred.png\"/></td><td>Alice shared a location from your interests</td></tr></table></a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\"><table><tr><td><img width=\"60\" height=\"60\" src=\"images/alice.png\"/></td><td>You have a missed call from alice</td></tr></table></a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\n");
      out.write("\t\t</li>   \n");
      out.write("             --><li><a href=\"../logoutServlet\">Logout</a></li>\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
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
      out.write('\n');
      out.write('\n');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/phonebookLineServlet", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");



      out.write('\n');

    ArrayList<presence> list = new ArrayList<presence>();
    
	list = (ArrayList) request.getAttribute("registrationDetails");


      out.write('\n');

ArrayList<UserProfile> users=(ArrayList<UserProfile>)request.getAttribute("List");

      out.write("\n");
      out.write("\n");
      out.write(" <!--<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\"\n");
      out.write("\tmedia=\"screen\" />\n");
      out.write("<link rel=\"stylesheet\" href=\"css/nivo-slider.css\" type=\"text/css\" />\n");
      out.write("<link rel=\"stylesheet\" href=\"css/jquery.fancybox-1.3.4.css\"\n");
      out.write("\ttype=\"text/css\" /> -->\n");
      out.write("\t<script\n");
      out.write("\tsrc=\"http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js\"></script>\n");
      out.write("<script>\n");
      out.write("window.jQuery\n");
      out.write("|| document\n");
      out.write("\t\t.write('<script src=\"js/jquery-1.6.1.min.js\"><\\/script>')\n");
      out.write("</script>\n");
      out.write("<script src=\"js/jquery.smoothscroll.js\"></script>\n");
      out.write("<script src=\"js/jquery.nivo.slider.pack.js\"></script>\n");
      out.write("<script src=\"js/jquery.easing-1.3.pack.js\"></script>\n");
      out.write("<script src=\"js/jquery.fancybox-1.3.4.pack.js\"></script>\n");
      out.write("<script src=\"js/init.js\"></script> \n");
      out.write("<script src=\"http://code.jquery.com/jquery-latest.js\"></script>\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\n");
      out.write("<!--\n");
      out.write("function popitup(url) {\n");
      out.write("\tnewwindow=window.open(url,'name','height=700,width=700');\n");
      out.write("\tif (window.focus) {newwindow.focus()}\n");
      out.write("\treturn false;\n");
      out.write("}\n");
      out.write("function callUser(sipname){\n");
      out.write("\t//alert(\"func called\");\n");
      out.write("\t\n");
      out.write("\tvar i = document.getElementById(\"myIframe\");\n");
      out.write("\tvar str = i.src.toString();\n");
      out.write("\t//alert(\"before value \"+str);\n");
      out.write("\tif(str.indexOf(\"&ToCallName=\")!=-1){\n");
      out.write("\t\tvar n = str.indexOf(\"&ToCallName=\");\n");
      out.write("\t\t//alert(n);\n");
      out.write("\t\tstr = str.replace(str.substring(n,str.length),\"\");\n");
      out.write("\t\t//alert(\"after value \"+str);\t\n");
      out.write("\t\t\t\t\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t//alert(\"after if value \"+str);\t\n");
      out.write("\ti.src = str+\"&ToCallName=\"+sipname; \n");
      out.write("}\n");
      out.write("// -->\n");
      out.write("\n");
      out.write("//function to refresh the page on interval of 10 sec \n");
      out.write(" $( document ).ready(function() \n");
      out.write("\t\t{ \n");
      out.write("\t compressCode();\n");
      out.write("\tvar timer = setInterval(compressCode, 90000); \n");
      out.write("\t}); \n");
      out.write("\n");
      out.write("//function to refresj phonebook \n");
      out.write("function compressCode(){\n");
      out.write("\t//alert(\"methodBeingCalled\");\n");
      out.write("\t$('#myDiv').load('friendbook.jsp');\n");
      out.write("}\n");
      out.write("\n");
      out.write("//read ip from file \n");
      out.write("/* var ip=\"10.1.5.6\"; */\n");
      out.write("var ip1;\n");
      out.write("  function readip()\n");
      out.write("  {\n");
      out.write("  var pathOfFileToRead = \"presentation_server_config.txt\";\n");
      out.write("\n");
      out.write("  ip1 = FileHelper.readStringFromFileAtPath\n");
      out.write("  \t(\n");
      out.write("  \t\tpathOfFileToRead\n");
      out.write("  \t);\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  function FileHelper()\n");
      out.write("  {}\n");
      out.write("  {\n");
      out.write("  \tFileHelper.readStringFromFileAtPath = function(pathOfFileToReadFrom)\n");
      out.write("  \t{\n");
      out.write("  \t\tvar request = new XMLHttpRequest();\n");
      out.write("  \t\trequest.open(\"GET\", pathOfFileToReadFrom, false);\n");
      out.write("  \t\trequest.send(null);\n");
      out.write("  \t\tvar returnValue = request.responseText;\n");
      out.write("  \t\treturn returnValue;\n");
      out.write("  \t}\n");
      out.write("  }\n");
      out.write("  readip();  \n");
      out.write("//alert(\" ip1 from file \"+ ip1);\n");
      out.write(" //reda server ip from file end       \n");
      out.write("\t    \n");
      out.write("function dofriendadd(element) \n");
      out.write("{ \n");
      out.write("\n");
      out.write("    var xmlHttp = new XMLHttpRequest(); \n");
      out.write("    var frinedtobeadded = document.getElementById(element).value;\n");
      out.write("    //alert(\"frind to be added \"+ frinedtobeadded);\n");
      out.write("    xmlHttp.open(\"GET\",\"http://\"+ip1+\":8080/WebRTC_presentation/FriendListController?action=findFriendURI&friendName=\"+frinedtobeadded, true);     \n");
      out.write("    xmlHttp.send(); \n");
      out.write("    setTimeout(function(){compressCode();},700);\n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write("function dofriendremove(element) \n");
      out.write("{ \n");
      out.write("    var xmlHttp = new XMLHttpRequest(); \n");
      out.write("    var frinedtoberemoved = document.getElementById(element).innerHTML;\n");
      out.write("    //var frinedtoberemoved = document.getElementById('friendsipuri').innerHTML;\n");
      out.write("   // alert(\"frind to be removed : \"+frinedtoberemoved );\n");
      out.write("    xmlHttp.open(\"GET\",\"http://\"+ip1+\":8080/WebRTC_presentation/FriendListController?action=removefriend&friendName=\"+frinedtoberemoved, true);     \n");
      out.write("    xmlHttp.send(); \n");
      out.write("    setTimeout(function(){compressCode();},700);\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("<div style=\"width:1000px\">\n");
      out.write(" <!----------------------------------------------------- main ---------------------------->\n");
      out.write("    <section id=\"main\">\n");
      out.write("    \n");
      out.write("\t\t\t<div style=\"width:75%; float:left; \">\t\t\t\n");
      out.write("\t\t        <table>\n");
      out.write("\t\t        <tr>\n");
      out.write("\t\t        <td><iframe src=\"../sipml5/callim.jsp?\n");
      out.write("\t\t        ip=");
      out.print(session.getAttribute("serverip"));
      out.write("\n");
      out.write("\t\t        &name=");
      out.print(session.getAttribute("name"));
      out.write("\n");
      out.write("\t\t        &privateIdentity=");
      out.print(session.getAttribute("privateIdentity"));
      out.write("\n");
      out.write("\t\t        &publicIdentity=");
      out.print(session.getAttribute("publicIdentity"));
      out.write("\n");
      out.write("\t\t        &password=");
      out.print(session.getAttribute("password"));
      out.write("\n");
      out.write("\t\t        &realm=");
      out.print(session.getAttribute("releam"));
      out.write("\" \n");
      out.write("\t\t        id=\"myIframe\" frameborder=\"0\" width=\"700\" height=\"700\" align=\"left\" scrolling=\"no\"></iframe>           \n");
      out.write("\t\t        </td>\n");
      out.write("\t\t        </tr>\n");
      out.write("\t\t       </table>\n");
      out.write("\t\t      </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t<!-- adding new frnds   --> \n");
      out.write("\t\t\t ");
      out.write("\n");
      out.write("\t\t\t <form name=\"addfriendform\">      \n");
      out.write("\t\t\t        <table>\n");
      out.write("\t\t\t         <tr>  \n");
      out.write("\t\t\t\t        <td>\n");
      out.write("\t\t\t\t          <input type=\"text\" name=\"friendName\" id=\"friendName\" placeholder=\"sip:abc@tcs.com\">&nbsp;&nbsp;&nbsp;\n");
      out.write("\t\t\t\t          </td>\n");
      out.write("\t\t\t\t          <td>\n");
      out.write("\t\t\t\t        <input type=\"button\" name=\"submit\" value=\" + \" onclick=\"dofriendadd('friendName')\">\n");
      out.write("\t\t\t\t        </td>\n");
      out.write("\t\t\t\t        <td>\n");
      out.write("\t\t\t\t        <button onclick='compressCode();'>R<img src=\"images/iconcycle.png\" style=\"width:5%;height:5%\"></button>\n");
      out.write("\t\t\t\t        </td>\n");
      out.write("\t\t\t        </tr>\n");
      out.write("\t\t\t        </table>\n");
      out.write("\t\t\t</form> \n");
      out.write("\t\t\t <!--  end add new frnd    -->           \n");
      out.write(" \t\t\t\n");
      out.write(" \t\t\t\n");
      out.write(" \t\t\t<div id=\"myDiv\" style=\"width:25%; float:right; overflow:auto; height:675px;\"> \n");
      out.write(" \n");
      out.write("\n");
      out.write("            </div> \n");
      out.write("            \n");
      out.write("        </td>\n");
      out.write("        <td>\n");
      out.write("\t        &nbsp;&nbsp;\n");
      out.write("       \n");
      out.write("\t     <!--    <button><img src=\"images/iconstar.png\"></button>\n");
      out.write("\t        <button><img src=\"images/icongroup.png\"></button> -->\n");
      out.write("        </td>\n");
      out.write("        </tr>\n");
      out.write("        \n");
      out.write("      </section>\n");
      out.write("</div>\n");
      out.write("      <!------------------------------------------ services -------------------------------------------->\n");
      out.write("\n");
      out.write(" <section id=\"services\" >\n");
      out.write(" \n");
      out.write("\t");

String s1=(String)session.getAttribute("themename");
System.out.println(s1);
String s;
if(s1==null||s1.equals("default"))
{
s="";
}
else
	s="_"+s1;


      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("function hoverimg(elemId){\n");
      out.write("\t//alert(\"hello\");\n");
      out.write("\tvar id=document.getElementById(\"elemId\");\n");
      out.write("\tid.style['width']='100px';\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<!--  background-image: url('images/services_bg_blue.png');  --><!-- \n");
      out.write(" border:solid; border-color: white; border-width: 2px; width: 950px; height:290px; padding-left: 50px;padding-top: 40px\" -->\n");
      out.write("<div class=\"containsection\" >\n");
      out.write("             <div class=\"row no-bottom-margin\">\n");
      out.write("             \n");
      out.write("                <section class=\"col\"  >\n");
      out.write("                    <h2><a href=\"conferencing12.jsp\" target=newtab> Conferencing </a></h2>\n");
      out.write("                    <p><img class=\"align-left\" alt=\"\" src=\"images/services/webdesign");
      out.print(s );
      out.write(".png\" onmouseover=\"this.width=68;this.height=70;\" onmouseout=\"this.width=60;this.height=62\" /> Video Conferencing, File Sharing and Chat-room  </p>\n");
      out.write("                </section>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <section class=\"col mid\">\n");
      out.write("                    <h2><a href=\"../../UploadPicsAudioVideo/CreateUserServlet?action=getUser&id=");
      out.print(session.getAttribute("privateIdentity"));
      out.write("&name=");
      out.print(session.getAttribute("name"));
      out.write("\" >Profile</a></h2>\n");
      out.write("                    <p><img class=\"align-left\" alt=\"\" src=\"images/services/logo-design-and-branding");
      out.print(s );
      out.write(".png\" onmouseover=\"this.width=68;this.height=70;\" onmouseout=\"this.width=60;this.height=62\" />Profile Description </p>\n");
      out.write("                </section>\n");
      out.write("                \n");
      out.write("\t\t\t\t\n");
      out.write("                <section class=\"col\">\n");
      out.write("\n");
      out.write("                  <h2><a href=\"servicecalllogs.jsp\" target=newtab > History </a></h2> \n");
      out.write("\t\t\t\t\t\t <p><img class=\"align-left\" alt=\"\" src=\"images/services/seo-services");
      out.print(s );
      out.write(".png\" onmouseover=\"this.width=68;this.height=70;\" onmouseout=\"this.width=60;this.height=62\" />Call Logs </p>\n");
      out.write("\n");
      out.write("                </section>\n");
      out.write("        \n");
      out.write(" \t\t\t</div> \n");
      out.write(" </div>\n");
      out.write(" <div class=\"containsection2\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("               ");
      out.write("\n");
      out.write("                \n");
      out.write("                <section class=\"col mid\">\n");
      out.write("                  <h2><a href=\"servicegeolocation.jsp\" target=newtab> Geolocation </a></h2>\n");
      out.write("                    <p><img class=\"align-left\" alt=\"\" src=\"images/services/webdevelopment");
      out.print(s );
      out.write(".png\" onmouseover=\"this.width=68;this.height=70;\" onmouseout=\"this.width=60;this.height=62\" />Location of user and friends </p>\n");
      out.write("                </section>\n");
      out.write("\n");
      out.write("              ");
      out.write("\n");
      out.write("                \n");
      out.write("    \t\t</div>  \n");
      out.write("   </div>          \n");
      out.write(" <br/><br/>");
      out.write(" \n");
      out.write("\t\n");
      out.write("   </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("<div id =\"footer-wrap\"></div>");
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
