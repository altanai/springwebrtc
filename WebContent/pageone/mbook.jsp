<%-- <%@include file="header.jsp" %> --%>

<!-- <!-- content-wrap --> 
<!-- <div class="content-wrap"> -->


<!--     --------------------------------------------------- main -------------------------- -->
 			<div class="primary"> 

            <form method="post" action="../message" id="contactform">


                    <div>
                    <label> To      :</label>
                    <input name="name" type="text" id="name" value="" />
                    </div>

                    <div>
                    <label>Subject  :</label>
                    <input name="subject" type="text" id="subject"  value="" />
                    </div>

                    <div>
                    <label>Message  :<span class="required">*</span></label>
                    <textarea name="message" rows="20" cols="50"  id="message" ></textarea><br /><br />
                    </div>

                    <div>
					<input type="submit"  value="Submit" class="button">
         			<input type="reset" value="Reset" class="button">
					</div>


           </form>

            </div>

            <aside>

                    <ul class="link-list social">
                        <li class="facebook"><a href="#">Facebook</a></li>
                        <li class="googleplus"><a href="#">Google+</a></li>
                        <li class="twitter"><a href="#">Twitter</a></li>
                        <li class="dribble"><a href="#">Dribble</a></li>
                        <li class="linkedin"><a href="#">Linkedin</a></li>
                        <li class="delicious"><a href="#">Delicious</a></li>
                        <li class="flickr"><a href="#">Flickr</a></li>
                    </ul>

            </aside>

<h2>Message List</h2>
    <iframe src="msglist.jsp" id="myIframe" frameborder="1" width="1000" height="300"></iframe>           
    

<!-- <!-- footer --> 
<%-- <%@include file="footer.jsp" %> --%>