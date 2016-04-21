<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddAdvertisement</title>
</head>
<style>
 th{
background-color:#1E90FF;
height:20px; 
}
#hint1{
  text-align:center;
}
</style>

<script type="text/javascript">
function validateForm()
{	var i=document.getElementById("intr").value;
	var x1=document.getElementById("sub1").value;
	var x2=document.getElementById("sub2").value;
	var x3=document.getElementById("sub3").value;
	if ((i==null || i==""))
  	{	document.getElementById("hint1").innerHTML="Please mention your Interest name first !";
	 	document.getElementById("hint1").style.color = "red";
        return false;
    }

else if((x1==null || x1=="") && (x2==null || x2=="")&& (x3==null || x3=="")&&(i!=null || i!="")){


document.getElementById("hint1").innerHTML="Please mention your Sub-Category!";
	 document.getElementById("hint1").style.color = "red";
	 return false;
}
else if((x1==null || x1=="") && (x2!=null || x2!="") &&(x3==null || x3=="")&&(i!=null || i!="")){


	document.getElementById("hint1").innerHTML="Please mention your first  Sub-Category also!";
		 document.getElementById("hint1").style.color = "red";
		 return false;
	}
else if((x1!=null || x1!="") && (x2==null || x2=="") &&(x3==null || x3=="")&&(i!=null || i!="")){


	document.getElementById("hint1").innerHTML="Success!";
		 document.getElementById("hint1").style.color = "green";
		 return true;
	}
else if((x1!=null || x1!="") && (x2!=null || x2!="") &&(x3==null || x3=="")&&(i!=null || i!="")){


	document.getElementById("hint1").innerHTML="Success!";
		 document.getElementById("hint1").style.color = "green";
		 return true;
	}
else if((x1==null || x1=="") && (x2==null || x2=="")&&(x3!=null || x3!="")&&(i!=null || i!="")){


	document.getElementById("hint1").innerHTML="Please mention your first and second Sub-Category also!";
		 document.getElementById("hint1").style.color = "red";
		 return false;
	}
	
else if((x1==null || x1=="") && (x2!=null || x2!="") &&(x3!=null || x3!="")&&(i!=null || i!="")){


	document.getElementById("hint1").innerHTML="Please mention your first Sub-Category also!";
		 document.getElementById("hint1").style.color = "red";
		 return false;
	}



else if((x1!=null || x1!="") && (x2==null || x2=="") &&(x3!=null || x3!="")&&(i!=null || i!="")){


	document.getElementById("hint1").innerHTML="Please mention your second Sub-Category also!";
		 document.getElementById("hint1").style.color = "red";
		 return false;
	}

else
{
return true;
}
}

</script>
<script src="<c:url value="resources/metroui/scripts/jquery-1.6.1.min.js"/>" type="text/javascript"></script>
<script>
function updateInterests()
{
		var interest=$("input:radio[name=interest1]:checked").val();
		var interestid=$("input:radio[name=interest1]:checked").attr('id');
		if(interestid.match("interest1")){
			  $("#interest").val('advertiseaccessories');	
		}
		else if(interestid.match("interest2")){
			  $("#interest").val('advertiseautomobile');	
		}
		else{
			  $("#interest").val('advertisefood');	
		}
		  var arr=interest.split(",");
		  $("#sub1").val(arr[0]);
		  $("#sub2").val(arr[1]);
		  $("#sub3").val(arr[2]);
		 	}
</script>

<script>
function UploadImage(){
var file=document.getElementById("advertiseImage").files[0];
var formData=new FormData();
alert(file.name);
formData.append("picFile",file);
var xmlHttp=new  XMLHttpRequest();
alert("xml Request");
xmlHttp.open("POST","updateadvertiseImage.html",false);
xmlHttp.onreadystatechange=function(){
if(xmlHttp.readyState==4&&xmlHttp.status==200){
alert("Profile-Pic updated");
}
}
xmlHttp.send(formData);
alert("XmlRequestSent");
}
</script>
<script>
$(document).ready(function() {
$category = $("select[name='category']");
$subCategory = $("select[name='subCategory']");

$category.change(function() {
if ("accessories".match($(this).val())) {
 <c:forEach items="${advertiseinterests}" var="advertiseinterest">
var accessoriesArray = "${(advertiseinterest.accessories)}".split(",");
</c:forEach>
$("select[name='subCategory'] option").remove();
$("<option>"+accessoriesArray[0]+"</option>").appendTo($subCategory);
$("<option>"+accessoriesArray[1]+"</option>").appendTo($subCategory);
$("<option>"+accessoriesArray[2]+"</option>").appendTo($subCategory);
}

if ("automobile".match($(this).val())) {
	 <c:forEach items="${advertiseinterests}" var="advertiseinterest">
	var automobileArray = "${(advertiseinterest.automobile)}".split(",");
	</c:forEach>
	$("select[name='subCategory'] option").remove();
	$("<option>"+automobileArray[0]+"</option>").appendTo($subCategory);
	$("<option>"+automobileArray[1]+"</option>").appendTo($subCategory);
	$("<option>"+automobileArray[2]+"</option>").appendTo($subCategory);
	}
	
if ("food".match($(this).val())) {
	 <c:forEach items="${advertiseinterests}" var="advertiseinterest">
	var foodArray = "${(advertiseinterest.food)}".split(",");
	</c:forEach>
	$("select[name='subCategory'] option").remove();
	$("<option>"+foodArray[0]+"</option>").appendTo($subCategory);
	$("<option>"+foodArray[1]+"</option>").appendTo($subCategory);
	$("<option>"+foodArray[2]+"</option>").appendTo($subCategory);
	}
});
});
</script>
<script language="JavaScript">
function Validate()
{
	  var image =document.getElementById("image").value;
	 if(image==''){
		 alert("Please enter Image Path");
		 document.getElementById("image").focus();
		 return false;
		 }
	 }
