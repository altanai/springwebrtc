
<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="com.tcs.bean.Login"%>

<%Login login2= new Login(); 
			%>
			<% if(session.getAttribute("data2")!=null){session.getAttribute("data2"); 
			login2= (Login)session.getAttribute("data2");
			
			System.out.println(login2.getDisplayName());
			System.out.println(login2.getPrivateIdentity());
			System.out.println(login2.getPublicIdentity());
			System.out.println(login2.getRealm());
			}
			else{
				login2.setDisplayName(" ");
				login2.setPrivateIdentity(" ");
				login2.setPublicIdentity(" ");
				login2.setRealm(" ");
			}
		%>
		
		
		
		
			<fieldset>
			
				
<p>
					<label for="login-username">Name</label> 
					
					<input type="text"
						id="displayName" name="displayName" value=<%=login2.getDisplayName()%> class="round full-width-input"/>
						<%System.out.println("Dashboard "+login2.getDisplayName()); %>
				</p>
			
	<p>		
					<label for="login-username">Public Identity</label>
					
					 <input
						type="text" id="publicIdentity" name="publicIdentity" value=<%=login2.getPublicIdentity()%> class="round full-width-input"/>
				</p>
				<p>
					<label for="login-username">Private Identity</label> <input
						type="text" id="privateIdentity" name="privateIdentity" value=<%=login2.getPrivateIdentity() %> class="round full-width-input" readonly="readonly"/>
				</p>
				
				<p>
					<label for="login-username">Realm</label> <input type="text" id="realm" name="realm" value=<%=login2.getRealm() %>
						class="round full-width-input"/>
				</p>
				
				<!-- <input type="submit" name="submit" value="SUBMIT"
					class="button round blue image-right ic-right-arrow"
					style="padding: 15px" onclick="validate();">
 -->
			</fieldset>
		