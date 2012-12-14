<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testFrame.aspx.vb" Inherits="smes_testFrame" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #leftDiv
        {
            position: absolute;
            background-color: #abc;
            left: -500px;
            top:100px;
            width: 500px;
            height: 300px;
            padding:10px
            z-index:0;
            opacity:0.1;
        }
        #leftFrame
        {
            width: 90%;
            left:20px;
            height: 90%;
        }
      html, body, #map_canvas {
        margin: 0;
        padding: 0;
        height: 100%;
      }
    </style>
    <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
    <script type="text/javascript"
        src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var map;
        function initialize() {
            var myOptions = {
                zoom: 8,
                center: new google.maps.LatLng(-34.397, 150.644),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById('map_canvas'),
            myOptions);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <script>
        $("document").ready(function () {
            $('#bt1').click(function () {
                show();
            });
            $('#bt2').click(function () {
                hide();
            });

            function show() {
                $("#leftDiv").animate({ "left": "+=500px" }, "fast");
            }
            function hide() {
                $("#leftDiv").animate({ "left": "-=500px" }, "fast");
            }
        });
    </script>
</head>
<body>
    <input type="button" id="bt1" value="show" />
    <input type="button" id="bt2" value="hide" />

<div id="map_canvas" style="width: 100%; height: 100%">
</div>
<div id="leftDiv">
    <iframe id="leftFrame" src="testFrame2.aspx"></iframe>
</div>
</body>
</html>