</script>
<body >

<h4 style="margin-left:90%;">! Welecome, Admin</h4>
<h2><img src="<c:url value="resources/image/advr.jpg"/> " height="50" width="150" title="CustomizeInterest"><font color=#6599FF> ADVERTISING INTERESTS </font></h2>
 <marquee behavior="ALTERNATE" direction="RIGHT"  bgcolor="#FF9901"; ><FONT COLOR="blue">ADVERTISE YOUR INTERESTS</FONT></marquee>
  <h1></h1>
 

<form:form method="POST" action="/sdnext/saveadvertisement.html">
<input type="hidden" name="pageName" value="add"/>
<table border=1px align="center" bgcolor="#FF9901">
<tr>

<th>Interest</th>
 <td style="font-size:15px;"><form:input path="interest" value="" id="interest"/></td>
</tr>
 
<tr>
<th>Sub-Category</th>

 <td style="font-size:15px;"><form:input path="sub1" value="" id="sub1" /></td> 
 <td style="font-size:15px;"><form:input path="sub2" value="" id="sub2"/></td>
   <td style="font-size:15px;"><form:input path="sub3" value="" id="sub3"/></td>  
 
</tr>


<tr>
<td><input type="reset" value="Reset">
<!-- <input type="submit" value="Submit" onclick="return validateForm()"> -->
<input type="submit" value="Submit" onclick="UploadImage()"></td>

</tr>
</table>
<center><h3><label id="hint1" ></label></h3></center>
</form:form>
<br/>

<form:form action="/sdnext/uploadimage.html" name="frm" method="POST"
	enctype="multipart/form-data" onSubmit="return Validate();">
<table border=1px align="center" bgcolor="#FF9901">
<tr>
<th>Interest</th>
<th>Sub-Category</th>
<th>Image</th>
</tr>
<tr>
<td><select name="category">
<option value="Select"></option>
  <option value="accessories">Accessories</option>
  <option value="automobile">Automobile</option>
  <option value="food">Food</option>
 </select></td>
 <td><select name="subCategory">

 </select></td>
 <td><form:input path="fileData" id="image" type="file" /></td> 
</tr>
<tr>
<td colspan="3" align="center"><input type="submit" value="Upload" /></td>
</tr>
</table>

</form:form>

<br/>
<br/>
<br/>
<c:if test="${!empty advertiseinterests}">
		
		<table border=1px align="center" bgcolor="#FF9901">
		<c:forEach items="${advertiseinterests}" var="advertiseinterest">
		<tr>
		<th id="interest11" style="font-size:15px;"><input type="radio" id="interest1" name ="interest1" value="${advertiseinterest.accessories}" />Accessories</th>
	<th id="interest21" style="font-size:15px;"><input type="radio" id="interest2" name ="interest1" value="${advertiseinterest.automobile}" />Automobile</th>
	<th id="interest31" style="font-size:15px;"><input type="radio" id="interest3"  name ="interest1" value="${advertiseinterest.food}" />Food</th>
	</tr>
	</c:forEach>
	<tr>
		<td>
		<table align="center" >
		

		<c:forEach items="${advertiseinterests}" var="advertiseinterest">
   <c:set var="accessorieslist" value="${fn:split(advertiseinterest.accessories, ',')}" />
            
	<c:forEach var="accessories" items="${accessorieslist}"> 
			<tr>
			<td style="font-size:15px;"><c:out value="${accessories}"/></td>
				
				</tr>
		</c:forEach>
		
			</c:forEach>
		</table>
		</td>
		<td>
		<table  align="center" >
		<c:forEach items="${advertiseinterests}" var="advertiseinterest">
		 <c:set var="automobilelist" value="${fn:split(advertiseinterest.automobile, ',')}" />
			 
			  <c:forEach var="automobile" items="${automobilelist}"> 
			 <tr>	
			
           	<td  style="font-size:15px;"><c:out value="${automobile}"/></td>
           	
			</tr>	
			
			</c:forEach>
				
			
			</c:forEach>
		</table>
		</td>
		
		<td>
		
		<table  align="center" >
		<c:forEach items="${advertiseinterests}" var="advertiseinterest">
		<c:set var="foodlist" value="${fn:split(advertiseinterest.food, ',')}" />
			 <c:forEach var="food" items="${foodlist}"> 
			 <tr> 
				
					<td  style="font-size:15px;"><c:out value="${food}"/></td>
			</tr>
			</c:forEach>
					
			</c:forEach>
		</table>
		</td>
		</tr>
		<tr>
		<td align="center" colspan=3>
	<button onclick="updateInterests()">Edit</button><button onclick="deleteInterests()">Delete</button>	
		</td>
	
		</tr>
		
		
	</table>
	
</c:if> 


</body>
</html>