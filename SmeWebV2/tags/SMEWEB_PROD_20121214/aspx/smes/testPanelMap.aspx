<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testPanelMap.aspx.vb" Inherits="smes_testPanelMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body 
        {
           margin:0px;
         
         }
        #map_canvas
        {
            margin-left:0px;
            margin:0px;   
            width: 100%;
            height: 100%;
        }
        #rightDiv 
        {
            margin:0px;   
         }
    </style>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="js/jquery.layout.all-1.2.0/jquery.layout.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"> </script>
    <script type="text/javascript">
        $(document).ready(function () {
          
            $('body').layout({
                applyDefaultStyles: true
         	  , west__size: 150
            }); 
             initializeMap();
        });
        var map;
        function initializeMap() {
            var location;
            var mapCenter = new google.maps.LatLng(10.82031, 100.66471);
            var mapOptions = {
                zoom: 6,
                scaleControl: true,
                center: mapCenter,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="ui-layout-north">
        head
    </div>
    <div id="leftDiv" class="ui-layout-west">
        menu
    </div>
    <div id="rightDiv" class="ui-layout-center">
        <div id="map_canvas">
        </div>
    </div>
    <div id="Div1" class="ui-layout-east">
        menu
    </div>
    
    </form>
</body>
</html>
