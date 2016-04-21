
var ip="localhost:8080";

// The default tile setup offered to new users.
window.DefaultTiles = [
    {
        name :"Section1",
        tiles: [
           { id: "flickr1", name:"flickr" }, // profile image 
           { id: "news1", name: "news" },	// geolocation
           { id: "reader1", name: "reader" },  // offline messaging      
           { id: "weather1", name: "weather" }, // calllogs
           { id: "cuttherope1", name: "cutTheRope" },//video conf
           { id: "myblog1", name: "myblog" },	//contacts   
           { id: "feature1", name: "feature" }, // other accounts
           { id: "angrybirds1", name: "angrybirds" } // call page
           
        ]
    },
     
];

// Convert it to a serialized string
window.DefaultTiles = _.map(window.DefaultTiles, function (section) {
    return "" + section.name + "~" + (_.map(section.tiles, function (tile) {
        return "" + tile.id + "," + tile.name;
    })).join(".");
}).join("|");
        

// Definition of the tiles, their default values. ------ calllogs 
window.TileBuilders = {
		
		

	    flickr: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            name: "flickr",
	            /*iconSrc: "img/Flickr alt 1.png",*/
	            iconSrc: "img/user.jpg",
	            /*label: "Flickr",*/
	            label: "Profile image",
	            size: "tile-double tile-double-vertical",
	            color: "bg-color-darken",
	            /*appUrl: "Tiles/Flickr/App/FlickrApp.html",
	            cssSrc: ["Tiles/flickr/flickr.css"],
	            scriptSrc: ["Tiles/flickr/flickr.js"],*/
	            //scriptSrc: ["tiles/flickr/flickr_interesting.js"],
	            //cssSrc: ["tiles/flickr/flickr_interesting.css"],            
	            initFunc: "flickr_load"
	        };
	    },
	    
	    news: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            /*name: "news",*/
	            name: "Geolocation",
	            label:"Geolocation",
	            tileImage: "img/Geolocation.png",
	            color: "bg-color-pink",
	            size: "tile-double",
	            /*appUrl: "http://www.bbc.co.uk/news/world/",*/
	            appUrl: "http://"+ip+"/sdnext/geolocationtogether.html?PrivateIdentity=sip:bob@tcs.com"
	            /*scriptSrc: ["Tiles/news/news.js"],
	            cssSrc: ["Tiles/news/news.css"],
	            initFunc: "load_news",
	            initParams: { url: "http://feeds.bbci.co.uk/news/world/rss.xml"}*/            
	        };
	    },

	    reader: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            name: "reader",
	            color: "bg-color-red",
	            label: "Offline Messaging",
	            iconSrc: 'img/messaging1.jpg',
	            appUrl: 'RssReader.aspx'
	        };
	    },
	    
	    
	    weather: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            name: "weather",
	            color: "bg-color-blue",
	         /* label: "Weather",
	            appTitle: "Weather App",
	            appUrl: "http://www.bbc.co.uk/weather/",
	          */
	            label: "Call Logs",
	            appTitle: "Call Logs",
	            appUrl: "",
	            size: "tile-double",
	            iconSrc: "img/CallLog.png",
	         /* scriptSrc: ["Tiles/weather/jQuery.simpleWeather.js", "Tiles/weather/weather.js"],
	            cssSrc: ["Tiles/weather/weather.css"],
	            initFunc: "load_weather",
	            initParams: {
	                location: 'London, UK'
	            }*/
	        };
	    },

	    
	    cutTheRope: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            name: "cutTheRope",
	            label:"Conferencing",
	            tileImage: "img/VideoConf.png",
	            appUrl: "http://"+ip+"/sdnext/conferencing12.html?PrivateIdentity=sip:bob@tcs.com"
	        };
	    },
	    
	    
	    myblog: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            name: "myblog",
	           label: "Contacts",
	            color: "bg-color-blueDark",
	            size: "tile-double",
	            appUrl: "http://"+ip+"/sdnext/addcontacts.html?sipuri=sip:bob@tcs.com",
	            tileImage: "img/Contacts.png",
	            /*scriptSrc: ["Tiles/news/news.js"],
	            cssSrc: ["Tiles/news/news.css"],
	            initFunc: "load_news",
	            initParams: { url: "http://omaralzabir.com/feed" }*/
	        };
	    },

	    
	    feature: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            name: "feature",
	            color: "bg-color-green",
	            size: "tile-double",
	            appUrl: "http://"+ip+"/sdnext/addopenid.html?sipuri=sip:bob@tcs.com",
	           /* slidesFrom: ["Tiles/features/feature1.html",
	                "Tiles/features/feature2.html",
	                "Tiles/features/feature3.html"],
	            cssSrc: ["Tiles/features/features.css"]*/
	            label:"Other Accounts",
	            tileImage: "img/Offline.png",
	        };
	    },
	    
	    
	    angrybirds: function (uniqueId) {
	        return {
	            uniqueId: uniqueId,
	            name: "angrybirds",
	            label:"Call",
	            /*tileImage: "img/AngryBirds.png",
	            appUrl: "http://chrome.angrybirds.com/"*/
	            tileImage: "img/Call.png",
	            appUrl: "http://"+ip+"/sdnext/call.html?PrivateIdentity=sip:bob@tcs.com"
	        };
	    },
     
};
