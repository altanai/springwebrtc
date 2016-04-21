package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class geolocation_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Geolocation</title>\n");
      out.write("    <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <link href=\"http://code.google.com//apis/maps/documentation/javascript/examples/default.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("   \n");
      out.write("   <!-- code for geolocation -->\n");
      out.write("    <script src=\"https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true\"></script>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("    var arr;\n");
      out.write("    var latitude;\n");
      out.write("    var longitude;\n");
      out.write("    var map;\n");
      out.write("    var serverip;\n");
      out.write("    var user;\n");
      out.write("\n");
      out.write("function initialize() {\n");
      out.write("\t\n");
      out.write("\t//alert(\"maps initialised 2 \");\n");
      out.write("\t\n");
      out.write("  var mapOptions = {\n");
      out.write("    zoom: 6,\n");
      out.write("    mapTypeId: google.maps.MapTypeId.ROADMAP\n");
      out.write("  };\n");
      out.write("  map = new google.maps.Map(document.getElementById('map-canvas'),\n");
      out.write("      mapOptions);\n");
      out.write("\n");
      out.write("  // Try HTML5 geolocation\n");
      out.write("  if(navigator.geolocation) {\n");
      out.write("    \n");
      out.write("\t  navigator.geolocation.getCurrentPosition(function(position) {\n");
      out.write("      \n");
      out.write("\t\t//  alert(\" lat:  \"+position.coords.latitude+\" long: \"+ position.coords.longitude);\n");
      out.write("\t\t  \n");
      out.write("      \n");
      out.write("\t\t  latitude=position.coords.latitude;\n");
      out.write("\t\t  longitude=position.coords.longitude;\n");
      out.write("\t\t  \n");
      out.write("\t\t  var pos = new google.maps.LatLng(position.coords.latitude,\n");
      out.write("                                       position.coords.longitude);\n");
      out.write("      \n");
      out.write("\n");
      out.write("      var infowindow = new google.maps.InfoWindow({\n");
      out.write("        map: map,\n");
      out.write("        position: pos,\n");
      out.write("        content: 'current location'\n");
      out.write("      });\n");
      out.write("\n");
      out.write("      map.setCenter(pos);\n");
      out.write("    }, function() {\n");
      out.write("      handleNoGeolocation(true);\n");
      out.write("    });\n");
      out.write("  } else {\n");
      out.write("    // Browser doesn't support Geolocation\n");
      out.write("    handleNoGeolocation(false);\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("  \n");
      out.write("}\n");
      out.write("\n");
      out.write("function handleNoGeolocation(errorFlag) {\n");
      out.write("  if (errorFlag) {\n");
      out.write("    var content = 'Error: The Geolocation service failed.';\n");
      out.write("  } else {\n");
      out.write("    var content = 'Error: Your browser doesn\\'t support geolocation.';\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  var options = {\n");
      out.write("    map: map,\n");
      out.write("    position: new google.maps.LatLng(60, 105),\n");
      out.write("    content: content\n");
      out.write("  };\n");
      out.write("\n");
      out.write("  var infowindow = new google.maps.InfoWindow(options);\n");
      out.write("  map.setCenter(options.position);\n");
      out.write("}\n");
      out.write("\n");
      out.write("google.maps.event.addDomListener(window, 'load', initialize);\n");
      out.write("\n");
      out.write("\n");
      out.write("var arr2;\n");
      out.write("var arr;//Array Variable declared globally\n");
      out.write("\n");
      out.write("\n");
      out.write("var xmlHttpRequest;\n");
      out.write("if(window.XMLHttpRequest)\n");
      out.write("\t{\n");
      out.write("\txmlHttpRequest=new XMLHttpRequest();\n");
      out.write("\t}\n");
      out.write("else if(window.ActiveXObject)\n");
      out.write("\t{\n");
      out.write("\txmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write(" function makeSipCall()\t//ADD These to the original call javascript\n");
      out.write("{\n");
      out.write("\t\n");
      out.write("} \n");
      out.write(" \n");
      out.write("function eraseResponseMessage()\n");
      out.write("{\n");
      out.write("\tdocument.getElementById(\"serverReply\").innerHTML=\"\";\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("function endCall()//ADD These to the original hangup javascript\n");
      out.write("{\n");
      out.write("\tuser = document.getElementById(\"user\").value;\n");
      out.write("\talert( \"user \"+user );\n");
      out.write("\tarr=new Array();\n");
      out.write("\tarr[arr.length]=user;\n");
      out.write("    arr[arr.length]=latitude;\n");
      out.write("\tarr[arr.length]=longitude;\n");
      out.write("\t\n");
      out.write("\tvar DateTime=new Date();\n");
      out.write("\tarr[arr.length]=DateTime.getDate();\n");
      out.write("\tarr[arr.length]=DateTime.getTime();\n");
      out.write("\n");
      out.write("\tsendDataToUpload();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function sendDataToUpload() //This function makes use of AJAX To Call the Servlet\n");
      out.write("{\n");
      out.write("\tserverip=document.getElementById(\"serverip\").value;\n");
      out.write("\talert( \"server ip \"+ serverip );\n");
      out.write("\txmlHttpRequest.open(\"POST\", \"http://\"+serverip+\":8080/Geolocation/GeolocationstoreServlet?sipuri=\"+arr[0]+\"&latitude=\"+arr[1]+\"&longitude=\"+arr[2]+\"&date=\"+arr[3]+\"&time=\"+arr[4], true);\n");
      out.write("\txmlHttpRequest.onreadystatechange=receiveMessageFromServer;\n");
      out.write("\txmlHttpRequest.send();\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("function receiveMessageFromServer()\n");
      out.write("{\n");
      out.write("\tif(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)\n");
      out.write("\t\t{\n");
      out.write("\t\tdocument.getElementById(\"serverReply\").innerHTML=xmlHttpRequest.responseText;\n");
      out.write("\t\tdocument.getElementById(\"HangUp\").disabled=true;\n");
      out.write("\t\tdocument.getElementById(\"CALL\").disabled=false;\n");
      out.write("\t\t}\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("    </script>   \n");
      out.write("    <!-- end geolocation code  -->\n");
      out.write("    \n");
      out.write("    \n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("  \n");
      out.write("  <H2 style=\"color: gray;\" align=\"center\">Geolocation service</H2>\n");
      out.write("\n");
      out.write("<table align=\"center\">\n");
      out.write("<!-- <tr><td></td><td></td></tr>\n");
      out.write("<tr><td>Sender:</td><td><input type=\"text\" name=\"caller\" id=\"caller\" onfocus=\"eraseResponseMessage()\"></td></tr>\n");
      out.write("<tr><td>Receiver:</td><td><input type=\"text\" name=\"callee\" id=\"callee\"></td></tr>\n");
      out.write("<tr><td><br/></td><td><br/></td></tr> -->\n");
      out.write("<tr>\n");
      out.write("\n");
      out.write("\t<td align=\"center\" ><button id=\"HangUp\" onclick=\"makeSipCall();endCall()\">Share My Location</button></td>\n");
      out.write("\t<td> <input type=\"text\" value=");
      out.print(session.getAttribute("user"));
      out.write(" id=\"user\" name=\"user\"> </td>\n");
      out.write("\t<td> <input type=\"text\" value=");
      out.print(session.getAttribute("serverip"));
      out.write(" id=\"serverip\" name=\"serverip\" style=\"display:none\"> </td>\n");
      out.write("\t<td> <a href=\"ViewServlet\">View Location of Others </a></td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<h3 align=\"center\" id=\"serverReply\"></h3>\n");
      out.write("\n");
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
