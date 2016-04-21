<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.tcs.bean.*"%>
<%@page import="com.tcs.dao.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<html>
<link rel="stylesheet" href="reveal.css">
<style>
body{
	font:62.5%/1.5 "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
	background-color:#000000;
	background-attachment:fixed;
	background-size:cover;
	-moz-background-size:cover;
	-webkit-background-size:cover;
	-o-background-size:cover;
}
td{
color:#000000;
font-size: 12px;
}
h4{
color:#000000;
}
</style>
<body>
	<%
		HttpSession session1 = request.getSession(true);	
		Login myLoginBean =new Login(); 
		myLoginBean=(Login)session1.getAttribute("data");
		String sipUri = myLoginBean.getPrivateIdentity();
		String name=myLoginBean.getDisplayName();
		
		ArrayList<String> list = new ArrayList<String>();
		detailsDAO details = new detailsDAO();	
		
		list.addAll(details.findUserInfo(sipUri));
		list.addAll(details.findStudents(sipUri));
		list.addAll(details.findJobseekers(sipUri));
		list.addAll(details.findProfessionals(sipUri));
		
		request.setAttribute("details", list);
		ArrayList<String> users=(ArrayList<String>)request.getAttribute("details");
	%>

	<input type="hidden" value=<%=users.get(3).toString()%> id="stateid"
		name="statename">
	<input type="hidden" value=<%=users.get(4).toString()%> id="countryid"
		name="countryname">
	<input type="hidden" value=<%=users.get(6).toString()%> id="profileid"
		name="profilename">
	<input type="hidden" value=<%=users.get(9).toString()%> id="courseid"
		name="coursename">
	<input type="hidden" value=<%=users.get(10).toString()%> id="subjectid"
		name="subjectname">
	<input type="hidden" value=<%=users.get(12).toString()%>
		id="qualificationid" name="qualificationname">
	<input type="hidden" value=<%=users.get(13).toString()%> id="fieldid"
		name="fieldname">
	<input type="hidden" value=<%=users.get(15).toString()%>
		id="jobtitleid" name="jobtitlename">
	<input type="hidden" value=<%=users.get(17).toString()%>
		id="industryid" name="industryname">

	<section id="main">
		<script>
			/*this function is used to populate the dropdowns also keep the text files in the same folder*/
			function populateDropDowns(param) {

				var client = new XMLHttpRequest();
				client.open('GET', param + '.txt');
				client.onreadystatechange = function() {
					if (client.readyState == 4 && client.status == 200) {
						t = client.response;
						t = t.split('\n');
						var listbox;
						for ( var i = 0; i < t.length; i++) {
							//alert( " val "+ document.getElementById("stateid").value +" : t[i] "+t[i] );
							if (t[i]
									.match(document.getElementById("stateid").value)
									|| t[i].match(document
											.getElementById("countryid").value)
									|| t[i].match(document
											.getElementById("profileid").value)
									|| t[i].match(document
											.getElementById("courseid").value)
									|| t[i].match(document
											.getElementById("subjectid").value)
									|| t[i]
											.match(document
													.getElementById("qualificationid").value)
									|| t[i].match(document
											.getElementById("fieldid").value)
									|| t[i]
											.match(document
													.getElementById("jobtitleid").value)
									|| t[i]
											.match(document
													.getElementById("industryid").value)) {
								listbox += '<option selected="selected" value="'+t[i]+'">'
										+ t[i] + '</option>';
							} else {
								listbox += '<option value="'+t[i]+'">' + t[i]
										+ '</option>';
							}
						}
						document.getElementById(param).innerHTML = listbox;
					}
				};
				client.send();
			}
			populateDropDowns('state');
			populateDropDowns('country');
			populateDropDowns('profile');
			populateDropDowns('course');
			populateDropDowns('subject');
			populateDropDowns('qualification');
			populateDropDowns('field');
			populateDropDowns('jobtitle');
			populateDropDowns('industry');
		</script>
		<table>
			<!-- <tr>
        	<td>Registered Successfully , You can add more details <a href="login.html">Back To Login Page</a></td>
        </tr> -->

			
				<%-- <td>

			<h2>Create Profile</h2>
			<form enctype="multipart/form-data" method="POST"
				onsubmit="return validateMoreDetails();" name="createUserform"
				action="../CreateUserServlet?name=<%=request.getParameter("privateIdentity")%>&displayName=<%=request.getParameter("displayName")%> ">
				<table id="AddCustTable" align="center">
				
					<tr>
						<td>Name:</td>
						<td><input id="Name" type="text" name="userid"
							title="Id should contain only digits only." maxlength="40"
							value=<%=request.getParameter("displayName")%> /></td>
						
						<td></td>
					</tr>
					<tr>
						<td>Sip Uri:</td>
						<td><input id="Name" type="text" name="name"
							title="Name should contain only alphabets and whitespaces."
							maxlength="40" value="<%=request.getParameter("privateIdentity")%>"/></td>
					
					</tr>
						<tr>
						<td>Profile-Pic:</td>
						<td><input style="padding: 2px 0px 2px 0px;" id="picture"
							type="file" name="picture"
							title="The document should be a .jpg file."
							onchange="checkUploadedPic('picture')" /><br/><br/></td>
						<td id="imageError" style="color: red;"></td>
					</tr>
					<!-- 					<tr> -->
					<!-- 						<td>Fav. Audio-track:</td> -->
					<!-- 						<td><input style="padding: 2px 0px 2px 0px;" id="audio" type="file" name="audio" title="The document should be a .mp3 file." onchange="checkUploadedAudio('audio')"/></td> -->
					<!-- 						<td id="audioError" style="color: red;"></td> -->
					<!-- 					</tr> -->
					<!-- 					<tr> -->
					<!-- 						<td>Fav. Video:</td> -->
					<!-- 						<td><input style="padding: 2px 0px 2px 0px;" id="video" type="file" name="video" title="The document should be a .mp4 file." onchange="checkUploadedVideo('video')"/></td> -->
					<!-- 						<td id="videoError" style="color: red;"></td> -->
					<!-- 					</tr> -->
					<tr>
						<td></td>
						<td><input style="padding: 3px;" type="submit" name="submit"
							value="Submit Details" /> <input style="padding: 3px;"
							type="reset" value="Reset" id="resetButton" /></td>
					</tr>
				</table>
			</form>
		</td> --%>
				<tr>
				<td align="left">
					<h4>Personal Information</h4><br />
					<form action="PersonalInfoController?displayName=<%=name%>"	method="post" name="f1">
						<table>
							<tr>
								<td>Sip Uri:</td>
								<td><input id="Name" type="text" name="name"
									title="Name should contain only alphabets and whitespaces."
									maxlength="40"
									value="<%=sipUri%>" /></td>
								<td id="NameError" style="color: red;"></td>
							</tr>
							<tr>
								<td style="vertical-align: top;">Address:</td>
								<td><textarea id="Address" name="address" cols="25"
										rows="5" title="Address should be of maximum 200 characters."
										onblur="checkForAddress('Address')"><%=users.get(1).toString()%></textarea></td>
								<td id="addressError" style="color: red; vertical-align: top;"></td>
							</tr>
							<tr>
								<td>City:</td>
								<td><input type="text" name="city"
									value="<%=users.get(2).toString()%>"></td>
							</tr>
							<tr>
								<td>State:</td>
								<td><select name="state" id="state">
								</select></td>
							</tr>
							<tr>
								<td>Country:</td>
								<td><select name="country" id="country">
								</select></td>
							</tr>
							<tr>
								<td>Contact No.:</td>
								<td><input id="Contact" type="text" name="contact"
									value="<%=users.get(5).toString()%>"
									title="Contact number should contain only digits."
									maxlength="15" onblur="checkContactNumber('Contact')" /></td>
							</tr>
							<tr>
								<td>Profile:</td>
								<td><select name="profile" id="profile">
								</select> <br />
								<br /></td>
							</tr>
							<tr>
								<td></td>
								<td><input class="button" style="padding: 3px;" type="submit"
									name="submit" value="Submit Details" /> 
									<input class="button" style="padding: 3px;" type="reset" value="Reset"
									id="resetButton" /></td>
							</tr>

						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<h3>-----------------------------------------------------------------------------</h3>
				</td>
			</tr>
			<tr>
				<td align="left" style="width: 100px;">
					<form action="StudentsController" method="get" name="f1">
						<table>
							<tr>
								<td></td>
								<td>
									<h4>Student</h4> <br />
								</td>
							</tr>
							<tr>
								<td>SipUri:</td>
								<td><input type="text" name="name"
									value="<%=sipUri%>"></td>
							</tr>
							<tr>
								<td>College/Institute:</td>
								<td><input type="text" name="institute"
									value="<%=users.get(8).toString()%>"></td>
							</tr>
							<tr>
								<td>Course/Degree:</td>
								<td><select name="course" id="course">
								</select></td>
							</tr>
							<tr>
								<td>Subjects:</td>
								<td><select name="subject" id="subject">
								</select> <br />
								<br /></td>

							</tr>
							<tr>
								<td></td>
								<td><input class="button" style="padding: 3px;" type="submit"
									name="submit" value="Submit Details" /> 
									<input class="button" style="padding: 3px;" type="reset" value="Reset"
									id="resetButton" /></td>
							</tr>
						</table>
					</form>
				</td>
				<td align="center" style="width: 100px;">
					<form action="JobSeekersController" method="post" name="f1">
						<table>
							<tr>
								<td></td>
								<td>
									<h4>Jobseeker</h4> <br />
								</td>
							</tr>
							<tr>
								<td>SipUri:</td>
								<td><input type="text" name="name"
									value="<%=sipUri%>"></td>
							</tr>
							<tr>
								<td>Qualification:</td>
								<td><select name="qualification" id="qualification">
								</select></td>
							</tr>
							<tr>
								<td>Field:</td>
								<td><select name="field" id="field">
								</select> <br />
								<br /></td>
							</tr>
							<tr><td></td><td><br/></td></tr>
							<tr>
								<td></td>
								<td><input style="padding: 3px;" type="submit"
									name="submit" value="Submit Details" class="button"/>
									 <input class="button" style="padding: 3px;" type="reset" value="Reset"
									id="resetButton" /></td>
							</tr>
						</table>
					</form>
				</td>
				<td align="right" style="width: 100px;">
					<form action="ProfessionalsController"	method="get" name="f1">
						<table>
							<tr>
								<td></td>
								<td>
									<h4>Professional</h4><br />
								</td>
							</tr>
							<tr>
								<td>SipUri:</td>
								<td><input type="text" name="name"
									value="<%=sipUri%>"></td>
							</tr>
							<tr>
								<td>Job Title:</td>
								<td><select name="jobtitle" id="jobtitle">
								</select></td>
							</tr>
							<tr>
								<td>Project:</td>
								<td><input type="text" name="project"
									value="<%=users.get(16).toString()%>"></td>
							</tr>
							<tr>
								<td>Industry:</td>
								<td><select name="industry" id="industry">
										<option value="select"></option>
								</select> <br />
								<br /></td>
							</tr>
							<tr>
								<td></td>
								<td><input class="button" style="padding: 3px;" type="submit"
									name="submit" value="Submit Details" /> 
									<input class="button" style="padding: 3px;" type="reset" value="Reset"
									id="resetButton" /></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>