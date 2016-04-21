package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ViewCallLogs_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
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
      out.write("\r\n");
      out.write("<title>WebRTC-View Call Logs</title>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(document).ready(function () { \r\n");
      out.write("\t$('#TableContainer').jtable({\r\n");
      out.write("\tactions: { \r\n");
      out.write("\t\tlistAction: '");
      out.print(request.getContextPath());
      out.write("/ViewCallLogsServlet/ViewAllLogs'\r\n");
      out.write("\t},\r\n");
      out.write("\t\ttitle:'CALL-LOGS',\r\n");
      out.write("\t\tpaging: true,\r\n");
      out.write("\t\tpageSize:5,\r\n");
      out.write("        sorting: true,\r\n");
      out.write("        defaultSorting:'CALLER ASC',\r\n");
      out.write("        columnSelectable: false,\r\n");
      out.write("        defaultDateFormat: 'dd-M-yy',\r\n");
      out.write("        openChildAsAccordion: true,\r\n");
      out.write("        saveUserPreferences: false,\r\n");
      out.write("        fields: { \r\n");
      out.write("        \tCALLER: { \r\n");
      out.write("\t\t\t\ttitle: 'CALLER',\r\n");
      out.write("\t\t\t\twidth: '20%'\r\n");
      out.write("\t\t\t}, \r\n");
      out.write("\t\t\tCALLEE: { \r\n");
      out.write("\t\t\t\ttitle: 'CALLEE',\r\n");
      out.write("\t\t\t\twidth: '20%',\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tDAY:\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\tsorting:false,\r\n");
      out.write("\t\t\ttitle :'DAY',\r\n");
      out.write("\t\t\twidth:'20%'\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\tSTARTTIME:\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\ttitle:'Start-Time',\r\n");
      out.write("\t\t\twidth:'20%'\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\tENDTIME:\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\ttitle:'End-Time',\r\n");
      out.write("\t\twidth:'20%'\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("});\r\n");
      out.write("\t\r\n");
      out.write("$('#TableContainer').jtable('load');\r\n");
      out.write("$(\"#columnName\").select2();\r\n");
      out.write("$( \"#datePicker\").datepicker({\r\n");
      out.write("\tdateFormat: \"d/mm/yy\", \r\n");
      out.write("\tinline: true\r\n");
      out.write("});\r\n");
      out.write("$( document ).tooltip();\r\n");
      out.write("$( \"#FilterRecords\").button();\r\n");
      out.write("$( \"#ClearFilter\").button();\r\n");
      out.write("\r\n");
      out.write("$('#FilterRecords').click(function (e) {\r\n");
      out.write("    e.preventDefault();\r\n");
      out.write("    $('#TableContainer').jtable('load', {\r\n");
      out.write("        queryFilter: $('#filterValue').val(),\r\n");
      out.write("        columnName: $('#columnName').val(),\r\n");
      out.write("        dateFilter: $('#datePicker').val()\r\n");
      out.write("    });\r\n");
      out.write("    $(\"#columnName\").select2();\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("$('#ClearFilter').click(function (e) {\r\n");
      out.write("\te.preventDefault();\r\n");
      out.write("\t$('#filterValue').val('');\r\n");
      out.write("\t$('#columnName').val('');\r\n");
      out.write("\t$('#datePicker').val('');\r\n");
      out.write("\t$('#datePicker').css('display','none');\r\n");
      out.write("\t$('#filterValue').css('display','none');\r\n");
      out.write("\t$('#TableContainer').jtable('load');\r\n");
      out.write("\t $(\"#columnName\").select2();\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function processFilterRequest()\r\n");
      out.write("{\r\n");
      out.write("\tvar temp=document.getElementById(\"columnName\");\r\n");
      out.write("\tvar tempVal=temp.value;\r\n");
      out.write("\ttempVal.trim();\r\n");
      out.write("\tif(tempVal.match(\"CALLEE\"))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\tdocument.getElementById(\"filterValue\").style.display=\"inline\";\r\n");
      out.write("\t\tdocument.getElementById(\"datePicker\").style.display=\"none\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif(tempVal.match(\"CALLER\"))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\tdocument.getElementById(\"filterValue\").style.display=\"inline\";\r\n");
      out.write("\t\tdocument.getElementById(\"datePicker\").style.display=\"none\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\tif(tempVal.match(\"DAY\"))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\tdocument.getElementById(\"datePicker\").style.display=\"inline\";\r\n");
      out.write("\t\tdocument.getElementById(\"filterValue\").style.display=\"none\";\r\n");
      out.write("\t\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"filterRecords\" style=\"padding-left: 20px;padding-right: 20px;padding-top: 50px\" >\r\n");
      out.write("\t\t\t\t\t <form><table>\r\n");
      out.write("\t\t\t\t\t <tr><td>\r\n");
      out.write("\t\t\t\t     <label style=\"font-size: 20px;font-style: normal;font-weight: bold;margin-right: 10px\">Filter by:</label></td>\r\n");
      out.write("\t\t\t\t     <td><input type=\"text\" id=\"filterValue\" style=\"width: 140px; height:24px;display: none\" maxlength=\"20\" title=\"Please enter text to filter records\"/></td>\r\n");
      out.write("\t\t\t\t     <td><input type=\"text\" id=\"datePicker\" style=\"width: 140px; height:24px;display: none\" maxlength=\"20\" title=\"Please choose a date to filter records\"/></td>\r\n");
      out.write("\t\t\t\t     <td><select id=\"columnName\" onchange=\"processFilterRequest();\" style=\"width: 200px\">\r\n");
      out.write("\t\t\t\t        \t<option>-Select-</option>\r\n");
      out.write("\t\t\t\t            <option value=\"CALLEE\">CALLEE</option>\r\n");
      out.write("\t\t\t\t             <option value=\"CALLER\">CALLER</option>\r\n");
      out.write("\t\t\t\t            <option value=\"DAY\">DAY-OF-CALL</option>\r\n");
      out.write("\t\t\t\t        </select></td>\r\n");
      out.write("\t\t\t\t        <td><button id=\"FilterRecords\" style=\"height: 28px\">FILTER</button></td>\r\n");
      out.write("\t\t\t\t        <td><button id=\"ClearFilter\" style=\"height: 28px\">CLEAR-FILTER</button></td>\r\n");
      out.write("\t\t\t\t        </tr>\r\n");
      out.write("\t\t\t\t        </table>\r\n");
      out.write("\t\t\t\t    </form>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("<div id=\"TableContainer\" style=\"padding-left: 20px;padding-right: 20px;padding-top: 20px\"></div>\r\n");
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
