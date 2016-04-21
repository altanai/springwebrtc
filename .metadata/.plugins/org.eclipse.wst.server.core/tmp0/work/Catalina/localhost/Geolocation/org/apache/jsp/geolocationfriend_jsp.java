package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class geolocationfriend_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <title>Simple markers</title>\n");
      out.write("    <style>\n");
      out.write("      html, body, #map-canvas {\n");
      out.write("        height: 100%;\n");
      out.write("        margin: 0px;\n");
      out.write("        padding: 0px\n");
      out.write("      }\n");
      out.write("    </style>\n");
      out.write("    <script src=\"https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false\"></script>\n");
      out.write("    <script>\n");
      out.write("function initialize() {\n");
      out.write("\t\n");
      out.write("\tvar friendlatitude=document.getElementById(\"friendlatitude\").value;\n");
      out.write("\tvar friendlongitude=document.getElementById(\"friendlongitude\").value;\n");
      out.write("\t\n");
      out.write("\talert(\" lat \"+ friendlatitude+ \" long \"+friendlongitude); \n");
      out.write("\t\n");
      out.write("  //var myLatlng = new google.maps.LatLng(-25.363882,131.044922);\n");
      out.write("   var myLatlng = new google.maps.LatLng(friendlatitude, friendlongitude);\n");
      out.write("   \n");
      out.write("  var mapOptions = {\n");
      out.write("    zoom: 4,\n");
      out.write("    center: myLatlng,\n");
      out.write("    mapTypeId: google.maps.MapTypeId.ROADMAP\n");
      out.write("  }\n");
      out.write("  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);\n");
      out.write("\n");
      out.write("  var marker = new google.maps.Marker({\n");
      out.write("      position: myLatlng,\n");
      out.write("      map: map,\n");
      out.write("      title: 'My Location!'\n");
      out.write("  });\n");
      out.write("  \n");
      out.write("  var myLatlng2 = new google.maps.LatLng(-25.363882,131.044922);\n");
      out.write("  var marker2 = new google.maps.Marker({\n");
      out.write("      position: myLatlng2,\n");
      out.write("      map: map,\n");
      out.write("      title: 'Friend Location!'\n");
      out.write("  });\n");
      out.write("  \n");
      out.write("}\n");
      out.write("\n");
      out.write("google.maps.event.addDomListener(window, 'load', initialize);\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    <H2 style=\"color: gray;\" align=\"center\">Friends Geolocation</H2>\n");
      out.write("\n");
      out.write("<table align=\"center\">\n");
      out.write("<tr>\n");
      out.write("\t<td align=\"center\" ><button id=\"HangUp\" onclick=\"makeSipCall();endCall()\">Location</button></td>\n");
      out.write("\t<td> <input type=\"text\" value=");
      out.print(request.getParameter("friendlatitude"));
      out.write(" id=\"friendlatitude\" name=\"friendlatitude\"> </td>\n");
      out.write("\t<td> <input type=\"text\" value=");
      out.print(request.getParameter("friendlongitude"));
      out.write(" id=\"friendlongitude\" name=\"friendlongitude\"> </td>\n");
      out.write("\t\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("    <div id=\"map-canvas\"></div>\n");
      out.write("  </body>\n");
      out.write("</html>");
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
