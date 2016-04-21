package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.tcs.webrtc.bean.AnalyticsBean;

public final class CallGraph_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=ISO-8859-1");
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
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Call Logs Chart</title>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/scripts/Chart.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/scripts/jquery-1.9.1.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/scripts/jquery-ui-1.10.3.custom.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/scripts/jquery.jtable.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/scripts/select2.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/themes/metro/blue/jtable.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/jquery-smoothness-theme/jquery-ui-1.10.3.custom.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/select2.css\"/>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath());
      out.write("/css/start/jquery-ui-1.10.3.custom.css\"/>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function processFilterRequest()\r\n");
      out.write("{\r\n");
      out.write("\tvar temp=document.getElementById(\"columnName\");\r\n");
      out.write("\tvar tempVal=temp.value;\r\n");
      out.write("\ttempVal.trim();\r\n");
      out.write("\tif(tempVal.match(\"MONTH\"))\r\n");
      out.write("\t{\r\n");
      out.write("\tdocument.getElementById(\"yearlyDatepicker\").style.display=\"none\";\r\n");
      out.write("\tdocument.getElementById(\"monthlyDatepicker\").style.display=\"inline\";\r\n");
      out.write("\tdocument.getElementById(\"sbmitBtn\").style.display = \"inline\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif(tempVal.match(\"YEAR\"))\r\n");
      out.write("\t{\r\n");
      out.write("\tdocument.getElementById(\"yearlyDatepicker\").style.display=\"inline\";\r\n");
      out.write("\tdocument.getElementById(\"monthlyDatepicker\").style.display=\"none\";\r\n");
      out.write("\tdocument.getElementById(\"sbmitBtn\").style.display = \"inline\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif(tempVal.match(\"SELECT\"))\r\n");
      out.write("\t{\t\t\t\r\n");
      out.write("\tdocument.getElementById(\"yearlyDatepicker\").style.display = \"none\";\r\n");
      out.write("\tdocument.getElementById(\"monthlyDatepicker\").style.display = \"none\";\r\n");
      out.write("\tdocument.getElementById(\"sbmitBtn\").style.display = \"none\";\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<script>\r\n");
      out.write("  $(function() {\r\n");
      out.write("    $( \"#dialog\" ).dialog({\r\n");
      out.write("      autoOpen: false,\r\n");
      out.write("      show: {\r\n");
      out.write("        duration: 1000\r\n");
      out.write("      },\r\n");
      out.write("      hide: {\r\n");
      out.write("        effect: \"explode\",\r\n");
      out.write("        duration: 1000\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write(" \r\n");
      out.write("    $( \"#canvas\" ).click(function() {\r\n");
      out.write("      $( \"#dialog\" ).dialog( \"open\" );\r\n");
      out.write("    });\r\n");
      out.write("  \r\n");
      out.write("    $( document ).tooltip(); \r\n");
      out.write("  $(\"#columnName\").select2();\r\n");
      out.write("  $( \"#yearlyDatepicker\" ).datepicker({\r\n");
      out.write("\t  dateFormat: \"yy\",\r\n");
      out.write("\t  inline: true,\r\n");
      out.write("      changeYear: true\r\n");
      out.write("    });\r\n");
      out.write("  $( \"#monthlyDatepicker\" ).datepicker({\r\n");
      out.write("\t  dateFormat: \"M, yy\",\r\n");
      out.write("\t  changeMonth: true,\t\r\n");
      out.write("\t  inline: true\r\n");
      out.write("    });\r\n");
      out.write("  });\r\n");
      out.write("  </script>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div id=\"filterContoller\" style=\"padding-left: 20px; padding-right: 20px; padding-top: 50px\">\r\n");
      out.write("\t\t<form action=\"");
      out.print(request.getContextPath() );
      out.write("/AnalyticsServlet\" method=\"post\">\r\n");
      out.write("\t\t<label style=\"font-size: 20px;font-style: normal;font-weight: bold;margin-right: 10px\">View Graph By:</label>\r\n");
      out.write("\t\t\t<select id=\"columnName\" name=\"columnName\" onchange=\"processFilterRequest();\" style=\"width: 140px\">\r\n");
      out.write("\t\t\t\t<option value=\"SELECT\">Select</option>\r\n");
      out.write("\t\t\t\t<option value=\"MONTH\">MONTH</option>\r\n");
      out.write("\t\t\t\t<option value=\"YEAR\">YEAR</option>\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t\t<input type=\"text\" name=\"month\" id=\"monthlyDatepicker\" style=\"width: 120px; height:26px;display: none;padding-left: 20px\" placeholder=\"Example Jan\" title=\"Please enter the month\"/> \r\n");
      out.write("\t\t\t<input type=\"text\" name=\"year\" id=\"yearlyDatepicker\"   style=\"width: 120px; height:26px;display: none;padding-left: 20px\" placeholder=\"Example 2013\" title=\"Please enter the year\" /> \r\n");
      out.write("\t\t\t<input type=\"submit\" id=\"sbmitBtn\" value=\"Submit\" title=\"Click here to submit\" style=\"height: 28px;display: none\"/>\r\n");
      out.write("\t\t\t<input type=\"hidden\" value=\"");
      out.print(request.getAttribute("sipUri") );
      out.write("\" name=\"sipUri\">\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\r\n");
      out.write("<div id=\"dialog\" title=\"Graph Details\">\r\n");
      out.write("  <p>This chart displays the total outgoing and incoming calls for a particular user for each month of the year.<br/>\r\n");
      out.write("   1.Outgoing call are shown in faded blue color<br/>2.Incoming calls are shown in grey color.</p>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"graphContainer\" style=\"padding-left: 20px;padding-right: 20px;padding-top: 50px\">\r\n");
      out.write("<canvas id=\"canvas\" height=\"450\" width=\"500\"></canvas>\r\n");
      out.write("\t\t<br/><br/>\r\n");
      out.write("\t ");
 
    	AnalyticsBean analyticsBean=(AnalyticsBean)request.getAttribute("analyticsBean");
   	 
      out.write("  \r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t var arr1 = new Array(");
int[] arr=new int[12];
	    			arr=analyticsBean.getIncomingCall();
	    			 System.out.println("In");
				    for(int i = 0; i < arr.length; i++) {  
				      out.print("\""+arr[i]+"\"");
				     
				      System.out.print(arr[i]+" ");
				      if(i+1 < arr.length) {  
				        out.print(",");  
				      }  
				    }  
      out.write(");\r\n");
      out.write("\t var arr2 = new Array(");
int[] arr1=new int[12];
		arr1=analyticsBean.getOutgoingCall();
		System.out.println("\nout\n");
	    for(int i = 0; i < arr1.length; i++) {  
	    	
	    	System.out.print(arr1[i]+" ");
	    	
	      out.print("\""+arr1[i]+"\"");  
	      if(i+1 < arr1.length) {  
	        out.print(",");  
	      }  
	    }  
      out.write("); \r\n");
      out.write("\r\n");
      out.write("\t\tvar lineChartData = {\r\n");
      out.write("\t\t\t\tlabels : [\"January\",\"February\",\"March\",\"April\",\"May\",\"June\",\"July\",\"August\",\"September\",\"October\",\"November\",\"December\"],\r\n");
      out.write("\t\t\t\tdatasets : [\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tfillColor : \"rgba(220,220,220,0.5)\",\r\n");
      out.write("\t\t\t\t\t\tstrokeColor : \"rgba(220,220,220,1)\",\r\n");
      out.write("\t\t\t\t\t\tpointColor : \"rgba(220,220,220,1)\",\r\n");
      out.write("\t\t\t\t\t\tpointStrokeColor : \"#fff\",\r\n");
      out.write("\t\t\t\t\t\tdata :arr1\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tfillColor : \"rgba(151,187,205,0.5)\",\r\n");
      out.write("\t\t\t\t\t\tstrokeColor : \"rgba(151,187,205,1)\",\r\n");
      out.write("\t\t\t\t\t\tpointColor : \"rgba(151,187,205,1)\",\r\n");
      out.write("\t\t\t\t\t\tpointStrokeColor : \"#fff\",\r\n");
      out.write("\t\t\t\t\t\tdata :arr2\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t]\r\n");
      out.write("\r\n");
      out.write("\t\t\t};\r\n");
      out.write("\t\tvar myLine = new Chart(document.getElementById(\"canvas\").getContext(\"2d\")).Line(lineChartData);\r\n");
      out.write("\t</script>\r\n");
      out.write("\t\r\n");
      out.write("    <input type=\"submit\" name=\"submit\" value=\"\" style=\"background-color:#87AFC7;\"> : Outgoing Calls\r\n");
      out.write("    <input type=\"submit\" name=\"submit\" value=\"\" style=\"background-color:#D1D0CE;\"> : Incoming Calls\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
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
