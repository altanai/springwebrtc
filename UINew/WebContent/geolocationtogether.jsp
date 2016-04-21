<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.tcs.bean.geolocation"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Geolocation</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script> 
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script> 
<script type="text/javascript"> 
	var xmlHttpRequest;
	if (window.XMLHttpRequest) 
	{
		xmlHttpRequest = new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		xmlHttpRequest = new ActiveXObject(MICROSOFT.XMLHTTP);
	}
    $(document).ready(function() { 
	initialize(); 	
    });   
    
    function initialize() {
    	  var t = [];
          var x = [];
          var y = [];
          var h = [];			    
    
    	var latitude = new Array();
    	var longitude = new Array();
    	var names=new Array();
    	    xmlHttpRequest.open("POST", "ViewServletTogether?action=traceFriendsTogether",false);
    		xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
    		xmlHttpRequest.send();
    		
    		function receiveMessageFromServer(){
    			
    			if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
    			{
    				var jsonResponse=eval('('+xmlHttpRequest.responseText+')');
    				$.each(jsonResponse.NAMES, function(key,val){
    					$.each(val, function(k,v){
    					names[k]=v;
    					t.push(v);
    					h.push('<p><strong>Friend Name- '+v+'</strong></p>');
    				});
    				});
    				$.each(jsonResponse.LATITUDES, function(key,val){
    					$.each(val, function(k,v){
    					latitude[k]=v;
    					x.push(v);
    					});
    				});
    				$.each(jsonResponse.LONGITUDES, function(key,val){
    					$.each(val, function(k,v){
    						y.push(v);
    						longitude[k]=v;
    						});    					
    				}); 
    			}
        }
    		
        var map_options = {
            center: new google.maps.LatLng(28.459497000000237,77.02663799999976),
            zoom: 14,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var google_map = new google.maps.Map(document.getElementById("map_canvas"), map_options);

        var info_window = new google.maps.InfoWindow({
            content: 'loading',
        });
        var i = 0;
		for ( item in t ) {
			 var m = new google.maps.Marker({
	                map:       google_map,
	                animation: google.maps.Animation.DROP,
	                title:     t[i],
	                position:  new google.maps.LatLng(x[i],y[i]),
	                html:      h[i],
	            });
	
	            google.maps.event.addListener(m, 'click', function() {
	                info_window.setContent(this.html);
	                info_window.open(google_map, this);
	            });
	            i++;
	        };		           
    };
	</script> 					
</head>
<body>
	<div id="map_canvas" style="width:400px;height:400px;">Google Map</div> 		         
</body>
</html>