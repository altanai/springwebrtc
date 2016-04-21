<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="com.tcs.bean.QuestionBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%QuestionBean questionBean= new QuestionBean();String sipUri=""; String question="";
%>
<% if(request.getAttribute("question")!=null && request.getAttribute("sipUri")!=null){ 
questionBean=(QuestionBean)request.getAttribute("question");
if("".equalsIgnoreCase(request.getAttribute("sipUri").toString())){
	sipUri="";
	
}
else{
	sipUri=request.getAttribute("sipUri").toString();
	if(questionBean.getQuestion()!=null){
		question=questionBean.getQuestion();
	}
	
}
//	System.out.println(questionBean.getQuestion());
//	System.out.println(questionBean.getAnswer());

}
/* else {
	questionBean.setDisplayName(" ");
	questionBean.setPrivateIdentity(" ");
	
} */
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Your Password</title>
<link rel="stylesheet" href="login.css">
<script type="text/javascript">

function appearDiv()
{
	var a=document.getElementById("displayQues");
	a.style.visibility="visible";
	}
	
	function checkAnswer(){
		gettingAnswerFunc();
		
		if((document.getElementById("gettingAnswer").value).match("<%=questionBean.getAnswer()%>")){
			
			location.href="ResetPassword.jsp?sipuri=<%=sipUri%>";
		}
		else{
			 document.getElementById('message1').innerHTML="";
			 var _message = document.createTextNode("Your answer does not match with the question");
			    document.getElementById('message1').appendChild(_message); 
		}
	}
	
	/* function validate()
	{
		var a=user();
		var b=pass();
		return a && b;
		
		} */
	function gettingAnswerFunc()
	{
		var name=document.getElementById("gettingAnswer").value;
		
		if (name==null || name=="")
		{
			document.getElementById("gettingAnswer-error").innerHTML="Please enter answer";
			return false;
		}
		
		else
		{
			document.getElementById("gettingAnswer-error").innerHTML="";
			return true;
		}
	}

</script>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/Controller">
 <input type="hidden" name="action" value="getquestion"/> 
<table>
<tr>
<td><label style="font-size: 15px;">Enter Username:</label></td>
<td><input type="text" id="privateIdentity" name="privateIdentity" value="<%=sipUri%>" placeholder="eg- name@tcs.com"/></td>
</tr>
<tr>
<td><input type="submit" value="Get Question" name="questionButton" style="width:90%;" class="reset-button" onclick="return appearDiv();"/></td>
</tr>
</table>
</form>
<form method="post" action="<%=request.getContextPath()%>/Controller">
<input type="hidden" name="action" value="checkAnswer"/>
<div id="displayQues">
<table>
<tr>
<td><label style="font-size: 15px;">Question:</label></td>
<td><label id="gettingQuestion" style="font-size: 15px;"><%=question%></label></td>
</tr>
<tr>
<td><label style="font-size: 15px;">Answer:</label></td>
<td><input type="text" id="gettingAnswer"/></td>
<td><span class="red-field" id="gettingAnswer-error"></span></td>
</tr>
<tr>
<td><input type="button" value="Submit" style="width:90%;" class="reset-button" onclick="checkAnswer();"/></td>
</tr>
</table>
</div>
<div id='message1' style="color: red; font-size: 15px;"></div>
</form>
</body>
</html>