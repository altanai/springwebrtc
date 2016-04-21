<!DOCTYPE html>
<!--[if IE 7 ]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8 oldie"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html> <!--<![endif]-->
<%@ page import="java.util.*" %> 
<%@ page import="com.tcs.dao.*" %> 
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>WebRTC Interests</title>
    <link rel="stylesheet" href="css/style_blue.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery.fancybox-1.3.4.css" type="text/css" />
    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.6.1.min.js"><\/script>')</script>
    <script src="js/jquery.smoothscroll.js"></script>
    <script src="js/jquery.nivo.slider.pack.js"></script>
    <script src="js/jquery.easing-1.3.pack.js"></script>
    <script src="js/jquery.fancybox-1.3.4.pack.js"></script>
    <script src="js/init.js"></script>
</head>	
<body>
		 <section id="portfolio">		 
		 <marquee scrollamount="12" behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();">	
		 <!--  style="width:1200px; height:800px; overflow: auto; overflow-y: hidden;"  -->	
		 <div>			
				<table>
					<tr>
						<td><ul class="folio-list clearfix">
					        <!-- first line -->
					        <li class="folio-thumb">
			                    <h3 class="entry-title"><%=request.getAttribute("realm")%></h3> 
						        <br/><iframe src="googlesearch3.jsp?sub=<%=request.getAttribute("realm")%>"  height="400" width="300"  frameborder="0" scrolling="no"></iframe>       
					        </li>
							<li class="folio-thumb last">			
					             <h3 class="entry-title"><%=request.getAttribute("jobtitle")%></h3>
					             <br/><iframe src="googlesearch3.jsp?sub=<%=request.getAttribute("jobtitle")%>"  height="400" width="300"  frameborder="0" scrolling="no"></iframe>       
					        </li>					
					        <li class="folio-thumb">
					             <h3 class="entry-title">Aftermath</h3>
					             <br/><iframe src="googlesearch3.jsp?sub=aftermath"  height="400" width="300"  frameborder="0" scrolling="no"></iframe>       					                    
					         </li>
 					         </ul>
						</td>						
						<td><ul class="folio-list clearfix"> 
					        <!-- next line  -->
					        <li class="folio-thumb">
					              <h3 class="entry-title"><%=request.getAttribute("industry")%></h3>
					              <br/><iframe src="googlesearch3.jsp?sub=<%=request.getAttribute("industry")%>"  height="400" width="300"  frameborder="0" scrolling="no"></iframe>       
					         </li>					
					         <li class="folio-thumb">
				                   <h3 class="entry-title">Eiffel Tower</h3>
					               <br/><iframe src="googlesearch3.jsp?sub=paris"  height="400" width="300"  frameborder="0" scrolling="no"></iframe>       					                    
					         </li>
					         <li class="folio-thumb last">
					               <h3 class="entry-title">Clouds &amp; Rainbow</h3>
					               <br/><iframe src="googlesearch3.jsp?sub=nature"  height="400" width="300"  frameborder="0" scrolling="no"></iframe>       
					         </li> 
					         </ul>						
						</td>
					</tr>
				</table>			 
		</div>				 
		</marquee>
	    </section>
</body>
</html>
